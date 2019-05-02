Imports Telerik.Web.UI
Imports System.Data

Imports System.Data.SqlClient
Partial Class DATA_INPUT_BRAKE_flt_BRAKETEST_INPUT
    Inherits System.Web.UI.Page
    Private Sub DATA_INPUT_BRAKE_flt_BRAKETEST_INPUT_Init(sender As Object, e As EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        Setup_Site_Combo()
        Me.RadCB_Site.SelectedValue = -1
        GetSYS()

    End Sub
    Sub GetSYS()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GET_SYS_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        End If
    End Sub
    Sub Get_Session_Info(ByVal SESSION_ID As Integer, ByVal CLIENT_APP_ID As Integer)
        Me.HF_Session_ID.Value = SESSION_ID
        Me.HF_Client_APP_ID.Value = CLIENT_APP_ID
        If HttpContext.Current.Request.IsLocal Then
            Me.HF_Username.Value = "Jonathan Snaith"
            Me.HF_PQQ_Permission.Value = "5"
            Me.HF_EMP_ID.Value = "595"
        Else
            Try
                Dim Qry As New Banks_Security.Security
                Qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ICT_CENTRALConnectionString").ConnectionString
                'xxx GET PERMISSIONS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
                Dim mPermissions As DataTable
                Qry.Session_ID = SESSION_ID
                Qry.Application_ID = CLIENT_APP_ID
                Qry.Execute_Get_Permissions()
                mPermissions = Qry.Permissions
                Dim dr As DataRow
                For Each dr In mPermissions.Rows
                    'Fields available : APPLICATION_ID, EMPLOYEE_ID, Is_Exception, EXCEPTION_ID, PERMISSION_ID, Value, SESSION_ID, Application_Title
                    If dr("APPLICATION_ID").ToString() = CLIENT_APP_ID Then
                        Select Case dr("Is_Exception").ToString()
                            Case 0 'APPLICATION PERMISSIONS
                                Me.HF_Username.Value = dr("Fullname").ToString()
                                Me.HF_PQQ_Permission.Value = dr("Value")
                                Me.HF_EMP_ID.Value = dr("EMPLOYEE_ID").ToString()
                            Case 1 ' APPLICATION EXCEPTIONS

                            Case Else
                        End Select
                    End If
                Next
                'xxx GET SETTINGS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                'Dim mSettings As DataTable
                'Qry.Execute_Get_Settings()
                'mSettings = Qry.Settings
                ''----
                'Dim drs As DataRow
                'For Each drs In mSettings.Rows
                '    Select Case drs("Category").ToString()
                '        Case "????"
                '            '
                '        Case Else
                '    End Select
                'Next
                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            Catch ex As Exception
                MsgBox(Err.Number & " " & Err.Description)
            End Try
        End If
        'End If
    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
        If Not Me.IsPostBack Then
            ResetStuff()
        Else
            WhichRowSelected()
            Dim eventTarget As String
            Dim eventArgument As String
            If (Me.Request("__EVENTTARGET") Is Nothing) Then
                eventTarget = String.Empty
            Else
                eventTarget = Me.Request("__EVENTTARGET")
                If (Me.Request("__EVENTARGUMENT") Is Nothing) Then
                    eventArgument = String.Empty
                Else
                    eventArgument = Me.Request("__EVENTARGUMENT")
                    ' Call your VB method here...
                    Select Case eventTarget
                        Case "Calculate"
                            Dim valuePassed As String = eventArgument
                            'Me.CalculateSheet()
                        Case "Show_Buttons"
                            Dim valuepassed As String = eventArgument
                            'ShowPage1_Buttons(valuepassed)
                        Case "FindCurrentRecord"
                            Dim valuepassed As String = eventArgument
                            Dim SiteId As String = RadCB_Site.SelectedValue
                            GetData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadDP_From.SelectedDate, RadDP_To.SelectedDate)
                            SelectCorrectRecord()
                        Case Else
                    End Select
                End If
            End If
        End If
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "Data Input - Brake Test"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
    End Sub
    Sub ResetStuff()
        Dim GetFromYear As Integer
        Dim GetToYear As Integer
        Dim GetMonth As Integer
        Dim BuildFromDate As String
        Dim BuildToDate As String
        GetFromYear = DatePart(DateInterval.Year, DateTime.Now)
        GetToYear = DatePart(DateInterval.Year, DateTime.Now)
        GetMonth = DatePart(DateInterval.Month, DateTime.Now)
        If GetMonth < 10 Then GetFromYear = GetFromYear - 1
        If GetMonth >= 10 Then GetToYear = GetToYear + 1
        BuildFromDate = CStr(GetFromYear) + "-10-01"
        BuildToDate = CStr(GetToYear) + "-10-01"
        HF_From.Value = BuildFromDate
        HF_To.Value = BuildToDate
        RadDP_From.SelectedDate = HF_From.Value
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        RadDP_To.SelectedDate = HF_To.Value
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        GetData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        T2.Visible = False
    End Sub
    Sub WhichRowSelected()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_DataInput.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("BRK_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_Row.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_DataInput.Items
            count = count + 1
            If Session("ThisId") = count Then
                item.Selected = True
            End If
        Next
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames(RadCB_Customer, True)
    End Sub
    Private Sub Setup_Site_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Site = Setup.Populate_SiteNames(RadCB_Site, RadCB_Customer.SelectedValue, True)
    End Sub
    Private Sub GetData(BRK_CUS_ID As Integer, ByVal BRK_SITE_ID As Integer, ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetBrakeTestList(BRK_CUS_ID, BRK_SITE_ID, DateFrom, DateTo)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_DataInput.DataSource = dtMain
        RadGrid_DataInput.DataBind()
    End Sub
#End Region
    Protected Sub RadBtn_Reset_Click(sender As Object, e As EventArgs) Handles RadBtn_Reset.Click
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        Setup_Site_Combo()
        Me.RadCB_Site.SelectedValue = -1
        ResetStuff()
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Setup_Site_Combo()
        Me.RadCB_Site.SelectedValue = -1
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        If RadCB_Site.SelectedValue <> -1 And RadCB_Customer.SelectedValue <> -1 Then
            T2.Visible = True
        Else
            T2.Visible = False
        End If
    End Sub
    Protected Sub RadDP_From_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        Dim ThisMonth As Date
        ThisMonth = RadDP_From.SelectedDate.ToString()
        Me.HF_From.Value = RadDP_From.SelectedDate.ToString()
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        RadDP_To.SelectedDate = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
    End Sub
    Protected Sub RadDP_To_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDP_To.SelectedDateChanged
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RadButton1.Click
        GetData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadDP_From.SelectedDate, RadDP_To.SelectedDate)
    End Sub

End Class
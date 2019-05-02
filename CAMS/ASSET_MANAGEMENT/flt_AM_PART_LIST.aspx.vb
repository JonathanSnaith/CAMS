Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI

Partial Class ASSET_MANAGEMENT_flt_AM_PART_LIST
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
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
        Me.RadCB_Level3.SelectedValue = -1
        Me.RadCB_Model.SelectedValue = -1
        Me.RadCB_Part.SelectedValue = -1
        Me.RadCB_Location.SelectedValue = -1
        Me.RadCB_Status.SelectedValue = "Active"
        Apply_Permissions()

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
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 75
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_4_R.Value = 1 'Asset Management - R
                                        End If
                                    Case 86
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_4_RW.Value = 1 'Asset Management - RW
                                        End If
                                    Case 93
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_15.Value = 1 'Review Part Request/Disposal
                                        End If
                                End Select
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
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "AM - Parts List"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
        If Not Me.IsPostBack Then
            Setup_Level3_Combo()
            Setup_Model_Combo()
            Setup_Part_Combo()
            Setup_Location_Combo()
            GetPartsRequestList()
            GetPartsList(-1, -1, -1, "-1", -1, "Active")
        Else
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
                        Case "Refresh_Combo"
                            Dim valuepassed As String = eventArgument
                        Case "Refresh_Grid"
                            Dim valuepassed As String = eventArgument
                            GetPartsRequestList()
                            Me.RadGrid_Part_Requests.Rebind()
                            GetPartsList(-1, -1, -1, "-1", -1, "Active")
                            Me.RadGrid_Part_List.Rebind()
                            WhichRowSelected()
                            SelectCorrectRecord()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub WhichRowSelected()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Part_List.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("P_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_Table.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Part_List.Items
            Dim EventIDCell As TableCell = item("P_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("P_ID") = "null" Then Session("P_ID") = "0"

            If Session("P_ID") = EventID Then
                item.Selected = True
            End If
        Next
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Level3_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Level3 = Setup.Populate_CodeLevel3Only_Parts(RadCB_Level3, True)
    End Sub
    Private Sub Setup_Model_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Model = Setup.Populate_Model_Parts(RadCB_Model, RadCB_Level3.SelectedValue, True)
    End Sub
    Private Sub Setup_Part_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Part = Setup.Populate_Part_Parts(RadCB_Part, RadCB_Level3.SelectedValue, RadCB_Model.SelectedValue, True)
    End Sub
    Private Sub Setup_Location_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Location = Setup.Populate_Location_Parts(RadCB_Location, RadCB_LT.SelectedValue)
    End Sub
    Private Sub GetPartsRequestList()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetPartsRequestList()
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadGrid_Part_Requests.DataSource = dtMain1
        RadGrid_Part_Requests.DataBind()
    End Sub
    Private Sub GetPartsList(ByVal P_Level_3 As Integer, P_MOD_ID As Integer, ByVal P_Part_ID As String, ByVal PD_Location_Type As String, ByVal P_Location_ID As Integer, ByVal P_Status As String)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetPartsList(P_Level_3, P_MOD_ID, P_Part_ID, PD_Location_Type, P_Location_ID, P_Status)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadGrid_Part_List.DataSource = dtMain1
        RadGrid_Part_List.DataBind()
    End Sub
#End Region
    Protected Sub btn_Refresh_Click(sender As Object, e As EventArgs) Handles btn_Refresh.Click
        Me.RadCB_Level3.SelectedValue = -1
        Me.RadCB_Model.SelectedValue = -1
        Me.RadCB_Part.SelectedValue = -1
        Me.RadCB_LT.SelectedValue = "-1"
        Me.RadCB_Location.Visible = False
        Me.RadGrid_Part_List.DataBind()
    End Sub
    Protected Sub RadCB_Location_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Location.SelectedIndexChanged
        Me.HF_Location_Type.Value = RadCB_LT.Text
        Me.HF_Location.Value = RadCB_Location.SelectedValue
    End Sub
    Protected Sub RadCB_LT_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_LT.SelectedIndexChanged
        If RadCB_LT.SelectedValue = "-1" Then
            RadCB_Location.Visible = False
        Else
            Me.RadCB_Location.Visible = True
            Me.RadCB_Location.DataBind()
            Me.RadCB_Location.SelectedValue = -1
        End If
        Me.RadGrid_Part_List.DataBind()
    End Sub
    Private Sub RadGrid_Part_List_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid_Part_List.ItemDataBound
        For Each item As GridDataItem In RadGrid_Part_List.Items
            Dim myTotalCell3 As TableCell = item("ActualDays")
            Dim myTotalCell4 As TableCell = item("ExpectedDaysCalc")
            Dim myTotalCell5 As TableCell = item("PD_Location_Type")
            Dim myTotalCell6 As TableCell = item("CurrentLocation")
            Dim myTotalCell7 As TableCell = item("P_Status")
            Dim ThisTotal7 As String
            ThisTotal7 = myTotalCell7.Text
            If InStr(myTotalCell3.Text, "&nbsp;") Then
            Else
                Dim ThisTotal3 As Double
                ThisTotal3 = myTotalCell3.Text
                Dim ThisTotal4 As Double
                ThisTotal4 = myTotalCell4.Text
                Dim ThisTotal5 As String
                ThisTotal5 = myTotalCell5.Text
                Dim ThisTotal6 As String
                ThisTotal6 = myTotalCell6.Text
                If (ThisTotal3 > ThisTotal4 And ThisTotal5 <> "Asset") And (ThisTotal3 > ThisTotal4 And ThisTotal6 <> "Thrislington Yard - Stock") Then
                    item("ActualDays").ForeColor = Drawing.Color.Red
                Else
                    item("ActualDays").ForeColor = Drawing.Color.White
                End If
            End If
            If ThisTotal7 = "Request Disposal" Then
                item.BackColor = Drawing.Color.Orange
            End If
            If ThisTotal7 = "Disposed" Then
                item.BackColor = Drawing.Color.Tomato
            End If
        Next
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_4_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
                Me.T2.Visible = True
                If HF_EXCEPTION_15.Value = 1 Then
                    Me.lbl_Pending_Requests.Visible = True
                    Me.RadGrid_Part_Requests.Visible = True
                    Me.lbl_Current_Parts.Visible = True
                Else
                    Me.lbl_Pending_Requests.Visible = False
                    Me.RadGrid_Part_Requests.Visible = False
                    Me.lbl_Current_Parts.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_4_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
                Me.T2.Visible = True
                If HF_EXCEPTION_15.Value = 1 Then
                    Me.lbl_Pending_Requests.Visible = True
                    Me.RadGrid_Part_Requests.Visible = True
                    Me.lbl_Current_Parts.Visible = True
                Else
                    Me.lbl_Pending_Requests.Visible = False
                    Me.RadGrid_Part_Requests.Visible = False
                    Me.lbl_Current_Parts.Visible = False
                End If
            Case 4
                Me.T1.Visible = True
                Me.T2.Visible = True
                If HF_EXCEPTION_15.Value = 1 Then
                    Me.lbl_Pending_Requests.Visible = True
                    Me.RadGrid_Part_Requests.Visible = True
                    Me.lbl_Current_Parts.Visible = True
                Else
                    Me.lbl_Pending_Requests.Visible = False
                    Me.RadGrid_Part_Requests.Visible = False
                    Me.lbl_Current_Parts.Visible = False
                End If
            Case 5
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.lbl_Pending_Requests.Visible = True
                Me.RadGrid_Part_Requests.Visible = True
                Me.lbl_Current_Parts.Visible = True
            Case Else
                Me.T1.Visible = False
                Me.T2.Visible = False
                Me.lbl_Pending_Requests.Visible = False
                Me.RadGrid_Part_Requests.Visible = False
                Me.lbl_Current_Parts.Visible = False
        End Select
    End Sub
End Class
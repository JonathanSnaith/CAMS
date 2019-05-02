Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DATA_INPUT_flt_MAGNETIC_PLUG_INSPECTIONS
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
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        Setup_Asset_Combo()
        Me.RadCB_Asset.SelectedValue = -1
        Setup_Compartment_Combo()
        Me.RadCB_Compartment.SelectedValue = -1
        Setup_Visual_Rating_Combo()
        Me.RadCB_Rating.SelectedValue = -1
        Setup_Engineer_Combo()
        Me.RadCB_Inspector.SelectedValue = -1
        GetData(-1, -1, -1, -1, -1)
        RadGrid_All_MPI.MasterTableView.GetColumnSafe("Customer").Display = True
        RadGrid_All_MPI.MasterTableView.GetColumnSafe("Asset").Display = True
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
                                'Select Case dr("EXCEPTION_ID").ToString()
                                '    Case 77
                                '        If dr("Value") = Nothing Then
                                '        Else
                                '            Me.HF_EXCEPTION_6_R.Value = 1 'Event Dashboard R
                                '        End If
                                '    Case 88
                                '        If dr("Value") = Nothing Then
                                '        Else
                                '            Me.HF_EXCEPTION_6_RW.Value = 1 'Event Dashboard RW
                                '        End If
                                'End Select
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
            HF_PageName.Value = "Data Input - Magnetic Plug Inspections"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
        If Me.IsPostBack Then
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
                        Case "Refresh_Grid_Combo"
                            Dim valuepassed As String = eventArgument
                            GetData(RadCB_Customer.SelectedValue, RadCB_Asset.SelectedValue, RadCB_Compartment.SelectedValue, RadCB_Rating.SelectedValue, RadCB_Inspector.SelectedValue)
                            SelectCorrectRecord()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub WhichRowSelected()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_All_MPI.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("MPI_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_Row.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_All_MPI.Items
            count = count + 1
            If Session("ThisId") = count Then
                item.Selected = True
            End If
        Next
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames_EventManagement(RadCB_Customer, True, 7)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames_EventManagement(RadCB_Asset, RadCB_Customer.SelectedValue, -1, True, 6)
    End Sub
    Private Sub Setup_Compartment_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Compartment = Setup.Populate_CompartmentNames(RadCB_Compartment, RadCB_Asset.SelectedValue, True)
    End Sub
    Private Sub Setup_Visual_Rating_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Rating = Setup.Populate_VRNames(RadCB_Rating, RadCB_Asset.SelectedValue, RadCB_Compartment.SelectedValue, True)
    End Sub
    Private Sub Setup_Engineer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Inspector = Setup.Populate_Engineers_EventManagement(RadCB_Inspector, RadCB_Asset.SelectedValue, -1, True, 5)
    End Sub
    Private Sub GetData(CUS_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID_CP As Integer, ByVal ATT_ID_VR As Integer, ByVal PER_EMP_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetMagPlugList(CUS_ID, A_ID, ATT_ID_CP, ATT_ID_VR, PER_EMP_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_All_MPI.DataSource = dtMain
        RadGrid_All_MPI.DataBind()
    End Sub
#End Region
    Protected Sub btn_Refresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Refresh.Click
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        Setup_Asset_Combo()
        Me.RadCB_Asset.SelectedValue = -1
        Setup_Compartment_Combo()
        Me.RadCB_Compartment.SelectedValue = -1
        Setup_Visual_Rating_Combo()
        Me.RadCB_Rating.SelectedValue = -1
        Setup_Engineer_Combo()
        Me.RadCB_Inspector.SelectedValue = -1
        GetData(-1, -1, -1, -1, -1)
        RadGrid_All_MPI.MasterTableView.GetColumnSafe("Customer").Display = True
        RadGrid_All_MPI.MasterTableView.GetColumnSafe("Asset").Display = True
        Me.RadGrid_All_MPI.DataBind()
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Setup_Asset_Combo()
        Me.RadCB_Asset.SelectedValue = -1
        Setup_Compartment_Combo()
        Me.RadCB_Compartment.SelectedValue = -1
        Setup_Visual_Rating_Combo()
        Me.RadCB_Rating.SelectedValue = -1
        Setup_Engineer_Combo()
        Me.RadCB_Inspector.SelectedValue = -1
        GetData(RadCB_Customer.SelectedValue, -1, -1, -1, -1)
        If RadCB_Customer.SelectedValue = -1 Then
            RadGrid_All_MPI.MasterTableView.GetColumnSafe("Customer").Display = True
            Exit Sub
        Else
            RadGrid_All_MPI.MasterTableView.GetColumnSafe("Customer").Display = False
        End If
        Me.RadGrid_All_MPI.DataBind()
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Setup_Compartment_Combo()
        Me.RadCB_Compartment.SelectedValue = -1
        Setup_Visual_Rating_Combo()
        Me.RadCB_Rating.SelectedValue = -1
        Setup_Engineer_Combo()
        Me.RadCB_Inspector.SelectedValue = -1
        GetData(RadCB_Customer.SelectedValue, RadCB_Asset.SelectedValue, -1, -1, -1)
        If RadCB_Asset.SelectedValue = -1 Then
            RadGrid_All_MPI.MasterTableView.GetColumnSafe("Asset").Display = True
            Exit Sub
        Else
            RadGrid_All_MPI.MasterTableView.GetColumnSafe("Asset").Display = False
        End If
        Me.RadGrid_All_MPI.DataBind()
    End Sub
    Protected Sub RadCB_Compartment_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Compartment.SelectedIndexChanged
        Setup_Visual_Rating_Combo()
        Me.RadCB_Rating.SelectedValue = -1
        Setup_Engineer_Combo()
        Me.RadCB_Inspector.SelectedValue = -1
        GetData(RadCB_Customer.SelectedValue, RadCB_Asset.SelectedValue, RadCB_Compartment.SelectedValue, -1, -1)
    End Sub
    Protected Sub RadCB_Rating_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Rating.SelectedIndexChanged
        Setup_Engineer_Combo()
        Me.RadCB_Inspector.SelectedValue = -1
        GetData(RadCB_Customer.SelectedValue, RadCB_Asset.SelectedValue, RadCB_Compartment.SelectedValue, RadCB_Rating.SelectedValue, -1)
    End Sub
    Protected Sub RadCB_Inspector_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Inspector.SelectedIndexChanged
        GetData(RadCB_Customer.SelectedValue, RadCB_Asset.SelectedValue, RadCB_Compartment.SelectedValue, RadCB_Rating.SelectedValue, RadCB_Inspector.SelectedValue)
    End Sub
    Sub GridFormatting()
        For Each item As GridDataItem In RadGrid_All_MPI.Items
            Dim myTotalCell4 As TableCell = item("Rating")
            Dim ThisTotal4 = myTotalCell4.Text
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                If ThisTotal4 = "5" Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "4" Then
                    item.BackColor = Drawing.Color.OrangeRed
                    item.ForeColor = Drawing.Color.Black
                End If
            End If
        Next
    End Sub
    Protected Sub RadGrid_All_MPI_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_All_MPI.ItemDataBound
        GridFormatting()
    End Sub
    Protected Sub RadGrid_All_MPI_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadGrid_All_MPI.SelectedIndexChanged
        GridFormatting()
    End Sub
End Class
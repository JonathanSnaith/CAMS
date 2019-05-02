Imports System.Data
Imports System.Data.SqlClient
Partial Class ASSET_MANAGEMENT_flt_AM_ASSET_LIST
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

        Me.RadGrid_Asset_List.Visible = True
        Me.RadCB_Customer.SelectedValue = -1
        Me.RadCB_Site.SelectedValue = -1
        Me.HF_A_ID.Value = -1
        Me.HF_SITE_ID.Value = -1
        Me.HF_MOD_ID.Value = -1
        Me.HF_CUS_ID.Value = -1
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
                                    Case 130
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_R.Value = 1 'Asset Management - R
                                        End If
                                    Case 142
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_RW.Value = 1 'Asset Management - RW
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
            HF_PageName.Value = "AM - Asset List"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
        If Not Me.IsPostBack Then
            Setup_Customer_Combo()
            Setup_Site_Combo()
            Setup_Asset_Combo()
            Setup_Model_Combo()
            GetData(-1, -1, -1, -1)
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
                            ' GetData(Me.HF_CUS_ID.Value, Me.HF_SITE_ID.Value, Me.HF_A_ID.Value, Me.HF_MOD_ID.Value)
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
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Asset_List.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("A_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_Row.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Asset_List.Items
            Dim EventIDCell As TableCell = item("A_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("A_ID") = "null" Then Session("A_ID") = "0"

            If Session("A_ID") = EventID Then
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
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames(RadCB_Asset, RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue)
    End Sub
    Private Sub Setup_Model_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Model = Setup.Populate_ModelAssetListNames(RadCB_Model, RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue)
    End Sub
    Private Sub GetData(A_CUS_ID As Integer, ByVal A_SITE_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString

        Dim ds As DataSet = qry.GetAssetList(A_CUS_ID, A_SITE_ID, A_ID, ATT_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)

        RadGrid_Asset_List.DataSource = dtMain
        RadGrid_Asset_List.DataBind()
    End Sub
#End Region
    Protected Sub btn_Refresh_Click(sender As Object, e As EventArgs) Handles btn_Refresh.Click
        Me.RadCB_Asset.ClearSelection()
        Me.RadCB_Model.ClearSelection()
        Me.RadCB_Customer.SelectedValue = -1
        Me.RadCB_Site.SelectedValue = -1
        Setup_Customer_Combo()
        Setup_Site_Combo()
        Setup_Asset_Combo()
        Setup_Model_Combo()
        GetData(-1, -1, -1, -1)
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Me.HF_CUS_ID.Value = RadCB_Customer.SelectedValue
        Me.RadGrid_Asset_List.Visible = True
        Me.RadGrid_Asset_List.DataBind()
        Me.RadCB_Site.SelectedValue = -1
        Me.RadCB_Model.SelectedValue = -1
        Me.RadCB_Asset.SelectedValue = -1
        Me.HF_A_ID.Value = -1
        Me.HF_MOD_ID.Value = -1
        Setup_Site_Combo()
        Setup_Asset_Combo()
        Setup_Model_Combo()
        GetData(Me.HF_CUS_ID.Value, Me.HF_SITE_ID.Value, Me.HF_A_ID.Value, Me.HF_MOD_ID.Value)
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Me.HF_SITE_ID.Value = RadCB_Site.SelectedValue
        Me.RadGrid_Asset_List.Visible = True
        Setup_Asset_Combo()
        Setup_Model_Combo()
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_Model.SelectedValue = -1
        GetData(Me.HF_CUS_ID.Value, Me.HF_SITE_ID.Value, Me.HF_A_ID.Value, Me.HF_MOD_ID.Value)

    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.HF_A_ID.Value = RadCB_Asset.SelectedValue
        Me.RadGrid_Asset_List.Visible = True
        Setup_Model_Combo()
        Me.RadCB_Model.SelectedValue = -1
        GetData(Me.HF_CUS_ID.Value, Me.HF_SITE_ID.Value, Me.HF_A_ID.Value, Me.HF_MOD_ID.Value)
    End Sub
    Protected Sub RadCB_Model_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Model.SelectedIndexChanged
        Me.HF_MOD_ID.Value = RadCB_Model.SelectedValue
        Me.RadGrid_Asset_List.Visible = True
        Me.RadCB_Asset.SelectedValue = -1
        GetData(Me.HF_CUS_ID.Value, Me.HF_SITE_ID.Value, Me.HF_A_ID.Value, Me.HF_MOD_ID.Value)

    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_2_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_2_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
            Case 4
                Me.T1.Visible = True
            Case 5
                Me.T1.Visible = True
            Case Else
                Me.T1.Visible = False
        End Select
    End Sub
End Class
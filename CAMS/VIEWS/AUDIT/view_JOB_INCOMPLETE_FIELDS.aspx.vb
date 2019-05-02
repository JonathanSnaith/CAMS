Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class VIEWS_AUDIT_view_JOB_INCOMPLETE_FIELDS
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
    End Sub
    Sub Get_Session_Info(ByVal SESSION_ID As Integer, ByVal CLIENT_APP_ID As Integer)
        Me.HF_Session_ID.Value = SESSION_ID
        Me.HF_Client_APP_ID.Value = CLIENT_APP_ID
        If HttpContext.Current.Request.IsLocal Then
            Me.HF_Username.Value = "Jonathan Snaith"
            Me.lblWhoIsIt.Text = "Jonathan Snaith"
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
                                Me.lblWhoIsIt.Text = dr("Fullname").ToString()
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
        lblPageName.Text = "Home - Reports - Audit - Incomplete Event Fields"
        Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
    End Sub
    Protected Sub RadGrid1_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemDataBound
        For Each item As GridDataItem In RadGrid1.Items
            Dim Img1 As Image = DirectCast(item("Level1").Controls(0), Image)
            Select Case Img1.AlternateText
                Case "Yes"
                    Img1.ImageUrl = "../../IMAGES/24x24/supplier_do_not_use_24x24.png"
                Case Else
                    Img1.ImageUrl = "../../IMAGES/24x24/blank_24x24.png"
            End Select
            Dim Img2 As Image = DirectCast(item("Level2").Controls(0), Image)
            Select Case Img2.AlternateText
                Case "Yes"
                    Img2.ImageUrl = "../../IMAGES/24x24/supplier_do_not_use_24x24.png"
                Case Else
                    Img2.ImageUrl = "../../IMAGES/24x24/blank_24x24.png"
            End Select
            Dim Img3 As Image = DirectCast(item("Level3").Controls(0), Image)
            Select Case Img3.AlternateText
                Case "Yes"
                    Img3.ImageUrl = "../../IMAGES/24x24/supplier_do_not_use_24x24.png"
                Case Else
                    Img3.ImageUrl = "../../IMAGES/24x24/blank_24x24.png"
            End Select
            Dim Img4 As Image = DirectCast(item("IncCode").Controls(0), Image)
            Select Case Img4.AlternateText
                Case "Yes"
                    Img4.ImageUrl = "../../IMAGES/24x24/supplier_do_not_use_24x24.png"
                Case Else
                    Img4.ImageUrl = "../../IMAGES/24x24/blank_24x24.png"
            End Select
        Next
    End Sub
End Class
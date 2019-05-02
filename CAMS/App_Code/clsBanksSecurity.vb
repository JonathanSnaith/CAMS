Imports Microsoft.VisualBasic
Imports System.Data



Public Class BanksSecurity

    Public Structure returnSecurity
        Public Session_GUID As String
        Public Session_Username As String
        Public Session_WhoIsIt As String
        Public Session_IP As String
        Public Session_Permission As String
        Public Session_AccessGranted As Boolean

    End Structure

    Public Sub New()

    End Sub

    Public Function GetSiteSecurity(ByVal GUID As String, ByVal UserHostAddress As String) As returnSecurity
        If HttpContext.Current.Request.IsLocal Then

            GetSiteSecurity.Session_GUID = GUID
            GetSiteSecurity.Session_Username = "Jonathan Snaith"
            GetSiteSecurity.Session_WhoIsIt = "Jonathan Snaith"
            GetSiteSecurity.Session_IP = ""
            GetSiteSecurity.Session_Permission = "5"
            GetSiteSecurity.Session_AccessGranted = True


        Else

            Dim qry As New Database.Query
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ICT_CENTRALConnectionString").ConnectionString

            Dim dt As DataTable = qry.SqlDS_Get_Session(GUID)

            If dt.Rows.Count > 0 Then
                Dim dr As DataRow = dt.Rows(0)


                GetSiteSecurity.Session_GUID = dr("Session_GUID")
                GetSiteSecurity.Session_Username = dr("Session_Username")
                GetSiteSecurity.Session_WhoIsIt = dr("Session_Username")
                GetSiteSecurity.Session_IP = dr("Session_IP")
                GetSiteSecurity.Session_Permission = dr("Session_Permission")

                If UserHostAddress <> GetSiteSecurity.Session_IP Then
                    GetSiteSecurity.Session_AccessGranted = False
                End If
            Else


                GetSiteSecurity.Session_GUID = GUID
                GetSiteSecurity.Session_Username = GUID
                GetSiteSecurity.Session_WhoIsIt = GUID
                GetSiteSecurity.Session_IP = ""
                GetSiteSecurity.Session_Permission = "5"
                GetSiteSecurity.Session_AccessGranted = True
            End If

        End If


    End Function


End Class

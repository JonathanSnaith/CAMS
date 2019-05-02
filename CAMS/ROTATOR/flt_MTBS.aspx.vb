Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class ROTATOR_flt_MTBS
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
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
        lbl_From.Text = HF_From.Value
        lbl_To.Text = HF_To.Value
        ''lbl_From.Text = DateTime.ParseExact(lbl_From.Text, "dd-MM-yyyy", Nothing)
        lbl_From.Text = "01/10/" + CStr(GetFromYear)
        lbl_To.Text = "01/10/" + CStr(GetToYear)
        RadHtmlChart6.Visible = True
        lbl_MTBS.Visible = True
        lbl_MTBS_Calc.Visible = True
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim dvSql As DataView = DirectCast(SqlDS_SYS.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        Next
    End Sub
End Class
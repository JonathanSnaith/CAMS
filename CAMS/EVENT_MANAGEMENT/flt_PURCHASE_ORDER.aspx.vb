Imports Telerik.Web.UI
Imports System.Data
Partial Class EVENT_MANAGEMENT_flt_PURCHASE_ORDER
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Me.lblORD_ID.Text = Request.QueryString("ORD_ID")
    End Sub
    Protected Sub Page_InitComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.InitComplete
        Get_Order_PO_List()
    End Sub
    Sub Get_Order_PO_List()
        Dim dvSql As DataView = DirectCast(SqlDS_PO_List.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.HF_PO.Value = drvSql("ORD_PO").ToString()
        Next
    End Sub
    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Header.ItemDataBound
        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = e.Item
            Dim myCell As TableCell = dataItem("Total")
            Dim FP_Total = CType(myCell.Text, Double)
            Me.HF_FocalPoint_Commit.Value = Me.HF_FocalPoint_Commit.Value + FP_Total
        End If
        Me.lblFocalPoint_Total.Text = String.Format("{0:C}", CType(Me.HF_FocalPoint_Commit.Value, Decimal))
    End Sub
End Class

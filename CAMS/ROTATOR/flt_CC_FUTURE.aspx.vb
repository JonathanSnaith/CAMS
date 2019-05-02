Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class ROTATOR_flt_CC_FUTURE
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim dvSql As DataView = DirectCast(SqlDS_SYS.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        Next
    End Sub
    Protected Sub RadGrid_Planning_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_PLANNING.ItemDataBound
        For Each item As GridDataItem In RadGrid_PLANNING.Items
            Dim myTotalCell2 As TableCell = item("STM_SMU_Value")
            If InStr(myTotalCell2.Text, "&nbsp;") Then
            Else
            End If
            Dim myTotalCell4 As TableCell = item("STM_Planning_Status")
            Dim ThisTotal4 = myTotalCell4.Text
            Dim myTotalCell5 As TableCell = item("STM_Date_Estimate")
            Dim ThisTotal5 = myTotalCell5.Text
            Dim myTotalCell3 As TableCell = item("ChangeDue")
            Dim ThisTotal3 = myTotalCell3.Text
            Dim TrendOverride As TableCell = item("SER_Trend_Override")
            Dim Trend As TableCell = item("SER_Trend")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                If ThisTotal4 = "*New" Then
                    item.BackColor = Drawing.Color.MediumSeaGreen
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal4 = "*Planning" Then
                    item.BackColor = Drawing.Color.Orange
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal4 = "*Event Cancelled" Then
                    item.BackColor = Drawing.Color.Gold
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal4 = "Monitoring" And ThisTotal5 < Date.Now Then
                    item.BackColor = Drawing.Color.Red
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
            If InStr(myTotalCell3.Text, "&nbsp;") Then
            Else
                If ThisTotal4 <> "Monitoring" And ThisTotal3 < 0 Then
                    item("ChangeDue").ForeColor = Drawing.Color.Red
                Else
                End If
            End If
            If TrendOverride.Text = "&nbsp;" Then
                Trend.ForeColor = Drawing.Color.Black
            Else
                Trend.ForeColor = Drawing.Color.MediumBlue
                Trend.Font.Bold = True
            End If
        Next
    End Sub
End Class


Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class ROTATOR_flt_SERVICING
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
    Sub EventFormatting()
        For Each item As GridDataItem In RadGrid_Active_Events.Items
            ' Dim Status As TableCell = item("E_Status")
            Dim ModifiedBy As TableCell = item("E_Modified_By")
            Dim Asset As TableCell = item("Asset")
            Dim DateEst As TableCell = item("E_Date_Estimated")
            'If InStr(Status.Text, "&nbsp;") Then
            'Else
            '    If Status.Text = "*New" Then
            '        item.BackColor = Drawing.Color.LightBlue
            '        item.ForeColor = Drawing.Color.Black
            '    End If
            'End If
            Dim EventType As TableCell = item("EventType")
            If InStr(EventType.Text, "&nbsp;") Then
            Else
                If EventType.Text = "Breakdown" And ModifiedBy.Text <> "PLANT ACTIVITY" Then
                    item.BackColor = Drawing.Color.Gold
                    item.ForeColor = Drawing.Color.Black
                ElseIf EventType.Text = "Breakdown" And ModifiedBy.Text = "PLANT ACTIVITY" Then
                    item.BackColor = Drawing.Color.FromName("#ffe75e")
                    item.ForeColor = Drawing.Color.Black
                    item.Font.Bold = True
                Else
                End If
            End If

            If InStr(DateEst.Text, "&nbsp;") Then
            Else
                If DateEst.Text < Date.Today Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If

            'Dim SupImg As Image = DirectCast(item("EventTypeImg").Controls(0), Image)
            'Select Case SupImg.AlternateText
            '    Case "Breakdown"
            '        If ModifiedBy.Text = "PLANT ACTIVITY" Then
            '            SupImg.ImageUrl = "../IMAGES/warningflash.png"
            '        Else
            '            SupImg.ImageUrl = "../../IMAGES/24x24/blank_24x24.png"
            '        End If
            '    Case Else
            '        SupImg.ImageUrl = "../../IMAGES/24x24/blank_24x24.png"
            'End Select
        Next
    End Sub
    Protected Sub RadGrid_Active_Events_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_Events.ItemDataBound
        EventFormatting()
    End Sub
End Class


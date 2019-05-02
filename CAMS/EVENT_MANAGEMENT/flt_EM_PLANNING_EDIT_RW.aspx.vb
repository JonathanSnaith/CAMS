Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class EVENT_MANAGEMENT_flt_EM_PLANNING_EDIT_RW
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_STM_ID.Value = Request.QueryString("STM_ID")
        Me.lbl_Asset.Text = Request.QueryString("STM_A_ID")
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.LblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        'Me.lblWhoIsIt.Text = "Jonathan Snaith"
        'Me.HF_PQQ_Permission.Value = 5
        GetData()
        Session("STM_ID") = Me.HF_STM_ID.Value
        'GetAdjustment()
        If RadCB_Level3.SelectedValue <> 805 Then
            Dim Freq As Double
            If Me.RadNumTxt_Frequency.Text = "0" Or Me.RadNumTxt_Frequency.Text = "" Then
                Freq = Me.RadNumTxt_Frequency.Text
            Else
                Freq = Me.RadNumTxt_Frequency.Text
            End If

            If RadNumTxt_SMU_Value.Text = "" Then RadNumTxt_SMU_Value.Text = "0"

            'Create new RadialGauge object
            Dim radialGauge As New RadRadialGauge()
            radialGauge.ID = "radialGauge1"

            'Set Pointer properties
            radialGauge.Pointer.Value = RadNumTxt_SMU_Value.Text '0.95
            radialGauge.Pointer.Cap.Size = 0.1
            radialGauge.Pointer.Cap.Color = System.Drawing.Color.Black
            radialGauge.Pointer.Color = System.Drawing.Color.Black

            'Set Min and Max values of the Scale
            radialGauge.Scale.Min = 0

            'In order the Max value to be displayed it should be multiple of the MajorUnit
            radialGauge.Scale.Max = Freq
            radialGauge.Scale.MinorUnit = Freq / 2
            radialGauge.Scale.MajorUnit = Freq / 10

            'Set Minor and Major Ticks properties
            radialGauge.Scale.MinorTicks.Visible = False
            radialGauge.Scale.MajorTicks.Size = 10

            'Set Scale Labels properties
            radialGauge.Scale.Labels.Visible = True
            radialGauge.Scale.Labels.Font = "15px Arial,Helvetica,sans-serif"
            radialGauge.Scale.Labels.Color = System.Drawing.Color.Black
            'radialGauge.Scale.Labels.Format = "P0"
            radialGauge.Scale.Labels.Position = Telerik.Web.UI.Gauge.ScaleLabelsPosition.Outside
            radialGauge.Width = 400

            'Create new GaugeRange object
            Dim gr1 As New GaugeRange()

            'Set the properties of the new object
            gr1.From = 0
            gr1.To = Freq / 3
            gr1.Color = System.Drawing.Color.Green

            Dim gr2 As New GaugeRange()
            gr2.From = Freq / 3
            gr2.To = (Freq / 3) * 2
            gr2.Color = System.Drawing.Color.Yellow

            Dim gr3 As New GaugeRange()
            gr3.From = (Freq / 3) * 2
            gr3.To = Freq
            gr3.Color = System.Drawing.Color.FromArgb(225, 0, 0)

            'Add Gauge objects to the RadialGauge
            radialGauge.Scale.Ranges.Add(gr1)
            radialGauge.Scale.Ranges.Add(gr2)
            radialGauge.Scale.Ranges.Add(gr3)

            'Add RadialGauge object to the div wrapper
            Me.PlaceHolder1.Controls.Add(radialGauge)
        End If
        Apply_Permissions()
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
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 75
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_4_R.Value = 1 'Event Dashboard R
                                        End If
                                    Case 86
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_4_RW.Value = 1 'Event Dashboard RW
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
        Dim ThisID As String = HF_STM_ID.Value
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "EM - Planning Edit" & " (" & ThisID & ")"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub GetData()
        Dim dvSql As DataView = DirectCast(SqlDS_Select.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_Modified.Text = DateTime.Parse(drvSql("STM_Modified")).ToString("dd MMM yyyy HH:mm")
            Me.lbl_Modified_By.Text = drvSql("STM_Modified_By").ToString()
            Me.RadCB_Asset.SelectedValue = drvSql("STM_A_ID").ToString()
            Me.lbl_Site.Text = drvSql("Site").ToString()
            Me.lbl_Model.Text = drvSql("Model").ToString()
            Me.lbl_Trend.Text = drvSql("SER_Trend").ToString()
            Me.lbl_Trend_Override.Text = drvSql("SER_Trend_Override").ToString()
            Me.HF_Trend.Value = drvSql("SER_Trend").ToString()
            If IsDBNull(drvSql("STM_Date_Reading")) = False Then
                Me.lbl_Date_Reading.Text = DateTime.Parse(drvSql("STM_Date_Reading")).ToString("MMM dd yyyy")
            End If
            If lbl_Date_Reading.Text = "Jan 01 1900" Then
                Me.lbl_Date_Reading.Text = "No Reading"
            End If
            Me.lbl_New_Number.Text = drvSql("STM_New_Number").ToString()
            Me.RadNumTxt_SMU_Value.Text = drvSql("STM_SMU_Value").ToString()
            Me.RadNumTxt_SMU_Initial.Text = drvSql("STM_SMU_Initial").ToString()
            Me.HF_SMU_Initial.Value = drvSql("STM_SMU_Initial").ToString()
            If HF_SMU_Initial.Value = "" Then
                HF_SMU_Initial.Value = "0"
            End If
            Me.lbl_ChangeDue.Text = drvSql("ChangeDue").ToString()
            If lbl_ChangeDue.Text < 0 Then
                Me.lbl_ChangeDue.ForeColor = Drawing.Color.Red
            End If
            Me.lbl_LatestSMU.Text = drvSql("LatestSMU").ToString() + " (" + lbl_Date_Reading.Text + ")"
            If Me.lbl_LatestSMU.Text = "0 ()" Then
                Me.lbl_LatestSMU.Text = "0"
            Else
            End If
            Me.lbl_SMU_Value.Text = drvSql("STM_SMU_Value").ToString()
            Me.RadCB_Level1.SelectedValue = drvSql("STM_Code_Level_1").ToString()
            Me.RadCB_Level2.SelectedValue = drvSql("STM_Code_Level_2").ToString()
            Me.RadCB_Level3.SelectedValue = drvSql("STM_Code_Level_3").ToString()
            Me.RadCB_Position.SelectedValue = drvSql("STM_Position_ID").ToString()
            Me.RadCB_Repair_Code.SelectedValue = drvSql("STM_Repair_Code").ToString()
            If IsDBNull(drvSql("STM_Date_Estimate")) = False Then
                Me.lbl_Estimated_Date.Text = DateTime.Parse(drvSql("STM_Date_Estimate")).ToString("dd MMM yyyy")
            End If
            Me.RadNumTxt_Frequency.Text = drvSql("STM_Frequency").ToString()
            Me.RadNumTxt_PCI.Text = drvSql("STM_PCI").ToString()
            Me.RadNumTxt_PCI_Interval.Text = drvSql("STM_PCI_Interval").ToString()
            Me.RadNumTxt_Adjustment.Text = drvSql("STM_Adjustment").ToString()
            Me.RadNumTxt_Cost.Text = drvSql("STM_Cost").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("STM_Planning_Status").ToString()
            Me.RadNumTxt_SMU_Changed.Text = drvSql("STM_SMU_Changed").ToString()
            Me.HF_SMU_Last.Value = drvSql("STM_SMU_Changed").ToString()
            Me.lbl_SMU_Changed_Value.Text = drvSql("STM_SMU_Changed").ToString()

            Me.RadCB_Reason.SelectedValue = drvSql("STM_Reason_ID").ToString()
            Me.RadTxt_Reason_Notes.Text = drvSql("STM_Reason_Notes").ToString()

            Me.lbl_MTD_Min.Text = drvSql("STM_Tyre_MTD_Min").ToString()
            Me.lbl_MTD_Current.Text = drvSql("STM_Tyre_MTD_Current").ToString()
            Me.lbl_Tyre_Serial.Text = drvSql("TyreSerial").ToString()
            Me.HF_PD_P_ID.Value = drvSql("PD_P_ID").ToString()


            Me.RadTxt_Notes.Text = drvSql("STM_Notes").ToString()
            If Me.RadCB_Status.SelectedValue = "*Planning" Then
                Me.Btn_Save.Visible = False
                Me.lbl_CloseMessage.Visible = True
                Me.lbl_CloseMessage.Text = "Item is locked for editing as it is currently being processed in Events"
                Me.lbl_Reason.Visible = True
                Me.RadCB_Reason.Visible = True
                Me.lbl_Reason_Note_Text.Visible = True
                Me.RadTxt_Reason_Notes.Visible = True
            End If
            Me.lbl_Plan.Text = drvSql("STMPlan").ToString()
            If drvSql("STMC_Current_Life").ToString() = Nothing Then
                Me.RadProgressBar1.Value = 0
            Else
                setProgressBarColor(RadProgressBar1, drvSql("STMC_Current_Life").ToString())
                RadProgressBar1.Label = drvSql("STMC_Current_Life").ToString() + "%"
                ''''Me.RadProgressBar1.Value = drvSql("STMC_Current_Life").ToString()
            End If
        Next
        Dim dvSql2 As DataView = DirectCast(SqlDS_LastSMUReading.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql2 As DataRowView In dvSql2
            Me.HF_SMULastReading.Value = drvSql2("SMU_Value").ToString()
        Next
        If RadCB_Level3.SelectedValue = 805 Then
            lbl_Frequency_Text.Visible = False
            RadNumTxt_Frequency.Visible = False
            lbl_SMU_Value_Text.Visible = False
            lbl_SMU_Value.Visible = False
            RadNumTxt_SMU_Value.Visible = False
            lbl_SMU_Changed_Text.Visible = False
            RadNumTxt_SMU_Changed.Visible = False
            lbl_Change_Due_Text.Visible = False
            lbl_ChangeDue.Visible = False
            lbl_Adjustment_Text.Visible = False
            RadNumTxt_Adjustment.Visible = False
            lbl_PCI_Text.Visible = False
            RadNumTxt_PCI.Visible = False
            lbl_PCI_Interval_Text.Visible = False
            RadNumTxt_PCI_Interval.Visible = False
            lbl_SMU_Initial_Text.Visible = False
            RadNumTxt_SMU_Initial.Visible = False
            RadGrid1.Visible = False

            lbl_MTD_Min_Text.Visible = True
            lbl_MTD_Min.Visible = True
            lbl_MTD_Current_Text.Visible = True
            lbl_MTD_Current.Visible = True
            lbl_Tyre_Serial_Text.Visible = True
            lbl_Tyre_Serial.Visible = True
            RadTabStrip1.Visible = True
            RadMultiPage2.Visible = True
            RadPV_Grid2.Visible = True
            RadPV_Grid3.Visible = True
            RadGrid2.Visible = True
            RadGrid3.Visible = True
        End If
    End Sub
    Protected Sub setProgressBarColor(ByRef progBar As RadProgressBar, ByVal pbValue As Double)
        progBar.Value = pbValue
        Select Case CInt(pbValue)
            Case Is >= 66
                progBar.CssClass = "redProgressBar"
            Case Is >= 33
                progBar.CssClass = "yellowProgressBar"
            Case Else
                progBar.CssClass = "greenProgressBar"
        End Select
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Me.SqlDS_Update.Select(DataSourceSelectArguments.Empty)
        If Me.lbl_Date_Reading.Text = "1900-01-01" Or Me.lbl_Date_Reading.Text = "" Or lbl_New_Number.Text = "" Or lbl_New_Number.Text = "0" Then
        Else
            If HF_Trend.Value > 0 Then
                Me.SqlDS_Planning_Estimate_Date.Select(DataSourceSelectArguments.Empty)
            End If
        End If
        If Me.RadCB_Status.SelectedValue = "*Planning" Then
            Me.SqlDS_Planning.Select(DataSourceSelectArguments.Empty)
            Me.SqlDS_Manual_Email.Select(DataSourceSelectArguments.Empty)
        End If
        If HF_Planning.Value = 1 Then
            Me.SqlDS_Component_Changeout_Request_Email.Select(DataSourceSelectArguments.Empty)
        End If
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("STM_ID") = Me.HF_STM_ID.Value
    End Sub
    Sub GetAdjustment()
        Dim dvSql As DataView = DirectCast(SqlDS_Trend.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.HF_Trend.Value = drvSql("SER_Trend").ToString()
        Next
        If HF_Trend.Value = "" Then HF_Trend.Value = 0
        If HF_Trend.Value < 1 Then
            Exit Sub
        Else
            If RadNumTxt_Adjustment.Text = "" Then
                Me.RadNumTxt_Adjustment.Text = "0"
            End If
            If RadNumTxt_SMU_Value.Text = "" Then
                Me.RadNumTxt_SMU_Value.Text = "0"
            End If
            Dim Frequency As Double
            If Me.RadNumTxt_Frequency.Text = "" Then
                Me.RadNumTxt_Frequency.Text = 0
                Frequency = Me.RadNumTxt_Frequency.Text
            End If
            If Me.RadNumTxt_Frequency.Text > 0 Then
                Frequency = Me.RadNumTxt_Frequency.Text
            End If
            If lbl_Date_Reading.Text <> "No Reading" Then
                Dim Step1 As Integer
                Dim Step2 As Date
                Step1 = Format(((((CDbl(Me.RadNumTxt_Adjustment.Text) + Frequency) - CDbl(RadNumTxt_SMU_Value.Text)) / HF_Trend.Value) * 7), "#,##0.##")
                Step2 = DateAdd(DateInterval.Day, Step1, CDate(Me.lbl_Date_Reading.Text))
                Me.lbl_Estimated_Date.Text = Step2.ToString("dd MMM yyyy")
            End If
        End If
    End Sub
    Protected Sub RadNumTxt_Adjustment_TextChanged(sender As Object, e As System.EventArgs) Handles RadNumTxt_Adjustment.TextChanged
        GetAdjustment()
    End Sub
    Protected Sub RadNumTxt_Frequency_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Frequency.TextChanged
        GetAdjustment()
    End Sub
    Protected Sub RadNumTxt_SMU_Value_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_SMU_Value.TextChanged
        GetAdjustment()
    End Sub
    Protected Sub RadCB_Level1_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level1.SelectedIndexChanged
        Me.RadCB_Level2.SelectedValue = "2662"
        Me.RadCB_Level3.SelectedValue = "2663"
    End Sub
    Protected Sub RadCB_Level2_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level2.SelectedIndexChanged
        Me.RadCB_Level3.SelectedValue = "2663"
    End Sub
    Protected Sub RadNumTxt_SMU_Changed_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_SMU_Changed.TextChanged
        Dim InitialSMU As Integer
        InitialSMU = 0
        If RadNumTxt_SMU_Initial.Text <> "" Then
            InitialSMU = RadNumTxt_SMU_Initial.Text
        End If

        Me.RadNumTxt_SMU_Value.Text = (HF_SMULastReading.Value - RadNumTxt_SMU_Changed.Text) + InitialSMU
    End Sub
    Protected Sub RadNumTxt_SMU_Initial_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_SMU_Initial.TextChanged
        If HF_SMU_Initial.Value = 0 Then
            Me.RadNumTxt_SMU_Value.Text = CDbl(Me.RadNumTxt_SMU_Value.Text) + CDbl(RadNumTxt_SMU_Initial.Text)
            GetAdjustment()
        Else
            Me.RadNumTxt_SMU_Value.Text = CDbl(Me.RadNumTxt_SMU_Value.Text) - Me.HF_SMU_Initial.Value
            Me.RadNumTxt_SMU_Value.Text = CDbl(Me.RadNumTxt_SMU_Value.Text) + CDbl(RadNumTxt_SMU_Initial.Text)
            GetAdjustment()
            Me.HF_SMU_Initial.Value = RadNumTxt_SMU_Initial.Text
        End If
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_4_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                    Me.RadGrid1.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                    Me.RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
                Else
                    Me.Btn_Save.Visible = False
                    Me.RadGrid1.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
                    Me.RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
                    HF_Planning.Value = 0
                End If
            Case 3
                If HF_EXCEPTION_4_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                    Me.RadGrid1.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                    Me.RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
                Else
                    Me.Btn_Save.Visible = False
                    Me.RadGrid1.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
                    Me.RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
                    HF_Planning.Value = 0
                End If
            Case 4
                Me.Btn_Save.Visible = True
                Me.RadGrid1.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                Me.RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
            Case 5
                Me.Btn_Save.Visible = True
                Me.RadGrid1.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                Me.RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
            Case Else
                Me.Btn_Save.Visible = False
                Me.RadGrid1.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
                Me.RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
                HF_Planning.Value = 0
        End Select
    End Sub

    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        If RadCB_Status.SelectedValue = "*Planning" Then
            Me.lbl_Reason.Visible = True
            Me.RadCB_Reason.Visible = True
            Me.lbl_Reason_Note_Text.Visible = True
            Me.RadTxt_Reason_Notes.Visible = True
            Me.Btn_Save.Visible = False
        Else
            Me.lbl_Reason.Visible = False
            Me.RadCB_Reason.SelectedValue = Nothing
            Me.RadCB_Reason.Visible = False
            Me.lbl_Reason_Note_Text.Visible = False
            Me.RadTxt_Reason_Notes.Visible = False
            Me.Btn_Save.Visible = True
            Apply_Permissions()
        End If
    End Sub
    Protected Sub RadCB_Reason_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Reason.SelectedIndexChanged
        If RadCB_Reason.SelectedValue IsNot Nothing And RadCB_Reason.SelectedValue <> "" And RadTxt_Reason_Notes.Text <> "" Then
            Me.Btn_Save.Visible = True
            HF_Planning.Value = 1
            Apply_Permissions()
        Else
            Me.Btn_Save.Visible = False
            HF_Planning.Value = 0
        End If
    End Sub
    Protected Sub RadTxt_Reason_Notes_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_Reason_Notes.TextChanged
        If RadCB_Reason.SelectedValue IsNot Nothing And RadCB_Reason.SelectedValue <> "" And RadTxt_Reason_Notes.Text <> "" Then
            Me.Btn_Save.Visible = True
            HF_Planning.Value = 1
            Apply_Permissions()
        Else
            Me.Btn_Save.Visible = False
            HF_Planning.Value = 0
            Dim msgstrEmptyWarning As String = "Please ensure both the Planning Reason and the Note are completed before preceding"
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrEmptyWarning & "');", True)
        End If
    End Sub
    Protected Sub RadGrid2_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid2.ItemDataBound
        For Each item As GridDataItem In RadGrid2.Items
            Dim CurrentMTD As TableCell = item("PDI_Tyre_MTD_Current")
            Dim ThisCurrentMTD = CurrentMTD.Text

            If InStr(CurrentMTD.Text, "&nbsp;") Then
            Else
                If ThisCurrentMTD < CInt(lbl_MTD_Min.Text) Then
                    CurrentMTD.ForeColor = Drawing.Color.Red
                Else
                End If
            End If
        Next
    End Sub
    Protected Sub RadGrid3_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid3.ItemDataBound
        For Each item As GridDataItem In RadGrid3.Items
            Dim CurrentMTD As TableCell = item("PDI_Tyre_MTD_Current")
            Dim ThisCurrentMTD = CurrentMTD.Text

            If InStr(CurrentMTD.Text, "&nbsp;") Then
            Else
                If ThisCurrentMTD < CInt(lbl_MTD_Min.Text) Then
                    CurrentMTD.ForeColor = Drawing.Color.Red
                Else
                End If
            End If
            Dim lblassetid As RadLabel = DirectCast(item.FindControl("RadLbl_Part_ID"), RadLabel)
            With lblassetid
                If IsNumeric(item("P_ID").Text) Then
                    .Attributes.Add("onClick", "part_tracker('" + item("P_ID").Text + "');")
                    .ToolTip = "Open Part Tracker"
                Else
                    .Visible = False
                End If
            End With
        Next
    End Sub
End Class
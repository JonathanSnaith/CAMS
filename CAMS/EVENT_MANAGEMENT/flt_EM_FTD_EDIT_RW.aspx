<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Add/Edit Timesheet Detail" CodeFile="flt_EM_FTD_EDIT_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_FTD_EDIT_RW" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style1 {
            text-align: right;
        }

        .style3 {
            height: 45px;
            width: 592px;
        }

        .style11 {
            text-align: left;
            width: 343px;
        }

        .style12 {
            width: 272px;
        }

        .style13 {
            text-align: left;
            width: 272px;
        }

        .auto-style1 {
            height: 45px;
            width: 79px;
        }

        .auto-style4 {
            height: 45px;
            }

        .auto-style8 {
            width: 100%;
        }

        .auto-style10 {
            color: yellow;
        }

        </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        function saveandcloseWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_FTD_ID').value;
            oWnd.close(ThisVal);
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            oWnd.close();
        }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" class="auto-style8">
                        <tr>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c;" class="auto-style1">
                                <img alt="" src="../IMAGES/Icons/EVENT_FITTER_TIMESHEET.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; padding-right: 10px;" class="auto-style4">ADD/EDIT TIMESHEET DETAILS
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general" cellspacing="0">
                                <tr>
                                    <td style="font-weight: bold">Travel</td>
                                    <td style="font-weight: bold">&nbsp;</td>
                                    <td style="font-weight: bold">&nbsp;</td>
                                    <td>
                                        <strong>Summary Hours</strong></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td valign="top">&nbsp;</td>
                                    <td valign="top">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-top-style: solid; border-left-style: solid;">Engineer:<span class="auto-style10">*</span></td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC; border-top-style: solid;">
                                        <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-top-style: solid; border-left-style: solid;">Travel time to site:</td>
                                    <td valign="top" style="border-color: #CCCCCC; padding-left: 5px; border-right-style: solid; border-top-style: solid;">
                                        <asp:Label ID="lbl_Travel_To_Time" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">
                                        Start Location:</td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadTextBox ID="RadTxt_Start_Location" Runat="server" Skin="Glow" Width="250px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-left-style: solid; border-color: #CCCCCC"></td>
                                    <td valign="top" style="border-right-style: solid; border-color: #CCCCCC">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">
                                        Start Time:<span class="auto-style10">*</span></td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadDateTimePicker ID="RadDTP_Start_Time" Runat="server" Skin="Glow" Width="200px" AutoPostBackControl="Both">
                                            <TimeView runat="server" Columns="4" EndTime="23:00:00" Interval="00:15:00" ShowHeader="False" Skin="Glow" StartTime="05:00:00">
                                            </TimeView>
                                            <TimePopupButton HoverImageUrl="" ImageUrl="" />
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDateTimePicker>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">Hrs on site:</td>
                                    <td valign="top" style="border-color: #CCCCCC; padding-left: 5px; border-right-style: solid;">
                                        <asp:Label ID="lbl_Job_Time" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">
                                         Start Mileage:</td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Start_Mileage" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="500000" MinValue="0" Skin="Glow" Width="160px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-left-style: solid; border-color: #CCCCCC"></td>
                                    <td valign="top" style="border-right-style: solid; border-color: #CCCCCC">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">
                                        Time ON Site:<span class="auto-style10">*</span></td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadDateTimePicker ID="RadDTP_Job_Start_Time" Runat="server" Skin="Glow" Width="200px" AutoPostBackControl="Both">
                                            <TimeView runat="server" Columns="4" EndTime="23:00:00" Interval="00:15:00" ShowHeader="False" Skin="Glow" StartTime="05:00:00">
                                            </TimeView>
                                            <TimePopupButton HoverImageUrl="" ImageUrl="" />
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDateTimePicker>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">Travel time from site:</td>
                                    <td valign="top" style="border-color: #CCCCCC; padding-left: 5px; border-right-style: solid;">
                                        <asp:Label ID="lbl_Travel_From_Time" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">Breaks (mins)</td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadComboBox ID="RadCB_Breaks" Runat="server" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="0" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Text="15" Value="15" />
                                                <telerik:RadComboBoxItem runat="server" Text="30" Value="30" />
                                                <telerik:RadComboBoxItem runat="server" Text="45" Value="45" />
                                                <telerik:RadComboBoxItem runat="server" Text="60" Value="60" />
                                                <telerik:RadComboBoxItem runat="server" Text="75" Value="75" />
                                                <telerik:RadComboBoxItem runat="server" Text="90" Value="90" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-left-style: solid; border-color: #CCCCCC">&nbsp;</td>
                                    <td valign="top" style="border-right-style: solid; border-color: #CCCCCC">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">Time OFF Site:<span class="auto-style10">*</span></td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadDateTimePicker ID="RadDTP_Job_End_Time" Runat="server" Skin="Glow" Width="200px" AutoPostBackControl="Both">
                                            <TimeView runat="server" Columns="4" EndTime="23:00:00" Interval="00:15:00" ShowHeader="False" Skin="Glow" StartTime="05:00:00">
                                            </TimeView>
                                            <TimePopupButton HoverImageUrl="" ImageUrl="" />
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDateTimePicker>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">Breaks:</td>
                                    <td valign="top" style="border-color: #CCCCCC; padding-left: 5px; border-right-style: solid;">
                                        <asp:Label ID="lbl_Breaks" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">End Location:</td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadTextBox ID="RadTxt_End_Location" Runat="server" Skin="Glow" Width="250px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-left-style: solid; border-color: #CCCCCC">&nbsp;</td>
                                    <td valign="top" style="border-right-style: solid; border-color: #CCCCCC">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">End Time:<span class="auto-style10">*</span></td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadDateTimePicker ID="RadDTP_End_Time" Runat="server" Skin="Glow" Width="200px" AutoPostBackControl="Both">
                                            <TimeView runat="server" Columns="4" EndTime="23:00:00" Interval="00:15:00" ShowHeader="False" Skin="Glow" StartTime="05:00:00">
                                            </TimeView>
                                            <TimePopupButton HoverImageUrl="" ImageUrl="" />
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDateTimePicker>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;"><strong>Total Hrs:</strong></td>
                                    <td valign="top" style="border-color: #CCCCCC; padding-left: 5px; border-right-style: solid;">
                                        <asp:Label ID="lbl_Total_Time" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">End Mileage:</td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_End_Mileage" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="500000" MinValue="0" Skin="Glow" Width="160px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid; color: #FFFF00; font-size: 14px; font-weight: bold;" valign="middle">Peak Hrs:</td>
                                    <td style="border-color: #CCCCCC; padding-left: 5px; border-right-style: solid;" valign="middle">
                                        <asp:Label ID="lbl_Peak_Time" runat="server" Font-Bold="True" Font-Size="14px" ForeColor="Yellow"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid;">&nbsp;</td>
                                    <td style="border-right-style: solid; border-color: #CCCCCC">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid; color: #FF9933; font-size: 14px; font-weight: bold;" valign="middle">Off-Peak Hrs:</td>
                                    <td style="border-color: #CCCCCC; padding-left: 5px; border-right-style: solid;" valign="middle">
                                        <asp:Label ID="lbl_Off_Peak_Time" runat="server" Font-Bold="True" Font-Size="14px" ForeColor="Orange"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-left-style: solid; border-bottom-style: solid;">&nbsp;</td>
                                    <td style="border-bottom-style: solid; border-right-style: solid; border-color: #CCCCCC">
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td valign="top" style="border-color: #CCCCCC; text-align: right; padding-right: 5px; border-bottom-style: solid; border-left-style: solid;"><strong>Total Mileage:</strong></td>
                                    <td valign="top" style="border-color: #CCCCCC; padding-left: 5px; border-bottom-style: solid; border-right-style: solid;">
                                        <asp:Label ID="lbl_Total_Mileage" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td valign="top">&nbsp;</td>
                                    <td valign="top">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">Status:</td>
                                    <td style="font-weight: bold">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="4">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="font-weight: bold">&nbsp;</td>
                                    <td style="padding-left: 20px" align="center">
                                        &nbsp;</td>
                                    <td align="center" style="padding-left: 20px">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" Skin="Glow" TabIndex="5" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px" align="center">
                                        &nbsp;</td>
                                    <td align="center" style="padding-left: 20px">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" TabIndex="6" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
             <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Previous_Status" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_FTD_ID" runat="server" />
            <asp:HiddenField ID="HF_J_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadDTP_Start_Time">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadDTP_Job_Start_Time">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadDTP_Job_End_Time">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadDTP_End_Time">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Start_Mileage">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_End_Mileage" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_End_Mileage">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Start_Mileage" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Event" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


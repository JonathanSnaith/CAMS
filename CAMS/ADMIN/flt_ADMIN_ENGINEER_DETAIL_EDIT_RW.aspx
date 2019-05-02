<%@ Page Language="VB" AutoEventWireup="false" Title="Admin - Asset - Edit Attribute" CodeFile="flt_ADMIN_ENGINEER_DETAIL_EDIT_RW.aspx.vb" Inherits="ADMIN_flt_ADMIN_ENGINEER_DETAIL_EDIT_RW" %>

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

        .style2 {
            font-size: 20px;
        }

        .style3 {
            height: 45px;
            width: 592px;
        }

        .style4 {
            text-align: right;
            height: 68px;
        }

        .style5 {
            height: 68px;
        }

        .auto-style1 {
            height: 45px;
            width: 73px;
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
            var ThisVal = document.getElementById('HF_ENGD_ID').value;
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
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c;" class="auto-style1">
                                <img alt="" src="../IMAGES/metro_setting_58x58.PNG" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c;">ADMIN : EDIT ENGINEER DETAILS</td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style1" style="padding-right: 20px"><strong>DETAILS</strong></td>
                                    <td>
                                        &nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Engineer:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px" AutoPostBack="True">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Peak Rate (/hr):</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Rate" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="40px" MaxValue="1000" MinValue="0" Skin="Glow" Type="Currency" Width="100px" AutoPostBack="True">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Off-Peak Rate (/hr):</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Off_Peak_Rate" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="40px" MaxValue="10000" MinValue="0" Skin="Glow" Type="Currency" Width="100px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Mileage Rate (/hr):</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Mileage_Rate" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="40px" MaxValue="10" MinValue="0" Skin="Glow" Type="Currency" Width="100px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">From:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_From" Runat="server" Skin="Glow" AutoPostBack="True">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" AutoPostBack="True">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                                <telerik:RadComboBoxItem runat="server" Text="Archive" Value="Archive" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Skin="Glow" Text="Save" Visible="False" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_To" runat="server" Text="To:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_To" Runat="server" Skin="Glow" Visible="False" AutoPostBack="True">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" AutoPostBack="True">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 20px">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" Text="Cancel" Width="100px">
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
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_ENGD_ID" runat="server" />
             <asp:HiddenField ID="HF_ENG_Flag" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_Current" runat="server" Value="1" />
            <asp:HiddenField ID="HF_EXCEPTION_11_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_11_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Rate">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Off_Peak_Rate">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Mileage_Rate">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_From">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_To">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_EMPD_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Current" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>

        </div>
    </form>
</body>
</html>


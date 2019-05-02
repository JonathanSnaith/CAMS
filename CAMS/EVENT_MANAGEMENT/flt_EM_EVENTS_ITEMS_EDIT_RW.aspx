<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Add/Edit Event Item" CodeFile="flt_EM_EVENTS_ITEMS_EDIT_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_EVENTS_ITEMS_EDIT_RW" %>
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

        .auto-style9 {
            font-weight: bold;
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
            var ThisVal = document.getElementById('HF_EI_ID').value;
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
                                <img alt="" src="../IMAGES/Icons/EVENT_DETAIL.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; padding-right: 10px;" class="auto-style4">ADD/EDIT EVENT ITEM DETAILS
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style9">Item</td>
                                    <td style="font-weight: bold">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">Component:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">Description:</td>
                                    <td colspan="2">
                                        <telerik:RadTextBox ID="RadTxt_Name" Runat="server" Rows="4" Skin="Glow" TextMode="MultiLine" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">
                                        Quantity:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Qty" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="100" MinValue="1" Skin="Glow" Width="50px" AutoPostBack="True">
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
                                        <asp:Label ID="lbl_Qty" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td valign="top" style="padding-left: 5px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">Rate:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Rate" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000000" MinValue="0" Skin="Glow" Width="100px" Type="Currency">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="2" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td valign="top">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">Markup (%):</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Markup" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="10000" MinValue="0" Skin="Glow" Type="Percent" Width="50px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="2" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td valign="top">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">Total:</td>
                                    <td>
                                        <asp:Label ID="lbl_Total" runat="server"></asp:Label>
                                    </td>
                                    <td valign="top" style="padding-left: 5px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">Status:</td>
                                    <td style="font-weight: bold">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="4">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                <telerik:RadComboBoxItem runat="server" Text="Requested" Value="Requested" />
                                                <telerik:RadComboBoxItem runat="server" Text="Used" Value="Used" />
                                                <telerik:RadComboBoxItem runat="server" Text="Unused" Value="Unused" />
                                                <telerik:RadComboBoxItem runat="server" Text="Rejected" Value="Rejected" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="center" style="padding-left: 20px">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" Skin="Glow" TabIndex="5" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-right: 5px">
                                        <asp:Label ID="lbl_Qty_Used" runat="server" Text="Quantity Used:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Qty_Used" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="100" MinValue="0" Skin="Glow" Visible="False" Width="50px" Value="0">
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
             <telerik:RadNotification ID="RadNotification1" runat="server" Skin="Glow"  LoadContentOn="FirstShow" VisibleOnPageLoad="True"  Position="Center"
                 Text="Incorrect Quantity. Please ensure that Quantity Used is less than and equal to Quantity before continuing." Title="CAMS Warning" Height="130px" Width="400px" Visible="False">
            </telerik:RadNotification>
             <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Previous_Status" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_EI_ID" runat="server" />
            <asp:HiddenField ID="HF_E_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Qty">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Rate" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Total" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                             <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Rate">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Qty" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Total" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                             <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadNumTxt_Markup">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Total" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                             <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Event" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Qty_Used" />
                             <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Qty_Used" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                             <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Qty_Used">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


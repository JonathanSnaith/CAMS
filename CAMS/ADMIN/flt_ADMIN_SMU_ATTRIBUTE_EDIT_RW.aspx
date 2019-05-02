<%@ Page Language="VB" AutoEventWireup="false" Title="Admin - Codes - Edit Attribute" CodeFile="flt_ADMIN_SMU_ATTRIBUTE_EDIT_RW.aspx.vb" Inherits="ADMIN_flt_ADMIN_SMU_ATTRIBUTE_EDIT_RW" %>
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
            width: 74px;
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
            var ThisVal = document.getElementById('lbl_Table').innerHTML;
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
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c;">ADMIN : EDIT ATTRIBUTE
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td></td>
                                    <td colspan="6" class="style2">
                                        <strong>
                                    <asp:Label ID="lbl_Table_English" runat="server"></asp:Label>
                                        </strong></td>
                                    <td class="style2"></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px"></td>
                                    <td colspan="6">
                                        <strong>
                                            <asp:Label ID="lbl_Table" runat="server" ForeColor="#2c3338"></asp:Label>
                                        </strong>
                                        <br />
                                    </td>
                                    <td style="padding-left: 20px"></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Level" runat="server" Text="Level:" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="6">
                                        <telerik:RadComboBox ID="RadCB_Level" runat="server" AutoPostBack="True" Visible="False" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Level 1" Value="1" />
                                                <telerik:RadComboBoxItem runat="server" Text="Level 2" Value="2" />
                                                <telerik:RadComboBoxItem runat="server" Text="Level 3" Value="3" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">
                                        <asp:Label ID="lbl_Level_Value" runat="server" Text="0" Visible="False" ForeColor="#2C3338"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Level1" runat="server" Text="Level 1:" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="6">
                                        <telerik:RadComboBox ID="RadCB_Level1" runat="server" AllowCustomText="True" AutoPostBack="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Visible="False" Width="300px" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">
                                        <asp:Label ID="lbl_Lookup_ID" runat="server" Text="0" Visible="False" ForeColor="#2C3338"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Level2" runat="server" Text="Level 2:" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="6">
                                        <telerik:RadComboBox ID="RadCB_Level2" runat="server" AllowCustomText="True" AutoPostBack="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Visible="False" Width="300px" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Level3" runat="server" Text="Level 3:" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="6">
                                        <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" AutoPostBack="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Visible="False" Width="300px" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Name:</td>
                                    <td colspan="6">
                                        <telerik:RadTextBox ID="RadTxt_Name" runat="server" Skin="Glow" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">
                                        <asp:Label ID="lbl_Name" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" Text="(4 digit code)" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" style="padding-right: 20px">Description:</td>
                                    <td colspan="6" class="style5">
                                        <telerik:RadTextBox ID="RadTxt_Description" runat="server" Height="59px"
                                            Skin="Glow" TextMode="MultiLine" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px" class="style5">
                                        <asp:Label ID="lbl_Desc" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" Text="(description - CAPITALS)" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Status:</td>
                                    <td colspan="6">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                                <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">
                                        <telerik:RadButton ID="Btn_Save" runat="server" BackColor="Red" Skin="Glow"
                                            Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Lookup" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="6">
                                        <telerik:RadComboBox ID="RadCB_TriggerCode" runat="server" Skin="Glow"
                                            Visible="False" Width="300px"
                                            DataTextField="ATT_Name" DataValueField="ATT_ID"
                                            ResolvedRenderMode="Classic" AllowCustomText="True" Filter="Contains">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow"
                                            Skin="Glow" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="3"></td>
                                    <td colspan="3"></td>
                                    <td style="padding-left: 20px"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="padding-left: 15px"></td>
                                    <td></td>
                                    <td></td>
                                    <td style="padding-left: 20px">
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
            <asp:HiddenField ID="HF_ATT_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_11_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_11_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_ATT_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Level1" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level1" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Level2" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Level_Value" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Lookup_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level2" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Lookup_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Lookup_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Lookup_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


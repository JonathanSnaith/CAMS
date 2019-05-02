<%@ Page Language="VB" AutoEventWireup="false" Title="Customer Management - Site List - Edit Site" CodeFile="flt_SITE_LIST_EDIT_RW.aspx.vb" Inherits="CUSTOMER_MANAGEMENT_flt_SITE_LIST_EDIT_RW" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style1 {
            text-align: right;
             color: white;     
        }

        .style3 {
            height: 45px;
            width: 751px;
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
            width: 80px;
        }

        .auto-style3 {
            text-align: right;
            color: white;
            height: 19px;
        }
        .auto-style4 {
            height: 19px;
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
            oWnd.close();
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_SITE_ID').value;
            oWnd.close(ThisVal);
        }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
           <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" class="auto-style1" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c;">
                                <img id="ImgHome" alt="" onclick="fn_home()" src="../IMAGES/metro_setting_58x58.png" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c; padding-right: 10px;">EDIT SITE
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="7">
                        <telerik:RadPageView ID="RadPV_ASSET_INFO" runat="server" Selected="True" >                   
                            <table class="style_table_general" style="vertical-align: top;">
                                <tr valign="top">
                                    <td class="auto-style3" style="padding-right: 20px" valign="top">
                                        Site:</td>
                                    <td class="auto-style4">
                                        <telerik:RadTextBox ID="RadTxt_Site_Name" runat="server" Skin="Glow" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px" class="auto-style4"></td>
                                    <td class="style1" style="padding-left: 20px" rowspan="12">&nbsp;</td>
                                    <td rowspan="12">
                                        &nbsp;</td>
                                </tr>
                                <tr valign="top">
                                    <td class="auto-style3" style="padding-right: 20px" valign="top">Customer:</td>
                                    <td class="auto-style4">
                                        <telerik:RadComboBox ID="RadCB_Customer" runat="server" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td class="auto-style4" style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr valign="top">
                                    <td class="auto-style3" style="padding-right: 20px" valign="top">Address Type:</td>
                                    <td class="auto-style4">
                                        <telerik:RadComboBox ID="RadCB_Address_Type" runat="server" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Registered" Value="Registered" />
                                                <telerik:RadComboBoxItem runat="server" Text="Secondary" Value="Secondary" />
                                                <telerik:RadComboBoxItem runat="server" Text="Unspecified" Value="Unspecified" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td class="auto-style4" style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Address:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Address_1" runat="server" Skin="Glow" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Address_2" runat="server" Skin="Glow" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Address_3" runat="server" Skin="Glow" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">City:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_City" runat="server" Skin="Glow" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">County:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_County" runat="server" Skin="Glow" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Postcode:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Postcode" runat="server" Skin="Glow" Width="150px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">GPS Lat:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Lat" runat="server" Skin="Glow" Width="150px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">GPS Lon:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Lon" runat="server" Skin="Glow" Width="150px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                                <telerik:RadComboBoxItem runat="server" Text="Non-Active" Value="Non-Active" />
                                                <telerik:RadComboBoxItem runat="server" Text="Do Not Use" Value="Do Not Use" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px"></td>
                                    <td align="right" style="padding-right: 20px;"></td>
                                </tr>
                            </table>
                        </telerik:RadPageView>       
                    </telerik:RadMultiPage>
                    <table width="100%" >
                     <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Skin="Glow" Text="Save" Width="100px" BackColor="Red" Font-Bold="True" Visible="False">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                    </td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
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
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_SITE_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_19_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_19_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                 <AjaxSettings>
               <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


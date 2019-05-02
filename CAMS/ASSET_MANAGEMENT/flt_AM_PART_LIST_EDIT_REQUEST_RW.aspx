<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET - Review Part Request" CodeFile="flt_AM_PART_LIST_EDIT_REQUEST_RW.aspx.vb" Inherits="AM_PART_LIST_EDIT_REQUEST_RW" %>

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

        .style7 {
            font-size: 20px;
            height: 25px;
        }

        .style13 {
            width: 143px;
        }

        .auto-style1 {
            width: 4px;
        }

        .auto-style2 {
            height: 45px;
            width: 74px;
        }

        .auto-style5 {
            width: 143px;
            height: 25px;
        }
        .auto-style6 {
            height: 25px;
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
            //var ThisVal = document.getElementById('lbl_Table').innerHTML;
            oWnd.close();
            top.location.href = top.location.href;
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
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c;" class="auto-style2">
                                <img alt="" src="../IMAGES/Icons/ASSET_PARTS.PNG" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c;">PART REQUEST
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style13">&nbsp;</td>
                                    <td class="style7" colspan="2">
                                        <strong>&nbsp; 
                                        </strong></td>
                                    <td class="style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Customer:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Customer" Runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Skin="Glow" Width="250px">
                                        </telerik:RadComboBox>
                                        <asp:Label ID="lbl_Customer" runat="server" Font-Bold="True" Style="font-style: italic" Visible="False"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Asset:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Asset" Runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" Skin="Glow" Width="250px">
                                        </telerik:RadComboBox>
                                        <asp:Label ID="lbl_Asset" runat="server" Font-Bold="True" Style="font-style: italic" Visible="False"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Model:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Model" runat="server" Font-Bold="True" Style="font-style: italic"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">Component:</td>
                                    <td colspan="2" class="auto-style6">
                                        <telerik:RadComboBox ID="RadCB_Component" Runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="250px">
                                        </telerik:RadComboBox>
                                        <asp:Label ID="lbl_Level3" runat="server" Font-Bold="True" Style="font-style: italic" Visible="False"></asp:Label>
                                    </td>
                                    <td class="auto-style6"></td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lbl_StatusText" runat="server" Text="Stock Status:"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Stock" runat="server"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Reason for Request:</td>
                                    <td colspan="2">
                                        <telerik:RadTextBox ID="RadTxt_Reason" Runat="server" Height="72px" Skin="Glow" TextMode="MultiLine" Width="100%">
                                        </telerik:RadTextBox>
                                        <asp:Label ID="lbl_Reason" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                                <telerik:RadComboBoxItem runat="server" Text="Approved" Value="Approved" />
                                                <telerik:RadComboBoxItem runat="server" Text="Rejected" Value="Rejected" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Rejection_Notes_Text" runat="server" Text="Rejection Notes:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Rejection_Notes" Runat="server" Height="96px" TextMode="MultiLine" Visible="False" Width="111%" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <table class="style_table_general">
                                <tr>
                                    <td class="style13" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Skin="Glow"
                                            Text="Submit" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        &nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow"
                                            Skin="Glow" Text="Cancel" Width="100px">
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
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_MOD_ID" runat="server" />
             <asp:HiddenField ID="HF_A_ID" runat="server" />
             <asp:HiddenField ID="HF_Code_Level_3" runat="server" />
             <asp:HiddenField ID="HF_Created_By" runat="server" />
            <asp:HiddenField ID="HF_PR_ID" runat="server" />
            <asp:HiddenField ID="HF_Stock" runat="server" />
            <asp:HiddenField ID="HF_Status" runat="server" />
            <asp:SqlDataSource ID="SqlDS_Select" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_PART_LIST_RG_REQUEST_SELECT_RW_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_PR_ID" Name="PR_ID" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Email" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_PART_REQUEST_OPEN"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                     <asp:ControlParameter ControlID="HF_A_ID" Name="A_ID" PropertyName="Value" Type="String" DefaultValue="0" />
                     <asp:ControlParameter ControlID="RadCB_Component" Name="P_Level_3" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_Username" Name="PR_Modified_By" PropertyName="Value" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Approved" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_PART_REQUEST_APPROVED"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_PR_ID" Name="PR_ID" PropertyName="Value" Type="String" DefaultValue="0" />
                     <asp:ControlParameter ControlID="HF_A_ID" Name="A_ID" PropertyName="Value" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_Code_Level_3" Name="P_Level_3" PropertyName="Value" Type="String" DefaultValue="0" />
                     <asp:ControlParameter ControlID="HF_Username" Name="PR_Modified_By" PropertyName="Value" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Rejected" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_PART_REQUEST_REJECTED"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_PR_ID" Name="PR_ID" PropertyName="Value" Type="String" DefaultValue="0" />
                     <asp:ControlParameter ControlID="HF_A_ID" Name="A_ID" PropertyName="Value" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_Code_Level_3" Name="P_Level_3" PropertyName="Value" Type="String" DefaultValue="0" />
                     <asp:ControlParameter ControlID="HF_Username" Name="PR_Modified_By" PropertyName="Value" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_StockCheck" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
                 SelectCommand="AM_PART_LIST_CHECK_STOCK_SP" 
                 SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadCB_Component" Name="Level3" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="HF_MOD_ID" Name="Model" PropertyName="Value" Type="String" />
                            <asp:Parameter Direction="Output" Name="Status" Type="Int32" />
                        </SelectParameters>
        </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Rejection_Notes_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Rejection_Notes" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                             <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Component">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Component" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Code_Level_3" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_StatusText" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Stock" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Status" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


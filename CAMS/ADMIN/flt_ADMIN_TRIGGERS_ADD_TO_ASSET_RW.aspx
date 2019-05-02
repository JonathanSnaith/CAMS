<%@ Page Language="VB" AutoEventWireup="false" Title="Admin - TRIGGERS - Add To Asset" CodeFile="flt_ADMIN_TRIGGERS_ADD_TO_ASSET_RW.aspx.vb" Inherits="ADMIN_TRIGGERS_ADD_TO_ASSET_RW" %>

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
            height: 45px;
            width: 77px;
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
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c;" class="auto-style1">
                                <img alt="" src="../IMAGES/metro_setting_58x58.PNG" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c;">
                                ADD PLAN TO SPECIFIC ASSET
                                <asp:Label ID="LblPreviousPage" runat="server" BackColor="#ff661c" ForeColor="#ff661c" Visible="False" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#ff661c" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#ff661c"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style13">&nbsp;</td>
                                    <td class="style7">
                                        <strong>&nbsp; 
                                    <asp:Label ID="lbl_Model_ID" runat="server" Font-Bold="False" Font-Size="2pt"
                                        ForeColor="#2C3338" Style="font-style: italic"></asp:Label>
                                        </strong></td>
                                    <td class="style7"></td>
                                    <td class="style7">&nbsp;</td>
                                    <td class="style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Model:</td>
                                    <td>
                                        <asp:Label ID="lbl_Model" runat="server" Font-Bold="True"
                                            Style="font-style: italic"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Level 1:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Level1" runat="server" Font-Bold="False" Style="font-style: italic"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Level 2:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Level2" runat="server" Font-Bold="False" Style="font-style: italic"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Level 3:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Level3" runat="server" Font-Bold="False" Style="font-style: italic"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Position:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Position" runat="server" Font-Bold="False" Style="font-style: italic"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                 <tr>
                                    <td class="style13" style="padding-right: 20px">Repair Code:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Repair_Code" runat="server" Font-Bold="False" Style="font-style: italic"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Select an Asset to add a plan to:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Assets" runat="server" AllowCustomText="True"
                                            DataSourceID="SqlDS_AssetGrid" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                            Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="100px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <table class="style_table_general">
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lbl_CloseMessage" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Skin="Glow"
                                            Text="Add Plan to Asset" Width="150px" BackColor="Red">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow"
                                            Skin="Glow" Text="Cancel" Width="150px">
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
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_SJ_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:SqlDataSource ID="SqlDS_SYS" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT SYS_Name, SYS_Version FROM SYSTEM"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_PageCount" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                InsertCommand="INSERT INTO PageCount(PC_Page_Name, PC_Accessed_By) VALUES (@PC_Page_Name, @PC_Accessed_By)"
                SelectCommand="GET_ROW_ID_SP" SelectCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:ControlParameter ControlID="lblPageName" Name="PC_Page_Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="PC_Accessed_By" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblPageName" Name="PC_Page_Name" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="PC_Accessed_By" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Select" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="ADMIN_JOB_TRIGGERS_SELECT_RW_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_SJ_ID" Name="SJ_ID" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Add_Plan" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="ADMIN_JOB_TRIGGERS_CREATE_SMU_TRIGGER_MONITORING_SPECIFIC_ASSET"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_SJ_ID" Name="SJ_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lbl_Model_ID" Name="Model" PropertyName="Text" />
                    <asp:ControlParameter ControlID="RadCB_Assets" Name="A_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_TriggerCode" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'SMU_Trigger_Code') AND (ATT_ID &lt;&gt; 553) ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_AssetGrid" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT ASSET.A_ID, ASSET.A_Asset_ID FROM ASSET INNER JOIN ATTRIBUTES ON ASSET.A_MOD_ID = ATTRIBUTES.ATT_ID WHERE (ASSET.A_MOD_ID = @Model) AND (ASSET.A_Activity_Status &lt;&gt; 'Disposed') AND (ASSET.A_Status NOT IN ('Trash', 'Delete')) ORDER BY ASSET.A_Asset_ID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl_Model_ID" Name="Model" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


<%@ Page Language="VB" AutoEventWireup="false" Title="Admin - TRIGGERS - Update Costs" CodeFile="flt_ADMIN_TRIGGERS_UPDATE_COSTS.aspx.vb" Inherits="ADMIN_TRIGGERS_UPDATE_COSTS" %>

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
      .auto-style2 {
            width: 171px;
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
                                UPDATE COSTS ON JOB TRIGGERS / LIVE PLANS
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
                                    <td class="auto-style2">&nbsp;</td>
                                    <td class="style7">
                                        <strong>&nbsp; 
                                    <asp:Label ID="lbl_Model_ID" runat="server" Font-Bold="False" Font-Size="2pt" ForeColor="#2C3338" Style="font-style: italic"></asp:Label>
                                        </strong></td>
                                    <td class="style7"></td>
                                    <td class="style7">&nbsp;</td>
                                    <td class="style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">Model:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Model" Runat="server" AutoPostBack="True" DataSourceID="SqlDS_CB_Model" DataTextField="Model" DataValueField="MOD_ID" AllowCustomText="True" Filter="Contains" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">Level 3:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Level3" Runat="server" AutoPostBack="True" DataSourceID="SqlDS_Level3" DataTextField="ATT_Name" DataValueField="ATT_ID_3" Width="250px" AllowCustomText="True" Filter="Contains" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">Cost:</td>
                                    <td colspan="2">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Cost" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="28px" MaxValue="500000" MinValue="0" Type="Currency" Width="70px" AutoPostBack="True" Skin="Glow">
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
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">
                                        <asp:Label ID="lblTriggersUpdateText" runat="server" Text="# of triggers affected:" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label ID="lblTriggersUpdate" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">Also apply to Live Plans:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Option" Runat="server" Width="70px" AutoPostBack="True" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Value="0" Selected="True" Text="No" />
                                                <telerik:RadComboBoxItem runat="server" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">
                                        <asp:Label ID="lblPlansUpdateText" runat="server" Text="# of live plans  affected:" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label ID="lblPlansUpdate" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <table class="style_table_general">
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Save" runat="server"
                                            Text="Update Costs" Width="100px" BackColor="Red" Visible="False" Skin="Glow">
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
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Text="Cancel" Width="100px" Skin="Glow">
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
            <asp:SqlDataSource ID="SqlDS_Update_Costs" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="ADMIN_JOB_TRIGGERS_UPDATE_COST_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Cost" Name="Cost" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Option" Name="Option" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_CB_Model" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '' AS MOD_ID, '' AS Model UNION SELECT DISTINCT CONVERT (nvarchar(5), ASSET.A_MOD_ID) AS MOD_ID, ATTRIBUTES.ATT_Name AS Model FROM ASSET INNER JOIN ATTRIBUTES ON ASSET.A_MOD_ID = ATTRIBUTES.ATT_ID INNER JOIN SMU_TRIGGER_MONITORING ON SMU_TRIGGER_MONITORING.STM_A_ID = ASSET.A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (ASSET.A_Activity_Status &lt;&gt; 'Disposed') AND (SMU_TRIGGER_MONITORING.STM_Planning_Status &lt;&gt; 'Trash') UNION SELECT DISTINCT CONVERT (nvarchar(5), SMU_JOB.SJ_MOD_ID) AS MOD_ID, ATTRIBUTES_1.ATT_Name AS Model FROM SMU_JOB INNER JOIN ATTRIBUTES AS ATTRIBUTES_1 ON SMU_JOB.SJ_MOD_ID = ATTRIBUTES_1.ATT_ID WHERE (SMU_JOB.SJ_Status NOT IN ('Trash', 'Delete')) ORDER BY Model">
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDS_Level3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '' AS ATT_ID_3, '' AS ATT_Name UNION SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID_3, ATTRIBUTES.ATT_Name + ' : ' + ATTRIBUTES.ATT_Description AS ATT_Name FROM SMU_TRIGGER_MONITORING AS STM INNER JOIN ATTRIBUTES ON STM.STM_Code_Level_3 = ATTRIBUTES.ATT_ID INNER JOIN ASSET ON STM.STM_A_ID = ASSET.A_ID WHERE (CONVERT (nvarchar(5), ASSET.A_MOD_ID) LIKE @Model) AND (STM.STM_Planning_Status &lt;&gt; 'Trash') UNION SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES_1.ATT_ID) AS ATT_ID_3, ATTRIBUTES_1.ATT_Name + ' : ' + ATTRIBUTES_1.ATT_Description AS ATT_Name FROM SMU_JOB INNER JOIN ATTRIBUTES AS ATTRIBUTES_1 ON SMU_JOB.SJ_Code_Level_3 = ATTRIBUTES_1.ATT_ID WHERE (CONVERT (nvarchar(5), SMU_JOB.SJ_MOD_ID) LIKE @Model) AND (SMU_JOB.SJ_Status &lt;&gt; 'Trash') ORDER BY ATT_Name">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" />
                        </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_GetTriggersNo" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT COUNT(SJ_Cost) AS Count FROM SMU_JOB WHERE (SJ_Code_Level_3 = @Level3) AND (SJ_Status &lt;&gt; 'Trash') AND (SJ_MOD_ID = @Model)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_GetPlansNo" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT COUNT(SMU_TRIGGER_MONITORING.STM_Cost) AS Count FROM SMU_TRIGGER_MONITORING INNER JOIN ASSET ON SMU_TRIGGER_MONITORING.STM_A_ID = ASSET.A_ID WHERE (ASSET.A_MOD_ID = @Model) AND (SMU_TRIGGER_MONITORING.STM_Code_Level_3 = @Level3) AND (SMU_TRIGGER_MONITORING.STM_Planning_Status &lt;&gt; 'Trash')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Cost"  />
                            <telerik:AjaxUpdatedControl ControlID="lblTriggersUpdateText"  />
                            <telerik:AjaxUpdatedControl ControlID="lblTriggersUpdate"  />
                            <telerik:AjaxUpdatedControl ControlID="lblPlansUpdateText"  />
                            <telerik:AjaxUpdatedControl ControlID="lblPlansUpdate"  />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save"  />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Cost"  />
                            <telerik:AjaxUpdatedControl ControlID="lblTriggersUpdateText"  />
                            <telerik:AjaxUpdatedControl ControlID="lblTriggersUpdate"  />
                            <telerik:AjaxUpdatedControl ControlID="lblPlansUpdateText"  />
                            <telerik:AjaxUpdatedControl ControlID="lblPlansUpdate"  />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save"  />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Cost">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lblTriggersUpdateText"  />
                             <telerik:AjaxUpdatedControl ControlID="lblTriggersUpdate"  />
                            <telerik:AjaxUpdatedControl ControlID="lblPlansUpdateText"  />
                            <telerik:AjaxUpdatedControl ControlID="lblPlansUpdate"  />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save"  />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Option">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lblTriggersUpdateText"  />
                            <telerik:AjaxUpdatedControl ControlID="lblTriggersUpdate"  />
                            <telerik:AjaxUpdatedControl ControlID="lblPlansUpdateText"  />
                            <telerik:AjaxUpdatedControl ControlID="lblPlansUpdate"  />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


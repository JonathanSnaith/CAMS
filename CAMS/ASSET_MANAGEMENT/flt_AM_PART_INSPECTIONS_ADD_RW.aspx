<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET - Part Inspection" CodeFile="flt_AM_PART_INSPECTIONS_ADD_RW.aspx.vb" Inherits="AM_PART_INSPECTIONS_ADD_RW" %>

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

        .auto-style3 {
            width: 165px;
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
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #E46C0A;" class="auto-style2">
                                <img alt="" src="../IMAGES/Icons/ASSET_PARTS.PNG" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #E46C0A;">NEW PART INSPECTION
                        <asp:Label ID="LblPreviousPage" runat="server" BackColor="#E46C0A" ForeColor="#E46C0A" Visible="False" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#E46C0A" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style3">&nbsp;</td>
                                    <td class="style7">
                                        <strong>&nbsp; 
                                        </strong></td>
                                    <td class="style7"></td>
                                    <td class="style7">&nbsp;</td>
                                    <td class="style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Part ID</td>
                                    <td>
                                        <asp:Label ID="lbl_Part_ID" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Model:</td>
                                    <td>
                                        <asp:Label ID="lbl_Model" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Component:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Component" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Inspection Overdue by:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Overdue_Days" runat="server"></asp:Label>
                                        days</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Inspection Date:</td>
                                    <td colspan="2">
                                        <telerik:RadDatePicker ID="RadDP_Inspection_Date" runat="server" AutoPostBack="True">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Inspector:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Inspector" runat="server"
                                            AllowCustomText="True" DataSourceID="SqlDS_CB_Inspector" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="11" Width="200px" AutoPostBack="True">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Comments:</td>
                                    <td colspan="2">
                                        <telerik:RadTextBox ID="RadTxt_Comments" runat="server" Height="72px" TextMode="MultiLine" Width="100%">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <table class="style_table_general">
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <telerik:RadButton ID="btn_Next" runat="server" Skin="Default" Text="Next" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Skin="Default"
                                            Text="Submit" Width="100px" Visible="False">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        &nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow"
                                            Skin="Default" Text="Cancel" Width="100px">
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
            <asp:HiddenField ID="HF_ID_ID" runat="server" />
            <asp:HiddenField ID="HF_PD_ID" runat="server" />
            <asp:HiddenField ID="HF_L3" runat="server" Value="%" />
            <asp:HiddenField ID="HF_MOD_ID" runat="server" Value="%" />
            <asp:HiddenField ID="HF_Part_ID" runat="server" Value="%" />
            <asp:HiddenField ID="HF_Status" runat="server" />
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
            <asp:SqlDataSource ID="SqlDS_CB_Inspector" runat="server"
                ConnectionString="<%$ ConnectionStrings:ICT_CENTRALConnectionString %>"
                SelectCommand="SELECT - 1 AS PER_EMP_ID, '*Not Assigned' AS PER_Fullname UNION ALL SELECT PER_EMP_ID, PER_Fullname FROM ict_PEOPLE_LIST WHERE (PER_Status = 'Current') AND (PER_Location_ID IN (2, 3, 8, 9, 10)) AND (PER_EMP_ID &lt; 1000000) AND (PER_Role NOT IN ('Plant Operator', 'Secretary', 'Plant Maintenance Administrator', 'Assistant Maintenance Planner/Administrator', 'Maintenance Planner/Administrator', 'Security Guard', 'Health &amp; Safety Manager', 'Plant Director', 'Cleaner', 'Security Supervisor', 'Plant Controller', 'Plant Director2', 'Office Manager/Administrator', 'Fleet Manager')) OR (PER_Status = 'Leaver') AND (PER_Location_ID IN (2, 3, 8, 9, 10)) AND (PER_EMP_ID &lt; 1000000) AND (PER_Role NOT IN ('Plant Operator', 'Secretary', 'Plant Maintenance Administrator', 'Assistant Maintenance Planner/Administrator', 'Maintenance Planner/Administrator', 'Security Guard', 'Health &amp; Safety Manager', 'Plant Director', 'Cleaner', 'Security Supervisor', 'Plant Controller', 'Plant Director2', 'Office Manager/Administrator', 'Fleet Manager')) AND (PER_Ending_Date &gt;= DATEADD(YEAR, - 4, GETDATE())) OR (PER_Status = 'Current') AND (PER_Location_ID IN (2, 3, 8, 9, 10)) AND (PER_EMP_ID IN (454)) ORDER BY PER_Fullname"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_GetData" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_PART_INSPECTIONS_SELECT_NEXT_RW_SP" SelectCommandType="StoredProcedure">
                <SelectParameters>
                     <asp:SessionParameter Name="ID" SessionField="ThisID" Type="String" />
                    <asp:ControlParameter ControlID="HF_L3" Name="P_Level_3" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_MOD_ID" Name="P_MOD_ID" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_Part_ID" Name="P_Part_ID" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Insert" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_PART_INSPECTIONS_RG_NEW_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_PD_ID" Name="PDI_PD_ID" PropertyName="Value" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadDP_Inspection_Date" Name="PDI_Inspection_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadCB_Inspector" Name="PDI_Inspector" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lbl_Overdue_Days" Name="PDI_Inspection_Overdue_Days" PropertyName="Text" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadTxt_Comments" Name="PDI_Comments" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="PDI_Created_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadDP_Inspection_Date">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Inspector">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btn_Next">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_PD_ID" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Part_ID" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Component" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Overdue_Days" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_Inspection_Date" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Inspector" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Comments" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


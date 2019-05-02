<%@ Page Language="VB" AutoEventWireup="false" Title="Fleet Asset Management - Engine Load Factors - Add New" CodeFile="flt_AM_ENGINE_LOAD_FACTORS_ADD_RW.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ENGINE_LOAD_FACTORS_ADD_RW" %>

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

        .style4 {
            text-align: right;
            height: 68px;
        }

        .style5 {
            height: 68px;
        }
        .auto-style1 {
            width: 52px;
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
        function saveandcloseWindowAdd() {
            var oWndadd = GetRadWindow();
            oWndadd.close();
            top.location.href = top.location.href;
        }
        function closeWindowAdd() {
            var oWndadd = GetRadWindow();
            oWndadd.close();
        }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; padding-right: 10px; background-color: #E46C0A;" class="auto-style1">
                                <img alt="" src="../IMAGES/metro_document_edit_58x58.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #E46C0A; padding-right: 10px;">
                                ENGINE LOAD FACTORS: ADD NEW
                                <asp:Label ID="LblPreviousPage" runat="server" BackColor="#E46C0A" ForeColor="#E46C0A" Text="" Visible="False" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#E46C0A" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#E46C0A"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style6">&#160;</td>
                                    <td class="style7"><strong>&nbsp; </strong></td>
                                    <td class="style7"></td>
                                    <td class="style7">&#160;</td>
                                    <td>&#160;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Model</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Model" runat="server"
                                            DataSourceID="SqlDS_CB_Model" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                            ResolvedRenderMode="Classic" AllowCustomText="True"
                                            Filter="Contains" AutoPostBack="True">
                                        </telerik:RadComboBox>
                                        <br />
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td>&#160;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Low:</td>
                                    <td align="right">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Low_Start" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000" MinValue="0" Width="75px">
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
                                    <td style="padding-left: 20px">-</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Low_End" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000" MinValue="0" Width="75px">
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
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Medium:</td>
                                    <td align="right">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Medium_Start" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000" MinValue="0" Width="75px">
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
                                    <td style="padding-left: 20px">-</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Medium_End" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000" MinValue="0" Width="75px">
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
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">High:</td>
                                    <td align="right">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_High_Start" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000" MinValue="0" Width="75px">
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
                                    <td style="padding-left: 20px">-</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_High_End" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000" MinValue="0" Width="75px">
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
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td style="padding-left: 60px">
                                        <telerik:RadButton ID="Btn_Save" runat="server"
                                            Skin="Default" Text="Save" Width="100px" BackColor="Red">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                    </td>
                                    <td>&#160;</td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td style="padding-left: 60px">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindowAdd" Skin="Default" Text="Cancel" Width="100px">
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
            <asp:SqlDataSource ID="SqlDS_Insert" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ENGINE_LOAD_FACTORS_RG_INSERT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Model" Name="ELF_MOD_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Low_Start" Name="ELF_LOW_START" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Low_End" Name="ELF_LOW_END" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Medium_Start" Name="ELF_MEDIUM_START" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Medium_End" Name="ELF_MEDIUM_END" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_High_Start" Name="ELF_HIGH_START" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_High_End" Name="ELF_HIGH_END" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="ELF_Created_By" PropertyName="Text" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="ELF_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Model" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_Status NOT IN ('Trash', 'Delete')) AND (ATT_ID NOT IN (SELECT ELF_MOD_ID FROM ENGINE_LOAD_FACTORS)) AND (ATT_TABLE = 'ASSET_Model') ORDER BY ATT_Name"></asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


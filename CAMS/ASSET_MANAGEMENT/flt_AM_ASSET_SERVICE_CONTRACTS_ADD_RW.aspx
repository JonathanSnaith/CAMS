<%@ Page Language="VB" AutoEventWireup="false" Title="Fleet Asset Management - Asset Service Contracts - Add Contract" CodeFile="flt_AM_ASSET_SERVICE_CONTRACTS_ADD_RW.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_SERVICE_CONTRACTS_ADD_RW" %>

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
                                ASSET SERVICE CONTRACTS: ADD NEW CONTRACT
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
                                    <td class="style1" style="padding-right: 20px">Asset ID:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Asset" runat="server"
                                            DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                            ResolvedRenderMode="Classic" Skin="Default" AllowCustomText="True"
                                            Filter="Contains" AutoPostBack="True">
                                        </telerik:RadComboBox>
                                        <br />
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">Type:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Type" runat="server" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="PM" Value="PM" />
                                                <telerik:RadComboBoxItem runat="server" Text="PM+" Value="PM+" />
                                                <telerik:RadComboBoxItem runat="server" Text="R+M" Value="R+M" />
                                                <telerik:RadComboBoxItem runat="server" Text="Service" Value="Service" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Contract Length (months):</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Months" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="240" MinValue="0" Width="50px">
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
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Contract Length (Hrs):</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Hours" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000000" MinValue="0" Width="100px">
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
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Start Date:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_Start_Date" runat="server" AutoPostBack="True"
                                            Skin="Default">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"
                                                Skin="Default" UseColumnHeadersAsSelectors="False"
                                                UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy"
                                                DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">Start SMU:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Start_SMU" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000000" MinValue="0" Width="100px">
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
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">End Date:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_End_Date" runat="server"
                                            AutoPostBack="True" Skin="Default">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"
                                                Skin="Default" UseColumnHeadersAsSelectors="False"
                                                UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy"
                                                DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">Agreed Usage:</td>
                                    <td>
                                        
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Usage" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="500000" MinValue="0" Width="160px">
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
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Supplier:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Company" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Company" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        Rate:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Month_Cost" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="500000" MinValue="0" Type="Currency" Width="160px">
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
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                                <telerik:RadComboBoxItem runat="server" Text="Expired" Value="Expired" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
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
                SelectCommand="AM_ASSET_SC_RG_INSERT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="ASC_A_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Type" Name="ASC_Type" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Company" Name="ASC_COM_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="112" />
                     <asp:ControlParameter ControlID="RadNumTxt_Start_SMU" Name="ASC_Start_SMU" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadDP_Start_Date" Name="ASC_Start_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadDP_End_Date" Name="ASC_End_Date" Type="DateTime" DefaultValue="1900-01-01" />
                     <asp:ControlParameter ControlID="RadNumTxt_Months" Name="ASC_Months" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Hours" Name="ASC_End_Hours" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Usage" Name="ASC_Agreed_Usage" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Month_Cost" Name="ASC_Month_Cost" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Status" Name="ASC_Status" PropertyName="SelectedValue" Type="String" DefaultValue="Active" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="ASC_Created_By" PropertyName="Text" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="ASC_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS A_ID, '*Not Specified' AS A_Asset_ID UNION ALL SELECT DISTINCT A_ID, A_Asset_ID FROM ASSET WHERE (A_Status NOT IN ('Trash', 'Delete')) AND (A_ID NOT IN (SELECT ASC_A_ID FROM ASSET_SERVICE_CONTRACTS WHERE (ASC_Status = 'Active'))) AND (A_ID NOT IN ('1785', '1803', '1888', '1889', '1749', '1750', '1758', '1759', '1751', '1752', '1747', '1748', '1374', '1828', '1829', '1355')) ORDER BY A_Asset_ID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Company" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_Status NOT IN ('Trash', 'Delete')) AND (ATT_TABLE = 'ASSET_Company') ORDER BY ATT_Name"></asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


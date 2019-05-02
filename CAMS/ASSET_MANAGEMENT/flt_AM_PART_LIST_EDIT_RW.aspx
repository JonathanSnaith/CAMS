<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - Add/Edit Part/Movement" CodeFile="flt_AM_PART_LIST_EDIT_RW.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_PART_LIST_EDIT_RW" %>
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
            width: 1168px;
        }

        .style4 {
            text-align: right;
            height: 68px;
        }

        .style5 {
            height: 68px;
        }

        .style6 {
            height: 25px;
        }

        .style7 {
            font-size: 20px;
            height: 25px;
        }

        .auto-style1 {
            height: 45px;
            width: 81px;
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
            var ThisVal = document.getElementById('HF_P_ID').value;
            oWnd.close(ThisVal);
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_P_ID').value;
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
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c;" class="auto-style1">
                                <img alt="" src="../IMAGES/Icons/ASSET_PARTS.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c; padding-right: 10px;">COMPONENT PARTS TRACKER - <asp:Label ID="lblTitle" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 20px" colspan="2">&nbsp;</td>
                                    <td style="padding-left: 20px" colspan="2">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1">&nbsp;</td>
                                    <td>Part ID:<br />
                                    </td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Part_ID" runat="server" Skin="Glow" Width="100px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td>Model:<telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="200px">
                                    </telerik:RadComboBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td>Component:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="250px">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td>Position:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Pos" runat="server" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="150" AutoPostBack="True" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">
                                        <telerik:RadButton ID="Btn_New" runat="server" Font-Bold="True" ForeColor="Yellow" Skin="Glow" Text="New Movement" Width="120px">
                                        </telerik:RadButton>
                                    </td>
                                    <td style="padding-left: 20px" colspan="2">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px" colspan="2">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="8">
                                        <asp:Table ID="Tbl_NewMovement" runat="server" Width="100%" Visible="False" BorderColor="#666666" BorderStyle="Dotted" BorderWidth="2px">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                Current Location:
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <telerik:RadComboBox ID="RadCB_LT" runat="server" AutoPostBack="True" Skin="Glow">
                                                        <Items>
                                                            <telerik:RadComboBoxItem runat="server" Text="*Select" Value="" />
                                                            <telerik:RadComboBoxItem runat="server" Text="Asset" Value="Asset" />
                                                            <telerik:RadComboBoxItem runat="server" Text="Company" Value="Company" />
                                                            <telerik:RadComboBoxItem runat="server" Text="Site" Value="Site" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                    <telerik:RadComboBox ID="RadCB_Location" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="ID" ResolvedRenderMode="Classic" Width="300px" AllowCustomText="True" Filter="Contains" Visible="False" Skin="Glow">
                                                    </telerik:RadComboBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                Date at Current Location:
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <telerik:RadDatePicker ID="RadDP_Location_Date" runat="server" Skin="Glow" AutoPostBack="True">
                                                        <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Default" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                Position on Asset:
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <telerik:RadComboBox ID="RadCB_Position" runat="server" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="150" AutoPostBack="True" Skin="Glow">
                                                    </telerik:RadComboBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>

                                                </asp:TableCell>
                                                <asp:TableCell>
                                                Expected No. of Days at Current Location:
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <telerik:RadNumericTextBox ID="RadNumTxt_Expected_Days" runat="server" Width="50px" AutoPostBack="True" MaxValue="1000" MinValue="0" Value="0" Skin="Glow">
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

                                                </asp:TableCell>
                                                <asp:TableCell>
                                                <%--Actual No. of Days at Current Location:--%>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl_Actual_Days" runat="server" Font-Bold="True"></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 20px" colspan="2">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px" colspan="2">&nbsp;</td>
                                    <td colspan="2" style="padding-left: 20px">
                                        <telerik:RadButton ID="Btn_Insert" runat="server" Font-Bold="True" ForeColor="Red" Skin="Glow" Text="Insert" Width="100px" Visible="False">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="5" class="style5">
                                        <asp:Label ID="lbl_History_Text" runat="server" Text="Component Part History:"></asp:Label>
                                        <telerik:RadGrid ID="RadGrid_Part_History" runat="server" DataSourceID="SqlDS_RadGrid_SP_PART_HISTORY"  ResolvedRenderMode="Classic" Width="800px" Height="250px" AllowAutomaticUpdates="True" Skin="Glow">
                                        <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                        <ClientSettings EnableAlternatingItems="True">
                                            <Scrolling AllowScroll="True" />
                                            <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                        </ClientSettings>
                                        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDS_RadGrid_SP_PART_HISTORY"  ClientDataKeyNames="PD_ID" DataKeyNames="PD_ID" AllowNaturalSort="False" NoMasterRecordsText="No movements to display.">
                                            <RowIndicatorColumn Visible="False">
                                            </RowIndicatorColumn>
                                            <ExpandCollapseColumn Created="True">
                                            </ExpandCollapseColumn>
                                            <CommandItemSettings AddNewRecordText="Add to asset" />
                                            <Columns>
                                                <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                                    <HeaderStyle Width="30px" />
                                                    <ItemStyle Width="30px" />
                                                </telerik:GridEditCommandColumn>
                                                <telerik:GridBoundColumn DataField="PD_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter PD_ID column" HeaderText="ID" ReadOnly="True" SortExpression="PD_ID" UniqueName="PD_ID">
                                                    <HeaderStyle Width="50px" Wrap="False" />
                                                    <ItemStyle Width="50px" Wrap="False" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PD_P_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter PD_P_ID column" HeaderText="Part Header ID" ReadOnly="True" SortExpression="PD_P_ID" UniqueName="PD_P_ID">
                                                    <HeaderStyle Width="50px" Wrap="False" />
                                                    <ItemStyle Width="50px" Wrap="False" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Customer" Display="True" FilterControlAltText="Filter Customer column" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" UniqueName="Customer">
                                                    <HeaderStyle Width="100px" Wrap="False" />
                                                    <ItemStyle Width="100px" Wrap="True" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Location" Display="True" FilterControlAltText="Filter Location column" HeaderText="Location" ReadOnly="True" SortExpression="Location" UniqueName="Location">
                                                    <HeaderStyle Width="100px" Wrap="False" />
                                                    <ItemStyle Width="100px" Wrap="True" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn DataField="PD_POS_ID" Display="False" FilterControlAltText="Filter PD_POS_ID column" HeaderText="Position" SortExpression="PD_POS_ID" UniqueName="PD_POS_ID">
                                                    <EditItemTemplate>
                                                        <telerik:RadComboBox ID="RadComboBox3" runat="server" DataSourceID="SqlDS_CB_Position" DataTextField="ATT_Name" DataValueField="ATT_ID" SelectedValue='<%# Bind("PD_POS_ID") %>' Skin="Glow">
                                                        </telerik:RadComboBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="PD_POS_IDLabel" runat="server" Text='<%# Eval("PD_POS_ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="Position" Display="True" FilterControlAltText="Filter Position column" HeaderText="Position" ReadOnly="True" SortExpression="Position" UniqueName="Position">
                                                    <HeaderStyle Width="100px" Wrap="False" />
                                                    <ItemStyle Width="100px" Wrap="True" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn DataField="PD_Location_Date" FilterControlAltText="Filter PD_Location_Date column" HeaderText="Date at Location" SortExpression="PD_Location_Date" UniqueName="PD_Location_Date">
                                                    <EditItemTemplate>
                                                        <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US" DbSelectedDate='<%# Bind("PD_Location_Date", "{0:dd MMM yyyy}") %>' Skin="Glow">
                                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                            </Calendar>
                                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
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
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="PD_Location_DateLabel" runat="server" Text='<%# Eval("PD_Location_Date", "{0:dd MMM yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn DataField="PD_Expected_Days" FilterControlAltText="Filter PD_Expected_Days column" HeaderText="Expected Days at Location" SortExpression="PD_Expected_Days" UniqueName="PD_Expected_Days" Display="False">
                                                    <EditItemTemplate>
                                                        <telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" Culture="en-GB" DbValue='<%# Bind("PD_Expected_Days") %>' DbValueFactor="1" LabelWidth="64px" Width="50px" Skin="Glow">
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
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="PD_Expected_DaysLabel" runat="server" Text='<%# Eval("PD_Expected_Days") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="ExpectedDaysText" FilterControlAltText="Filter ExpectedDaysText column" HeaderText="Expected Days" ReadOnly="True" SortExpression="ExpectedDaysText" UniqueName="ExpectedDaysText">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PD_Actual_Days" Display="True" FilterControlAltText="Filter PD_Actual_Days column" HeaderText="Actual Days at Location" ReadOnly="True" SortExpression="PD_Actual_Days" UniqueName="PD_Actual_Days">
                                                    <HeaderStyle Width="100px" Wrap="False" />
                                                    <ItemStyle Width="100px" Wrap="True" />
                                                </telerik:GridBoundColumn>
                                                 <telerik:GridBoundColumn DataField="PD_Status" Display="True" FilterControlAltText="Filter PD_Status column" HeaderText="Status" ReadOnly="True" SortExpression="PD_Status" UniqueName="PD_Status">
                                                    <HeaderStyle Width="100px" Wrap="False" />
                                                    <ItemStyle Width="100px" Wrap="True" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PD_Latest_Movement" Display="False" FilterControlAltText="Filter PD_Latest_Movement column" HeaderText="Latest" ReadOnly="True" SortExpression="PD_Latest_Movement" UniqueName="PD_Latest_Movement">
                                                    <HeaderStyle Width="100px" Wrap="False" />
                                                    <ItemStyle Width="100px" Wrap="True" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn DataField="PD_Trash" FilterControlAltText="Filter PD_Trash column" HeaderText="Trash?" SortExpression="PD_Trash" UniqueName="PD_Trash" Display="False">
                                                    <EditItemTemplate>
                                                        <telerik:RadComboBox ID="RadComboBox4" runat="server" SelectedValue='<%# Bind("PD_Trash") %>' Width="100px" Skin="Glow">
                                                            <Items>
                                                                <telerik:RadComboBoxItem runat="server" Value="0" />
                                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="1" />
                                                            </Items>
                                                        </telerik:RadComboBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="PD_TrashLabel" runat="server" Text='<%# Eval("PD_Trash") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="ExpectedDaysCalc" Display="False" FilterControlAltText="Filter ExpectedDaysCalc column" HeaderText="ExpectedDaysCalc" ReadOnly="True" SortExpression="ExpectedDaysCalc" UniqueName="ExpectedDaysCalc">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PD_Location_Type" Display="False" FilterControlAltText="Filter PD_Location_Type column" HeaderText="Location Type" ReadOnly="True" SortExpression="PD_Location_Type" UniqueName="PD_Location_Type">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                            <EditFormSettings>
                                                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                                </EditColumn>
                                            </EditFormSettings>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                    </td>
                                    <td colspan="3" valign="top">Notes:<br />
                                        <telerik:RadTextBox ID="RadTxt_Notes" runat="server" Height="250px" Skin="Glow" TextMode="MultiLine" Width="300px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="4">
                                        <telerik:RadGrid ID="RadGrid_Attachments" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" Height="150px" DataSourceID="SqlDS_Documents" ResolvedRenderMode="Classic" Skin="Glow">
                                            <ClientSettings>
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <MasterTableView AllowPaging="True" AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDS_Documents" DataKeyNames="DOC_ID" NoMasterRecordsText="No attachments.">
                                                <CommandItemSettings AddNewRecordText="Add new attachment" />
                                                <Columns>
                                                    <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="50px" />
                                                    </telerik:GridEditCommandColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_ID column" HeaderText="ID" ReadOnly="True" SortExpression="DOC_ID" UniqueName="DOC_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="DOC_Name" Display="True" FilterControlAltText="Filter DOC_Name column" HeaderText="Name" SortExpression="DOC_Name" UniqueName="DOC_Name">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox3" runat="server" LabelWidth="64px" Resize="None" Skin="Glow" Text='<%# Bind("DOC_Name") %>' Width="400px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="DOC_NameLabel0" runat="server" Text='<%# Eval("DOC_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="400px" />
                                                        <ItemStyle Width="400px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_P_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_P_ID column" HeaderText="Part ID" ReadOnly="True" SortExpression="DOC_P_ID" UniqueName="DOC_P_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="DOC_Link" Display="False" FilterControlAltText="Filter DOC_Link column" HeaderText="Link" SortExpression="DOC_Link" UniqueName="DOC_Link">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox4" runat="server" LabelWidth="64px" Resize="None" Skin="Glow" Text='<%# Bind("DOC_Link") %>' Width="400px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="DOC_LinkLabel0" runat="server" Text='<%# Eval("DOC_Link") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="DOC_Link" FilterControlAltText="Filter DOC_Link column" HeaderText="Link" ImageUrl="../IMAGES/24x24/document_tender_24x24.png" Target="_blank" UniqueName="DOC_Link">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="50px" />
                                                    </telerik:GridHyperLinkColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                    <td class="style1" style="padding-left: 20px" colspan="2">&nbsp;</td>
                                    <td style="padding-left: 150px" colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">Status:</td>
                                    <td colspan="2" style="padding-left: 20px">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                                <telerik:RadComboBoxItem runat="server" Text="Ordered" Value="Ordered" />
                                                <telerik:RadComboBoxItem runat="server" Text="Allocated" Value="Allocated" />
                                                <telerik:RadComboBoxItem runat="server" Text="Unallocated" Value="Unallocated" />
                                                <telerik:RadComboBoxItem runat="server" Text="Request Disposal" Value="Request Disposal" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                        <telerik:RadComboBox ID="RadCB_Status_Disposal_Request" runat="server" AutoPostBack="True" Visible="False" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                                <telerik:RadComboBoxItem runat="server" Text="Ordered" Value="Ordered" />
                                                <telerik:RadComboBoxItem runat="server" Text="Allocated" Value="Allocated" />
                                                <telerik:RadComboBoxItem runat="server" Text="Unallocated" Value="Unallocated" />
                                                <telerik:RadComboBoxItem runat="server" Text="Request Disposal" Value="Request Disposal" />
                                                <telerik:RadComboBoxItem runat="server" Text="Disposed" Value="Disposed" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td class="style1" colspan="2" style="padding-left: 20px">&nbsp;</td>
                                    <td colspan="2" style="padding-left: 150px">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" Skin="Glow" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 20px" colspan="2">
                                        &nbsp;</td>
                                    <td class="style1" style="padding-left: 20px" colspan="2">&nbsp;</td>
                                    <td style="padding-left: 150px" colspan="2">
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
            <asp:HiddenField ID="HF_P_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_Disposal_LOCK" runat="server" />
            <asp:HiddenField ID="HF_Status" runat="server" />
            <asp:HiddenField ID="HF_Disposal_Requested_By" runat="server" />
            <asp:HiddenField ID="HF_Disposal_Approved_By" runat="server" />
            <asp:HiddenField ID="HF_Location" runat="server" />
            <asp:HiddenField ID="HF_Location_Type" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_93" runat="server" />
              <asp:SqlDataSource ID="SqlDS_RequestDisposalEmail" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_PART_DISPOSAL_REQUEST"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_P_ID" Name="P_ID" PropertyName="Value" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_DisposedEmail" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_PART_DISPOSED"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_P_ID" Name="P_ID" PropertyName="Value" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Position" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'Defect_Position') AND (ATT_Status NOT IN ('Trash', 'Delete')) ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_PART_HISTORY" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_PART_DETAIL_RG_SELECT_SP"
                UpdateCommand="AM_PART_LIST_RG_UPDATE_MOVEMENT_SP" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_P_ID" Name="PD_P_ID" PropertyName="Value" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PD_ID" />
                    <asp:ControlParameter ControlID="HF_P_ID" Name="PD_P_ID" PropertyName="Value" Type="String" />
                    <asp:Parameter Name="PD_POS_ID" />
                    <asp:Parameter Name="PD_Location_Date" />
                    <asp:Parameter Name="PD_Expected_Days" />
                    <asp:Parameter Name="PD_Trash" />
                    <asp:ControlParameter ControlID="HF_Username" Name="PD_Modified_By" PropertyName="Value" DefaultValue="0" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Documents" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                InsertCommand="INSERT INTO DOCUMENTS(DOC_Name, DOC_P_ID, DOC_Link, DOC_Created_By, DOC_Date_Created, DOC_Sub) VALUES (@DOC_Name, @DOC_P_ID, @DOC_Link, @DOC_Created_By, GETDATE(), 2)"
                SelectCommand="SELECT DOC_ID, DOC_Name, DOC_P_ID, DOC_Link, DOC_Sub FROM DOCUMENTS WHERE (DOC_Sub = 2) AND (DOC_P_ID = @DOC_P_ID)"
                UpdateCommand="UPDATE DOCUMENTS SET DOC_Name = @DOC_Name, DOC_P_ID = @DOC_P_ID, DOC_Link = @DOC_Link, DOC_Date_Modified = GETDATE(), DOC_Modified_By = @DOC_Modified_By WHERE (DOC_ID = @DOC_ID)"
                DeleteCommand="DELETE FROM DOCUMENTS WHERE (DOC_ID = @DOC_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="DOC_ID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DOC_Name" />
                    <asp:ControlParameter ControlID="HF_P_ID" Name="DOC_P_ID" PropertyName="Value" />
                    <asp:Parameter Name="DOC_Link" />
                    <asp:ControlParameter ControlID="HF_Username" Name="DOC_Created_By" PropertyName="Value" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_P_ID" Name="DOC_P_ID" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DOC_Name" />
                    <asp:ControlParameter ControlID="HF_P_ID" Name="DOC_P_ID" PropertyName="Value" />
                    <asp:Parameter Name="DOC_Link" />
                    <asp:ControlParameter ControlID="HF_Username" Name="DOC_Modified_By" PropertyName="Value" />
                    <asp:Parameter Name="DOC_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" IsSticky="True" Skin="Default">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="Btn_New">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Tbl_NewMovement" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Insert" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Tbl_NewMovement">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Insert" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_History" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Location" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Location_Type" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Location">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Insert" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadNumTxt_Expected_Days">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Insert" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Insert">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_History" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Part_History">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_History" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Status" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Disposal_Requested_By" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status_Disposal_Request">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Status" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Disposal_Approved_By" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_P_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


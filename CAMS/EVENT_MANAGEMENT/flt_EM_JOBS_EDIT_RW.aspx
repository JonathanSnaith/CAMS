<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Edit Job" CodeFile="flt_EM_JOBS_EDIT_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_JOBS_EDIT_RW" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .RadGrid a img {
            border: none;
        }

        .style1 {
            text-align: right;
        }

        .style3 {
            height: 45px;
            width: 443px;
        }

        .style4 {
            text-align: right;
            height: 68px;
            width: 175px;
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

        .style8 {
            text-align: right;
            height: 25px;
            width: 175px;
        }

        .style22 {
            width: 198px;
        }

        .style23 {
            font-size: 20px;
            height: 25px;
            width: 198px;
        }

        .style24 {
            width: 317px;
        }

        .style25 {
            font-size: 20px;
            height: 25px;
            width: 317px;
        }

        .style26 {
            text-align: right;
            width: 175px;
        }

        .style31 {
            width: 21px;
        }

        .style32 {
            width: 17px;
        }

        .style36 {
            width: 400px;
        }

        .style38 {
            height: 25px;
            width: 532px;
        }

        .auto-style1 {
            text-align: right;
            height: 26px;
            width: 175px;
        }

        .auto-style2 {
            height: 26px;
        }

        .auto-style3 {
            height: 45px;
            width: 91px;
        }

        .auto-style4 {
            width: 304px;
        }
        .auto-style8 {
            width: 182px;
        }
        .auto-style10 {
            color: yellow;
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
        function fn_OpenJobCard() {
            var EventId = document.getElementById('HF_E_ID').value;
            var JobId = document.getElementById('HF_J_ID').value;
            if (EventId == "N/A") {
                EventId = 0
            }
            window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/JobCard2.rpt&@Event_ID=' + EventId + "&@Job_ID=" + JobId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
        }
        function saveandcloseWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_E_ID').value; 
            oWnd.close(ThisVal);
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            oWnd.close();
        }
        var ent = false;

        function DetectEnter(sender, eventArgs) {
            var keyCode = eventArgs._domEvent.keyCode;
            if (keyCode == 13) {
                ent = true;
            }
            else {
                ent = false;
            }
        }
        function CheckEnter_JobType(sender, eventArgs) {
            var combo = $find("<%= RadCB_JobType.ClientID %>");
            combo.hideDropDown();
            var temp = ent;
            ent = false;
            eventArgs.set_cancel(temp);
        }
        function CheckEnter_Eng(sender, eventArgs) {
            var combo = $find("<%= RadCB_Engineer.ClientID %>");
            combo.hideDropDown();
            var temp = ent;
            ent = false;
            eventArgs.set_cancel(temp);
        }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" class="auto-style3" rowspan="2" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c;">
                                <img alt="" src="../IMAGES/Icons/EVENT_JOB_MANAGEMENT.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" /></td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c; padding-right: 10px;" rowspan="2" class="auto-style4">
                                 <asp:Label ID="lblTitle" runat="server" ForeColor="White"></asp:Label>&nbsp;
                                <asp:Label ID="lbl_J_ID" runat="server" ForeColor="White"></asp:Label></td>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: right; padding-right: 10px;">
                                <asp:Label ID="lbl_SMU_Prev" runat="server" Font-Bold="True" Text="Latest SMU:" Visible="False"></asp:Label></td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: left;" class="auto-style8">
                                <asp:Label ID="lblLastSMU" runat="server" Font-Bold="True" Font-Italic="True" Visible="False">0</asp:Label></td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #ff661c; text-align: right;">
                                <asp:Label ID="lbl_Created" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lbl_Created_By" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 10px; background-color: #ff661c; text-align: right;">
                                <asp:Label ID="lblModel_Text" runat="server">Model:</asp:Label>
                            </td>
                            <td align="left" class="auto-style8" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: left;">
                                <asp:Label ID="lblModel" runat="server"></asp:Label>
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #ff661c; text-align: right;">
                                <asp:Label ID="lbl_Modified" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lbl_Modified_By" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general" cellspacing="0">
                                <tr>
                                    <td style="padding-left: 20px;"><strong>DETAILS</strong></td>
                                    <td>
                                        &nbsp;</td>
                                    <td align="left" colspan="5" style="padding-left: 10px"><strong>ATTACHMENTS &amp; ORDERS</strong></td>
                                </tr>
                                <tr>
                                    <td class="style26" style="border-color: #CCCCCC; padding-right: 20px; border-top-style: solid; border-left-style: solid;">Event ID:</td>
                                    <td style="border-top-style: solid; border-top-color: #CCCCCC; border-right-style: solid; border-right-color: #CCCCCC;">
                                        <telerik:RadComboBox ID="RadCB_Event" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="EventDetails" DataValueField="E_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="1" Width="400px">
                                        </telerik:RadComboBox>
                                        <asp:Label ID="lbl_EventID_SignOff" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lbl_EventID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="5" style="padding-left: 10px;" align="left" rowspan="3" valign="top">
                                        <telerik:RadGrid ID="RadGrid_Attachments0" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" DataSourceID="SqlDS_Documents" ResolvedRenderMode="Classic" Skin="Glow">
                                            <ClientSettings>
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <MasterTableView AllowPaging="True" AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="DOC_ID" DataSourceID="SqlDS_Documents" NoMasterRecordsText="No attachments.">
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
                                                    <telerik:GridBoundColumn DataField="DOC_E_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_E_ID column" HeaderText="Event ID" ReadOnly="True" SortExpression="DOC_E_ID" UniqueName="DOC_E_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_J_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_J_ID column" HeaderText="Job ID" ReadOnly="True" SortExpression="DOC_J_ID" UniqueName="DOC_J_ID">
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
                                </tr>
                                <tr>
                                    <td class="style26" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Instruction:</td>
                                    <td style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadTextBox ID="RadTxt_Instruction" runat="server" Height="80px" Skin="Glow" TabIndex="2" TextMode="MultiLine" Width="100%">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style26" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Job Type:<span class="auto-style10">*</span></td>
                                    <td style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadComboBox ID="RadCB_JobType" runat="server" AllowCustomText="True"
                                             DataTextField="ATT_Name"
                                            OnClientKeyPressing="DetectEnter" OnClientSelectedIndexChanging="CheckEnter_JobType"
                                            DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="300px" AutoPostBack="True" TabIndex="3" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style26" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">&nbsp;</td>
                                    <td style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <asp:Table ID="Table_Codes" runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell><strong>Codes</strong></asp:TableCell><asp:TableCell runat="server" Style="padding-left: 15px">Level 1:</asp:TableCell><asp:TableCell>
                                                    <telerik:RadComboBox ID="RadCB_Level1" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="5" Skin="Glow" Width="500px">
                                                    </telerik:RadComboBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>&nbsp;</asp:TableCell><asp:TableCell runat="server" Style="padding-left: 15px">Level 2:</asp:TableCell><asp:TableCell>
                                                    <telerik:RadComboBox ID="RadCB_Level2" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="6" Skin="Glow" Width="500px">
                                                    </telerik:RadComboBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>&nbsp;</asp:TableCell><asp:TableCell runat="server" Style="padding-left: 15px">Level 3:</asp:TableCell><asp:TableCell>
                                                    <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="7" Skin="Glow" Width="500px">
                                                    </telerik:RadComboBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>&nbsp;</asp:TableCell><asp:TableCell runat="server" Style="padding-left: 15px">Incident Code:</asp:TableCell><asp:TableCell>
                                                    <telerik:RadComboBox ID="RadCB_INC_CODE" runat="server" AllowCustomText="True" DataTextField="ATT_Name" TabIndex="8" DataValueField="ATT_ID" Skin="Glow" Width="300px">
                                                    </telerik:RadComboBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </td>
                                    <td align="left" colspan="5" rowspan="10" style="padding-left: 10px" valign="top">
                                        <telerik:RadGrid ID="RadGrid_PO" runat="server" AllowPaging="True" DataSourceID="SqlDS_Orders" ResolvedRenderMode="Classic" Skin="Glow">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <MasterTableView AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="ORD_ID" DataSourceID="SqlDS_Orders" EditMode="InPlace" NoMasterRecordsText="No purchase orders.">
                                                <CommandItemSettings AddNewRecordText="Add new purchase order" />
                                                <Columns>
                                                    <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                                        <HeaderStyle Width="100px" />
                                                        <ItemStyle Width="100px" />
                                                    </telerik:GridEditCommandColumn>
                                                    <telerik:GridBoundColumn DataField="ORD_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter ORD_ID column" HeaderText="Order ID" ReadOnly="True" SortExpression="ORD_ID" UniqueName="ORD_ID">
                                                        <HeaderStyle Width="100px" />
                                                        <ItemStyle Width="100px" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="ORD_J_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter ORD_J_ID column" HeaderText="ORD_J_ID" ReadOnly="True" SortExpression="ORD_J_ID" UniqueName="ORD_J_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="ORD_PO" DataType="System.Int32" FilterControlAltText="Filter ORD_PO column" HeaderText="PO #" SortExpression="ORD_PO" UniqueName="ORD_PO">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox9" runat="server" LabelWidth="64px" Resize="None" Skin="Glow" Text='<%# Bind("ORD_PO") %>' Width="100px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="ORD_POLabel" runat="server" Text='<%# Eval("ORD_PO") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="100px" />
                                                        <ItemStyle Width="150px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ORD_ID" DataNavigateUrlFormatString="flt_PURCHASE_ORDER.aspx?ORD_ID={0}" DataTextField="ORD_PO" FilterControlAltText="Filter ORD_PO column" HeaderButtonType="LinkButton" HeaderText="PO (FocalPoint Link)" Target="_blank" UniqueName="ORD_PO">
                                                        <HeaderStyle HorizontalAlign="Center" Width="70px" Wrap="False" />
                                                        <ItemStyle HorizontalAlign="Center" Width="70px" Wrap="False" />
                                                    </telerik:GridHyperLinkColumn>
                                                    <telerik:GridBoundColumn DataField="ORD_SupCode" DataType="System.Int32" Display="True" FilterControlAltText="Filter ORD_SupCode column" HeaderText="Supplier Code" ReadOnly="True" SortExpression="ORD_SupCode" UniqueName="ORD_SupCode">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="ORD_PO_Total" DataFormatString="{0:£#,##0.00}" FilterControlAltText="Filter ORD_PO_Total column" HeaderText="PO Total" ReadOnly="True" SortExpression="ORD_PO_Total" UniqueName="ORD_PO_Total">
                                                        <HeaderStyle HorizontalAlign="Right" Width="100px" Wrap="False" />
                                                        <ItemStyle HorizontalAlign="Right" Width="100px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="ORD_Fully_Received_Date" FilterControlAltText="Filter ORD_Fully_Received_Date column" HeaderText="Fully Received" SortExpression="ORD_Fully_Received_Date" UniqueName="ORD_Fully_Received_Date">
                                                        <EditItemTemplate>
                                                            <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US" DbSelectedDate='<%# Bind("ORD_Fully_Received_Date", "{0:dd MMM yyyy}") %>' Skin="Default">
                                                                <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                                                            <asp:Label ID="ORD_Fully_Received_DateLabel" runat="server" Text='<%# Eval("ORD_Fully_Received_Date", "{0:dd MMM yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridClientDeleteColumn ButtonType="ImageButton" FilterControlAltText="Filter column column" UniqueName="column">
                                                        <HeaderStyle Width="100px" />
                                                        <ItemStyle Width="100px" />
                                                    </telerik:GridClientDeleteColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style26" style="padding-right: 20px; border-bottom-style: solid; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC; border-left-style: solid;">
                                        Engineer:<span class="auto-style10">*</span></td>
                                    <td class="style7" style="border-bottom-style: solid; border-bottom-color: #CCCCCC; border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True"
                                             DataTextField="PER_Fullname"
                                            OnClientKeyPressing="DetectEnter" OnClientSelectedIndexChanging="CheckEnter_Eng"
                                            DataValueField="PER_EMP_ID" Filter="Contains" ResolvedRenderMode="Classic" Visible="True" Width="300px" TabIndex="11" Skin="Glow" AutoPostBack="True">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style26" style="padding-right: 20px">&nbsp;</td>
                                    <td class="style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px;"><strong>CONTRACT</strong></td>
                                    <td class="style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style26" style="padding-right: 20px; border-top-style: solid; border-top-color: #CCCCCC; border-left-style: solid; border-left-color: #CCCCCC;">Planned Start Date:<span class="auto-style10">*</span></td>
                                    <td style="border-top-style: solid; border-top-color: #CCCCCC; border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadDatePicker ID="RadDP_Planned_Start_Date" runat="server" TabIndex="12" MinDate="1960-01-01" Skin="Glow" AutoPostBack="True">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False"
                                                UseRowHeadersAsSelectors="False" Skin="Glow">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
                                                        <ItemStyle BackColor="#FFC5A8" />
                                                    </telerik:RadCalendarDay>
                                                </SpecialDays>
                                            </Calendar>
                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="12" AutoPostBack="True">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="12" />
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style26" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Estimated_Hours_Text" runat="server" Text="Estimated Time:"></asp:Label>
                                    </td>
                                    <td style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <table>
                                            <tr>
                                                <td>
                                            <telerik:RadNumericTextBox ID="RadNumTxt_Estimated_Hours" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="500" MinValue="0" Skin="Glow" Width="40px">
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
                                                <td>
                                            <telerik:RadNumericTextBox ID="RadNumTxt_Estimated_Mins" Runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="59" MinValue="0" Skin="Glow" Width="40px">
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
                                        </table>
                                        
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Actual_Hours_Text" runat="server" Text="Actual Time:"></asp:Label>
                                    </td>
                                    <td class="auto-style2" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <asp:Label ID="lbl_Actual_Hours" runat="server">[time will appear as timesheets are completed]</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC; ">
                                        <asp:Label ID="lbl_Time_Diff_Text" runat="server" Text="Time Difference:" Visible="False"></asp:Label>
                                    </td>
                                    <td class="auto-style2" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <asp:Label ID="lbl_Time_Diff" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC; border-bottom-style: solid; border-bottom-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Engineer_Rate_Text" runat="server" Text="Current Engineer Cost:"></asp:Label>
                                    </td>
                                    <td class="auto-style2" style="border-bottom-style: solid; border-bottom-color: #C0C0C0; border-right-style: solid; border-right-color: #CCCCCC">
                                        <asp:Label ID="lbl_Engineer_Rate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_SMU" runat="server" Text="SMU:" Visible="False"></asp:Label>
                                    </td>
                                    <td class="auto-style2">
                                        <telerik:RadNumericTextBox ID="RadTxt_SMU" runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="40px" MaxValue="500000" MinValue="0" Skin="Glow" TabIndex="26" Value="0" Visible="False" Width="100px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
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
                                    <td class="style4" style="padding-right: 20px" rowspan="3">Notes:</td>
                                    <td class="style5" rowspan="3">
                                        <telerik:RadTextBox ID="RadTxt_Notes" runat="server" Height="80px" TabIndex="21" TextMode="MultiLine" Width="100%" Skin="Glow"></telerik:RadTextBox></td>
                                    <td align="left" style="padding-left: 10px" valign="top">Status:</td>
                                    <td align="left" colspan="3" style="padding-left: 10px" valign="top">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="22">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                                <telerik:RadComboBoxItem runat="server" Text="Cancelled" Value="Cancelled" />
                                                <telerik:RadComboBoxItem runat="server" Text="Complete" Value="Complete" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" style="padding-right: 10px;">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" Skin="Glow" TabIndex="35" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="padding-left: 10px" valign="top" colspan="2">
                                        <asp:Label ID="lbl_Closed" runat="server" Text="Closed:" Visible="False"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 10px" valign="top">
                                        <telerik:RadDateTimePicker ID="RadDP_Closed" Runat="server" Skin="Glow" Width="200px" Visible="False">
                                            <TimeView runat="server" Columns="4" EndTime="23:00:00" Interval="00:15:00" ShowHeader="False" Skin="Glow" StartTime="05:00:00">
                                            </TimeView>
                                        </telerik:RadDateTimePicker>
                                    </td>
                                    <td align="right" colspan="2" style="padding-right: 10px;">
                                        <telerik:RadButton ID="btnPrintJobCard" runat="server" AutoPostBack="True" Font-Bold="True" ForeColor="#666666" Skin="Glow" TabIndex="36" Text="Save &amp; Print" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="padding-left: 10px" valign="top" colspan="2">
                                        <asp:Label ID="lbl_Create_Event" runat="server" Text="Create Event:" Visible="False"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 10px" valign="top">
                                        <telerik:RadComboBox ID="RadCB_Create_Event" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="22" Visible="False" Width="70px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" colspan="2" style="padding-right: 10px;">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" TabIndex="37" Text="Cancel" Width="100px">
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
            <telerik:RadNotification ID="RadNotification1" runat="server" Text="There are outstanding jobs to complete before the sign-off can be completed" Skin="Glow"></telerik:RadNotification>
            <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Previous_Status" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_Close" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_J_ID" runat="server" />
            <asp:HiddenField ID="HF_Estimated_Time" runat="server" Value="00:00" />
            <asp:HiddenField ID="HF_Event_Type" runat="server" />
            <asp:HiddenField ID="HF_EventCount" runat="server" />
            <asp:HiddenField ID="HF_E_ID" runat="server" />
            <asp:HiddenField ID="HF_A_ID" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Site_ID" runat="server" />
            <asp:HiddenField ID="HF_MOD_ID" runat="server" />
            <asp:HiddenField ID="HF_ET_ID" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PO" runat="server" Value="0" />
            <asp:HiddenField ID="HF_E_Planned_Start_Date" runat="server" />
            <asp:HiddenField ID="HF_Event_Status" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_SMU" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Type" runat="server" Value="0" />
            <asp:HiddenField ID="HF_RequiresSMU" runat="server" Value="0" />
            <asp:HiddenField ID="HF_RequiresSMUJob" runat="server" Value="0" />
            <asp:HiddenField ID="HF_LiveOrArchive" runat="server" />
            <%--<asp:SqlDataSource ID="SqlDS_RequiresSMU" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATTJT.ATT_FLAG AS JobFlag, ATTET.ATT_FLAG AS EventFlag FROM JOB LEFT OUTER JOIN ATTRIBUTES AS ATTJT ON ATTJT.ATT_ID = JOB.J_JT_ID INNER JOIN EVENT ON EVENT.E_ID = JOB.J_E_ID INNER JOIN ATTRIBUTES AS ATTET ON EVENT.E_ET_ID = ATTET.ATT_ID WHERE (JOB.J_ID = @J_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_J_ID" Name="J_ID" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>--%><%--            <asp:SqlDataSource ID="SqlDS_UpdateServiceTrend" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SERVICING_TREND_FROM_SMU" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_A_ID" Name="Asset" PropertyName="Value" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
            <asp:SqlDataSource ID="SqlDS_Orders" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                DeleteCommand="DELETE FROM [ORDERS] WHERE [ORD_ID] = @ORD_ID"
                InsertCommand="INSERT INTO ORDERS(ORD_J_ID, ORD_PO, ORD_Modified_By, ORD_Fully_Received_Date) VALUES (@ORD_J_ID, @ORD_PO, @ORD_Modified_By, @ORD_Fully_Received_Date)"
                SelectCommand="SELECT ORD_ID, ORD_J_ID, ORD_PR, ORD_PO, ORD_DATECREATED, ORD_Date_Modified, ORD_Modified_By, ORD_PO_TOTAL, ORD_SupCode, ORD_Fully_Received_Date FROM ORDERS WHERE (ORD_J_ID = @J_ID)"
                UpdateCommand="UPDATE ORDERS SET ORD_PO = @ORD_PO, ORD_Date_Modified = GETDATE(), ORD_Modified_By = @ORD_Modified_By, ORD_J_ID = @ORD_J_ID, ORD_Fully_Received_Date = @ORD_Fully_Received_Date WHERE (ORD_ID = @ORD_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="ORD_ID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="HF_J_ID" Name="ORD_J_ID" PropertyName="Value" />
                    <asp:Parameter Name="ORD_PO" />
                    <asp:ControlParameter ControlID="HF_Username" Name="ORD_Modified_By" PropertyName="Value" />
                    <asp:Parameter Name="ORD_Fully_Received_Date" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_J_ID" Name="J_ID" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ORD_PO" />
                    <asp:ControlParameter ControlID="HF_Username" Name="ORD_Modified_By" PropertyName="Value" />
                    <asp:ControlParameter ControlID="HF_J_ID" Name="ORD_J_ID" PropertyName="Value" />
                    <asp:Parameter Name="ORD_Fully_Received_Date" />
                    <asp:Parameter Name="ORD_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Documents" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                InsertCommand="INSERT INTO DOCUMENTS(DOC_Name, DOC_E_ID, DOC_J_ID, DOC_Link, DOC_Created_By, DOC_Date_Created, DOC_Sub) VALUES (@DOC_Name, @DOC_E_ID, @DOC_J_ID, @DOC_Link, @DOC_Created_By, GETDATE(), 1)"
                SelectCommand="SELECT DOC_ID, DOC_Name, DOC_E_ID, DOC_J_ID, DOC_Link, DOC_Sub FROM DOCUMENTS WHERE (DOC_J_ID = @DOC_J_ID) AND (DOC_Sub = 1)"
                UpdateCommand="UPDATE DOCUMENTS SET DOC_Name = @DOC_Name, DOC_E_ID = @DOC_E_ID, DOC_J_ID = @DOC_J_ID, DOC_Link = @DOC_Link, DOC_Date_Modified = GETDATE(), DOC_Modified_By = @DOC_Modified_By WHERE (DOC_ID = @DOC_ID)"
                DeleteCommand="DELETE FROM DOCUMENTS WHERE (DOC_ID = @DOC_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="DOC_ID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DOC_Name" />
                    <asp:ControlParameter ControlID="RadCB_Event" Name="DOC_E_ID" PropertyName="SelectedValue" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_J_ID" Name="DOC_J_ID" PropertyName="Value" />
                    <asp:Parameter Name="DOC_Link" />
                    <asp:ControlParameter ControlID="HF_Username" Name="DOC_Created_By" PropertyName="Value" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_J_ID" Name="DOC_J_ID" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DOC_Name" />
                    <asp:ControlParameter ControlID="RadCB_Event" Name="DOC_E_ID" PropertyName="SelectedValue" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_J_ID" Name="DOC_J_ID" PropertyName="Value" />
                    <asp:Parameter Name="DOC_Link" />
                    <asp:ControlParameter ControlID="HF_Username" Name="DOC_Modified_By" PropertyName="Value" />
                    <asp:Parameter Name="DOC_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Event">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_E_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_PO">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PO" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_JobType">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Table_Codes" />
                            <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Estimated_Hours_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Estimated_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Estimated_Mins" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Actual_Hours_Text" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Actual_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Time_Diff_Text" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Time_Diff" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadDP_Planned_Start_Date">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTxt_SMU">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                            <telerik:AjaxUpdatedControl ControlID="HF_SMU" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadNumTxt_Estimated_Hours">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Estimated_Mins" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Estimated_Time" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadNumTxt_Estimated_Mins">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Estimated_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Estimated_Time" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Closed" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_Closed" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Create_Event" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Create_Event" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_SMU" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_SMU_Prev" />
                            <telerik:AjaxUpdatedControl ControlID="lblLastSMU" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_SMU" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


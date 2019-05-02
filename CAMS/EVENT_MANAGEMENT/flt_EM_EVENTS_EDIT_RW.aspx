<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Add/Edit Event" CodeFile="flt_EM_EVENTS_EDIT_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_EVENTS_EDIT_RW" %>

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
            width: 62px;
        }

        .auto-style4 {
            width: 99px;
        }

        .auto-style8 {
            width: 212px;
        }

        .auto-style9 {
            width: 375px;
        }

        .auto-style10 {
            color: yellow;
        }
        .auto-style11 {
            text-align: right;
            height: 23px;
        }
        .auto-style12 {
            height: 23px;
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
            //top.location.href = top.location.href;
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_E_ID').value;
            oWnd.close(ThisVal);
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
        function CheckEnter_Asset(sender, eventArgs) {
            var combo = $find("<%= RadCB_Asset.ClientID %>");
            combo.hideDropDown();
            var temp = ent;
            ent = false;
            eventArgs.set_cancel(temp);
        }
        function CheckEnter_Site(sender, eventArgs) {
            var combo = $find("<%= RadCB_Site.ClientID %>");
            combo.hideDropDown();
            var temp = ent;
            ent = false;
            eventArgs.set_cancel(temp);
        }
        function CheckEnter_EventType(sender, eventArgs) {
            var combo = $find("<%= RadCB_EventType.ClientID %>");
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
        function RowSelected(sender, eventArgs) {
            var ATTid = sender.get_selectedItems()[0].getDataKeyValue('EI_ID');
            document.getElementById('HF_EI_ID').value = ATTid;
            sessionStorage.setItem("HF_EI_ID", ATTid);
        }
        function fn_onrowdblclick(sender, eventArgs) {
            var ATTid = sender.get_selectedItems()[0].getDataKeyValue('EI_ID');
            sessionStorage.setItem("HF_EI_ID", ATTid);
            fn_OnClickWindow();
        }
        function fn_OnClickButton() {
            var THISGUID = document.getElementById('HF_GUID').value;
            var THISE = document.getElementById('HF_E_ID').value;
            var THISEI = 0;
            var oWnd = $find("<%=RadWindow2.ClientID%>");
    oWnd.setUrl('flt_EM_EVENTS_ITEMS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&E_ID=' + THISE + '&EI_ID=' + THISEI + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
    oWnd.show();
}
function fn_OnClickWindow() {
    var THISGUID = document.getElementById('HF_GUID').value;
    var THISE = document.getElementById('HF_E_ID').value;
    var THISEI = document.getElementById('HF_EI_ID').value;
    var oWnd = $find("<%=RadWindow2.ClientID%>");
    oWnd.setUrl('flt_EM_EVENTS_ITEMS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&E_ID=' + THISE + '&EI_ID=' + THISEI + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
    oWnd.show();
}
function closeWindow_add(sender, args) {
    var x = args.get_argument();
    { __doPostBack('Refresh_Grid', 0); }
    if (x > 0) {
        var oWnd = $find("<%=RadWindow2.ClientID%>");
            oWnd.close();
        }
    }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" class="auto-style1" rowspan="2" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: right;">
                                <img id="ImgHome" alt="" onclick="fn_home()" src="../IMAGES/Icons/EVENT_DETAIL.png" style="cursor: pointer" /></td>
                            <td align="left" class="auto-style4" rowspan="2" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 5px; background-color: #ff661c; padding-right: 10px;">
                                <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></td>
                            <td align="center" class="auto-style8" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 5px; background-color: #ff661c; padding-right: 10px;">
                                <asp:Label ID="lbl_Latest_SMU" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label></td>
                            <td align="left" class="auto-style9" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #ff661c; text-align: right;">
                                <asp:Label ID="lbl_Created" runat="server" Text=""></asp:Label>&nbsp;&nbsp;<asp:Label ID="lbl_Created_By" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center" class="auto-style8" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 5px; background-color: #ff661c; padding-right: 10px;">
                                <asp:Label ID="lbl_Trend" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label></td>
                            <td align="left" class="auto-style9" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #ff661c; text-align: right;">
                                <asp:Label ID="lbl_Modified" runat="server" Text=""></asp:Label>&nbsp;&nbsp;<asp:Label ID="lbl_Modified_By" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general" cellspacing="0">
                                <tr>
                                    <td style="padding-left: 10px"><strong>DETAILS</strong></td>
                                    <td colspan="4">&nbsp;</td>
                                    <td colspan="3" valign="top" style="padding-left: 10px"><strong>ATTACHMENTS &amp; ITEMS</strong></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="border-color: #CCCCCC; padding-right: 20px; border-top-style: solid; border-left-style: solid;">Customer:<span class="auto-style10">*</span></td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC; border-top-style: solid; border-top-color: #CCCCCC;">
                                        <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px"></telerik:RadComboBox>
                                    </td>
                                    <td colspan="3" rowspan="4" valign="top" style="padding-left: 10px">
                                        <telerik:RadGrid ID="RadGrid_Attachments" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" ResolvedRenderMode="Classic" Skin="Glow">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <ClientSettings>
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <MasterTableView AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="DOC_ID" NoMasterRecordsText="No attachments." PageSize="5">
                                                <CommandItemSettings AddNewRecordText="Add new attachment" />
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="DOC_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_ID column" HeaderText="ID" ReadOnly="True" SortExpression="DOC_ID" UniqueName="DOC_ID"></telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="DOC_Name" Display="True" FilterControlAltText="Filter DOC_Name column" HeaderText="Name" SortExpression="DOC_Name" UniqueName="DOC_Name">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox1" runat="server" LabelWidth="64px" Resize="None" Skin="Silk" Text='<%# Bind("DOC_Name") %>' Width="400px"></telerik:RadTextBox></EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="DOC_NameLabel" runat="server" Text='<%# Eval("DOC_Name") %>'></asp:Label></ItemTemplate>
                                                        <HeaderStyle Width="400px" />
                                                        <ItemStyle Width="400px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_E_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_E_ID column" HeaderText="Event ID" ReadOnly="True" SortExpression="DOC_E_ID" UniqueName="DOC_E_ID"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_J_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_J_ID column" HeaderText="Job ID" ReadOnly="True" SortExpression="DOC_J_ID" UniqueName="DOC_J_ID"></telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="DOC_Link" Display="False" FilterControlAltText="Filter DOC_Link column" HeaderText="Link" SortExpression="DOC_Link" UniqueName="DOC_Link">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox2" runat="server" LabelWidth="64px" Resize="None" Skin="Silk" Text='<%# Bind("DOC_Link") %>' Width="400px"></telerik:RadTextBox></EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="DOC_LinkLabel" runat="server" Text='<%# Eval("DOC_Link") %>'></asp:Label></ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="DOC_Link" FilterControlAltText="Filter DOC_Link column" HeaderText="Link" ImageUrl="../IMAGES/24x24/document_tender_24x24.png" Target="_blank" UniqueName="DOC_Link">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="50px" />
                                                    </telerik:GridHyperLinkColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView></telerik:RadGrid></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Site:<span class="auto-style10">*</span></td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" OnClientKeyPressing="DetectEnter" OnClientSelectedIndexChanging="CheckEnter_Site" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="2" Width="250px"></telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Asset:<span class="auto-style10">*</span></td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" OnClientKeyPressing="DetectEnter" OnClientSelectedIndexChanging="CheckEnter_Asset" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="1" Width="150px"></telerik:RadComboBox>
                                        &#160;</td>
                                    <td colspan="2" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <asp:Label ID="lblModel" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Event Category:<span class="auto-style10">*</span></td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadComboBox ID="RadCB_EventCat" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" OnClientKeyPressing="DetectEnter" OnClientSelectedIndexChanging="CheckEnter_EventType" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="4" Width="300px"></telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Event Type:<span class="auto-style10">*</span></td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadComboBox ID="RadCB_EventType" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" OnClientKeyPressing="DetectEnter" OnClientSelectedIndexChanging="CheckEnter_EventType" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="4" Width="300px"></telerik:RadComboBox>
                                    </td>
                                    <td colspan="3" valign="top" align="left" style="padding-left: 10px">
                                        <telerik:RadButton ID="RadBtn_Add_Item" runat="server" AutoPostBack="False" OnClientClicked="fn_OnClickButton" Skin="Glow" Text="Add Item" Visible="False"></telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Description:</td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadTextBox ID="RadTxt_Description" runat="server" Height="27px" Skin="Glow" TabIndex="6" Width="400px"></telerik:RadTextBox></td>
                                    <td colspan="3" rowspan="8" valign="top" style="padding-left: 10px">
                                        <telerik:RadGrid ID="RadGrid_Items" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Visible="False">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                                <Selecting AllowRowSelect="True" />
                                                <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                                <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                            </ClientSettings>
                                            <MasterTableView AllowPaging="True" AutoGenerateColumns="False" ClientDataKeyNames="EI_ID" DataKeyNames="EI_ID" NoMasterRecordsText="No items." PageSize="5">
                                                <CommandItemSettings AddNewRecordText="Add new item" />
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="EI_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter EI_ID column" HeaderText="ID" ReadOnly="True" SortExpression="EI_ID" UniqueName="EI_ID"></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="Component" Display="True" FilterControlAltText="Filter Component column" HeaderText="Component" ReadOnly="True" SortExpression="Component" UniqueName="Component"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="EI_E_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter EI_E_ID column" HeaderText="Event ID" ReadOnly="True" SortExpression="EI_E_ID" UniqueName="EI_E_ID"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="EI_Name" Display="True" FilterControlAltText="Filter EI_Name column" HeaderText="Item" ReadOnly="True" SortExpression="EI_Name" UniqueName="EI_Name">
                                                        <ItemStyle Width="250px" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="EI_Qty" DataType="System.Int32" Display="True" FilterControlAltText="Filter EI_Qty column" HeaderText="Qty" ReadOnly="True" SortExpression="EI_Qty" UniqueName="EI_Qty"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="EI_Rate" DataType="System.Int32" Display="True" DataFormatString="{0:£#,##0.00}" FilterControlAltText="Filter EI_Rate column" HeaderText="Rate" ReadOnly="True" SortExpression="EI_Rate" UniqueName="EI_Rate"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="EI_Markup"  Display="True" DataFormatString="{0:N0}%" FilterControlAltText="Filter EI_Markup column" HeaderText="Markup" ReadOnly="True" SortExpression="EI_Markup" UniqueName="EI_Markup"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="EI_Total" DataType="System.Int32" Display="True" DataFormatString="{0:£#,##0.00}" FilterControlAltText="Filter EI_Total column" HeaderText="Total" ReadOnly="True" SortExpression="EI_Total" UniqueName="EI_Total"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="EI_Status" Display="True" FilterControlAltText="Filter EI_Status column" HeaderText="Status" ReadOnly="True" SortExpression="EI_Status" UniqueName="EI_Status"></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="EI_Qty_Used" DataType="System.Int32" Display="True" FilterControlAltText="Filter EI_Qty_Used column" HeaderText="Qty (Used)" ReadOnly="True" SortExpression="EI_Qty_Used" UniqueName="EI_Qty_Used"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="EI_Diff" DataType="System.Int32" Display="False" FilterControlAltText="Filter EI_Diff column" HeaderText="Diff" ReadOnly="True" SortExpression="EI_Diff" UniqueName="EI_Diff"></telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView></telerik:RadGrid></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Engineer" runat="server">Engineer:</asp:Label><span class="auto-style10">*</span></td>
                                    <td class="style7" colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" OnClientKeyPressing="DetectEnter" OnClientSelectedIndexChanging="CheckEnter_Eng" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="8" Width="300px" AutoPostBack="True"></telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Planned Start Date:<span class="auto-style10">*</span></td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadDatePicker ID="RadDP_Planned_Start_Date" runat="server" AutoPostBack="True" MinDate="1960-01-01" Skin="Glow" TabIndex="10">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
                                                        <ItemStyle BackColor="#FFC5A8" />
                                                    </telerik:RadCalendarDay>
                                                </SpecialDays>
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="10">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="10" />
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">Estimated Due Back:<span class="auto-style10">*</span></td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadDatePicker ID="RadDP_Estimated_Date" runat="server" AutoPostBack="True" Skin="Glow" TabIndex="11">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
                                                        <ItemStyle BackColor="#FFC5A8" />
                                                    </telerik:RadCalendarDay>
                                                </SpecialDays>
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="11">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="11" />
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-bottom-style: solid; border-bottom-color: #CCCCCC; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Start" runat="server" Text="Breakdown Time:" Visible="False"></asp:Label></td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC; border-bottom-style: solid; border-bottom-color: #CCCCCC">
                                        <telerik:RadDateTimePicker ID="RadDTP_Start" runat="server" Skin="Glow" Width="200px" Visible="False">
                                            <TimeView runat="server" Columns="4" EndTime="23:00:00" Interval="00:15:00" ShowHeader="False" Skin="Glow" StartTime="05:00:00"></TimeView>
                                        </telerik:RadDateTimePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px;">&nbsp;</td>
                                    <td colspan="4">&#160;</td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px;"><strong>CONTRACT</strong></td>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-color: #CCCCCC; padding-left: 10px; border-top-style: solid; border-left-style: solid; border-spacing: 0px;">&nbsp;</td>
                                    <td align="center" style="border-top-style: solid; border-color: #CCCCCC">
                                        <asp:Label ID="lbl_From_Text" runat="server" Font-Italic="True" Text="from"></asp:Label></td>
                                    <td align="center" style="border-top-style: solid; border-color: #CCCCCC" colspan="2">
                                        <asp:Label ID="lbl_Months_Text" runat="server" Font-Italic="True" Text="mths"></asp:Label></td>
                                    <td align="center" style="border-top-style: solid; border-color: #CCCCCC; border-right-style: solid;">
                                        <asp:Label ID="lbl_To_Text" runat="server" Font-Italic="True" Text="to"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="border-color: #CCCCCC; padding-right: 20px; border-left-style: solid;">
                                        <asp:Label ID="lbl_Date_Text" runat="server" Text="Date:"></asp:Label></td>
                                    <td align="center">
                                        <telerik:RadDatePicker ID="RadDP_From" runat="server" AutoPostBack="True" Skin="Glow" TabIndex="10" MinDate="2019-01-01">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
                                                        <ItemStyle BackColor="#FFC5A8" />
                                                    </telerik:RadCalendarDay>
                                                </SpecialDays>
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="10">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="10" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td colspan="2">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Months" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="60" MinValue="1" Skin="Glow" Width="50px" AutoPostBack="True" Value="1">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox></td>
                                    <td align="center" style="border-right-style: solid; border-color: #CCCCCC">
                                        <telerik:RadDatePicker ID="RadDP_To" runat="server" MinDate="1960-01-01" Skin="Glow" TabIndex="10">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
                                                        <ItemStyle BackColor="#FFC5A8" />
                                                    </telerik:RadCalendarDay>
                                                </SpecialDays>
                                            </Calendar>
                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="10">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="10" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td align="right" style="padding-right: 5px" colspan="2">
                                        <asp:Label ID="lbl_Subtotal_Text" runat="server" Text="Subtotal:" Visible="False" Font-Italic="True"></asp:Label></td>
                                    <td align="right" style="padding-right: 10px">
                                        <asp:Label ID="lbl_Subtotal" runat="server" Visible="False" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Estimated_Hours_Text" runat="server" Text="Estimated Time:"></asp:Label></td>
                                    <td style="text-align: left; border-right-style: solid; border-right-color: #CCCCCC;" colspan="4"><em>
                                        <asp:Label ID="lbl_Estimated_Hours" runat="server" Font-Italic="True" Text="[enter time within associated job(s)]"></asp:Label></em></td>
                                    <td align="right" style="padding-right: 5px" colspan="2">
                                        <asp:Label ID="lbl_Discount" runat="server" Text="Discount:" Visible="False" Font-Italic="True"></asp:Label></td>
                                    <td align="right" style="padding-right: 10px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Discount" runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="100" MinValue="0" Skin="Glow" Type="Percent" Visible="False" Width="60px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="n%" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Actual_Hours_Text" runat="server" Text="Actual Time:"></asp:Label></td>
                                    <td colspan="4" style="text-align: left; border-right-style: solid; border-right-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Actual_Hours" runat="server" Font-Italic="True">[time will appear as timesheets are completed]</asp:Label></td>
                                    <td align="right" rowspan="3" style="padding-right: 5px" colspan="2">
                                        <asp:Label ID="lbl_Total_Text" runat="server" Font-Bold="True" Font-Italic="True" Text="Total Items Cost:" Visible="False"></asp:Label></td>
                                    <td align="right" rowspan="3" style="padding-right: 10px">
                                        <asp:Label ID="lbl_Total" runat="server" Font-Bold="True" Font-Size="16pt" Text="0" Visible="False"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Time_Diff_Text" runat="server" Text="Time Difference:" Visible="False"></asp:Label></td>
                                    <td colspan="4" style="text-align: left; border-right-style: solid; border-right-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Time_Diff" runat="server" Visible="False"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Engineer_Rate_Text" runat="server" Text="Current Engineer Cost:"></asp:Label>
                                    </td>
                                    <td class="auto-style12" colspan="4" style="text-align: left; border-right-style: solid; border-right-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Engineer_Rate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-left-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Payment_Terms_Text" runat="server" Text="Payment Terms:"></asp:Label></td>
                                    <td colspan="4" style="border-right-style: solid; border-right-color: #CCCCCC">
                                        <telerik:RadComboBox ID="RadCB_Payment_Terms" runat="server" Skin="Glow" Width="200px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Payment Prior To Work" Value="Payment Prior To Work" />
                                                <telerik:RadComboBoxItem runat="server" Text="14 Days" Value="14 Days" />
                                                <telerik:RadComboBoxItem runat="server" Selected="True" Text="30 Days" Value="30 Days" />
                                                <telerik:RadComboBoxItem runat="server" Text="60 Days" Value="60 Days" />
                                                <telerik:RadComboBoxItem runat="server" Text="Immediate Payment" Value="Immediate Payment" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" style="padding-right: 5px">
                                        <asp:Label ID="lbl_Status" runat="server" Text="Status:"></asp:Label></td>
                                    <td align="left" style="padding-left: 10px;">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="16">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Planning" Value="Planning" />
                                                <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                            </Items>
                                        </telerik:RadComboBox>
                                        <telerik:RadComboBox ID="RadCB_Status_Archive" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="17" Visible="False">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Planning" Value="Planning" />
                                                <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                                <telerik:RadComboBoxItem runat="server" Text="Cancelled" Value="Cancelled" />
                                                <telerik:RadComboBoxItem runat="server" Text="Complete" Value="Complete" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" style="padding-right: 10px">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" Skin="Glow" TabIndex="19" Text="Save" Width="100px"></telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px; border-left-style: solid; border-bottom-style: solid; border-left-color: #CCCCCC; border-bottom-color: #CCCCCC;">
                                        <asp:Label ID="lbl_Special_Note" runat="server" Text="Special Note:"></asp:Label></td>
                                    <td colspan="4" style="border-bottom-style: solid; border-bottom-color: #CCCCCC; border-right-style: solid; border-right-color: #CCCCCC;">
                                        <telerik:RadTextBox ID="RadTxt_Special_Note" runat="server" Skin="Glow" Text="Once signed, please fax, post or e-mail it to the provided address." Width="400px" Wrap="False"></telerik:RadTextBox></td>
                                    <td align="right" style="padding-right: 5px">
                                        <asp:Label ID="lbl_Ended" runat="server" Text="Date Closed:" Visible="False"></asp:Label></td>
                                    <td align="left" style="padding-left: 10px;">
                                        <telerik:RadDatePicker ID="RadDP_Ended_Date" runat="server" Skin="Glow" TabIndex="18" Visible="False">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"></Calendar>
                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="18">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="18" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td align="right" style="padding-right: 10px">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" TabIndex="20" Text="Cancel" Width="100px"></telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&#160;</td>
                                    <td colspan="4">&#160;</td>
                                    <td align="right" style="padding-right: 10px;" valign="top">Notes:</td>
                                    <td align="left" style="padding-left: 10px;" valign="top">
                                        <telerik:RadTextBox ID="RadTxt_Notes" runat="server" Height="60px" Skin="Glow" TabIndex="15" TextMode="MultiLine" Width="100%"></telerik:RadTextBox></td>
                                    <td align="right" style="padding-right: 10px;" valign="top">&#160;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage></telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <telerik:RadNotification ID="RadNotification1" runat="server" Skin="Glow" LoadContentOn="FirstShow" AutoCloseDelay="8000" Width="450px" Height="150px"
                Title="CAMS Error - Please Correct Before Continuing." Animation="Fade" Position="Center" Visible="False" VisibleOnPageLoad="True">
            </telerik:RadNotification>
            <telerik:RadNotification ID="RadNotification2" runat="server" Skin="Glow" LoadContentOn="FirstShow" AutoCloseDelay="8000" Width="450px" Height="150px"
                Title="CAMS Error - Cannot save Breakdown Event in 'Planning.'" Animation="Fade" Position="Center" Visible="False" VisibleOnPageLoad="True">
            </telerik:RadNotification>
            <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server" />
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Previous_Status" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Event_ReOpen" runat="server" Value="0" />
            <asp:HiddenField ID="HF_E_ID" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Estimated_Time" runat="server" Value="00:00" />
            <asp:HiddenField ID="HF_PageEI" runat="server" />
            <asp:HiddenField ID="HF_EI_ID" runat="server" />
            <asp:HiddenField ID="HF_ET_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_Status" runat="server" Value="Planning" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Items" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Subtotal" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Discount" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Total" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Time_Diff" />
                             <telerik:AjaxUpdatedControl ControlID="RadGrid_Items" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Items">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Items" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Attachments">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Attachments" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_EventCat">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadBtn_Add_Item" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Items" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Subtotal_Text" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Subtotal" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Discount" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Discount" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Total_Text" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Total" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_EventType">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Start" />
                            <telerik:AjaxUpdatedControl ControlID="RadDTP_Start" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadNotification2" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Discount">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Subtotal" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Discount" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Total" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_Planned_Start_Date">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_Estimated_Date">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_From">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Months" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Months">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Ended" />
                            <telerik:AjaxUpdatedControl ControlID="RadNotification2" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_Ended_Date" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Status" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status_Archive">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Status" />
                             <telerik:AjaxUpdatedControl ControlID="HF_Event_ReOpen" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_E_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="500px" Width="500px" OnClientClose="closeWindow_add" Behaviors="Close, Move" Modal="True" Title="CAMS - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


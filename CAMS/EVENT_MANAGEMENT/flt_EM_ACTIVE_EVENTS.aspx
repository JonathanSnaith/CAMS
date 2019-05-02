<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Active Events" CodeFile="flt_EM_ACTIVE_EVENTS.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_ACTIVE_EVENTS" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style5 {
            height: 45px;
            width: 886px;
        }

        .style6 {
            height: 45px;
            color: black;
            font-size: medium;
        }

        .style11 {
            height: 45px;
            width: 791px;
        }

        .style14 {
            width: 134px;
        }

        .style15 {
            width: 220px;
        }

        .style18 {
            width: 160px;
        }

        .auto-style2 {
            width: 1020px;
        }

        .auto-style3 {
            width: 202px;
        }

        .showitem {
            display: block;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
        }

        .hideitem {
            display: none;
        }

        .auto-style27 {
            width: 237px;
        }
    </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
    function fn_back() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISPP = document.getElementById('HF_PreviousPage').value;
        if (THISPP == 0) {
            window.open('../CLIENT/flt_EVENT_MANAGEMENT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../DASHBOARDS/flt_D_EVENT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=8', '_self');
        }
        if (THISPP == 3) {
            window.open('../DASHBOARDS/flt_D_EVENT_CAL.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
    }
    function fn_home() {
        var THISGUID = document.getElementById('HF_GUID').value;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('E_ID');
        document.getElementById('HF_E_ID').value = ATTid;
        document.getElementById('HF_J_ID').value = "";
        sessionStorage.setItem("J_E_ID", ATTid);
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISE = 0;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_EM_EVENTS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&E_ID=' + THISE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISE = document.getElementById('HF_E_ID').value;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_EM_EVENTS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&E_ID=' + THISE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function RowSelectedjob(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('J_ID');
        document.getElementById('HF_J_ID').value = ATTid;
        sessionStorage.setItem("J_ID", ATTid);
    }
    function fn_onrowdblclickjob(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('J_ID');
        sessionStorage.setItem("J_ID", ATTid);
        fn_OnClickWindowjob();
    }
    function fn_OnClickButtonjob() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISE = sessionStorage.getItem("J_E_ID");
        var THISJSess = 0;
        var oWnd = $find("<%=RadWindow4.ClientID%>");
        oWnd.setUrl('flt_EM_JOBS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&J_ID=' + THISJSess + '&J_E_ID=' + THISE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickWindowjob() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISE = sessionStorage.getItem("J_E_ID");
        var THISJSess = sessionStorage.getItem("J_ID");
        var oWnd = $find("<%=RadWindow4.ClientID%>");
        oWnd.setUrl('flt_EM_JOBS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&J_ID=' + THISJSess + '&J_E_ID=' + THISE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function RowSelectedft(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('FT_ID');
        document.getElementById('HF_FT_ID').value = ATTid;
        sessionStorage.setItem("FT_ID", ATTid);
    }
    function fn_onrowdblclickft(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('FT_ID');
        sessionStorage.setItem("FT_ID", ATTid);
        fn_OnClickWindowft();
    }
    function fn_OnClickWindowft() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISFT = document.getElementById('HF_FT_ID').value;
        var THISE = document.getElementById('HF_E_ID').value;
        var THISFTSess = sessionStorage.getItem("FT_ID");
        var oWnd = $find("<%=RadWindow6.ClientID%>");
        oWnd.setUrl('flt_EM_FT_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&E_ID=' + THISE + '&FT_ID=' + THISFTSess + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OpenJobCard() {
        var EventId = document.getElementById('HF_E_ID').value;
        var JobId = "0";  //document.getElementById('HF_J_ID').value;
        //        alert(EventId);
        //        alert(JobId);
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/JobCard2.rpt&@Event_ID=' + EventId + "&@Job_ID=" + JobId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');

    }
    function closeWindow_add_event(sender, args) {
        var x = args.get_argument();
        { __doPostBack('Refresh_Grid', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow2.ClientID%>");
            oWnd.close();
        }
    }
    function closeWindow_add_eventjob(sender, args) {
        var x = args.get_argument();
        { __doPostBack('Refresh_Grid', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow4.ClientID%>");
            oWnd.close();
        }
    }
    function closeWindow_add_eventft(sender, args) {
        var x = args.get_argument();
        { __doPostBack('Refresh_Grid', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow6.ClientID%>");
            oWnd.close();
        }
    }
    function closeWindow_asset(sender, args) {
        var x = args.get_argument();
        if (x > 0) {
            var oWnd = $find("<%=RadWindow_Asset.ClientID%>");
            oWnd.close();
        }
    }
    function closeWindow_customer(sender, args) {
        var x = args.get_argument();
        if (x > 0) {
            var oWnd = $find("<%=RadWindow_Customer.ClientID%>");
            oWnd.close();
        }
    }
     function asset_details(args) {
        var THISGUID = document.getElementById('HF_GUID').value;
         var THISA = args
        var oWnd = $find("<%=RadWindow_Asset.ClientID%>");
        oWnd.setUrl('../ASSET_MANAGEMENT/flt_AM_ASSET_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&A_ID=' + THISA + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
     function cus_details(args) {
         var THISGUID = document.getElementById('HF_GUID').value;
         var THISC = args
        var oWnd = $find("<%=RadWindow_Customer.ClientID%>");
        oWnd.setUrl('../CUSTOMER_MANAGEMENT/flt_CUSTOMER_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&CUS_ID=' + THISC + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">&nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">&nbsp;</td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style27" rowspan="2">
                                <asp:Label ID="lblTitle" runat="server" Text="ACTIVE EVENTS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" rowspan="2">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Text="Refresh" Width="100px" Skin="Glow">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right; padding-top: 5px;">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;">
                                <telerik:RadComboBox ID="RadCB_EventType" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="250px" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right; padding-top: 5px;">
                                <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;">
                                <telerik:RadTextBox ID="RadTxt_Instruction" runat="server" AutoPostBack="True" EmptyMessage="search any text field" LabelWidth="100px" Resize="None" Width="250px" Skin="Glow">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">Date Created (From) </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadDatePicker ID="DateFrom" runat="server" AutoPostBack="True" Skin="Glow">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput AutoPostBack="True" DateFormat="yyyy-MM-dd" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">Date Created (To) </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadDatePicker ID="DateTo" runat="server" AutoPostBack="True" Skin="Glow">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput AutoPostBack="True" DateFormat="yyyy-MM-dd" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
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
                        </tr>
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_1" runat="server" onClick="fn_OnClickButton()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/EVENT_DETAIL.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW EVENT" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_2" runat="server" onClick="fn_OnClickButtonjob()" CssClass="roundcorners" BackColor="#d9ffd9">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/EVENT_JOB_MANAGEMENT.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="NEW JOB" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow45" runat="server">
                                        <asp:TableCell ID="ID_CELL_3" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_3" runat="server" onClick="fn_OpenJobCard()" CssClass="roundcorners" BackColor="#d9ffd9">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                            <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="PRINT ALL JOBS" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T4" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow36" runat="server">
                                        <asp:TableCell ID="ID_CELL_4" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_4" runat="server" onClick="fn_panel_4()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label36" runat="server" Text="" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td colspan="7" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Active_Events" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                                    AllowPaging="True" AllowSorting="True" ResolvedRenderMode="Classic" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="E_ID" DataKeyNames="E_ID"
                                        NoMasterRecordsText="No events to display." PageSize="15">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new event" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="E_CUS_ID" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter E_CUS_ID column" HeaderText="E CUS ID" ReadOnly="True"
                                                SortExpression="E_CUS_ID" UniqueName="E_CUS_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Customer" Display="False" FilterControlAltText="Filter Customer column" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" UniqueName="Customer">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn FilterControlAltText="Filter Cus_T column" HeaderText="Customer" UniqueName="Cus_T" SortExpression="Customer">
                                                <ItemTemplate>
                                                    <table border="0" style="height: 100%;">
                                                        <tr>
                                                            <td>
                                                                <telerik:RadLabel ID="RadLbl_Customer_ID_Event" runat="server" Text='<%# Bind("Customer") %>'
                                                                    Style="cursor: pointer;" Font-Underline="True" ForeColor="White">
                                                                </telerik:RadLabel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px" />
                                                <ItemStyle Wrap="False" Width="80px" />
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="E_A_ID" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter E_A_ID column" HeaderText="E A ID" ReadOnly="True"
                                                SortExpression="E_A_ID" UniqueName="E_A_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Asset" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter Asset column" HeaderText="Asset" ReadOnly="True"
                                                SortExpression="Asset" UniqueName="Asset">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn FilterControlAltText="Filter Asset_T column" HeaderText="Asset" UniqueName="Asset_T" SortExpression="Asset">
                                                <ItemTemplate>
                                                    <table border="0" style="height: 100%;">
                                                        <tr>
                                                            <td>
                                                                <telerik:RadLabel ID="RadLbl_Asset_ID_Event" runat="server" Text='<%# Bind("Asset") %>'
                                                                    Style="cursor: pointer;" Font-Underline="True" ForeColor="White">
                                                                </telerik:RadLabel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px" />
                                                <ItemStyle Wrap="False" Width="80px" />
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="E_ID" DataType="System.Int32" Display="True" FilterControlAltText="Filter E_ID column" HeaderText="Event No" ReadOnly="True" SortExpression="E_ID" UniqueName="E_ID">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Site_Name" Display="True" FilterControlAltText="Filter Site_Name column" HeaderText="Site" ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="EventCat" FilterControlAltText="Filter EventCat column"
                                                        HeaderText="Category" ReadOnly="True" SortExpression="EventCat" UniqueName="EventCat">
                                                        <HeaderStyle Width="120px" Wrap="False" />
                                                        <ItemStyle Width="120px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="E_ET_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter E_ET_ID column" HeaderText="E ET ID" ReadOnly="True"
                                            SortExpression="E_ET_ID" UniqueName="E_ET_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EventType" FilterControlAltText="Filter EventType column" HeaderText="Type" ReadOnly="True" SortExpression="EventType" UniqueName="EventType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Description" Display="True" FilterControlAltText="Filter E_Description column" HeaderText="Description" ReadOnly="True" SortExpression="E_Description" UniqueName="E_Description">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Engineer" Display="True" FilterControlAltText="Filter Engineer column" HeaderText="Engineer" ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Planned_Start_Date" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter E_Planned_Start_Date column" HeaderText="Planned Start Date" SortExpression="E_Planned_Start_Date" UniqueName="E_Planned_Start_Date">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Date_Estimated" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter E_Date_Estimated column" HeaderText="Due Date" ReadOnly="True" SortExpression="E_Date_Estimated" UniqueName="E_Date_Estimated">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="E_Estimated_Time" FilterControlAltText="Filter E_Estimated_Time column"
                                                     Display="False"  HeaderText="Est. Time" ReadOnly="True" SortExpression="E_Estimated_Time" UniqueName="E_Estimated_Time">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="E_Total_Time" FilterControlAltText="Filter E_Total_Time column"
                                                      Display="False"  HeaderText="Act. Time" ReadOnly="True" SortExpression="E_Total_Time" UniqueName="E_Total_Time">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="E_Time_Diff" FilterControlAltText="Filter E_Time_Diff column"
                                                        HeaderText="Time Diff" ReadOnly="True" SortExpression="E_Time_Diff" UniqueName="E_Time_Diff">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="E_Time_Diff_Minutes" FilterControlAltText="Filter E_Time_Diff_Minutes column"
                                                    Display="False"    HeaderText="Time Diff (Mins)" ReadOnly="True" SortExpression="E_Time_Diff_Minutes" UniqueName="E_Time_Diff_Minutes">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="E_Engineer_Rate" DataFormatString="{0:£#,##0.00}"
                                                Display="True" FilterControlAltText="Filter E_Engineer_Rate column" HeaderText="Total Engineer Cost"
                                                ReadOnly="True" SortExpression="E_Engineer_Rate" UniqueName="E_Engineer_Rate">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="E_Total" DataFormatString="{0:£#,##0.00}"
                                                Display="True" FilterControlAltText="Filter E_Total column" HeaderText="Total Item Cost"
                                                ReadOnly="True" SortExpression="E_Total" UniqueName="E_Total">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Status" FilterControlAltText="Filter E_Status column" HeaderText="Status" ReadOnly="True" SortExpression="E_Status" UniqueName="E_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Notes" Display="False" FilterControlAltText="Filter E_Notes column"
                                                HeaderText="Notes" ReadOnly="True" SortExpression="E_Notes" UniqueName="E_Notes"
                                                Visible="False">
                                                <HeaderStyle Width="400px" Wrap="False" />
                                                <ItemStyle Width="400px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Created" DataFormatString="{0:dd MMM yyyy}"
                                                Display="False" FilterControlAltText="Filter E_Created column" HeaderText="Date Created"
                                                ReadOnly="True" SortExpression="E_Created" UniqueName="E_Created" Visible="False">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Created_By" Display="False" FilterControlAltText="Filter E_Created_By column"
                                                HeaderText="Created By" ReadOnly="True" SortExpression="E_Created_By" UniqueName="E_Created_By"
                                                Visible="False">
                                                <HeaderStyle Width="120px" Wrap="False" />
                                                <ItemStyle Width="120px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Modified" DataFormatString="{0:dd MMM yyyy}"
                                                Display="False" FilterControlAltText="Filter E_Modified column" HeaderText="Date Modified"
                                                ReadOnly="True" SortExpression="E_Modified" UniqueName="E_Modified" Visible="False">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Modified_By" Display="False" FilterControlAltText="Filter E_Modified_By column"
                                                HeaderText="Modified By" ReadOnly="True" SortExpression="E_Modified_By" UniqueName="E_Modified_By">
                                                <HeaderStyle Width="120px" Wrap="False" />
                                                <ItemStyle Width="120px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td style="text-align: left; vertical-align: top;" colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_Job_Text" runat="server" Font-Bold="True" Font-Names="segoe ui" Font-Size="14pt" ForeColor="White" Text="Jobs" Visible="False"></asp:Label>
                            </td>
                            <td style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_FT_Text" runat="server" Font-Bold="True" Font-Names="segoe ui" Font-Size="14pt" ForeColor="White" Text="Timesheets" Visible="False"></asp:Label>
                            </td>
                            <td colspan="2" style="text-align: left; vertical-align: top;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Active_Jobs" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" ResolvedRenderMode="Classic" Skin="Glow" Width="1000px">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclickjob" OnRowSelected="RowSelectedjob" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="J_ID" DataKeyNames="J_ID" NoMasterRecordsText="No jobs to display.">
                                        <CommandItemSettings AddNewRecordText="Add new job" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="J_E_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter J_E_ID column" HeaderText="Event No" ReadOnly="True" SortExpression="J_E_ID" UniqueName="J_E_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_ID" DataType="System.Int32" Display="True" FilterControlAltText="Filter J_ID column" HeaderText="Job No" ReadOnly="True" SortExpression="J_ID" UniqueName="J_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="JobType" FilterControlAltText="Filter JobType column" HeaderText="Type" ReadOnly="True" SortExpression="JobType" UniqueName="JobType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column"
                                                HeaderText="Component" ReadOnly="True" SortExpression="Level3"
                                                UniqueName="Level3">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EngOrCom" Display="True" FilterControlAltText="Filter EngOrCom column"
                                                HeaderText="Engineer" ReadOnly="True" SortExpression="EngOrCom" UniqueName="EngOrCom">
                                                <HeaderStyle Width="150px" Wrap="True" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Instruction" Display="True" FilterControlAltText="Filter J_Instruction column" HeaderText="Instruction" ReadOnly="True" SortExpression="J_Instruction" UniqueName="J_Instruction">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Estimated_Time" FilterControlAltText="Filter J_Estimated_Time column"
                                                     Display="False"  HeaderText="Est. Time" ReadOnly="True" SortExpression="J_Estimated_Time" UniqueName="J_Estimated_Time">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="J_FTD_Total_Time" FilterControlAltText="Filter J_FTD_Total_Time column"
                                                      Display="False"  HeaderText="Act. Time" ReadOnly="True" SortExpression="J_FTD_Total_Time" UniqueName="J_FTD_Total_Time">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="J_Time_Diff" FilterControlAltText="Filter J_Time_Diff column"
                                                        HeaderText="Time Diff" ReadOnly="True" SortExpression="J_Time_Diff" UniqueName="J_Time_Diff">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Time_Diff_Minutes" FilterControlAltText="Filter J_Time_Diff_Minutes column"
                                                    Display="False"    HeaderText="Time Diff (Mins)" ReadOnly="True" SortExpression="J_Time_Diff_Minutes" UniqueName="J_Time_Diff_Minutes">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Date_Closed" DataFormatString="{0:dd MMM yyyy}" Display="True" FilterControlAltText="Filter J_Date_Closed column" HeaderText="Date Closed" ReadOnly="True" SortExpression="J_Date_Closed" UniqueName="J_Date_Closed">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Status" FilterControlAltText="Filter J_Status column" HeaderText="Status" ReadOnly="True" SortExpression="J_Status" UniqueName="J_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Notes" Display="False" FilterControlAltText="Filter J_Notes column" HeaderText="Notes" ReadOnly="True" SortExpression="J_Notes" UniqueName="J_Notes">
                                                <HeaderStyle Width="400px" Wrap="False" />
                                                <ItemStyle Width="400px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Active_FT" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" ResolvedRenderMode="Classic" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclickft" OnRowSelected="RowSelectedft" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="FT_ID" DataKeyNames="FT_ID" NoMasterRecordsText="No timesheets to display.">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new timesheet" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="FT_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter FT_ID column" HeaderText="ID" ReadOnly="True" SortExpression="FT_ID" UniqueName="FT_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_J_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter FT_J_ID column" HeaderText="Job No" ReadOnly="True" SortExpression="FT_J_ID" UniqueName="FT_J_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Date" DataFormatString="{0:dd MMM yyyy}" Display="False" FilterControlAltText="Filter FT_Date column" HeaderText="Date" ReadOnly="True" SortExpression="FT_Date" UniqueName="FT_Date">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FTD_Total_Hours" FilterControlAltText="Filter FTD_Total_Hours column" HeaderText="Job Hours" ReadOnly="True" SortExpression="FTD_Total_Hours" UniqueName="FTD_Total_Hours">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Status" FilterControlAltText="Filter FT_Status column" HeaderText="Status" ReadOnly="True" SortExpression="FT_Status" UniqueName="FT_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Modified" DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter FT_Modified column" HeaderText="Date Modified" ReadOnly="True"
                                                SortExpression="FT_Modified" UniqueName="FT_Modified">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td colspan="2" style="text-align: left; vertical-align: top;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: left; vertical-align: top;" class="style6">&nbsp;</td>
                            <td style="text-align: left;" class="style5">
                            </td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server" />
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_PageJob" runat="server" />
            <asp:HiddenField ID="HF_PageFT" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_E_ID" runat="server" />
            <asp:HiddenField ID="HF_J_ID" runat="server" />
            <asp:HiddenField ID="HF_FT_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Site" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Customer" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow4">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow6">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="DateFrom" />
                            <telerik:AjaxUpdatedControl ControlID="DateTo" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_EventType">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="DateFrom">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                            <telerik:AjaxUpdatedControl ControlID="DateTo" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="DateTo">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Active_Events">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="T3" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Active_Jobs">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTxt_Instruction">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="850px" Width="1400px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="CAMS - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow4" runat="server" Height="800px" Width="1250px" OnClientClose="closeWindow_add_eventjob" Behaviors="Close, Move" Modal="True" Title="CAMS - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow6" runat="server" Height="750px" Width="1000px" OnClientClose="closeWindow_add_eventft" Behaviors="Close, Move" Modal="True" Title="CAMS - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow_Asset" runat="server" Height="700px" Width="1350px" OnClientClose="closeWindow_asset" Behaviors="Close, Move" Modal="True" Title="Asset" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow_Customer" runat="server" Height="700px" Width="900px" OnClientClose="closeWindow_customer" Behaviors="Close, Move" Modal="True" Title="Customer" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


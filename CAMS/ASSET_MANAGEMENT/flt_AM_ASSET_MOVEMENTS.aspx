<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Asset Management - Asset Movements" CodeFile="flt_AM_ASSET_MOVEMENTS.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_MOVEMENTS" %>

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

        .style4 {
            height: 19px;
        }

        .style5 {
            height: 45px;
        }

        .style6 {
            height: 19px;
            width: 218px;
        }

        .style7 {
            height: 19px;
            width: 95px;
        }

        .style8 {
            height: 19px;
            width: 219px;
        }

        .style11 {
            height: 19px;
            width: 96px;
        }

        .style12 {
            height: 19px;
            width: 108px;
        }
        .auto-style2 {
            height: 45px;
            width: 1020px;
        }
        .auto-style3 {
            height: 45px;
            width: 209px;
        }
        .auto-style5 {
            height: 45px;
            width: 103px;
        }
        .auto-style9 {
            height: 45px;
            width: 120px;
        }
        .auto-style10 {
            height: 45px;
            width: 91px;
        }
        .auto-style11 {
            height: 19px;
            width: 676px;
        }
        .auto-style12 {
            height: 19px;
            width: 177px;
        }
    </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
    function fn_home() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    function fn_back() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISPP = document.getElementById('lblPreviousPage').innerHTML;
        if (THISPP == 0) {
            window.open('../CLIENT/flt_ASSET_MANAGEMENT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('AM_ID');
        document.getElementById('HF_AM_ID').value = ATTid;
        sessionStorage.setItem("AM_ID", ATTid);
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var oWndadd = $find("<%=RadWindow1.ClientID%>");
        oWndadd.setUrl('flt_AM_ASSET_MOVEMENTS_ADD_RW.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        //var THISAM = document.getElementById('HF_AM_ID').value;
        var THISAM = sessionStorage.getItem("AM_ID");
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_AM_ASSET_MOVEMENTS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&AM_ID=' + THISAM + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickRequest() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var oWndadd = $find("<%=RadWindow3.ClientID%>");
         oWndadd.setUrl('flt_AM_ASSET_MOVEMENTS_ADD_REQUEST_RW.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
    }
    function closeWindow_add_event_new_item(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWndadd = $find("<%=RadWindow1.ClientID%>");
            oWndadd.close();
        }
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
    function fn_report() {
        var DateFrom = document.getElementById('HF_From').value
        var DateTo = document.getElementById('HF_To').value
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Asset_Movements.rpt&@DateFrom=' + DateFrom + "&@DateTo=" + DateTo, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
    }
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                      <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>
                                <asp:Label ID="lbl_Site" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lbl_Asset" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style3">
                                 <asp:Label ID="lblTitle" runat="server" Text="ASSET MOVEMENTS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style10">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Default" Text="Refresh" Width="100px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style12">
                                Asset:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style9">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AutoPostBack="True" Filter="Contains" ResolvedRenderMode="Classic" AllowCustomText="True" DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID" Font-Names="Segoe UI" Font-Size="10pt" Skin="Default">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style16">
                                From:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadDatePicker ID="RadDP_From" runat="server" AutoPostBack="True" Skin="Default" Style="margin-left: 0px">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Default" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style13">
                                 &nbsp;To:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadDatePicker ID="RadDP_To" runat="server" AutoPostBack="True" Skin="Default">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Default" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style14">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style15">
                                 &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                &nbsp;</td>
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
                                                    <img src="../IMAGES/Icons_Black/ASSET_MOVEMENT_NEW_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW MOVEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="True">
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                     <asp:Panel ID="Panel_2" runat="server" onClick="fn_OnClickRequest()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2" >
                                                     <img src="../IMAGES/Icons_Black/ASSET_MOVEMENT_REQUEST_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="REQUEST MOVEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="True">
                                    <asp:TableRow ID="TableRow45" runat="server">
                                        <asp:TableCell ID="ID_CELL_3" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_3" runat="server" onClick="fn_report()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                     <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="PRINT" ForeColor="Black"></asp:Label>
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
                    <table class="style1" style="padding-top: 20px">
                        <tr>
                            <td class="style4" colspan="6" style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_Previous_Movements0" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="12pt" ForeColor="Black" Text="Pending Movements"></asp:Label>
                            </td>
                            <td class="style4" style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4" colspan="6" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Asset_Movements_Requests" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_ASSET_MOVEMENTS_REQUESTS" ResolvedRenderMode="Classic" Width="95%">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="AM_ID" DataKeyNames="AM_ID" DataSourceID="SqlDS_RadGrid_SP_ASSET_MOVEMENTS_REQUESTS" NoMasterRecordsText="No requests to display.">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new attribute" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="AM_ID" DataType="System.Int32" Display="True" FilterControlAltText="Filter AM_ID column" HeaderText="Move Ref." ReadOnly="True" SortExpression="AM_ID" UniqueName="AM_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Asset_ID" FilterControlAltText="Filter Asset_ID column" HeaderText="Asset ID" ReadOnly="True" SortExpression="Asset_ID" UniqueName="Asset_ID">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_WeekEnding" DataFormatString="{0:dd MMM yyyy}" Display="False" FilterControlAltText="Filter AM_WeekEnding column" HeaderText="WeekEnding" ReadOnly="True" SortExpression="AM_WeekEnding" UniqueName="AM_WeekEnding">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_Date" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter AM_Date column" HeaderText="Proposed Date of Movement" ReadOnly="True" SortExpression="AM_Date" UniqueName="AM_Date">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_Date_Started" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter AM_Date_Started column" HeaderText="Actual Date of Movement" ReadOnly="True" SortExpression="AM_Date_Started" UniqueName="AM_Date_Started">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Previous_Site_Name" Display="True" FilterControlAltText="Filter Previous_Site_Name column" HeaderText="Current Location" ReadOnly="True" SortExpression="Previous_Site_Name" UniqueName="Previous_Site_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Previous_SC_Name" Display="True" FilterControlAltText="Filter Previous_SC_Name column" HeaderText="Current Cost Location" ReadOnly="True" SortExpression="Previous_SC_Name" UniqueName="Previous_SC_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Site_Name" Display="True" FilterControlAltText="Filter Site_Name column" HeaderText="Proposed Location" ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SC_Name" Display="True" FilterControlAltText="Filter SC_Name column" HeaderText="Proposed Cost Location" ReadOnly="True" SortExpression="SC_Name" UniqueName="SC_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_SMU" Display="False" FilterControlAltText="Filter AM_SMU column" HeaderText="SMU" ReadOnly="True" SortExpression="AM_SMU" UniqueName="AM_SMU">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="AM_Reason" Display="True" FilterControlAltText="Filter AM_Reason column" HeaderText="Reason" ReadOnly="True" SortExpression="AM_Reason" UniqueName="AM_Reason">
                                                <HeaderStyle Width="300px" Wrap="False" />
                                                <ItemStyle Width="300px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_Status" Display="True" FilterControlAltText="Filter AM_Status column" HeaderText="Status" ReadOnly="True" SortExpression="AM_Status" UniqueName="AM_Status">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_Created" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter AM_Created column" HeaderText="Date Created" ReadOnly="True" SortExpression="AM_Created" UniqueName="AM_Created">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td class="style4" style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4" colspan="6" style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_Previous_Movements" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="12pt" ForeColor="Black" Text="Previous Movements"></asp:Label>
                            </td>
                            <td class="style4" style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5" style="text-align: left; vertical-align: top;" colspan="6">
                                <telerik:RadGrid ID="RadGrid_Asset_Movements" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="SqlDS_RadGrid_SP_ASSET_MOVEMENTS"
                                    ResolvedRenderMode="Classic" Width="95%" AllowSorting="True">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="AM_ID"
                                        DataKeyNames="AM_ID" DataSourceID="SqlDS_RadGrid_SP_ASSET_MOVEMENTS" NoMasterRecordsText="No movements to display.">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new attribute" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="AM_ID" DataType="System.Int32"
                                                Display="True" FilterControlAltText="Filter AM_ID column" HeaderText="Move Ref."
                                                ReadOnly="True" SortExpression="AM_ID" UniqueName="AM_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Asset_ID"
                                                FilterControlAltText="Filter Asset_ID column" HeaderText="Asset ID" ReadOnly="True"
                                                SortExpression="Asset_ID" UniqueName="Asset_ID">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_WeekEnding" Display="False"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter AM_WeekEnding column" HeaderText="WeekEnding"
                                                ReadOnly="True" SortExpression="AM_WeekEnding" UniqueName="AM_WeekEnding">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_Date"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter AM_Date column" HeaderText="Proposed Date of Movement"
                                                ReadOnly="True" SortExpression="AM_Date" UniqueName="AM_Date">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_Date_Started"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter AM_Date_Started column" HeaderText="Actual Date of Movement"
                                                ReadOnly="True" SortExpression="AM_Date_Started" UniqueName="AM_Date_Started">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Previous_Site_Name" Display="True"
                                                FilterControlAltText="Filter Previous_Site_Name column"
                                                HeaderText="Previous Location" ReadOnly="True" SortExpression="Previous_Site_Name"
                                                UniqueName="Previous_Site_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Previous_SC_Name" Display="True"
                                                FilterControlAltText="Filter Previous_SC_Name column"
                                                HeaderText="Previous Cost Location" ReadOnly="True" SortExpression="Previous_SC_Name"
                                                UniqueName="Previous_SC_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Site_Name" Display="True"
                                                FilterControlAltText="Filter Site_Name column"
                                                HeaderText="New Location" ReadOnly="True" SortExpression="Site_Name"
                                                UniqueName="Site_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SC_Name" Display="True"
                                                FilterControlAltText="Filter SC_Name column"
                                                HeaderText="New Cost Location" ReadOnly="True" SortExpression="SC_Name"
                                                UniqueName="SC_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_SMU" Display="False"
                                                FilterControlAltText="Filter AM_SMU column"
                                                HeaderText="SMU" ReadOnly="True" SortExpression="AM_SMU"
                                                UniqueName="AM_SMU">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_Status" Display="True"
                                                FilterControlAltText="Filter AM_Status column"
                                                HeaderText="Status" ReadOnly="True" SortExpression="AM_SMU"
                                                UniqueName="AM_Status">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AM_Created"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter AM_Created column" HeaderText="Date Created"
                                                ReadOnly="True" SortExpression="AM_Created" UniqueName="AM_Created">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td class="style5" style="text-align: left"></td>
                        </tr>
                    </table>
                    <asp:Label ID="lblPageName" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblRun" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                    <asp:Label ID="lbl_Test" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                    <asp:Label ID="lbl_Table" runat="server" ForeColor="White" Font-Size="1pt"></asp:Label>
                    <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_AM_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_From" runat="server" Value="1900-01-01" />
            <asp:HiddenField ID="HF_To" runat="server" Value="2100-01-01" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_2_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_2_RW" runat="server" Value="0" />
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
            <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS A_ID, '*All Asset Movements' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM ASSET INNER JOIN ASSET_MOVEMENT ON ASSET.A_ID = ASSET_MOVEMENT.AM_A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (ASSET_MOVEMENT.AM_Date &gt;= @AM_Date_From) AND (ASSET_MOVEMENT.AM_Date &lt;= @AM_Date_To) ORDER BY A_Asset_ID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadDP_From" Name="AM_Date_From" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="RadDP_To" Name="AM_Date_To" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ASSET_MOVEMENTS" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_MOVEMENTS_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadDP_From" DbType="Date" Name="AM_Date_From" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="RadDP_To" DbType="Date" Name="AM_Date_To" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ASSET_MOVEMENTS_REQUESTS" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_MOVEMENTS_REQUEST_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" IsSticky="True" Skin="Default">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements_Requests" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements_Requests" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements_Requests" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_From">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="HF_From" />
                             <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements_Requests" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_To">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Movements_Requests" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow1" runat="server" Height="650px" Width="950px" OnClientClose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="750px" Width="950px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
             <telerik:RadWindow ID="RadWindow3" runat="server" Height="600px" Width="500px" onclientclose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="New Asset Movement Request" VisibleStatusbar="False" KeepInScreenBounds="True">
</telerik:RadWindow>
        </div>
    </form>
</body>
</html>


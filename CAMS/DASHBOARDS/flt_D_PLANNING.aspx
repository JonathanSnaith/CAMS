<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - Component Changeout Planner" CodeFile="flt_D_PLANNING.aspx.vb" Inherits="DASHBOARDS_flt_D_PLANNING" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico"/> 
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

        .auto-style5 {
            width: 180px;
        }

        .auto-style9 {
            width: 230px;
        }

        .auto-style15 {
            width: 282px;
        }

        .auto-style17 {
            width: 78px;
        }

        .auto-style18 {
            width: 391px;
        }

        .auto-style19 {
            width: 90px;
        }

        .auto-style24 {
            width: 122px;
        }

        .auto-style26 {
            width: 108px;
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=7', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=7', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=7', '_self');
        }
    }
    function fn_job_triggers() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('../ADMIN/flt_ADMIN_TRIGGERS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
    }
    function fn_planning_calc() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('flt_D_PLANNING_CALC.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('STM_ID');
        document.getElementById('HF_STM_ID').value = ATTid;
        sessionStorage.setItem("STM_ID", ATTid);
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        //var THISSTM = document.getElementById('HF_STM_ID').value;
        var THISSTM = sessionStorage.getItem("STM_ID");
        var THISASSET = document.getElementById('lbl_Asset').innerHTML;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('../EVENT_MANAGEMENT/flt_EM_PLANNING_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&STM_ID=' + THISSTM + '&STM_A_ID=' + THISASSET + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function RowSelectedE(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('E_ID');
        document.getElementById('HF_E_ID').value = ATTid;
    }
    function fn_onrowdblclickE() {
        fn_OnClickWindowE();
    }
    function fn_OnClickWindowE() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISE = document.getElementById('HF_E_ID').value;
        var oWnd = $find("<%=RadWindow4.ClientID%>");
        oWnd.setUrl('../EVENT_MANAGEMENT/flt_EM_EVENTS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&E_ID=' + THISE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
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
    function closeWindow_add_event2(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow4.ClientID%>");
            oWnd.close();
        }
    }
    function fn_report() {
        var Model = document.getElementById('HF_MOD_ID').value
        var Asset = document.getElementById('HF_A_ID').value
        var Level3 = document.getElementById('HF_Level3').value
        var RepairCode = document.getElementById('HF_Repair_Code').value
        var DateFrom = document.getElementById('HF_From').value
        var DateTo = document.getElementById('HF_To').value
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ComponentChangeOutSMUMonitoring.rpt&@EstDateFrom=' + DateFrom + "&@EstDateTo=" + DateTo + "&@Model=" + Model + "&@Asset=" + Asset + "&@Level3=" + Level3 + "&@RepairCode=" + RepairCode, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=1100');

    }
     function closeWindow_asset(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Grid', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow_Asset.ClientID%>");
            oWnd.close();
        }
      }
    function asset_details(args) {
         var THISGUID = document.getElementById('lblGUID').innerHTML;
         var THISA = args
        var oWnd = $find("<%=RadWindow_Asset.ClientID%>");
        oWnd.setUrl('../ASSET_MANAGEMENT/flt_AM_ASSET_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&A_ID=' + THISA + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
</script>
<body>
    <form id="form1" runat="server" >
    <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;" >
        <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
            <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
            <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="Gray">
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

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">
                                    <div id="cont_38931451cfb4f5b8a7c0ed8446ebd8b5"><script type="text/javascript" async src="https://www.yourweather.co.uk/wid_loader/38931451cfb4f5b8a7c0ed8446ebd8b5"></script></div>
                                </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #E46C0A; text-align: left;" valign="middle">
                                  <div id="cont_3fe1c13214bab6685b24e548f5cb541c"><script type="text/javascript" async src="https://www.yourweather.co.uk/wid_loader/3fe1c13214bab6685b24e548f5cb541c"></script></div>
                            </td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 14px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style18" rowspan="2">
                                 <asp:Label ID="lblTitle" runat="server" Text="COMPONENT CHANGEOUT PLANNER" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style19" rowspan="2">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Default" Text="Reset" Width="60px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style17" rowspan="2">
                                Model:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style9" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Model" DataTextField="Model" DataValueField="A_MOD_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style19">
                                Asset:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style24">
                                 Component:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Level3" DataTextField="ATT_Name" DataValueField="ATT_ID_3" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default" Width="250px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style26">
                                Repair Code:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style15">
                                 <telerik:RadComboBox ID="RadCB_Repair_Code" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Repair_Code" DataTextField="ATT_Name" DataValueField="ATT_ID_RC" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="250px">
                                 </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="auto-style19" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">From: </td>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;">
                                <telerik:RadDatePicker ID="DateFrom" Runat="server" AutoPostBack="True" Skin="Default">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Silk" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                            <td align="left" class="auto-style24" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">To: </td>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;">
                                <telerik:RadDatePicker ID="DateTo" Runat="server" AutoPostBack="True" Skin="Default">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Silk" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                            <td align="left" class="auto-style26" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">Status: </td>
                            <td align="left" class="auto-style15" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Status" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Status" DataTextField="STM_Planning_Status_Text" DataValueField="STM_Planning_Status" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                    </table>
                                    <table style="padding-top: 20px">

                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_1" runat="server" onClick="fn_job_triggers()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" /
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="JOB TRIGGERS" ForeColor="Black"></asp:Label>
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
                                     <asp:Panel ID="Panel_2" runat="server" onClick="fn_report()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                     <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="PRINT" ForeColor="Black"></asp:Label>
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
                                    <asp:Panel ID="Panel_3" runat="server" onClick="fn_planning_calc()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                           <td class="metro_400x75_cell_content_top" colspan="2">
                                                      <img src="../IMAGES/Icons_Black/DASHBORAD_PLANNING.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="COMPONENT CHANGEOUT BUDGET CALCULATOR" ForeColor="Black" Font-Size="14px"></asp:Label>
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
                <table class="style8" >
                    <tr>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">Live Plans</td>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                            <asp:Label ID="lbl_Archive_Text" runat="server" Font-Bold="True" Text="Archive"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9" style="text-align: left; vertical-align: top;">
                            <telerik:RadGrid ID="RadGrid_PLANNING" runat="server" AllowAutomaticInserts="True"
                                AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_PLANNING" ResolvedRenderMode="Classic" Skin="Default">
                                <ClientSettings EnableAlternatingItems="False" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />
                                    <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                    <Resizing AllowResizeToFit="True" EnableRealTimeResize="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="STM_ID" DataKeyNames="STM_ID"
                                    DataSourceID="SqlDS_RadGrid_PLANNING" NoMasterRecordsText="No plans to display." PageSize="30">
                                    <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add new service" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="STM_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter STM_ID column" HeaderText="Trigger ID" ReadOnly="True"
                                            SortExpression="STM_ID" UniqueName="STM_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STM_A_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter STM_A_ID column" HeaderText="STM A ID" ReadOnly="True"
                                            SortExpression="STM_A_ID" UniqueName="STM_A_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Asset" Display="False" FilterControlAltText="Filter Asset column"
                                            HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Model" Display="False" FilterControlAltText="Filter Model column"
                                            HeaderText="Model" ReadOnly="True" SortExpression="Model" UniqueName="Model">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridTemplateColumn FilterControlAltText="Filter Asset_T column" HeaderText="Asset" UniqueName="Asset_T" SortExpression="Asset">
                                                        <ItemTemplate>
                                                            <table border="0" style="height: 100%; ">                                                      
                                                                <tr>                                                            
                                                                    <td >
                                                                        <telerik:RadLabel ID="RadLbl_Asset_ID_STM" runat="server" Text='<%# Bind("Asset") %>' 
                                                                            style="cursor: pointer; " Font-Underline="True"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
                                                <ItemStyle Wrap="False" Width="80px" />
                                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column"
                                            HeaderText="Component" ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                            <HeaderStyle Width="200px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Code_Level_3" FilterControlAltText="Filter STM_Code_Level_3 column" Display="False"
                                            HeaderText="Component" ReadOnly="True" SortExpression="STM_Code_Level_3" UniqueName="STM_Code_Level_3">
                                            <HeaderStyle Width="200px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Position" Display="True" FilterControlAltText="Filter Position column"
                                            HeaderText="Position" ReadOnly="True" SortExpression="Position"
                                            UniqueName="Position">
                                            <HeaderStyle Width="250px" Wrap="True" />
                                            <ItemStyle Width="250px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="RepairCode" Display="True" FilterControlAltText="Filter RepairCode column"
                                            HeaderText="Repair Code" ReadOnly="True" SortExpression="RepairCode"
                                            UniqueName="RepairCode">
                                            <HeaderStyle Width="250px" Wrap="True" />
                                            <ItemStyle Width="250px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Cost" FilterControlAltText="Filter STM_Cost column" DataFormatString="{0:£#,##0}"
                                            HeaderText="Cost" ReadOnly="True" SortExpression="STM_Cost" UniqueName="STM_Cost">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Trend" FilterControlAltText="Filter SER_Trend column"
                                            HeaderText="Trend" ReadOnly="True" SortExpression="SER_Trend" UniqueName="SER_Trend">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Trend_Override" FilterControlAltText="Filter SER_Trend_Override column" Display="False"
                                            HeaderText="Trend Override" ReadOnly="True" SortExpression="SER_Trend_Override" UniqueName="SER_Trend_Override">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Frequency" FilterControlAltText="Filter STM_Frequency column"
                                            HeaderText="Planned Component Hours" ReadOnly="True" SortExpression="STM_Frequency" UniqueName="STM_Frequency">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_SMU_Value" FilterControlAltText="Filter STM_SMU_Value column"
                                            HeaderText="Current Component Hours" ReadOnly="True" SortExpression="STM_SMU_Value" UniqueName="STM_SMU_Value">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Leadtime_Weeks" Display="False" FilterControlAltText="Filter STM_Leadtime_Weeks column"
                                            HeaderText="Leadtime (Wks)" ReadOnly="True" SortExpression="STM_Leadtime_Weeks"
                                            UniqueName="STM_Leadtime_Weeks">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ChangeDue" Display="True" FilterControlAltText="Filter ChangeDue column"
                                            HeaderText="Change Due (Hours)" ReadOnly="True" SortExpression="ChangeDue" UniqueName="ChangeDue">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Adjustment" Display="True" FilterControlAltText="Filter STM_Adjustment column"
                                            HeaderText="Current Adjustment" ReadOnly="True" SortExpression="STM_Adjustment" UniqueName="STM_Adjustment">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Tyre_MTD_Min" Display="False" FilterControlAltText="Filter STM_Tyre_MTD_Min column"
                                            HeaderText="Minimum Tread Depth" ReadOnly="True" SortExpression="STM_Tyre_MTD_Min" UniqueName="STM_Tyre_MTD_Min">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STM_Tyre_MTD_Current" Display="False" FilterControlAltText="Filter STM_Tyre_MTD_Current column"
                                            HeaderText="Current Tread Depth" ReadOnly="True" SortExpression="STM_Tyre_MTD_Current" UniqueName="STM_Tyre_MTD_Current">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Date_Estimate" DataFormatString="{0:dd MMM yyyy}"
                                            Display="True" FilterControlAltText="Filter STM_Date_Estimate column" HeaderText="Estimated Change Date"
                                            ReadOnly="True" SortExpression="STM_Date_Estimate" UniqueName="STM_Date_Estimate">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Current_Planned_Date" DataFormatString="{0:dd MMM yyyy}"
                                            Display="True" FilterControlAltText="Filter Current_Planned_Date column" HeaderText="Current Planned Date"
                                            ReadOnly="True" SortExpression="Current_Planned_Date" UniqueName="Current_Planned_Date">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Planning_Status" Display="False" FilterControlAltText="Filter STM_Planning_Status column"
                                            HeaderText="Status" ReadOnly="True" SortExpression="STM_Planning_Status" UniqueName="STM_Planning_Status">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid></td>
                        <td colspan="3" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; color: #000000;">
                            <telerik:RadGrid ID="RadGrid_Archive" runat="server" DataSourceID="SqlDS_RadGrid_Archive" ResolvedRenderMode="Classic" CellSpacing="-1" >
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <MasterTableView AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="STMA_ID" DataSourceID="SqlDS_RadGrid_Archive">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="STMA_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter STMA_ID column" HeaderText="STMA_ID" ReadOnly="True" SortExpression="STMA_ID" UniqueName="STMA_ID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="E_ID" DataNavigateUrlFormatString="../EVENT_MANAGEMENT/flt_EM_EVENTS_POP_UP.aspx?E_ID={0}" DataTextField="E_ID" FilterControlAltText="Filter E_ID column" HeaderButtonType="LinkButton" HeaderText="Event" Target="_blank" UniqueName="E_ID">
                                            <HeaderStyle HorizontalAlign="Center" Width="70px" Wrap="False" />
                                            <ItemStyle HorizontalAlign="Center" Width="70px" Wrap="False" />
                                        </telerik:GridHyperLinkColumn>
                                        <telerik:GridBoundColumn DataField="E_Date_Ended" DataFormatString="{0:dd MMM yyyy}" DataType="System.DateTime" FilterControlAltText="Filter E_Date_Ended column" HeaderText="Event Closed" SortExpression="E_Date_Ended" UniqueName="E_Date_Ended">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMA_A_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter STMA_A_ID column" HeaderText="STMA_A_ID" SortExpression="STMA_A_ID" UniqueName="STMA_A_ID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMA_Trigger" DataType="System.Int32" Display="False" FilterControlAltText="Filter STMA_Trigger column" HeaderText="Trigger" SortExpression="STMA_Trigger" UniqueName="STMA_Trigger">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMA_SMU_Value" DataType="System.Double" FilterControlAltText="Filter STMA_SMU_Value column" HeaderText="Hours Reached" SortExpression="STMA_SMU_Value" UniqueName="STMA_SMU_Value">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMA_Frequency" DataType="System.Double" FilterControlAltText="Filter STMA_Frequency column" HeaderText="Planned Component Hours" SortExpression="STMA_Frequency" UniqueName="STMA_Frequency">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMA_Frequency_Diff" DataType="System.Double" FilterControlAltText="Filter STMA_Frequency_Diff column" HeaderText="Difference (Hours)" SortExpression="STMA_Frequency_Diff" UniqueName="STMA_Frequency_Diff">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMA_Date_Estimate" DataFormatString="{0:dd MMM yyyy}" DataType="System.DateTime" FilterControlAltText="Filter STMA_Date_Estimate column" HeaderText="Estimated Change Date" SortExpression="STMA_Date_Estimate" UniqueName="STMA_Date_Estimate">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STMA_Life" DataType="System.Double" FilterControlAltText="Filter STMA_Life column" HeaderText="Life Reached (%)" SortExpression="STMA_Life" UniqueName="STMA_Life">
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STMA_Cost" FilterControlAltText="Filter STMA_Cost column" DataFormatString="{0:£#,##0}"
                                            HeaderText="Cost" ReadOnly="True" SortExpression="STMA_Cost" UniqueName="STMA_Cost">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STMA_Cost_Saving" FilterControlAltText="Filter STMA_Cost_Saving column" DataFormatString="{0:£#,##0}"
                                            HeaderText="Cost Saving/Loss" ReadOnly="True" SortExpression="STMA_Cost_Saving" UniqueName="STMA_Cost_Saving">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMA_Created" DataFormatString="{0:dd MMM yyyy}" DataType="System.DateTime" Display="False" FilterControlAltText="Filter STMA_Created column" HeaderText="Event Created Date" SortExpression="STMA_Created" UniqueName="STMA_Created">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid></td>
                    </tr>
                    <tr>
                        <td class="style6" colspan="3" style="text-align: left; vertical-align: top;">
                            <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lbl_Asset" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lbl_Site" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lbl_Test" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        </td>
                        <td class="style5" style="text-align: left;"></td>
                    </tr>
                </table>
            </telerik:RadPane>
        </telerik:RadSplitter>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
<asp:HiddenField ID="HF_Username" runat="server" />
<asp:HiddenField ID="HF_SessionIP" runat="server" />
<asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
<asp:HiddenField ID="HF_STM_ID" runat="server" />
<asp:HiddenField ID="HF_E_ID" runat="server" />
<asp:HiddenField ID="HF_Report" runat="server" Value="Estimated Changeout Report" />
<asp:HiddenField ID="HF_MOD_ID" runat="server" Value="%" />
<asp:HiddenField ID="HF_Level3" runat="server" Value="%" />
<asp:HiddenField ID="HF_Repair_Code" runat="server" Value="%" />
<asp:HiddenField ID="HF_From" runat="server" Value="1900-01-01" />
<asp:HiddenField ID="HF_To" runat="server" Value="2100-01-01" />
<asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
<asp:HiddenField ID="HF_Asset" runat="server" Value="Test" />
<asp:HiddenField ID="HF_A_ID" runat="server" Value="%" />
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
        <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM ASSET INNER JOIN SMU_TRIGGER_MONITORING ON SMU_TRIGGER_MONITORING.STM_A_ID = ASSET.A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (ASSET.A_Activity_Status &lt;&gt; 'Disposed') AND (CONVERT (nvarchar(5), ASSET.A_MOD_ID) LIKE @Model) AND (SMU_TRIGGER_MONITORING.STM_Planning_Status &lt;&gt; 'Trash') ORDER BY A_Asset_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Model" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS A_MOD_ID, '*All Models' AS Model UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ASSET.A_MOD_ID) AS A_MOD_ID, ATTRIBUTES.ATT_Name AS Model FROM ASSET INNER JOIN ATTRIBUTES ON ASSET.A_MOD_ID = ATTRIBUTES.ATT_ID INNER JOIN SMU_TRIGGER_MONITORING ON SMU_TRIGGER_MONITORING.STM_A_ID = ASSET.A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (ASSET.A_Activity_Status &lt;&gt; 'Disposed') ORDER BY Model">
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDS_Level3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS ATT_ID_3, '*All' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID_3, ATTRIBUTES.ATT_Name + ' : ' + ATTRIBUTES.ATT_Description AS ATT_Name FROM SMU_TRIGGER_MONITORING AS STM INNER JOIN ATTRIBUTES ON STM.STM_Code_Level_3 = ATTRIBUTES.ATT_ID WHERE (CONVERT (nvarchar(5), STM.STM_A_ID) LIKE @A_ID) AND (STM.STM_Planning_Status &lt;&gt; 'Trash') ORDER BY ATT_Name">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                        </SelectParameters>
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDS_Repair_Code" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS ATT_ID_RC, '*All' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID_RC, ATTRIBUTES.ATT_Name + ' : ' + ATTRIBUTES.ATT_Description AS ATT_Name FROM SMU_TRIGGER_MONITORING AS STM INNER JOIN ATTRIBUTES ON STM.STM_Repair_Code = ATTRIBUTES.ATT_ID WHERE (CONVERT (nvarchar(5), STM.STM_A_ID) LIKE @A_ID) AND (STM.STM_Planning_Status &lt;&gt; 'Trash') ORDER BY ATT_Name">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                        </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Status" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS STM_Planning_Status, '*All' AS STM_Planning_Status_Text UNION ALL SELECT DISTINCT STM.STM_Planning_Status, STM.STM_Planning_Status AS STM_Planning_Status_Text FROM SMU_TRIGGER_MONITORING AS STM INNER JOIN ATTRIBUTES ON STM.STM_Code_Level_3 = ATTRIBUTES.ATT_ID WHERE (CONVERT (nvarchar(5), STM.STM_A_ID) LIKE @A_ID) AND (CONVERT (nvarchar(5), STM.STM_Code_Level_3) LIKE @Level3) AND (CONVERT (nvarchar(5), STM.STM_Repair_Code) LIKE @RepairCode) AND (STM.STM_Planning_Status &lt;&gt; 'Trash') ORDER BY STM_Planning_Status_Text">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadCB_Repair_Code" Name="RepairCode" PropertyName="SelectedValue" />
                    </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_PLANNING" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_SELECT_SP" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
             <asp:ControlParameter ControlID="RadCB_Model" Name="A_MOD_ID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" />
                 <asp:ControlParameter ControlID="RadCB_Repair_Code" Name="RepairCode" PropertyName="SelectedValue" />
                 <asp:ControlParameter ControlID="RadCB_Status" Name="STM_Planning_Status" PropertyName="SelectedValue" Type="String" />
                 <asp:ControlParameter ControlID="DateFrom" DbType="Date" Name="DateFrom" PropertyName="SelectedDate" DefaultValue="1900-01-01" />
                 <asp:ControlParameter ControlID="DateTo" DbType="Date" Name="DateTo" PropertyName="SelectedDate" DefaultValue="2100-01-01" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_Archive" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT STMA.STMA_ID, STMA.STMA_Trigger, STMA.STMA_SMU_Value, STMA.STMA_Frequency, STMA.STMA_Frequency_Diff, STMA.STMA_Date_Estimate, STMA.STMA_Created, STMA.STMA_Created_By, STMA.STMA_STM_ID, EVENT.E_ID, CONVERT (date, EVENT.E_Date_Ended) AS E_Date_Ended, STMA.STMA_J_ID, JOB.J_STM_ID, STMA.STMA_Life, STMA.STMA_Cost, STMA.STMA_Cost_Saving FROM SMU_TRIGGER_MONITORING_ARCHIVE AS STMA INNER JOIN JOB ON STMA.STMA_J_ID = JOB.J_ID INNER JOIN EVENT ON JOB.J_E_ID = EVENT.E_ID WHERE (JOB.J_STM_ID LIKE @STM_ID) ORDER BY STMA.STMA_ID DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadGrid_PLANNING" Name="STM_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" Skin="Silk">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                          <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Level3"/>
                           <telerik:AjaxUpdatedControl ControlID="RadCB_Repair_Code"/>
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3"/>
                         <telerik:AjaxUpdatedControl ControlID="RadCB_Repair_Code"/>
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Archive_Text" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Level3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadCB_Repair_Code">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Repair_Code" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="DateFrom">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_From" />
                          <telerik:AjaxUpdatedControl ControlID="DateTo" />
                          <telerik:AjaxUpdatedControl ControlID="HF_To" />
                           <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
<%--                          <telerik:AjaxUpdatedControl ControlID="Radbtn_Export" />--%>
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="DateTo">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_To" />
                          <telerik:AjaxUpdatedControl ControlID="DateTo" />
                           <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
<%--                           <telerik:AjaxUpdatedControl ControlID="Radbtn_Export" />--%>
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadGrid_PLANNING">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="lbl_Archive_Text" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Repair_Code" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="DateFrom" />
                        <telerik:AjaxUpdatedControl ControlID="DateTo" />
                         <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                         <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                         <telerik:AjaxUpdatedControl ControlID="HF_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Repair_Code" />
                         <telerik:AjaxUpdatedControl ControlID="HF_From" />
                         <telerik:AjaxUpdatedControl ControlID="HF_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Archive_Text" />
                         <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive" />
<%--                        <telerik:AjaxUpdatedControl ControlID="Radbtn_Export" />--%>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadWindow ID="RadWindow2" runat="server" Height="800px" Width="1630px" onclientclose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
</telerik:RadWindow>
 <telerik:RadWindow ID="RadWindow4" runat="server" Height="580px" Width="670px" onclientclose="closeWindow_add_event2" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
</telerik:RadWindow>
          <telerik:RadWindow ID="RadWindow_Asset" runat="server" Height="700px" Width="1250px" OnClientClose="closeWindow_asset" Behaviors="Close, Move" Modal="True" Title="Asset" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
</div>
    </form>
</body>
</html>


<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Timesheets" CodeFile="flt_EM_FITTERS_TIMESHEETS.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_FITTERS_TIMESHEETS" %>
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
    function fn_home() {
        var THISGUID = document.getElementById('HF_GUID').value;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
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
    function RowSelectedft(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('FT_ID');
        document.getElementById('HF_FT_ID').value = ATTid;
        sessionStorage.setItem("FT_ID", ATTid);
        var ATTid2 = sender.get_selectedItems()[0].getDataKeyValue('FT_J_ID');
        document.getElementById('HF_J_ID').value = ATTid2;
        var ATTid3 = sender.get_selectedItems()[0].getDataKeyValue('E_ID');
        document.getElementById('HF_EventId').value = ATTid3;

    }
    function fn_onrowdblclickft(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('FT_ID');
        sessionStorage.setItem("FT_ID", ATTid);
        fn_OnClickWindowft();
    }
    function fn_OnClickButtonft(sender, eventArgs) {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISE = document.getElementById('HF_EventId').value;
        var THISFTSess = 0;
        var oWnd = $find("<%=RadWindow6.ClientID%>");
        oWnd.setUrl('flt_EM_FT_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&FT_ID=' + THISFTSess + '&E_ID=' + THISE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickWindowft() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISE = document.getElementById('HF_EventId').value;
        var THISFTSess = sessionStorage.getItem("FT_ID");
        var oWnd = $find("<%=RadWindow6.ClientID%>");
        oWnd.setUrl('flt_EM_FT_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&FT_ID=' + THISFTSess + '&E_ID=' + THISE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function closeWindow_add_eventftBlank(sender, args) {
        var x = args.get_argument();
        { __doPostBack('Refresh_Grid_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow6.ClientID%>");
            oWnd.close();
        }
    }
    function fn_OpenFittersTimeSheet() {
        var SiteId = document.getElementById('lbl_Site').innerHTML;
        var PER_EMP_ID = document.getElementById('HF_Engineer').value;
        var FT_Status = document.getElementById('RadCB_Status').value;
        var E_ID = document.getElementById('HF_EventId').value;
        var EXT_ID = document.getElementById('HF_External').value;

        if (PER_EMP_ID == "0") {
            PER_EMP_ID = "%"
        }

        if (PER_EMP_ID == "*All Engineers") {
            PER_EMP_ID = "%"
        }
        if (FT_Status == "*All Status") {
            FT_Status = "%"
        }
        if (E_ID == "0") {
            E_ID = "%"
        }
        if (EXT_ID == "") {
            EXT_ID = "%"
        }

        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/FittersTimeSheet.rpt&@SITE_ID=' + SiteId + "&@PER_EMP_ID=" + PER_EMP_ID + "&@FT_Status=" + FT_Status + "&@E_ID=" + E_ID + "&@Ext_ID=" + EXT_ID, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
    }
    function fn_OpenJobCard() {
        var E_ID = document.getElementById('RadTxt_Number').value;
        var EventId = document.getElementById('HF_EventId').value;
        var JobId = document.getElementById('HF_J_ID').value;
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/JobCard2.rpt&@Event_ID=' + EventId + "&@Job_ID=" + JobId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style27">
                                <asp:Label ID="lblTitle" runat="server" Text="TIMESHEETS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Glow" Text="Refresh" Width="100px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="100px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Status" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="FT_Status_Text" DataValueField="FT_Status" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadNumericTextBox ID="RadTxt_Number" runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" EmptyMessage="Event ID" LabelWidth="48px" MaxValue="9999999999" MinValue="0" ResolvedRenderMode="Classic" Skin="Glow" Width="120px">
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadNumericTextBox ID="RadTxt_JobNumber" runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" EmptyMessage="Job ID" LabelWidth="48px" MaxValue="9999999999" MinValue="0" ResolvedRenderMode="Classic" Skin="Glow" Width="120px">
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
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_1" runat="server" onClick="fn_OpenFittersTimeSheet()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                            <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="PRINT TIMESHEET" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_2" runat="server" onClick="fn_OpenJobCard()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                            <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="PRINT JOB" ForeColor="Black"></asp:Label>
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
                                            <asp:Panel ID="Panel_3" runat="server" onClick="fn_panel_3()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                            <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="" ForeColor="Black"></asp:Label>
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
                    <table class="style1">
                        <tr>
                            <td style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Active_FT" runat="server" AllowAutomaticInserts="True"
                                    AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" 
                                    ResolvedRenderMode="Classic" Width="1600px" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclickft" OnRowSelected="RowSelectedft" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="FT_ID, FT_J_ID, E_ID"
                                        DataKeyNames="FT_ID, FT_J_ID, E_ID" NoMasterRecordsText="No timesheets to display."
                                        PageSize="15" Name="Timesheets">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new timesheet" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="FT_ID" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter FT_ID column" HeaderText="Timesheet ID" ReadOnly="True"
                                                SortExpression="FT_ID" UniqueName="FT_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
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
                                                            <table border="0" style="height: 100%; ">                                                      
                                                                <tr>                                                            
                                                                    <td >
                                                                        <telerik:RadLabel ID="RadLbl_Customer_ID_Event" runat="server" Text='<%# Bind("Customer") %>' 
                                                                            style="cursor: pointer; " Font-Underline="True" ForeColor="White"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
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
                                                            <table border="0" style="height: 100%; ">                                                      
                                                                <tr>                                                            
                                                                    <td >
                                                                        <telerik:RadLabel ID="RadLbl_Asset_ID_Event" runat="server" Text='<%# Bind("Asset") %>' 
                                                                            style="cursor: pointer; " Font-Underline="True" ForeColor="White"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
                                                <ItemStyle Wrap="False" Width="80px" />
                                                        </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Site_Name" Display="True" FilterControlAltText="Filter Site_Name column"
                                                HeaderText="Site" ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_ID" DataType="System.Int32" FilterControlAltText="Filter E_ID column"
                                                HeaderText="Event ID" ReadOnly="True" SortExpression="E_ID" UniqueName="E_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EventType" FilterControlAltText="Filter EventType column"
                                                HeaderText="Event Type" ReadOnly="True" SortExpression="EventType" UniqueName="EventType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_J_ID" DataType="System.Int32" FilterControlAltText="Filter FT_J_ID column"
                                                HeaderText="Job ID" ReadOnly="True" SortExpression="FT_J_ID" UniqueName="FT_J_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="JobType" FilterControlAltText="Filter JobType column"
                                                HeaderText="Job Type" ReadOnly="True" SortExpression="JobType" UniqueName="JobType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column" Display="True"
                                                HeaderText="Component" ReadOnly="True" SortExpression="Level3"
                                                UniqueName="Level3">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Engineer" Display="True" FilterControlAltText="Filter Engineer column"
                                                HeaderText="Engineer" ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                                <HeaderStyle Width="120px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Estimated_Time" FilterControlAltText="Filter J_Estimated_Time column"
                                                     Display="True"  HeaderText="Job Est. Hrs" ReadOnly="True" SortExpression="J_Estimated_Time" UniqueName="J_Estimated_Time">
                                                        <HeaderStyle Width="70px" Wrap="True" />
                                                        <ItemStyle Width="70px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="FTD_Peak_Calc" FilterControlAltText="Filter FTD_Peak_Calc column"
                                                HeaderText="Peak Hrs" ReadOnly="True" SortExpression="FTD_Peak_Calc" UniqueName="FTD_Peak_Calc">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="FTD_Off_Peak_Calc" FilterControlAltText="Filter FTD_Off_Peak_Calc column"
                                                HeaderText="Off-Peak Hrs" ReadOnly="True" SortExpression="FTD_Off_Peak_Calc" UniqueName="FTD_Off_Peak_Calc">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="FTD_Total_Hours" FilterControlAltText="Filter FTD_Total_Hours column"
                                                HeaderText="Engineer Hrs" ReadOnly="True" SortExpression="FTD_Total_Hours" UniqueName="FTD_Total_Hours">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_FTD_Total_Hours" FilterControlAltText="Filter J_FTD_Total_Hours column"
                                                HeaderText="Job Total Hrs" ReadOnly="True" SortExpression="J_FTD_Total_Hours" UniqueName="J_FTD_Total_Hours">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Time_Diff" FilterControlAltText="Filter J_Time_Diff column"
                                                        HeaderText="Time Diff." ReadOnly="True" SortExpression="J_Time_Diff" UniqueName="J_Time_Diff">
                                                        <HeaderStyle Width="70px" Wrap="True" />
                                                        <ItemStyle Width="70px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Time_Diff_Minutes" FilterControlAltText="Filter J_Time_Diff_Minutes column"
                                                    Display="False"    HeaderText="Time Diff. (Mins)" ReadOnly="True" SortExpression="J_Time_Diff_Minutes" UniqueName="J_Time_Diff_Minutes">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="FTD_Engineer_Rate" DataFormatString="{0:£#,##0.00}"
                                                Display="True" FilterControlAltText="Filter FTD_Engineer_Rate column" HeaderText="Engineer Cost"
                                                ReadOnly="True" SortExpression="FTD_Engineer_Rate" UniqueName="FTD_Engineer_Rate">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Instruction" FilterControlAltText="Filter J_Instruction column"
                                                HeaderText="Job Instruction" ReadOnly="True" SortExpression="J_Instruction" UniqueName="J_Instruction">
                                                <HeaderStyle Width="300px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Notes" Display="False" FilterControlAltText="Filter FT_Notes column"
                                                HeaderText="Notes" ReadOnly="True" SortExpression="FT_Notes" UniqueName="FT_Notes">
                                                <HeaderStyle Width="400px" Wrap="False" />
                                                <ItemStyle Width="400px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Status" FilterControlAltText="Filter FT_Status column"
                                                HeaderText="Status" ReadOnly="True" SortExpression="FT_Status" UniqueName="FT_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Status" FilterControlAltText="Filter J_Status column" Display="False"
                                                HeaderText="Job Status" ReadOnly="True" SortExpression="J_Status" UniqueName="J_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Created" DataFormatString="{0:dd MMM yyyy}"
                                                Display="False" FilterControlAltText="Filter FT_Created column" HeaderText="Date Created"
                                                ReadOnly="True" SortExpression="FT_Created" UniqueName="FT_Created">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Created_By" Display="False" FilterControlAltText="Filter FT_Created_By column"
                                                HeaderText="Created By" ReadOnly="True" SortExpression="FT_Created_By" UniqueName="FT_Created_By">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Modified" DataFormatString="{0:dd MMM yyyy}" Display="False"
                                                FilterControlAltText="Filter FT_Modified column" HeaderText="Date Modified" ReadOnly="True"
                                                SortExpression="FT_Modified" UniqueName="FT_Modified">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Modified_By" FilterControlAltText="Filter FT_Modified_By column" Display="False"
                                                HeaderText="Modified By" ReadOnly="True" SortExpression="FT_Modified_By" UniqueName="FT_Modified_By">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td style="text-align: left; vertical-align: top;" colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left; vertical-align: top;" class="style6">
                            </td>
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
            <asp:HiddenField ID="HF_FT_ID" runat="server" />
            <asp:HiddenField ID="HF_J_ID" runat="server" />
            <asp:HiddenField ID="HF_J_E_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Site" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_EventId" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Engineer" runat="server" Value="0" />
            <asp:HiddenField ID="HF_External" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
            <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS SITE_ID, '*All Sites' AS SITE_Name UNION ALL SELECT CONVERT (nvarchar(5), SITE_ID) AS SITE_ID, SITE_Name FROM SITE WHERE (SITE_Input = 1) ORDER BY SITE_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Engineer" runat="server"
                ConnectionString="<%$ ConnectionStrings:ICT_CENTRALConnectionString %>"
                SelectCommand="SELECT '%' AS PER_EMP_ID, '*All Engineers' AS PER_Fullname UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ict_PEOPLE_LIST.PER_EMP_ID) AS PER_EMP_ID, ict_PEOPLE_LIST.PER_Fullname FROM ict_PEOPLE_LIST LEFT OUTER JOIN FLEET.dbo.JOB ON FLEET.dbo.JOB.J_Engineer_ID = ict_PEOPLE_LIST.PER_EMP_ID LEFT OUTER JOIN FLEET.dbo.FITTER_TIMESHEET ON FLEET.dbo.FITTER_TIMESHEET.FT_J_ID = FLEET.dbo.JOB.J_ID LEFT OUTER JOIN FLEET.dbo.EVENT ON FLEET.dbo.EVENT.E_ID = FLEET.dbo.JOB.J_E_ID WHERE (ict_PEOPLE_LIST.PER_Status = 'Current') AND (ict_PEOPLE_LIST.PER_Location_ID IN (2, 8, 9, 10)) AND (ict_PEOPLE_LIST.PER_EMP_ID &lt; 1000000) AND (CONVERT (nvarchar(5), FLEET.dbo.EVENT.E_SITE_ID) LIKE @SITE) OR (ict_PEOPLE_LIST.PER_Status = 'Leaver') AND (ict_PEOPLE_LIST.PER_Location_ID IN (2, 8, 9, 10)) AND (ict_PEOPLE_LIST.PER_EMP_ID &lt; 1000000) AND (CONVERT (nvarchar(5), FLEET.dbo.EVENT.E_SITE_ID) LIKE @SITE) AND (ict_PEOPLE_LIST.PER_Ending_Date &gt;= DATEADD(YEAR, - 1, GETDATE())) UNION SELECT DISTINCT CONVERT (nvarchar(5), ict_PEOPLE_LIST_1.PER_EMP_ID) AS PER_EMP_ID, ict_PEOPLE_LIST_1.PER_Fullname FROM ict_PEOPLE_LIST AS ict_PEOPLE_LIST_1 LEFT OUTER JOIN FLEET.dbo.FITTER_TIMESHEET_Detail ON FLEET.dbo.FITTER_TIMESHEET_Detail.FTD_Engineer_ID = ict_PEOPLE_LIST_1.PER_EMP_ID LEFT OUTER JOIN FLEET.dbo.FITTER_TIMESHEET AS FITTER_TIMESHEET_1 ON FITTER_TIMESHEET_1.FT_J_ID = FLEET.dbo.FITTER_TIMESHEET_Detail.FTD_J_ID LEFT OUTER JOIN FLEET.dbo.JOB AS JOB_1 ON FITTER_TIMESHEET_1.FT_J_ID = JOB_1.J_ID LEFT OUTER JOIN FLEET.dbo.EVENT AS EVENT_1 ON EVENT_1.E_ID = JOB_1.J_E_ID WHERE (ict_PEOPLE_LIST_1.PER_Status = 'Current') AND (ict_PEOPLE_LIST_1.PER_Location_ID IN (2, 8, 9, 10)) AND (ict_PEOPLE_LIST_1.PER_EMP_ID &lt; 1000000) AND (CONVERT (nvarchar(5), EVENT_1.E_SITE_ID) LIKE @SITE) OR (ict_PEOPLE_LIST_1.PER_Status = 'Leaver') AND (ict_PEOPLE_LIST_1.PER_Location_ID IN (2, 8, 9, 10)) AND (ict_PEOPLE_LIST_1.PER_EMP_ID &lt; 1000000) AND (CONVERT (nvarchar(5), EVENT_1.E_SITE_ID) LIKE @SITE) AND (ict_PEOPLE_LIST_1.PER_Ending_Date &gt;= DATEADD(YEAR, - 1, GETDATE())) ORDER BY PER_Fullname">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="SITE" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Status" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS FT_Status, '*All Status' AS FT_Status_Text UNION ALL SELECT DISTINCT FITTER_TIMESHEET.FT_Status, FITTER_TIMESHEET.FT_Status AS FT_Status_Text FROM FITTER_TIMESHEET LEFT OUTER JOIN JOB ON FITTER_TIMESHEET.FT_J_ID = JOB.J_ID LEFT OUTER JOIN EVENT ON JOB.J_E_ID = EVENT.E_ID WHERE (FITTER_TIMESHEET.FT_Status NOT IN ('*', 'Trash', 'Delete'))">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ALL_FT" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_ALL_FT_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="SITE_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Engineer" Name="PER_EMP_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Status" Name="FT_Status" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadTxt_Number" Name="E_ID" PropertyName="Text" Type="String" DefaultValue="%" />
                    <asp:ControlParameter ControlID="RadTxt_JobNumber" Name="J_ID" PropertyName="Text" Type="String" DefaultValue="%" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Sunset">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_JobNumber" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_JobNumber" />
                           <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                           <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_JobNumber" />
                           <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_JobNumber" />
                           <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_JobNumber" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_JobNumber" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTxt_Number">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                            <telerik:AjaxUpdatedControl ControlID="HF_PageJob" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTxt_JobNumber">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                            <telerik:AjaxUpdatedControl ControlID="HF_PageJob" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow6" runat="server" Height="750px" Width="1000px" OnClientClose="closeWindow_add_eventftBlank" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow_Asset" runat="server" Height="700px" Width="1350px" OnClientClose="closeWindow_asset" Behaviors="Close, Move" Modal="True" Title="Asset" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow_Customer" runat="server" Height="700px" Width="900px" OnClientClose="closeWindow_customer" Behaviors="Close, Move" Modal="True" Title="Customer" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>

        </div>
    </form>
</body>
</html>


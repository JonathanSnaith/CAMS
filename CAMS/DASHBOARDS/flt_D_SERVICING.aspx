<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - Servicing" CodeFile="flt_D_SERVICING.aspx.vb" Inherits="DASHBOARD_flt_D_SERVICING" %>
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
        .auto-style29 {
            width: 715px;
        }
        .auto-style30 {
            width: 271px;
        }
        .auto-style31 {
            cursor: pointer;
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=9', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=9', '_self');
        }
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('SER_ID');
        document.getElementById('HF_SER_ID').value = ATTid;
        sessionStorage.setItem("SER_ID", ATTid);
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISSITE = document.getElementById('lbl_Site').innerHTML;
        var oWndadd = $find("<%=RadWindow1.ClientID%>");
        oWndadd.setUrl('../EVENT_MANAGEMENT/flt_EM_SER_ADD_RW.aspx?FLT_GUID=' + THISGUID + '&SITE=' + THISSITE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
    }
    function fn_OnClickButtonArc() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISSITE = document.getElementById('lbl_Site').innerHTML;
        var oWndadd = $find("<%=RadWindow3.ClientID%>");
        oWndadd.setUrl('../EVENT_MANAGEMENT/flt_EM_SER_ARC_ADD_RW.aspx?FLT_GUID=' + THISGUID + '&SITE=' + THISSITE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISSER = sessionStorage.getItem("SER_ID");
        //var THISSER = document.getElementById('HF_SER_ID').value;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('../EVENT_MANAGEMENT/flt_EM_SER_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&SER_ID=' + THISSER + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickButtonArcEdit() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISSERA = document.getElementById('HF_SERA_ID').value;
        var oWndadd = $find("<%=RadWindow3.ClientID%>");
        oWndadd.setUrl('../EVENT_MANAGEMENT/flt_EM_SER_ARC_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&SERA_ID=' + THISSERA + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
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
    function closeWindow_add_event_arc_new_item(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWndadd = $find("<%=RadWindow3.ClientID%>");
            oWndadd.close();
        }
    }
    function closeWindow_add_event_arc_edit_item(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWndadd = $find("<%=RadWindow4.ClientID%>");
            oWndadd.close();
        }
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
    function fn_OpenServiceAndOilSampleMonitor() {
        var SiteId = document.getElementById('lbl_Site').innerHTML;
        var OK = 1;
        if (SiteId == "%" && OK == 1) {
            alert('Please select a Site')
            OK = 0;
        }
        if (OK == 1) {
            var url = 'http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ServiceAndOilSampleMonitor2.rpt&@SiteId=' + SiteId
            window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ServiceAndOilSampleMonitor2.rpt&@SiteId=' + SiteId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
        }
    }
    function fn_OpenServiceSMU() {
        var SiteId = document.getElementById('lbl_Site').innerHTML;
        var OK = 1;
        if (SiteId == "0" && OK == 1) {
            alert('Please select a Site')
            OK = 0;
        }
        if (OK == 1) {
            var url = 'http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ServicingSMU.rpt&@SiteId=' + SiteId
            window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ServicingSMU.rpt&@SiteId=' + SiteId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
        }
    }
    function fn_OpenServiceCal() {
        var SiteId = document.getElementById('lbl_Site').innerHTML;
            var url = 'http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ServicingCal.rpt&@SiteId=' + SiteId
            window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ServicingCal.rpt&@SiteId=' + SiteId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
    }
    function fn_1() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISSITE = document.getElementById('lbl_Site').innerHTML;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/HOME/view_SERVICE_ADHERENCE.aspx?FLT_GUID=' + THISGUID + '&Site=' + THISSITE, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
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
            <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False">
            </telerik:RadSplitBar>
            <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                 <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style29">
                                 <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>

                            </td>
                             <td style="color: White; font-family: 'Segoe UI'; font-size: 14px; background-color: #ff661c; padding-right: 15px; text-align: left;" align="center" class="auto-style30">
                                  <asp:Table ID="Table101" runat="server" CellSpacing="0" Height="75px" Visible="False" Width="350px" BorderStyle="Dashed" BorderWidth="2px" BorderColor="White" CssClass="auto-style31">
                                    <asp:TableRow ID="TableRow1" runat="server">
                                        <asp:TableCell ID="ID_1_A" runat="server" BackColor="#ff661c" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr >
                                                       <td colspan="4" align="center">
                                                           Service Adherence (+25hr Overdue)
                                                       </td>
                                                        </tr>
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="lblCount_1" runat="server" Text="0" Font-Size="20pt" ForeColor="White" ToolTip=""></asp:Label>
                                                            <%--<asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />--%>
                                                        </td>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="Label1" runat="server" Text="average hours overdue" ForeColor="White" Font-Size="10"></asp:Label>
                                                           
                                                        </td>
                                    
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="lblCount_2" runat="server" Text="0" Font-Size="20pt" ForeColor="White" ToolTip=""></asp:Label>
                                                            <%--<asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />--%>
                                                        </td>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="Label2" runat="server" Text="overdue smu services" ForeColor="White" Font-Size="10"></asp:Label>
                                                           
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                             </td>
                             <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                 
                                </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: left;" valign="middle">
                              
                            </td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr >
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style27">
                                 <asp:Label ID="lblTitle" runat="server" Text="SERVICING" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Glow" Text="Refresh" Width="60px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">Site: </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Site" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">Status: </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Status" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Status" DataTextField="ATT_Flag" DataValueField="Flag_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">Asset: </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Asset_SMU" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Asset_SMU" DataTextField="A_ASSET_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="160px">
                                </telerik:RadComboBox>
                                <telerik:RadComboBox ID="RadCB_Asset_CAL" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Asset_CAL" DataTextField="A_ASSET_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="160px">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                    </table>
                 <table style="padding-top: 20px">
                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px" >
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_1" runat="server" onClick="fn_OnClickButton()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/EVENT_SERVICE.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW SERVICE" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px" >
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                     <asp:Panel ID="Panel_2" runat="server" onClick="fn_OpenServiceSMU()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                               <td class="metro_400x75_cell_content_top" colspan="2" >
                                                     <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="EXPORT SMU SERVICING" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px" >
                                    <asp:TableRow ID="TableRow45" runat="server">
                                        <asp:TableCell ID="ID_CELL_3" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_3" runat="server" onClick="fn_OpenServiceAndOilSampleMonitor()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                            <td class="metro_400x75_cell_content_top" colspan="2" >
                                                     <img src="../IMAGES/Icons_Black/metro_scales_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="SERVICE & OIL SAMPLE REPORT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T4" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow36" runat="server">
                                        <asp:TableCell ID="ID_CELL_4" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_4" runat="server" onClick="fn_OpenServiceCal()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                      <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label36" runat="server" Text="EXPORT CALENDAR SERVICING" ForeColor="Black"></asp:Label>
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
                        <td colspan="18" style="text-align: left; vertical-align: top;">
                            <telerik:RadGrid ID="RadGrid_Active_SER" runat="server" AllowAutomaticInserts="True"
                                AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_ALL_SER" ResolvedRenderMode="Classic" Width="1000px" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="False">
                                    <Selecting AllowRowSelect="True" />
                                    <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true">
                                </ExportSettings>
                                <MasterTableView UseAllDataFields="true" AutoGenerateColumns="False" ClientDataKeyNames="SER_ID"
                                    DataKeyNames="SER_ID" DataSourceID="SqlDS_RadGrid_SP_ALL_SER" NoMasterRecordsText="No services to display." PageSize="15">
                                    <RowIndicatorColumn Visible="False">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True">
                                    </ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add new service" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="SER_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter SER_ID column" HeaderText="Servicing ID" ReadOnly="True"
                                            SortExpression="SER_ID" UniqueName="SER_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="SER_A_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter SER_A_ID column" HeaderText="SER A ID" ReadOnly="True"
                                            SortExpression="SER_A_ID" UniqueName="SER_A_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn FilterControlAltText="Filter Asset_TemplateColumn column" HeaderText="Asset" UniqueName="Asset_TemplateColumn" SortExpression="Asset">
                                                        <ItemTemplate>
                                                            <table border="0" style="height: 100%; ">                                                      
                                                                <tr>                                                            
                                                                    <td >
                                                                        <telerik:RadLabel ID="RadLbl_Asset_ID" runat="server" Text='<%# Bind("Asset") %>' 
                                                                            style="cursor: pointer; " Font-Underline="True"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
                                                <ItemStyle Wrap="False" Width="80px" />
                                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="SER_External" FilterControlAltText="Filter SER_External column"
                                            HeaderText="External" ReadOnly="True" SortExpression="SER_External" UniqueName="SER_External">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Site_Name" Display="False" FilterControlAltText="Filter Site_Name column"
                                            HeaderText="Site" ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_SMU_Counter" FilterControlAltText="Filter SER_SMU_Counter column"
                                            HeaderText="SMU Counter" ReadOnly="True" SortExpression="SER_SMU_Counter" UniqueName="SER_SMU_Counter">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_SMU_Left" FilterControlAltText="Filter SER_SMU_Left column"
                                            HeaderText="SMU Left" ReadOnly="True" SortExpression="SER_SMU_Left" UniqueName="SER_SMU_Left">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Cycle" FilterControlAltText="Filter SER_Cycle column"
                                            HeaderText="Cycle" ReadOnly="True" SortExpression="SER_Cycle" UniqueName="SER_Cycle">
                                            <HeaderStyle Width="50px" Wrap="False" />
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
                                        <telerik:GridBoundColumn DataField="SER_Trigger" FilterControlAltText="Filter SER_Trigger column"
                                            HeaderText="Trigger" ReadOnly="True" SortExpression="SER_Trigger" UniqueName="SER_Trigger">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Sample" Display="False" FilterControlAltText="Filter SER_Sample column"
                                            HeaderText="Sample Rqd" ReadOnly="True" SortExpression="SER_Sample" UniqueName="SER_Sample">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Oil_Weeks" FilterControlAltText="Filter SER_Oil_Weeks column"
                                            HeaderText="Oil Wks" ReadOnly="True" SortExpression="SER_Oil_Weeks" UniqueName="SER_Oil_Weeks">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Service_Weeks" FilterControlAltText="Filter SER_Service_Weeks column"
                                            HeaderText="Service Wks" ReadOnly="True" SortExpression="SER_Service_Weeks" UniqueName="SER_Service_Weeks">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ServiceType" FilterControlAltText="Filter ServiceType column"
                                            HeaderText="Nxt Svc" ReadOnly="True" SortExpression="ServiceType" UniqueName="ServiceType">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Event_Status" FilterControlAltText="Filter SER_Event_Status column"
                                            HeaderText="Status" ReadOnly="True" SortExpression="SER_Event_Status" UniqueName="SER_Event_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Status_Flag" Display="False" FilterControlAltText="Filter SER_Status_Flag column"
                                            HeaderText="Status Flag" ReadOnly="True" SortExpression="SER_Status_Flag" UniqueName="SER_Status_Flag">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Notes" Display="False" FilterControlAltText="Filter SER_Notes column"
                                            HeaderText="Notes" ReadOnly="True" SortExpression="SER_Notes" UniqueName="SER_Notes">
                                            <HeaderStyle Width="400px" Wrap="False" />
                                            <ItemStyle Width="400px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Confirm" Display="False" FilterControlAltText="Filter SER_Confirm column"
                                            HeaderText="Confirm" ReadOnly="True" SortExpression="SER_Confirm" UniqueName="SER_Confirm">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Created" DataFormatString="{0:dd MMM yyyy}"
                                            Display="False" FilterControlAltText="Filter SER_Created column" HeaderText="Date Created"
                                            ReadOnly="True" SortExpression="SER_Created" UniqueName="SER_Created">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Created_By" Display="False" FilterControlAltText="Filter SER_Created_By column"
                                            HeaderText="Created By" ReadOnly="True" SortExpression="SER_Created_By" UniqueName="SER_Created_By">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Modified" Display="False" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_Modified column" HeaderText="Date Modified"
                                            ReadOnly="True" SortExpression="SER_Modified" UniqueName="SER_Modified">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Modified_By" Display="False" FilterControlAltText="Filter SER_Modified_By column"
                                            HeaderText="Modified By" ReadOnly="True" SortExpression="SER_Modified_By" UniqueName="SER_Modified_By">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                        </EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView></telerik:RadGrid>
                        </td>
                        <td style="text-align: left; vertical-align: top;">
                            <telerik:RadGrid ID="RadGrid_Cal_SER" runat="server" AllowAutomaticInserts="True"
                                AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_CAL_SER" ResolvedRenderMode="Classic" Width="600px" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Selecting AllowRowSelect="True" />
                                    <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                 <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true">
                                </ExportSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="SER_ID" DataKeyNames="SER_ID"
                                    DataSourceID="SqlDS_RadGrid_SP_CAL_SER" NoMasterRecordsText="No services to display." PageSize="15">
                                    <RowIndicatorColumn Visible="False">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True">
                                    </ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add new service" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="SER_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter SER_ID column" HeaderText="Servicing ID" ReadOnly="True"
                                            SortExpression="SER_ID" UniqueName="SER_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="SER_A_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter SER_A_ID column" HeaderText="SER A ID" ReadOnly="True"
                                            SortExpression="SER_A_ID" UniqueName="SER_A_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn FilterControlAltText="Filter Asset_TemplateColumn column" HeaderText="Asset" UniqueName="Asset_TemplateColumn" SortExpression="Asset">
                                                        <ItemTemplate>
                                                            <table border="0" style="height: 100%; ">                                                      
                                                                <tr>                                                            
                                                                    <td >
                                                                        <telerik:RadLabel ID="RadLbl_Asset_ID_Cal" runat="server" Text='<%# Bind("Asset") %>' 
                                                                            style="cursor: pointer; " Font-Underline="True"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
                                                <ItemStyle Wrap="False" Width="80px" />
                                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="SER_Event_Status" Display="False" FilterControlAltText="Filter SER_Event_Status column"
                                            HeaderText="Status" ReadOnly="True" SortExpression="SER_Event_Status" UniqueName="SER_Event_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Cal_Event_Status" Display="False" FilterControlAltText="Filter SER_Cal_Event_Status column"
                                            HeaderText="Cal Status" ReadOnly="True" SortExpression="SER_Cal_Event_Status"
                                            UniqueName="SER_Cal_Event_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Fire_Event_Status" Display="False" FilterControlAltText="Filter SER_Fire_Event_Status column"
                                            HeaderText="Fire Status" ReadOnly="True" SortExpression="SER_Fire_Event_Status"
                                            UniqueName="SER_Fire_Event_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Exam_Event_Status" Display="False" FilterControlAltText="Filter SER_Exam_Event_Status column"
                                            HeaderText="Exam Status" ReadOnly="True" SortExpression="SER_Exam_Event_Status"
                                            UniqueName="SER_Exam_Event_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Status_Flag" Display="False" FilterControlAltText="Filter SER_Status_Flag column"
                                            HeaderText="Status Flag" ReadOnly="True" SortExpression="SER_Status_Flag" UniqueName="SER_Status_Flag">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Cal_Date_Due" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_Cal_Date_Due column" HeaderText="Cal Date Due"
                                            ReadOnly="True" SortExpression="SER_Cal_Date_Due" UniqueName="SER_Cal_Date_Due">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Cal_Event_Type" FilterControlAltText="Filter SER_Cal_Event_Type column"
                                            HeaderText="Cal Event Type" ReadOnly="True" SortExpression="SER_Cal_Event_Type"
                                            UniqueName="SER_Cal_Event_Type">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Fire" FilterControlAltText="Filter SER_Fire column"
                                            HeaderText="Fire" ReadOnly="True" SortExpression="SER_Fire" UniqueName="SER_Fire">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Fire_Cycle" Display="False" FilterControlAltText="Filter SER_Fire_Cycle column"
                                            HeaderText="Fire Cycle" ReadOnly="True" SortExpression="SER_Fire_Cycle" UniqueName="SER_Fire_Cycle">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Fire_Date" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_Fire_Date column" HeaderText="Fire Date" ReadOnly="True"
                                            SortExpression="SER_Fire_Date" UniqueName="SER_Fire_Date">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Exam" FilterControlAltText="Filter SER_Exam column"
                                            HeaderText="TE" ReadOnly="True" SortExpression="SER_Exam" UniqueName="SER_Exam">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Exam_Cycle" Display="False" FilterControlAltText="Filter SER_Exam_Cycle column"
                                            HeaderText="TE Cycle" ReadOnly="True" SortExpression="SER_Exam_Cycle" UniqueName="SER_Exam_Cycle">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Exam_Date" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_Exam_Date column" HeaderText="TE Date" ReadOnly="True"
                                            SortExpression="SER_Exam_Date" UniqueName="SER_Exam_Date">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Created" DataFormatString="{0:dd MMM yyyy}"
                                            Display="False" FilterControlAltText="Filter SER_Created column" HeaderText="Date Created"
                                            ReadOnly="True" SortExpression="SER_Created" UniqueName="SER_Created">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Created_By" Display="False" FilterControlAltText="Filter SER_Created_By column"
                                            HeaderText="Created By" ReadOnly="True" SortExpression="SER_Created_By" UniqueName="SER_Created_By">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Modified" Display="False" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_Modified column" HeaderText="Date Modified"
                                            ReadOnly="True" SortExpression="SER_Modified" UniqueName="SER_Modified">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Modified_By" Display="False" FilterControlAltText="Filter SER_Modified_By column"
                                            HeaderText="Modified By" ReadOnly="True" SortExpression="SER_Modified_By" UniqueName="SER_Modified_By">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                        </EditColumn>
                                    </EditFormSettings>
                                </MasterTableView></telerik:RadGrid>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7" colspan="3" style="text-align: left; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; color: #FFFFFF;">
                            Archive
                        </td>
                        <td class="style7" colspan="4" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                            <telerik:RadButton ID="RadBtn_Add_Archive" runat="server" AutoPostBack="False" Font-Names="Segoe UI"
                                Font-Size="10pt" OnClientClicked="fn_OnClickButtonArc" Skin="Glow" Text="Add new archive" Visible="False">
                            </telerik:RadButton>
                            <telerik:RadButton ID="RadBtn_Edit_Archive" runat="server" AutoPostBack="False" Font-Names="Segoe UI"
                                Font-Size="10pt" OnClientClicked="fn_OnClickButtonArcEdit" Skin="Glow" Text="Edit last archive" Visible="False">
                            </telerik:RadButton>
                        </td>
                        <td class="style7" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="5" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="4" style="text-align: left; padding-left: 15px; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; color: #FFFFFF;">
                            Open Service Events
                        </td>
                    </tr>
                    <tr>
                        <td class="style7" colspan="7" style="text-align: left; font-family: 'Segoe UI'; font-size: 16px; color: #000000; vertical-align: top;">
                            <telerik:RadGrid ID="RadGrid_ARCHIVE" runat="server" DataSourceID="SqlDS_Archive" ResolvedRenderMode="Classic" Width="800px" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="False">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SERA_ID" DataSourceID="SqlDS_Archive" AllowPaging="True">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="SERA_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter SERA_ID column" HeaderText="SERA_ID" ReadOnly="True"
                                            SortExpression="SERA_ID" UniqueName="SERA_ID">
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="SERA_A_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter SERA_A_ID column" HeaderText="SERA A ID" ReadOnly="True"
                                            SortExpression="SERA_A_ID" UniqueName="SERA_A_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn FilterControlAltText="Filter Asset_TemplateColumn column" HeaderText="Asset" UniqueName="Asset_TemplateColumn" SortExpression="Asset">
                                                        <ItemTemplate>
                                                            <table border="0" style="height: 100%; ">                                                      
                                                                <tr>                                                            
                                                                    <td >
                                                                        <telerik:RadLabel ID="RadLbl_Asset_ID_Archive" runat="server" Text='<%# Bind("Asset") %>' 
                                                                            style="cursor: pointer; " Font-Underline="True"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
                                                <ItemStyle Wrap="False" Width="80px" />
                                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Date_Service" DataFormatString="{0:dd MMM yyyy}"
                                            DataType="System.DateTime" FilterControlAltText="Filter SERA_Date_Service column"
                                            HeaderText="Svc Date" SortExpression="SERA_Date_Service" UniqueName="SERA_Date_Service">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_SITE_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter SERA_SITE_ID column" HeaderText="SERA_SITE_ID" SortExpression="SERA_SITE_ID"
                                            UniqueName="SERA_SITE_ID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SITE_Name" FilterControlAltText="Filter SITE_Name column"
                                            HeaderText="Site" SortExpression="SITE_Name" UniqueName="SITE_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_SERT_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter SERA_SERT_ID column" HeaderText="SERA_SERT_ID" SortExpression="SERA_SERT_ID"
                                            UniqueName="SERA_SERT_ID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ServiceType" FilterControlAltText="Filter ServiceType column"
                                            HeaderText="ServiceType" SortExpression="ServiceType" UniqueName="ServiceType">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Service_SMU" DataType="System.Double" FilterControlAltText="Filter SERA_Service_SMU column"
                                            HeaderText="Svc SMU" SortExpression="SERA_Service_SMU" UniqueName="SERA_Service_SMU">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Last_SMU" DataType="System.Double" FilterControlAltText="Filter SERA_Last_SMU column"
                                            HeaderText="Last SMU" SortExpression="SERA_Last_SMU" UniqueName="SERA_Last_SMU">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Event_Ref" FilterControlAltText="Filter SERA_Event_Ref column"
                                            HeaderText="Ref." SortExpression="SERA_Event_Ref" UniqueName="SERA_Event_Ref">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Cal_Event_Type" FilterControlAltText="Filter SERA_Cal_Event_Type column"
                                            HeaderText="Cal Event Type" SortExpression="SERA_Cal_Event_Type" UniqueName="SERA_Cal_Event_Type">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_SMU_Diff" DataType="System.Double" Display="False"
                                            FilterControlAltText="Filter SERA_SMU_Diff column" HeaderText="SMU Difference"
                                            SortExpression="SERA_SMU_Diff" UniqueName="SERA_SMU_Diff">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_SMU_Left" DataType="System.Double" Display="False"
                                            FilterControlAltText="Filter SERA_SMU_Left column" HeaderText="SMU Left" SortExpression="SERA_SMU_Left"
                                            UniqueName="SERA_SMU_Left">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Created" DataFormatString="{0:dd MMM yyyy}"
                                            DataType="System.DateTime" FilterControlAltText="Filter SERA_Created column"
                                            HeaderText="Created" SortExpression="SERA_Created" UniqueName="SERA_Created">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Created_By" Display="False" FilterControlAltText="Filter SERA_Created_By column"
                                            HeaderText="SERA_Created_By" SortExpression="SERA_Created_By" UniqueName="SERA_Created_By">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Modified" DataFormatString="{0:dd MMM yyyy}"
                                            DataType="System.DateTime" Display="False" FilterControlAltText="Filter SERA_Modified column"
                                            HeaderText="SERA_Modified" SortExpression="SERA_Modified" UniqueName="SERA_Modified">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Modified_By" Display="False" FilterControlAltText="Filter SERA_Modified_By column"
                                            HeaderText="SERA_Modified_By" SortExpression="SERA_Modified_By" UniqueName="SERA_Modified_By">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView></telerik:RadGrid>
                        </td>
                        <td class="style7" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="5" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="4" style="text-align: left; padding-left: 10px; font-family: 'Segoe UI'; font-size: 16px; color: #FFFFFF; vertical-align: top;">
                            <telerik:RadGrid ID="RadGrid_Active_Events" runat="server" AllowAutomaticInserts="True"
                                AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_ACTIVE_EVENTS" ResolvedRenderMode="Classic" PageSize="5" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="E_ID" DataKeyNames="E_ID"
                                    DataSourceID="SqlDS_RadGrid_SP_ACTIVE_EVENTS" NoMasterRecordsText="No events to display.">
                                    <RowIndicatorColumn Visible="False">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True">
                                    </ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add new event" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="E_ID" DataType="System.Int32" Display="True"
                                            FilterControlAltText="Filter E_ID column" HeaderText="ID" ReadOnly="True" SortExpression="E_ID"
                                            UniqueName="E_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_A_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter E_A_ID column" HeaderText="E A ID" ReadOnly="True"
                                            SortExpression="E_A_ID" UniqueName="E_A_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn FilterControlAltText="Filter Asset_TemplateColumn column" HeaderText="Asset" UniqueName="Asset_TemplateColumn" SortExpression="Asset">
                                                        <ItemTemplate>
                                                            <table border="0" style="height: 100%; ">                                                      
                                                                <tr>                                                            
                                                                    <td >
                                                                        <telerik:RadLabel ID="RadLbl_Asset_ID_Event" runat="server" Text='<%# Bind("Asset") %>' 
                                                                            style="cursor: pointer; " Font-Underline="True"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
                                                <ItemStyle Wrap="False" Width="80px" />
                                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="E_WeekEnding" DataFormatString="{0:dd MMM yyyy}" Display="False"
                                            FilterControlAltText="Filter E_WeekEnding column" HeaderText="WeekEnding" ReadOnly="True"
                                            SortExpression="E_WeekEnding" UniqueName="E_WeekEnding">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Site_Name" Display="True" FilterControlAltText="Filter Site_Name column"
                                            HeaderText="Site" ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                            <HeaderStyle Width="150px" Wrap="False" />
                                            <ItemStyle Width="150px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Shift" FilterControlAltText="Filter E_Shift column"
                                            HeaderText="Shift" ReadOnly="True" SortExpression="E_Shift" UniqueName="E_Shift"
                                            Display="False">
                                            <HeaderStyle Width="60px" Wrap="False" />
                                            <ItemStyle Width="60px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Handler" Display="False" FilterControlAltText="Filter E_Handler column"
                                            HeaderText="Owner" ReadOnly="True" SortExpression="E_Handler" UniqueName="E_Handler">
                                            <HeaderStyle Width="60px" Wrap="False" />
                                            <ItemStyle Width="60px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Company" Display="False" FilterControlAltText="Filter Company column"
                                            HeaderText="Contractor" ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                            <HeaderStyle Width="150px" Wrap="False" />
                                            <ItemStyle Width="150px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Engineer" Display="False" FilterControlAltText="Filter Engineer column"
                                            HeaderText="Engineer" ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                            <HeaderStyle Width="150px" Wrap="False" />
                                            <ItemStyle Width="150px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EventType" FilterControlAltText="Filter EventType column"
                                            HeaderText="Event Type" ReadOnly="True" SortExpression="EventType" UniqueName="EventType">
                                            <HeaderStyle Width="150px" Wrap="False" />
                                            <ItemStyle Width="150px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="E_Description" FilterControlAltText="Filter E_Description column"
                                            HeaderText="Description" ReadOnly="True" SortExpression="E_Description" UniqueName="E_Description">
                                            <HeaderStyle Width="250px" Wrap="False" />
                                            <ItemStyle Width="250px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Date_Estimated" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter E_Date_Estimated column" HeaderText="Estimated Due Back"
                                            ReadOnly="True" SortExpression="E_Date_Estimated" UniqueName="E_Date_Estimated">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Date_Started" DataFormatString="{0:dd MMM yyyy}"
                                            Display="False" FilterControlAltText="Filter E_Date_Started column" HeaderText="Breakdown Called In"
                                            ReadOnly="True" SortExpression="E_Date_Started" UniqueName="E_Date_Started">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Status" FilterControlAltText="Filter E_Status column"
                                            HeaderText="Status" ReadOnly="True" SortExpression="E_Status" UniqueName="E_Status"
                                            Display="False">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Notes" Display="False" FilterControlAltText="Filter E_Notes column"
                                            HeaderText="Notes" ReadOnly="True" SortExpression="E_Notes" UniqueName="E_Notes">
                                            <HeaderStyle Width="400px" Wrap="False" />
                                            <ItemStyle Width="400px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Created" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter E_Created column" HeaderText="Date Created" ReadOnly="True"
                                            SortExpression="E_Created" UniqueName="E_Created">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Created_By" Display="False" FilterControlAltText="Filter E_Created_By column"
                                            HeaderText="Created By" ReadOnly="True" SortExpression="E_Created_By" UniqueName="E_Created_By">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Modified" DataFormatString="{0:dd MMM yyyy}"
                                            Display="False" FilterControlAltText="Filter E_Modified column" HeaderText="Date Modified"
                                            ReadOnly="True" SortExpression="E_Modified" UniqueName="E_Modified">
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
                                </MasterTableView></telerik:RadGrid>
                            <asp:Label ID="lbl_SMU_Header" runat="server" Font-Bold="True" Text="SMU Readings"></asp:Label>
                            <telerik:RadGrid ID="RadGrid_SMU" runat="server" DataSourceID="SqlDS_RadGrid_SMU" ResolvedRenderMode="Classic" Skin="Glow">
                                        <MasterTableView AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="SMU_ID" DataSourceID="SqlDS_RadGrid_SMU">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="SMU_ID" DataType="System.Int32" Display="False"
                                                    FilterControlAltText="Filter SMU_ID column" HeaderText="SMU_ID" ReadOnly="True"
                                                    SortExpression="SMU_ID" UniqueName="SMU_ID">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="SMU_WeekEnding" DataFormatString="{0:dd MMM yyyy}"  Display="False"
                                                    DataType="System.DateTime" FilterControlAltText="Filter SMU_WeekEnding column"
                                                    HeaderText="WeekEnding" SortExpression="SMU_WeekEnding" UniqueName="SMU_WeekEnding">
                                                    <HeaderStyle Width="90px" Wrap="False" />
                                                    <ItemStyle Width="90px" Wrap="False" />
                                                </telerik:GridBoundColumn>
                                                 <telerik:GridBoundColumn DataField="SMU_Date" DataFormatString="{0:dd MMM yyyy}"
                                                    DataType="System.DateTime" FilterControlAltText="Filter SMU_Date column"
                                                    HeaderText="Date" SortExpression="SMU_Date" UniqueName="SMU_Date">
                                                    <HeaderStyle Width="90px" Wrap="False" />
                                                    <ItemStyle Width="90px" Wrap="False" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="SMU_A_ID" DataType="System.Int32" Display="False"
                                                    FilterControlAltText="Filter SMU_A_ID column" HeaderText="SMU_A_ID" SortExpression="SMU_A_ID"
                                                    UniqueName="SMU_A_ID">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="SMU_Value" DataType="System.Double" FilterControlAltText="Filter SMU_Value column"
                                                    HeaderText="SMU" SortExpression="SMU_Value" UniqueName="SMU_Value">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="SMU_Usage" DataType="System.Double" FilterControlAltText="Filter SMU_Usage column"
                                                    HeaderText="Usage" SortExpression="SMU_Usage" UniqueName="SMU_Usage">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView></telerik:RadGrid>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7" colspan="7" style="text-align: left; font-family: 'Segoe UI'; font-size: 16px; color: #000000; vertical-align: top;">
                        </td>
                        <td class="style7" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="5" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="4" style="text-align: left; padding-left: 15px; font-family: 'Segoe UI'; font-size: 16px; color: #000000; font-weight: bold;">
                        </td>
                    </tr>
                    <tr>
                        <td class="style7" colspan="7" style="text-align: left; font-family: 'Segoe UI'; font-size: 16px; color: #000000; vertical-align: top;">
                        </td>
                        <td class="style7" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="5" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                        </td>
                        <td class="style7" colspan="4" style="text-align: left; padding-left: 10px; font-family: 'Segoe UI'; font-size: 16px; color: #000000; vertical-align: top;">
                            <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                            <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                            <asp:Label ID="lbl_Test" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                            <asp:Label ID="lbl_TestCal" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                            <asp:Label ID="lbl_Site" runat="server" Font-Size="1px" ForeColor="#2c3338" Text="%"></asp:Label>
                            <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                            <asp:Label ID="lbl_Asset" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                            <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                            <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                        </td>
                    </tr>
                </table>
            </telerik:RadPane>
        </telerik:RadSplitter>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
<asp:HiddenField ID="HF_Username" runat="server" />
<asp:HiddenField ID="HF_SessionIP" runat="server" />
<asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
<asp:HiddenField ID="HF_SER_ID" runat="server" />
<asp:HiddenField ID="HF_SERA_ID" runat="server" />
<asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
<asp:HiddenField ID="HF_Site" runat="server" Value="Test" />
<asp:HiddenField ID="HF_Session_ID" runat="server" />
<asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
<asp:HiddenField ID="HF_EXCEPTION_8_R" runat="server" Value="0" />
<asp:HiddenField ID="HF_EXCEPTION_8_RW" runat="server" Value="0" />
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
        <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS SITE_ID, '*All Sites' AS SITE_Name UNION ALL SELECT CONVERT (nvarchar(5), SITE_ID) AS SITE_ID, SITE_Name FROM SITE WHERE (SITE_Status = 'Active') ORDER BY SITE_Name">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Asset_SMU" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_ASSET_ID UNION ALL SELECT CONVERT (nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM SERVICING AS SER INNER JOIN ASSET ON SER.SER_A_ID = ASSET.A_ID LEFT OUTER JOIN ATTRIBUTES AS ATTST ON SER.SER_SERT_ID = ATTST.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTSS ON SER.SER_Status_ID = ATTSS.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTCAL ON SER.SER_Cal_Status_ID = ATTCAL.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTFIRE ON SER.SER_Fire_Status_ID = ATTFIRE.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTEXAM ON SER.SER_Exam_Status_ID = ATTEXAM.ATT_ID WHERE (ASSET.A_Activity_Status NOT IN ('Off_Hire', 'Disposed')) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @A_SITE_ID) AND (ATTSS.ATT_FLAG = 'MONITORING') OR (ASSET.A_Activity_Status NOT IN ('Off_Hire', 'Disposed')) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @A_SITE_ID) AND (ATTCAL.ATT_FLAG = 'MONITORING') OR (ASSET.A_Activity_Status NOT IN ('Off_Hire', 'Disposed')) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @A_SITE_ID) AND (ATTFIRE.ATT_FLAG = 'MONITORING') OR (ASSET.A_Activity_Status NOT IN ('Off_Hire', 'Disposed')) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @A_SITE_ID) AND (ATTEXAM.ATT_FLAG = 'MONITORING') ORDER BY A_ASSET_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Site" Name="A_SITE_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Asset_CAL" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_ASSET_ID UNION ALL SELECT CONVERT (nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM SERVICING AS SER INNER JOIN ASSET ON SER.SER_A_ID = ASSET.A_ID LEFT OUTER JOIN ATTRIBUTES AS ATTST ON SER.SER_SERT_ID = ATTST.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTSS ON SER.SER_Status_ID = ATTSS.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTCAL ON SER.SER_Cal_Status_ID = ATTCAL.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTFIRE ON SER.SER_Fire_Status_ID = ATTFIRE.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTEXAM ON SER.SER_Exam_Status_ID = ATTEXAM.ATT_ID WHERE (ASSET.A_Activity_Status NOT IN ('Off_Hire', 'Disposed')) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @A_SITE_ID) AND (ATTSS.ATT_FLAG = 'NOT_IN_USE') AND (ATTCAL.ATT_FLAG = 'NOT_IN_USE') AND (ATTFIRE.ATT_FLAG = 'NOT_IN_USE') AND (ATTEXAM.ATT_FLAG = 'NOT_IN_USE') ORDER BY A_ASSET_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Site" Name="A_SITE_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ACTIVE_EVENTS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="D_SERVICING_ACTIVE_EVENTS_RG_SELECT_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Site" Name="SITE_ID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="lbl_Asset" Name="A_ID" PropertyName="Text" Type="String"  />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Status" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT DISTINCT ATTRIBUTES.ATT_FLAG AS Flag_ID, CASE ATTRIBUTES.ATT_FLAG WHEN 'MONITORING' THEN 'Live' WHEN 'EXTERNAL' THEN 'External Service' WHEN 'NOT_IN_USE' THEN 'Not In Use' END AS ATT_Flag FROM ATTRIBUTES INNER JOIN SERVICING ON SERVICING.SER_Status_ID = ATTRIBUTES.ATT_ID WHERE (ATTRIBUTES.ATT_Status NOT IN ('Trash', 'Delete')) AND (ATTRIBUTES.ATT_TABLE = 'SERVICE_Status') ORDER BY Flag_ID">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ALL_SER" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="D_ALL_SER_RG_SELECT_SP" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
                 <asp:ControlParameter ControlID="RadCB_Status" Name="Status" PropertyName="SelectedValue" Type="String" />
                 <asp:ControlParameter ControlID="lbl_Asset" Name="A_ID" PropertyName="Text" Type="String"  />
                <asp:ControlParameter ControlID="RadCB_Site" Name="SITE_ID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_SP_CAL_SER" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="D_CAL_SER_RG_SELECT_SP" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Status" Name="Status" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="lbl_Asset" Name="A_ID" PropertyName="Text" Type="String"  />
                <asp:ControlParameter ControlID="RadCB_Site" Name="SITE_ID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
      <%--   <asp:SqlDataSource ID="SqlDS_Box1" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="WIDGET_Service_Adherence_SP" SelectCommandType="StoredProcedure">
            <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="Site" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
        <asp:SqlDataSource ID="SqlDS_Archive" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT SERA.SERA_ID, SERA.SERA_A_ID, SERA.SERA_Date_Service, SERA.SERA_SITE_ID, SERA.SERA_Fitter, SERA.SERA_SERT_ID, ISNULL(SERA.SERA_Service_SMU, 0) AS SERA_Service_SMU, ISNULL(SERA.SERA_Last_SMU, 0) AS SERA_Last_SMU, SERA.SERA_Event_Ref, SERA.SERA_Cal_Event_Type, SERA.SERA_SMU_Diff, SERA.SERA_SMU_Left, SERA.SERA_Created, SERA.SERA_Created_By, SERA.SERA_Modified, SERA.SERA_Modified_By, ATTRIBUTES.ATT_Name AS ServiceType, SITE.SITE_Name, ASSET.A_Asset_ID AS Asset FROM SERVICING_ARCHIVE AS SERA LEFT OUTER JOIN ATTRIBUTES ON SERA.SERA_SERT_ID = ATTRIBUTES.ATT_ID INNER JOIN ASSET ON SERA.SERA_A_ID = ASSET.A_ID LEFT OUTER JOIN SITE ON SERA.SERA_SITE_ID = SITE.SITE_ID WHERE (CONVERT (nvarchar(5), SERA.SERA_A_ID) LIKE @A_ID) ORDER BY SERA.SERA_ID DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbl_Asset" Name="A_ID" PropertyName="Text" Type="String"  />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_SMU" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT SMU_ID, SMU_WeekEnding, SMU_Date, SMU_A_ID, SMU_Value, SMU_Usage FROM SMU WHERE (SMU_A_ID = @A_ID) AND (SMU_Date &gt;= DATEADD(year, - 1, GETDATE())) ORDER BY SMU_Date DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbl_Asset" Name="A_ID" PropertyName="Text" Type="String"  />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_GetSERA" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT TOP (1) SERA_ID FROM SERVICING_ARCHIVE WHERE (SERA_A_ID = @SERA_A_ID) AND (SERA_Last_SMU IS NOT NULL OR SERA_Last_SMU &lt;&gt; 0) ORDER BY SERA_ID DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbl_Asset" Name="SERA_A_ID" PropertyName="Text" Type="String"  />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" Skin="Silk">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_SER" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Cal_SER" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_SMU" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_CAL" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Cal_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_ARCHIVE" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_SMU" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                         <telerik:AjaxUpdatedControl ControlID="Table101" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_SMU" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_CAL" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Cal_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Add_Archive" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_ARCHIVE" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_SMU" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Asset_SMU">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_SERA_ID" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Cal_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Edit_Archive" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_ARCHIVE" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_SMU_Header" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_SMU" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Asset_CAL">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_SERA_ID" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Cal_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Edit_Archive" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_ARCHIVE" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_SMU_Header" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_SMU" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_SMU" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_CAL" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Cal_SER" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Edit_Archive" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_ARCHIVE" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Events" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_SMU_Header" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_SMU" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                         <telerik:AjaxUpdatedControl ControlID="Table101" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadWindow ID="RadWindow1" runat="server" Height="650px" Width="1200px" onclientclose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True">
</telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow2" runat="server" Height="650px" Width="1200px" onclientclose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
</telerik:RadWindow>
<telerik:RadWindow ID="RadWindow3" runat="server" Height="450px" Width="600px" onclientclose="closeWindow_add_event_arc_new_item" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True">
</telerik:RadWindow>
<telerik:RadWindow ID="RadWindow4" runat="server" Height="450px" Width="600px" onclientclose="closeWindow_add_event_arc_edit_item" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True">
</telerik:RadWindow>
         <telerik:RadWindow ID="RadWindow_Asset" runat="server" Height="700px" Width="1250px" OnClientClose="closeWindow_asset" Behaviors="Close, Move" Modal="True" Title="Asset" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
</div>
    </form>
</body>
</html>


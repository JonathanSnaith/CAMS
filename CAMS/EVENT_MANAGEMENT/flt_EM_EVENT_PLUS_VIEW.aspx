<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Event Plus View" CodeFile="flt_EM_EVENT_PLUS_VIEW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_EVENT_PLUS_VIEW" %>

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
        .auto-style28 {
            width: 137px;
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
            window.open('../CLIENT/flt_EVENT_MANAGEMENT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=8', '_self');
        }
        if (THISPP == 2) {
            window.open('../DASHBOARDS/flt_D_EVENT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
    }
    function fn_1() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var EventType = document.getElementById('HF_ET_ID').value;
        var Asset = document.getElementById('HF_A_ID').value;
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Events_Plus_250.rpt&@E_ET_ID=' + EventType + "&@Asset=" + Asset, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
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
                                 <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>

                            </td>
                            <td style="color: White; font-family: 'Segoe UI'; font-size: 14px; background-color: #ff661c; padding-right: 15px; text-align: left;" align="right" class="auto-style28">
                                <asp:Table ID="Table101" runat="server" CellSpacing="0" Height="75px" Style="cursor: pointer" Visible="False" Width="180px" BorderStyle="Dashed" BorderWidth="2px" BorderColor="White">
                                    <asp:TableRow ID="TableRow1" runat="server">
                                        <asp:TableCell ID="ID_1_A" runat="server" BackColor="#ff661c" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="lblCount_1" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip=""></asp:Label>
                                                            <%--<asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />--%>
                                                        </td>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="Label1" runat="server" Text="events within 250hrs" ForeColor="White" Font-Size="10"></asp:Label>
                                                           
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow2" runat="server" BorderStyle="None">
                                        <asp:TableCell ID="ID_1_B" runat="server" BackColor="#ff661c" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: left; padding-top: 5px; padding-left: 5px;" colspan="2">
                                                         <asp:Label ID="Label2" runat="server" Text="smu at event type: " ForeColor="White" Font-Size="10"></asp:Label>
                                                         <asp:Label ID="lblSMU" runat="server" Text="" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                    </asp:TableRow>
                                    <%-- <asp:TableRow ID="TableRow2" runat="server">
                                        <asp:TableCell ID="ID_1_B" runat="server" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 75px;" >
                                                            <asp:ImageButton ID="img_1_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                    </asp:TableRow>--%>
                                </asp:Table>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 14px; background-color: #ff661c; padding-right: 15px; text-align: left; padding-bottom: 5px;" valign="bottom">
                                <asp:Label ID="lbl_EventSMUPlus250" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="lbl_LatestSMU" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="lbl_Hours" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" >
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style27">
                                <asp:Label ID="lblTitle" runat="server" Text="EVENT PLUS 250 HOURS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Text="Refresh" Width="100px" Skin="Glow">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; background-color: #747474; text-align: right; padding-right: 15px;">
                                Customer:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; background-color: #747474; text-align: left; padding-left: 10px;">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Customer" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; background-color: #747474; text-align: right; padding-right: 15px;">Asset:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; background-color: #747474; text-align: right; padding-top: 5px; padding-right: 15px;">
                                Event Type:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;">
                                <telerik:RadComboBox ID="RadCB_EventType" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_EventType" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="250px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right; padding-top: 5px;">
                                &nbsp;</td>
                            <td align="left" style="color: White; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_1" runat="server" onClick="fn_OnClickButtonjob()" CssClass="roundcorners" BackColor="#d9ffd9">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/EVENT_JOB_MANAGEMENT.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW JOB" ForeColor="Black"></asp:Label>
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
                                            <asp:Panel ID="Panel_2" runat="server" onClick="fn_panel_2()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="" ForeColor="Black"></asp:Label>
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
                    <table class="style1" width="100%">
                        <tr>
                            <td colspan="7" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Archive_Events" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                                    AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_ARCHIVE_EVENTS" ResolvedRenderMode="Classic" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true">
                                    </ExportSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="E_ID" DataKeyNames="E_ID"
                                        DataSourceID="SqlDS_RadGrid_SP_ARCHIVE_EVENTS" NoMasterRecordsText="No events to display." PageSize="15">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new event" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="Customer" Display="True" FilterControlAltText="Filter Customer column"
                                                HeaderText="Customer" ReadOnly="True" SortExpression="Customer" UniqueName="Customer">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
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
                                                                            style="cursor: pointer; " Font-Underline="True"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
                                                <ItemStyle Wrap="False" Width="80px" />
                                                        </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="E_ID" FilterControlAltText="Filter E_ID column"
                                                HeaderText="Event No" ReadOnly="True" SortExpression="E_ID"
                                                UniqueName="E_ID" DataType="System.Int32" Display="True">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Site_Name" Display="True" FilterControlAltText="Filter Site_Name column"
                                                HeaderText="Site" ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EventType"
                                                FilterControlAltText="Filter EventType column" HeaderText="Event Type"
                                                ReadOnly="True" SortExpression="EventType" UniqueName="EventType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Description" Display="True"
                                                FilterControlAltText="Filter E_Description column" HeaderText="Description"
                                                ReadOnly="True" SortExpression="E_Description" UniqueName="E_Description">
                                                <HeaderStyle Width="400px" Wrap="False" />
                                                <ItemStyle Width="400px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Shift" FilterControlAltText="Filter E_Shift column"
                                                HeaderText="Shift" ReadOnly="True" SortExpression="E_Shift" UniqueName="E_Shift">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Handler" FilterControlAltText="Filter E_Handler column"
                                                HeaderText="Owner" ReadOnly="True" SortExpression="E_Handler" UniqueName="E_Handler">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EngOrCom" Display="True" FilterControlAltText="Filter EngOrCom column"
                                                HeaderText="Engineer/Company" ReadOnly="True" SortExpression="EngOrCom" UniqueName="EngOrCom">
                                                <HeaderStyle Width="200px" Wrap="True" />
                                                <ItemStyle Width="200px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Engineer" Display="False"
                                                FilterControlAltText="Filter Engineer column" HeaderText="Engineer"
                                                ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Company" Display="False" FilterControlAltText="Filter Company column"
                                                HeaderText="Contractor" ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Date_Started" DataFormatString="{0:dd MMM yyyy HH:mm}"
                                                Display="True" FilterControlAltText="Filter E_Date_Started column" HeaderText="Breakdown Called In"
                                                ReadOnly="True" SortExpression="E_Date_Started" UniqueName="E_Date_Started">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Planned_Start_Date"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter E_Planned_Start_Date column"
                                                HeaderText="Planned Start Date" SortExpression="E_Planned_Start_Date"
                                                UniqueName="E_Planned_Start_Date">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Date_Estimated"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter E_Date_Estimated column"
                                                HeaderText="Estimated Due Back" ReadOnly="True"
                                                SortExpression="E_Date_Estimated" UniqueName="E_Date_Estimated">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Date_Ended" DataFormatString="{0:dd MMM yyyy HH:mm}"
                                                Display="True" FilterControlAltText="Filter E_Date_Ended column" HeaderText="Date Closed"
                                                ReadOnly="True" SortExpression="E_Date_Ended" UniqueName="E_Date_Ended">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Status" FilterControlAltText="Filter E_Status column"
                                                HeaderText="Status" ReadOnly="True" SortExpression="E_Status" UniqueName="E_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td colspan="2" style="text-align: left; vertical-align: top;">&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_Job_Text" runat="server" Font-Bold="True" Font-Names="segoe ui"
                                    Font-Size="14pt" ForeColor="White" Text="Jobs" Visible="False"></asp:Label>
                            </td>
                            <td style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_FT_Text" runat="server" Font-Bold="True" Font-Names="segoe ui"
                                    Font-Size="14pt" ForeColor="White" Text="Timesheets" Visible="False"></asp:Label>
                            </td>
                            <td colspan="2" style="text-align: left; vertical-align: top;">&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Active_Jobs" runat="server" AllowAutomaticInserts="True"
                                    AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_ACTIVE_JOBS"
                                    ResolvedRenderMode="Classic" Skin="Glow" Width="1000px">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="J_ID" DataKeyNames="J_ID"
                                        DataSourceID="SqlDS_RadGrid_SP_ACTIVE_JOBS" NoMasterRecordsText="No jobs to display.">
                                        <CommandItemSettings AddNewRecordText="Add new job" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="J_E_ID" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter J_E_ID column" HeaderText="Event No"
                                                ReadOnly="True" SortExpression="J_E_ID"
                                                UniqueName="J_E_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_ID" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter J_ID column" HeaderText="Job No" ReadOnly="True"
                                                SortExpression="J_ID" UniqueName="J_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="JobType" FilterControlAltText="Filter JobType column"
                                                HeaderText="Job Type" ReadOnly="True" SortExpression="JobType" UniqueName="JobType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column"
                                                HeaderText="Component" ReadOnly="True" SortExpression="Level3"
                                                UniqueName="Level3">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Instruction" Display="True"
                                                FilterControlAltText="Filter J_Instruction column" HeaderText="Instruction"
                                                ReadOnly="True" SortExpression="J_Instruction" UniqueName="J_Instruction">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Shift"
                                                FilterControlAltText="Filter J_Shift column" HeaderText="Shift" ReadOnly="True"
                                                SortExpression="J_Shift" UniqueName="J_Shift">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Handler" FilterControlAltText="Filter J_Handler column" HeaderText="Owner" ReadOnly="True" SortExpression="J_Handler" UniqueName="J_Handler">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EngOrCom" Display="True" FilterControlAltText="Filter EngOrCom column"
                                                HeaderText="Engineer/Company" ReadOnly="True" SortExpression="EngOrCom" UniqueName="EngOrCom">
                                                <HeaderStyle Width="150px" Wrap="True" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Date_Closed" DataFormatString="{0:dd MMM yyyy}"
                                                Display="True" FilterControlAltText="Filter J_Date_Closed column" HeaderText="Date Closed"
                                                ReadOnly="True" SortExpression="J_Date_Closed" UniqueName="J_Date_Closed">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="J_SMU"
                                                FilterControlAltText="Filter J_SMU column" HeaderText="SMU" ReadOnly="True"
                                                SortExpression="J_SMU" UniqueName="J_SMU">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Status" FilterControlAltText="Filter J_Status column"
                                                HeaderText="Status" ReadOnly="True" SortExpression="J_Status" UniqueName="J_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
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
                                <telerik:RadGrid ID="RadGrid_Active_FT" runat="server" AllowAutomaticInserts="True"
                                    AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_ACTIVE_FT"
                                    ResolvedRenderMode="Classic" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="FT_ID" DataKeyNames="FT_ID"
                                        DataSourceID="SqlDS_RadGrid_SP_ACTIVE_FT" NoMasterRecordsText="No timesheets to display.">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new timesheet" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="FT_ID" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter FT_ID column" HeaderText="ID" ReadOnly="True" SortExpression="FT_ID"
                                                UniqueName="FT_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_J_ID" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter FT_J_ID column" HeaderText="Job ID" ReadOnly="True"
                                                SortExpression="FT_J_ID" UniqueName="FT_J_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Date" DataFormatString="{0:dd MMM yyyy}" Display="False"
                                                FilterControlAltText="Filter FT_Date column" HeaderText="Date" ReadOnly="True"
                                                SortExpression="FT_Date" UniqueName="FT_Date">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FTD_Total_Hours" FilterControlAltText="Filter FTD_Total_Hours column"
                                                HeaderText="Total Hours" ReadOnly="True" SortExpression="FTD_Total_Hours" UniqueName="FTD_Total_Hours">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FT_Status" FilterControlAltText="Filter FT_Status column"
                                                HeaderText="Status" ReadOnly="True" SortExpression="FT_Status" UniqueName="FT_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td colspan="2" style="text-align: left; vertical-align: top;">
                            </td>
                        </tr>
                        <tr>
                            <td class="style6" colspan="4" style="text-align: left; vertical-align: top;">
                            </td>
                            <td class="style5" style="text-align: left">
                                <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                                <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                                <asp:Label ID="lbl_Test" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                                <asp:Label ID="lbl_TestJob" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                                <asp:Label ID="lbl_TestFT" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                                <asp:Label ID="lbl_Site" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                                <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_ET_ID" runat="server" />
             <asp:HiddenField ID="HF_Customer" runat="server" />
            <asp:HiddenField ID="HF_A_ID" runat="server" />
            <asp:HiddenField ID="HF_E_ID" runat="server" />
            <asp:HiddenField ID="HF_J_ID" runat="server" />
            <asp:HiddenField ID="HF_FT_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Site" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
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
             <asp:SqlDataSource ID="SqlDS_CB_Customer" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '' AS CUS_ID, '*Select' AS CUS_Name UNION ALL SELECT CONVERT (nvarchar(5), CUSTOMER.CUS_ID) AS CUS_ID, CUSTOMER.CUS_Name FROM CUSTOMER INNER JOIN EVENT ON EVENT.E_CUS_ID = CUSTOMER.CUS_ID WHERE (CUSTOMER.CUS_Status NOT IN ('Trash', 'Delete')) AND (EVENT.E_Status IN ('*New', 'Open', 'Planning')) ORDER BY CUS_Name">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '' AS A_ID, '*Select' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), EVENT.E_A_ID) AS A_ID, ASSET.A_Asset_ID FROM ASSET RIGHT OUTER JOIN EVENT ON ASSET.A_ID = EVENT.E_A_ID WHERE (EVENT.E_Status NOT IN ('Trash', 'Cancelled')) AND (CONVERT (nvarchar(5), ASSET.A_CUS_ID) = @Customer) ORDER BY A_Asset_ID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Customer" Name="Customer" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ARCHIVE_EVENTS" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_EVENT_PLUS_VIEW_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_EventType" Name="E_ET_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="Asset" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ACTIVE_JOBS" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_ACTIVE_JOBS_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadGrid_Archive_Events" Name="E_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ACTIVE_FT" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_ACTIVE_FT_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadGrid_Active_Jobs" Name="J_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_EventType" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '' AS ATT_ID, '*Select' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name FROM ATTRIBUTES INNER JOIN EVENT ON ATTRIBUTES.ATT_ID = EVENT.E_ET_ID WHERE (CONVERT (nvarchar(5), EVENT.E_A_ID) LIKE @Asset) AND (EVENT.E_Status NOT IN ('Trash', 'Cancelled')) ORDER BY ATT_Name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="Asset" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box1" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="WIDGET_Events_PLUS_250_SP" SelectCommandType="StoredProcedure">
            <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_EventType" Name="E_ET_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="Asset" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_ET_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="Table101" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_EventSMUPlus250" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_LatestSMU" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_EventType">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive_Events" />
                            <telerik:AjaxUpdatedControl ControlID="HF_ET_ID" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="Table101" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_EventSMUPlus250" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_LatestSMU" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Archive_Events">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="btnPrintJobCard" />
                            <%--<telerik:AjaxUpdatedControl ControlID="Table101" />--%>
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
                     <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_ET_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="Table101" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_EventSMUPlus250" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_LatestSMU" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_ET_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive_Events" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Job_Text" />
                            <telerik:AjaxUpdatedControl ControlID="Table101" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_EventSMUPlus250" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_LatestSMU" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_FT_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_Jobs" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Active_FT" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
              <telerik:RadWindow ID="RadWindow_Asset" runat="server" Height="700px" Width="1250px" OnClientClose="closeWindow_asset" Behaviors="Close, Move" Modal="True" Title="Asset" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


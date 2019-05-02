<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Jobs" CodeFile="flt_EM_JOBS.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_JOBS" %>
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
    function RowSelectedjob(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('J_ID');
        document.getElementById('HF_J_ID').value = ATTid;
        sessionStorage.setItem("J_ID", ATTid);
        var ATTidEvent = sender.get_selectedItems()[0].getDataKeyValue('J_E_ID');
        document.getElementById('HF_J_E_ID').value = ATTidEvent;
        sessionStorage.setItem("J_E_ID", ATTidEvent);
    }
    function fn_onrowdblclickjob(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('J_ID');
        sessionStorage.setItem("J_ID", ATTid);
        var ATTidEvent = sender.get_selectedItems()[0].getDataKeyValue('J_E_ID');
        sessionStorage.setItem("J_E_ID", ATTidEvent);
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
    function closeWindow_add_eventjob(sender, args) {
        var x = args.get_argument();
        { __doPostBack('Refresh_Grid_Combo', 0); }
        if (x > 0) {
            var oWnd = $find("<%=RadWindow4.ClientID%>");
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
                                 <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">&nbsp;</td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style27" rowspan="2">
                                <asp:Label ID="lblTitle" runat="server" Text="JOB MANAGEMENT" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Text="Refresh" Width="100px" Skin="Glow">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; background-color: #747474; text-align: right; padding-right: 15px;">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="100px" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_JobType" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="250px" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Status" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="J_Status_Text" DataValueField="J_Status" Filter="Contains" ResolvedRenderMode="Classic" Width="100px" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadTextBox ID="RadTxt_Instruction" runat="server" AutoPostBack="True" EmptyMessage="search any text field" LabelWidth="100px" Resize="None" Width="250px" Skin="Glow">
                                </telerik:RadTextBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadNumericTextBox ID="RadTxt_Number" runat="server" AutoPostBack="True" Culture="en-GB" DbValueFactor="1" EmptyMessage="Event ID" LabelWidth="48px" MaxValue="9999999999" MinValue="0" ResolvedRenderMode="Classic" Width="120px" Skin="Glow">
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; background-color: #747474; text-align: right; padding-right: 15px;">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" >
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="250px">
                                </telerik:RadComboBox>
                            </td>
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
                    <table class="style1">
                        <tr>
                            <td colspan="7" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_All_Jobs" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                    AllowSorting="True" PageSize="25" ResolvedRenderMode="Classic" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclickjob" OnRowSelected="RowSelectedjob" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="J_ID, J_E_ID" DataKeyNames="J_ID, J_E_ID"
                                        NoMasterRecordsText="No jobs to display." PageSize="25">
                                        <CommandItemSettings AddNewRecordText="Add new job" />
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
                                            <telerik:GridBoundColumn DataField="J_E_ID" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter J_E_ID column" HeaderText="Event No" ReadOnly="True"
                                                SortExpression="J_E_ID" UniqueName="J_E_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_ID" DataType="System.Int32"
                                                Display="True" FilterControlAltText="Filter J_ID column" HeaderText="Job No"
                                                ReadOnly="True" SortExpression="J_ID" UniqueName="J_ID">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SITE_Name" FilterControlAltText="Filter SITE_Name column"
                                                HeaderText="Site" ReadOnly="True" SortExpression="SITE_Name" UniqueName="SITE_Name">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="JobType" FilterControlAltText="Filter JobType column"
                                                HeaderText="Job Type" ReadOnly="True" SortExpression="JobType" UniqueName="JobType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column"
                                                HeaderText="Level 3" ReadOnly="True" SortExpression="Level3"
                                                UniqueName="Level3">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Instruction"
                                                FilterControlAltText="Filter J_Instruction column" HeaderText="Instruction"
                                                ReadOnly="True" SortExpression="J_Instruction" UniqueName="J_Instruction">
                                                <HeaderStyle Width="450px" Wrap="False" />
                                                <ItemStyle Width="450px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Engineer" Display="True"
                                                FilterControlAltText="Filter Engineer column" HeaderText="Job Engineer"
                                                ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Estimated_Time" FilterControlAltText="Filter J_Estimated_Time column"
                                                HeaderText="Job Est. Hrs" ReadOnly="True" SortExpression="J_Estimated_Time" UniqueName="J_Estimated_Time">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Peak_Time" FilterControlAltText="Filter J_Peak_Time column"
                                                HeaderText="Peak Hrs" ReadOnly="True" SortExpression="J_Peak_Time" UniqueName="J_Peak_Time">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Off_Peak_Time" FilterControlAltText="Filter J_Off_Peak_Time column"
                                                HeaderText="Off-Peak Hrs" ReadOnly="True" SortExpression="J_Off_Peak_Time" UniqueName="J_Off_Peak_Time">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_FTD_Total_Time" FilterControlAltText="Filter J_FTD_Total_Time column"
                                                HeaderText="Job Total Hrs" ReadOnly="True" SortExpression="J_FTD_Total_Time" UniqueName="J_FTD_Total_Time">
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
                                             <telerik:GridBoundColumn DataField="J_Engineer_Rate" DataFormatString="{0:£#,##0.00}"
                                                Display="True" FilterControlAltText="Filter FTD_Engineer_Rate column" HeaderText="Engineer Cost"
                                                ReadOnly="True" SortExpression="FTD_Engineer_Rate" UniqueName="FTD_Engineer_Rate">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Date_Closed" DataFormatString="{0:dd MMM yyyy}"
                                                Display="False" FilterControlAltText="Filter J_Date_Closed column" HeaderText="Date Closed"
                                                ReadOnly="True" SortExpression="J_Date_Closed" UniqueName="J_Date_Closed">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Planned_Start_Date"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter J_Planned_Start_Date column"
                                                HeaderText="Planned Start Date" SortExpression="J_Planned_Start_Date"
                                                UniqueName="J_Planned_Start_Date">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Status" FilterControlAltText="Filter J_Status column"
                                                HeaderText="Status" ReadOnly="True" SortExpression="J_Status" UniqueName="J_Status">
                                                <HeaderStyle Width="70px" Wrap="False" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="E_Status" Display="False" FilterControlAltText="Filter E_Status column"
                                                HeaderText="E Status" ReadOnly="True" SortExpression="E_Status" UniqueName="E_Status">
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
                            <td colspan="2" style="text-align: left; vertical-align: top;"></td>
                        </tr>
                        <tr>
                            <td class="style6" colspan="4" style="text-align: left; vertical-align: top;"></td>
                            <td class="style5" style="text-align: left;">
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
            <asp:HiddenField ID="HF_J_ID" runat="server" />
            <asp:HiddenField ID="HF_J_E_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Site" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Sunset">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_JobType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_JobType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_JobType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_JobType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_JobType">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Instruction" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadTxt_Instruction">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTxt_Number">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_Jobs" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_All_Jobs">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_J_E_ID" />
                            <telerik:AjaxUpdatedControl ControlID="T1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow4" runat="server" Height="950px" Width="1300px" OnClientClose="closeWindow_add_eventjob" Behaviors="Close, Move" Modal="True" Title="CAMS - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
             <telerik:RadWindow ID="RadWindow_Asset" runat="server" Height="700px" Width="1350px" OnClientClose="closeWindow_asset" Behaviors="Close, Move" Modal="True" Title="Asset" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow_Customer" runat="server" Height="700px" Width="900px" OnClientClose="closeWindow_customer" Behaviors="Close, Move" Modal="True" Title="Customer" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>

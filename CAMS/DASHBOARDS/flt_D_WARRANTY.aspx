<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - Warranties" CodeFile="flt_D_WARRANTY.aspx.vb" Inherits="DASHBOARDS_flt_D_WARRANTY" %>
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
        .auto-style19 {
            width: 90px;
        }
        .auto-style24 {
            width: 122px;
        }
        .auto-style25 {
            width: 88px;
        }
        .auto-style27 {
            width: 329px;
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
        var DateFrom = document.getElementById('HF_From').value
        var DateTo = document.getElementById('HF_To').value
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ComponentChangeOutSMUMonitoring.rpt&@EstDateFrom=' + DateFrom + "&@EstDateTo=" + DateTo + "&@Model=" + Model + "&@Asset=" + Asset + "&@Level3=" + Level3, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=1100');

    }
</script>
<body>
    <form id="form1" runat="server" >
    <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;" >
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style27" rowspan="2">
                                 <asp:Label ID="lblTitle" runat="server" Text="WARRANTY TRACKER" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style19" rowspan="2">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Default" Text="Refresh" Width="60px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style17">
                                Model:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style9">
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style24" rowspan="2">
                                 Component:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Level3" DataTextField="ATT_Name" DataValueField="ATT_ID_3" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default" Width="250px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style25" rowspan="2">
                                Planning Status: </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style15" rowspan="2">
                                 <telerik:RadComboBox ID="RadCB_Status" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Status" DataTextField="STM_Planning_Status_Text" DataValueField="STM_Planning_Status" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default">
                                 </telerik:RadComboBox>
                            </td>
                            <td align="left" class="auto-style15" rowspan="2" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadButton ID="Radbtn_Export" runat="server" AutoPostBack="False" OnClientClicked="fn_report" Skin="Default" Text="Print" Visible="False" Width="150">
                                </telerik:RadButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="auto-style17" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">From:</td>
                            <td align="left" class="auto-style9" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadDatePicker ID="DateFrom" Runat="server" AutoPostBack="True" Skin="Default">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                            <td align="left" class="auto-style19" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">To:</td>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;">
                                <telerik:RadDatePicker ID="DateTo" Runat="server" AutoPostBack="True" Skin="Default">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                        </tr>
                    </table>
                <table class="style8" style="padding-top: 20px">
                    <tr>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">Warranties (by Date)</td>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">Warranties (by Hours)</td>
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
                                    DataSourceID="SqlDS_RadGrid_PLANNING" NoMasterRecordsText="No warranties to display." PageSize="30">
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
                                        <telerik:GridBoundColumn DataField="Asset" Display="True" FilterControlAltText="Filter Asset column"
                                            HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Model" Display="True" FilterControlAltText="Filter Model column"
                                            HeaderText="Model" ReadOnly="True" SortExpression="Model" UniqueName="Model">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column"
                                            HeaderText="Component" ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                            <HeaderStyle Width="200px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMC_J_ID" Display="False" FilterControlAltText="Filter STMC_J_ID column"
                                            HeaderText="Job" ReadOnly="True" SortExpression="STMC_J_ID" UniqueName="STMC_J_ID">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMC_Component_ID" Display="False" FilterControlAltText="Filter STMC_Component_ID column" 
                                            HeaderText="Component ID" ReadOnly="True" SortExpression="STMC_Component_ID"
                                            UniqueName="STMC_Component_ID">
                                            <HeaderStyle Width="200px" Wrap="True" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STMC_Date_Fitted" DataFormatString="{0:dd MMM yyyy}" Display="False"
                                             FilterControlAltText="Filter STMC_Date_Fitted column" HeaderText="Date Fitted"
                                            ReadOnly="True" SortExpression="STMC_Date_Fitted" UniqueName="STMC_Date_Fitted">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMC_SMU_Fitted" Display="False" FilterControlAltText="Filter STMC_SMU_Fitted column"
                                            HeaderText="SMU Fitted" ReadOnly="True" SortExpression="STMC_SMU_Fitted" UniqueName="STMC_SMU_Fitted">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Company" FilterControlAltText="Filter Company column" Display="False"
                                            HeaderText="Company" ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                            <HeaderStyle Width="200px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMC_Warranty_Expiry_Date" DataFormatString="{0:dd MMM yyyy}"
                                            Display="True" FilterControlAltText="Filter STMC_Warranty_Expiry_Date column" HeaderText="Warranty Expiry Date"
                                            ReadOnly="True" SortExpression="STMC_Warranty_Expiry_Date" UniqueName="STMC_Warranty_Expiry_Date">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Frequency" FilterControlAltText="Filter STM_Frequency column"
                                            HeaderText="Planned Component Hours" ReadOnly="True" SortExpression="STM_Frequency" UniqueName="STM_Frequency">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_SMU_Value" FilterControlAltText="Filter STM_SMU_Value column"
                                            HeaderText="Current Component Hours" ReadOnly="True" SortExpression="STM_SMU_Value" UniqueName="STM_SMU_Value">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Warranty_Days_Remaining" FilterControlAltText="Filter Warranty_Days_Remaining column"
                                            HeaderText="Warranty Days Remaining" ReadOnly="True" SortExpression="Warranty_Days_Remaining" UniqueName="Warranty_Days_Remaining">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STMC_Current_Life" FilterControlAltText="Filter STMC_Current_Life column"
                                            HeaderText="Current Life (%)" ReadOnly="True" SortExpression="STMC_Current_Life" UniqueName="STMC_Current_Life">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid></td>
                        <td colspan="3" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; color: #000000;">
                             <telerik:RadGrid ID="RadGrid_PLANNING_HOURS" runat="server" AllowAutomaticInserts="True"
                                AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_PLANNING_HOURS" ResolvedRenderMode="Classic" Skin="Default">
                                <ClientSettings EnableAlternatingItems="False" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />
                                    <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                    <Resizing AllowResizeToFit="True" EnableRealTimeResize="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="STM_ID" DataKeyNames="STM_ID"
                                    DataSourceID="SqlDS_RadGrid_PLANNING_HOURS" NoMasterRecordsText="No warranties to display." PageSize="30">
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
                                        <telerik:GridBoundColumn DataField="Asset" Display="True" FilterControlAltText="Filter Asset column"
                                            HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Model" Display="True" FilterControlAltText="Filter Model column"
                                            HeaderText="Model" ReadOnly="True" SortExpression="Model" UniqueName="Model">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column"
                                            HeaderText="Component" ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                            <HeaderStyle Width="200px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMC_J_ID" Display="False" FilterControlAltText="Filter STMC_J_ID column" 
                                            HeaderText="Job" ReadOnly="True" SortExpression="STMC_J_ID" UniqueName="STMC_J_ID">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMC_Component_ID" Display="False" FilterControlAltText="Filter STMC_Component_ID column"
                                            HeaderText="Component ID" ReadOnly="True" SortExpression="STMC_Component_ID"
                                            UniqueName="STMC_Component_ID">
                                            <HeaderStyle Width="200px" Wrap="True" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STMC_Date_Fitted" DataFormatString="{0:dd MMM yyyy}"
                                            Display="False" FilterControlAltText="Filter STMC_Date_Fitted column" HeaderText="Date Fitted"
                                            ReadOnly="True" SortExpression="STMC_Date_Fitted" UniqueName="STMC_Date_Fitted">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STMC_SMU_Fitted" Display="False" FilterControlAltText="Filter STMC_SMU_Fitted column"
                                            HeaderText="SMU Fitted" ReadOnly="True" SortExpression="STMC_SMU_Fitted" UniqueName="STMC_SMU_Fitted">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Company" FilterControlAltText="Filter Company column" Display="False"
                                            HeaderText="Company" ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                            <HeaderStyle Width="200px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STMC_Warranty_Expiry_Hours" Display="True" FilterControlAltText="Filter STMC_Warranty_Expiry_Hours column"
                                            HeaderText="Warranty Expiry Hours" ReadOnly="True" SortExpression="STMC_Warranty_Expiry_Hours" UniqueName="STMC_Warranty_Expiry_Hours">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Frequency" FilterControlAltText="Filter STM_Frequency column"
                                            HeaderText="Planned Component Hours" ReadOnly="True" SortExpression="STM_Frequency" UniqueName="STM_Frequency">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_SMU_Value" FilterControlAltText="Filter STM_SMU_Value column"
                                            HeaderText="Current Component Hours" ReadOnly="True" SortExpression="STM_SMU_Value" UniqueName="STM_SMU_Value">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Warranty_Hours_Remaining" FilterControlAltText="Filter Warranty_Hours_Remaining column"
                                            HeaderText="Warranty Hours Remaining" ReadOnly="True" SortExpression="Warranty_Hours_Remaining" UniqueName="Warranty_Hours_Remaining">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="STMC_Current_Life" FilterControlAltText="Filter STMC_Current_Life column"
                                            HeaderText="Current Life (%)" ReadOnly="True" SortExpression="STMC_Current_Life" UniqueName="STMC_Current_Life">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid></td>
                    </tr>
                    <tr>
                        <td class="style6" colspan="3" style="text-align: left; vertical-align: top;">
                            <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lbl_Test" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lbl_Site" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lbl_Asset" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
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
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), A.A_ID) AS A_ID, A.A_Asset_ID FROM ASSET AS A INNER JOIN SMU_TRIGGER_MONITORING AS STM ON STM.STM_A_ID = A.A_ID INNER JOIN SMU_TRIGGER_MONITORING_Component_Fitting AS STMC ON STMC.STMC_STM_ID = STM.STM_ID WHERE (A.A_Status NOT IN ('Trash', 'Delete')) AND (A.A_Activity_Status &lt;&gt; 'Disposed') AND (CONVERT (nvarchar(5), A.A_MOD_ID) LIKE CONVERT (nvarchar(5), @Model)) AND (STMC.STMC_Trash = 0) AND (STMC.STMC_Status &lt;&gt; 'Warranty Expired') AND (STMC.STMC_Latest = 1) AND (STMC.STMC_Warranty_Expiry_Date IS NOT NULL) ORDER BY A_Asset_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Model" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS A_MOD_ID, '*All Models' AS Model UNION ALL SELECT DISTINCT CONVERT(nvarchar(5), A.A_MOD_ID) AS A_MOD_ID, ATT.ATT_Name AS Model FROM ASSET AS A INNER JOIN ATTRIBUTES AS ATT ON A.A_MOD_ID = ATT.ATT_ID INNER JOIN SMU_TRIGGER_MONITORING AS STM ON STM.STM_A_ID = A.A_ID INNER JOIN SMU_TRIGGER_MONITORING_Component_Fitting AS STMC ON STMC.STMC_STM_ID = STM.STM_ID WHERE (A.A_Status NOT IN ('Trash', 'Delete')) AND (A.A_Activity_Status &lt;&gt; 'Disposed') AND (STMC.STMC_Trash = 0) AND (STMC.STMC_Status &lt;&gt; 'Warranty Expired') AND (STMC.STMC_Latest = 1) AND (STMC.STMC_Warranty_Expiry_Date IS NOT NULL) ORDER BY Model">
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDS_Level3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS ATT_ID_3, '*All' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATT.ATT_ID) AS ATT_ID_3, ATT.ATT_Name + ' : ' + ATT.ATT_Description AS ATT_Name FROM SMU_TRIGGER_MONITORING AS STM INNER JOIN ATTRIBUTES AS ATT ON STM.STM_Code_Level_3 = ATT.ATT_ID INNER JOIN SMU_TRIGGER_MONITORING_Component_Fitting AS STMC ON STMC.STMC_STM_ID = STM.STM_ID WHERE (CONVERT (nvarchar(5), STM.STM_A_ID) LIKE CONVERT (nvarchar(5), @A_ID)) AND (STM.STM_Planning_Status &lt;&gt; 'Trash') AND (STMC.STMC_Trash = 0) AND (STMC.STMC_Status &lt;&gt; 'Warranty Expired') AND (STMC.STMC_Latest = 1) AND (STMC.STMC_Warranty_Expiry_Date IS NOT NULL) ORDER BY ATT_Name">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                        </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Status" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '%' AS STM_Planning_Status, '*All' AS STM_Planning_Status_Text UNION ALL SELECT DISTINCT STM.STM_Planning_Status, STM.STM_Planning_Status AS STM_Planning_Status_Text FROM SMU_TRIGGER_MONITORING AS STM INNER JOIN ATTRIBUTES AS ATT ON STM.STM_Code_Level_3 = ATT.ATT_ID INNER JOIN SMU_TRIGGER_MONITORING_Component_Fitting AS STMC ON STMC.STMC_STM_ID = STM.STM_ID WHERE (CONVERT (nvarchar(5), STM.STM_A_ID) LIKE CONVERT (nvarchar(5), @A_ID)) AND (CONVERT (nvarchar(5), STM.STM_Code_Level_3) LIKE CONVERT (nvarchar(5), @Level3)) AND (STM.STM_Planning_Status &lt;&gt; 'Trash') AND (STMC.STMC_Trash = 0) AND (STMC.STMC_Status &lt;&gt; 'Warranty Expired') AND (STMC.STMC_Latest = 1) AND (STMC.STMC_Warranty_Expiry_Date IS NOT NULL) ORDER BY STM_Planning_Status_Text">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" />
                    </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_PLANNING" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_WARRANTY_SELECT_SP" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
             <asp:ControlParameter ControlID="RadCB_Model" Name="A_MOD_ID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" />
                 <asp:ControlParameter ControlID="RadCB_Status" Name="STM_Planning_Status" PropertyName="SelectedValue" Type="String" />
                 <asp:ControlParameter ControlID="DateFrom" DbType="Date" Name="DateFrom" PropertyName="SelectedDate" DefaultValue="1900-01-01" />
                 <asp:ControlParameter ControlID="DateTo" DbType="Date" Name="DateTo" PropertyName="SelectedDate" DefaultValue="2100-01-01" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_PLANNING_HOURS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_WARRANTY_HOURS_SELECT_SP" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
             <asp:ControlParameter ControlID="RadCB_Model" Name="A_MOD_ID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" />
                 <asp:ControlParameter ControlID="RadCB_Status" Name="STM_Planning_Status" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" Skin="Silk">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING_HOURS" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                          <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Level3"/>
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING_HOURS" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3"/>
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING_HOURS" />
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
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING_HOURS" />
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
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="DateFrom" />
                        <telerik:AjaxUpdatedControl ControlID="DateTo" />
                         <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                         <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                         <telerik:AjaxUpdatedControl ControlID="HF_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="HF_From" />
                         <telerik:AjaxUpdatedControl ControlID="HF_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING_HOURS" />
<%--                        <telerik:AjaxUpdatedControl ControlID="Radbtn_Export" />--%>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadWindow ID="RadWindow2" runat="server" Height="800px" Width="1630px" onclientclose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
</telerik:RadWindow>
 <telerik:RadWindow ID="RadWindow4" runat="server" Height="580px" Width="670px" onclientclose="closeWindow_add_event2" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
</telerik:RadWindow>
</div>
    </form>
</body>
</html>


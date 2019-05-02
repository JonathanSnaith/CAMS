<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Report Event Management Home" CodeFile="flt_REPORT_EVENT.aspx.vb" Inherits="REPORTS_flt_REPORT_EVENT" %>

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
            width: 360px;
        }
    </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
    function fn_back() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISPP = document.getElementById('lblPreviousPage').innerHTML;
        if (THISPP == 0) {
            window.open('../CLIENT/flt_REPORT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=5', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=5', '_self');
        }
    }
    function fn_home() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    function fn_report() {
        var WhichReport = document.getElementById('lbl_Select').innerHTML
        var Asset = document.getElementById('HF_A_ID').value
        var EventType = document.getElementById('HF_ET_ID').value
        var Model = document.getElementById('HF_MOD_ID').value
        var Company = document.getElementById('HF_COM_ID').value
        var Level3 = document.getElementById('HF_Level3').value
        var Status = document.getElementById('HF_Status').value
        var SiteId = document.getElementById('HF_Site').value
        var DateFrom = document.getElementById('HF_From').value
        var DateTo = document.getElementById('HF_To').value
        var EventId = document.getElementById('HF_EventID').value
        var JobId = document.getElementById('HF_JobID').value
        var OK = 1
        if (WhichReport == "Open Events") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Events_Open.rpt&@E_SITE_ID=' + SiteId + "&@E_ET_ID=" + EventType + "&@E_Status=" + Status, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Open Jobs") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Jobs_Open.rpt&@E_SITE_ID=' + SiteId + "&@E_ET_ID=" + EventType + "&@E_A_ID=" + Asset, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Event + 250hrs") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Events_Plus_250.rpt&@E_ET_ID=' + EventType + "&@Asset=" + Asset, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Service Report") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ServiceAndOilSampleMonitor2.rpt&@SiteId=' + SiteId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Blank Magnetic Plug Report") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/BlankMagneticPlugInspection.rpt&@SiteId=' + SiteId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Open Events (between dates)") {
            if (DateTo == "" && OK == 1) {
                alert('You must select a Date')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Events_Open_Month.rpt&@DateFrom=' + DateFrom + "&@DateTo=" + DateTo + "&@E_ET_ID=" + EventType + "&@E_Status=" + Status, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Job Card") {
            if (JobId == "" && OK == 1) {
                alert('You must select a Job')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/JobCard2.rpt&@Event_ID=' + EventId + "&@Job_ID=" + JobId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Job Card (Complete)") {
            if (JobId == "" && OK == 1) {
                alert('You must select a Job')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/JobCard_COMPLETE.rpt&@Event_ID=' + EventId + "&@Job_ID=" + JobId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Estimated Changeout Report") {
            if (DateTo == "" && OK == 1) {
                alert('You must select a Date')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ComponentChangeOutSMUMonitoring.rpt&@EstDateFrom=' + DateFrom + "&@EstDateTo=" + DateTo + "&@Model=" + Model + "&@Asset=" + Asset + "&@Level3=" + Level3, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=1100');
            }
        }
        if (WhichReport == "Timesheet Summary Report") {
            if (DateTo == "" && OK == 1) {
                alert('You must select a Date')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/FleetTimesheetSummaryReport.rpt&@DateFrom=' + DateFrom + "&@DateTo=" + DateTo + "&@Site=" + SiteId + "&@Asset=" + Asset, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Event Costing") {
            if (DateTo == "" && OK == 1) {
                alert('You must select a Date')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Events_Cost.rpt&@E_SITE_ID=' + SiteId + "&@Asset=" + Asset + "&@DateFrom=" + DateFrom + "&@DateTo=" + DateTo + "&@E_ID=" + EventId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Event Costing (Event Search Only)") {
            if (EventId == "" && OK == 1) {
                alert('You must select a Job')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Events_Cost_Event_Only.rpt&@E_ID=' + EventId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Component Changeout History") {
            if (DateTo == "" && OK == 1) {
                alert('You must select a Date')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Component_Life.rpt&@Asset=' + Asset + "&@Model=" + Model + "&@DateFrom=" + DateFrom + "&@DateTo=" + DateTo, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Event MTBS") {
            if (DateTo == "" && OK == 1) {
                alert('You must select a Date')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Events_MTBS.rpt&@DateFrom=' + DateFrom + "&@DateTo=" + DateTo + "&@Asset=" + Asset, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Service Archive") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Service_Archive.rpt&@Site=' + SiteId + "&@DateFrom=" + DateFrom + "&@DateTo=" + DateTo, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Breakdown Events") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Breakdown_Events.rpt&@Site=' + SiteId + "&@Model=" + Model + "&@Company=" + Company, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
    }
    function fn_OpenJobCardBlank() {
        var EventId = "0";
        var JobId = "0";
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/JobCard2.rpt&@Event_ID=' + EventId + "&@Job_ID=" + JobId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
    }
</script>
<body>
    <form id="form1" runat="server">
        
            <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
              <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style2">
                              <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr >
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style27">
                                 <asp:Label ID="lblTitle" runat="server" Text="REPORTS - EVENT MANAGEMENT" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadButton ID="RadBtn_Reset" runat="server" Text="Reset">
                                </telerik:RadButton>
                            </td>
                        </tr>
                    </table>
            <table border="0" style="width: 100%">
                <tr>
                    <td width="15%" class="auto-style1">
                        
                    </td>
                    <td width="17%" class="auto-style2">
                       
                    </td>
                    <td width="17%" class="auto-style2"></td>
                    <td valign="30%" class="auto-style3">

                    </td>
                    <td width="12%" class="auto-style4"></td>
                    <td width="9%" class="auto-style1"></td>
                </tr>
                <tr>
                    <td style="padding-left: 15px;" valign="top">
                        &nbsp;</td>
                    <td style="width: 300px; height: 150px" valign="top">
                        <telerik:RadButton ID="RadBtn_Events_Open" runat="server" Skin="Silk" Text="Open Events" Width="300px" CssClass="auto-style6">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Events_Open_Month" runat="server" Skin="Silk" Text="Open Events (between dates)" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Blank_JobCard" runat="server" Skin="Silk" Text="Blank Job Card" Width="300px" OnClientClicked="fn_OpenJobCardBlank">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Blank_Plug" runat="server" Skin="Silk" Text="Blank Magnetic Plug Report" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Timesheet_Summary_Report" runat="server" Skin="Silk" Text="Timesheet Summary Report" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Component_Life" runat="server" Skin="Silk" Text="Component Changeout History" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Event_MTBS" runat="server" Skin="Silk" Text="Event MTBS" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Breakdown_Events" runat="server" Skin="Silk" Text="Breakdown Events" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Events_250" runat="server" Skin="Silk" Text="Event + 250hrs" Width="300px">
                        </telerik:RadButton>
                    </td>
                    <td style="width: 300px; height: 150px" valign="top">
                        <telerik:RadButton ID="RadBtn_Jobs_Open" runat="server" Skin="Silk" Text="Open Jobs" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Service" runat="server" Skin="Silk" Text="Service Report" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_JobCard" runat="server" Skin="Silk" Text="Job Card" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Changeout_Report" runat="server" Skin="Silk" Text="Estimated Changeout Report" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Event_Costing" runat="server" Skin="Silk" Text="Event Costing" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Event_Costing_Event_Only" runat="server" Skin="Silk" Text="Event Costing (Event Search Only)" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Service_Archive" runat="server" Skin="Silk" Text="Service Archive" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_JobCard_Complete" runat="server" Skin="Silk" Text="Job Card (Complete)" Width="300px">
                        </telerik:RadButton>
                    </td>
                    <td style="border-left: 10px solid #A8A8A8; padding-left: 25px; background-color: Black; text-align: left; vertical-align: top; padding-bottom: 0px;" colspan="3">
                        <table width="800">
                            <tr>
                                <td align="center" colspan="4">
                                    <asp:Label ID="lbl_Select" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Select a Report"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style7" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_Site" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Site:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Site" DataTextField="SITE_Name" DataValueField="SITE_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic"
                                        Skin="Default" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td class="auto-style7">
                                    <asp:Label ID="lbl_EventType" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Event Type:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <telerik:RadComboBox ID="RadCB_EventType" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_EVENT_Type" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                        Filter="Contains"
                                        ResolvedRenderMode="Classic" Width="300px" Visible="False">
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="RadCB_EventType_Jobs" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_EVENT_Type_Jobs" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                        Filter="Contains"
                                        ResolvedRenderMode="Classic" Width="300px" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_From" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="From:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7" valign="middle">
                                    <telerik:RadDatePicker ID="RadDP_From" runat="server" AutoPostBack="True" Skin="Default" Visible="False">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%" AutoPostBack="True">
                                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                            <FocusedStyle Resize="None"></FocusedStyle>

                                            <DisabledStyle Resize="None"></DisabledStyle>

                                            <InvalidStyle Resize="None"></InvalidStyle>

                                            <HoveredStyle Resize="None"></HoveredStyle>

                                            <EnabledStyle Resize="None"></EnabledStyle>
                                        </DateInput>

                                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                    </telerik:RadDatePicker>
                                </td>
                                <td class="auto-style7">
                                    <asp:Label ID="lbl_To" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="To:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7" valign="middle">
                                    <telerik:RadDatePicker ID="RadDP_To" runat="server" AutoPostBack="True" Skin="Default" Visible="False">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%" AutoPostBack="True">
                                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                            <FocusedStyle Resize="None"></FocusedStyle>

                                            <DisabledStyle Resize="None"></DisabledStyle>

                                            <InvalidStyle Resize="None"></InvalidStyle>

                                            <HoveredStyle Resize="None"></HoveredStyle>

                                            <EnabledStyle Resize="None"></EnabledStyle>
                                        </DateInput>

                                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                    </telerik:RadDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_EventID_2" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Event ID:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <telerik:RadNumericTextBox ID="RadTxt_EventID" runat="server" AutoPostBack="True" Visible="False">
                                        <NegativeStyle Resize="None" />
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator="" />
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </telerik:RadNumericTextBox>
                                </td>
                                <td class="auto-style7">
                                    <asp:Label ID="lbl_JobID_2" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Job ID:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <telerik:RadNumericTextBox ID="RadTxt_JobID" runat="server" AutoPostBack="True" Visible="False">
                                        <NegativeStyle Resize="None" />
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator="" />
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
                                <td class="auto-style5" align="right">
                                    <asp:Label ID="lbl_Asset" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Asset:" Visible="False"></asp:Label>
                                    <asp:Label ID="lbl_Company" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Manufacturer:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="RadCB_Asset_MTBS" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Asset_Event" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="RadCB_Asset_Jobs" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Asset_Jobs" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="RadCB_Asset_Event_Plus" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Asset_Event_Plus" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="RadCB_Company" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Company" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td class="auto-style8">
                                    <asp:Label ID="lbl_Level3" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Component:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" DataSourceID="SqlDS_Level3" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="300px" Visible="False" AutoPostBack="True">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="auto-style7">
                                    <asp:Label ID="lbl_Model" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Model:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Model" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="RadCB_Model_ECR" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Model_ECR" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="RadCB_Model_Company" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Model_Company" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td class="auto-style7">
                                    <asp:Label ID="lbl_Status" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Status:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <telerik:RadComboBox ID="RadCB_Status" Runat="server" AutoPostBack="True" Visible="False">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                            <telerik:RadComboBoxItem runat="server" Text="Planning" Value="Planning" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_Asset_Model" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Asset:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <telerik:RadComboBox ID="RadCB_Asset_Model" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Asset_Model" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                    <telerik:RadComboBox ID="RadCB_Asset_Model_ECR" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Asset_Model_ECR" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style7" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="4" width="500px">
                                    <telerik:RadButton ID="RadBtn_Submit" runat="server" Skin="Default" Text="Submit" Visible="False" OnClientClicked="fn_report">
                                    </telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 150px; padding-left: 15px;">
                        </td>
                    <td style="width: 300px; height: 150px"></td>
                    <td style="width: 300px; height: 150px"></td>
                    <td style="width: 150px; padding-left: 10px;"></td>
                </tr>
                <tr>
                    <td style="height: 150px"></td>
                    <td style="width: 300px; height: 150px"></td>
                    <td align="left" style="font-family: 'Segoe UI'; font-size: 10pt; color: #FFFFFF" valign="bottom"></td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblParam1" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblParam2" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblParam3" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblParam4" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblParam5" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblParam6" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                        <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <asp:HiddenField ID="HF_Username" runat="server" />
        <asp:HiddenField ID="HF_SessionIP" runat="server" />
        <asp:HiddenField ID="HF_Site" runat="server" Value="0" />
        <asp:HiddenField ID="HF_From" runat="server" />
        <asp:HiddenField ID="HF_To" runat="server" />
        <asp:HiddenField ID="HF_A_ID" runat="server" />
        <asp:HiddenField ID="HF_ET_ID" runat="server" />
        <asp:HiddenField ID="HF_MOD_ID" runat="server" />
        <asp:HiddenField ID="HF_COM_ID" runat="server" />
        <asp:HiddenField ID="HF_Level1" runat="server" />
        <asp:HiddenField ID="HF_Level2" runat="server" />
        <asp:HiddenField ID="HF_Level3" runat="server" />
        <asp:HiddenField ID="HF_EventID" runat="server" />
        <asp:HiddenField ID="HF_JobID" runat="server" />
        <asp:HiddenField ID="HF_Status" runat="server" Value="Open" />
        <asp:HiddenField ID="HF_Session_ID" runat="server" />
        <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
        <asp:HiddenField ID="HF_EMP_ID" runat="server" />
        <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
         <asp:SqlDataSource ID="SqlDS_SYS" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT SYS_Name, SYS_Version FROM SYSTEM"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_PageCount" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="GET_ROW_ID_SP_2" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblPageName" Name="PC_Page_Name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="lblParam1" Name="PC_Para_1" PropertyName="Text" Type="String" DefaultValue="N/A" />
                <asp:ControlParameter ControlID="lblParam2" Name="PC_Para_2" PropertyName="Text" Type="String" DefaultValue="N/A" />
                <asp:ControlParameter ControlID="lblParam3" Name="PC_Para_3" PropertyName="Text" Type="String" DefaultValue="N/A" />
                <asp:ControlParameter ControlID="lblParam4" Name="PC_Para_4" PropertyName="Text" Type="String" DefaultValue="N/A" />
                <asp:ControlParameter ControlID="lblParam5" Name="PC_Para_5" PropertyName="Text" Type="String" DefaultValue="N/A" />
                <asp:ControlParameter ControlID="lblParam6" Name="PC_Para_6" PropertyName="Text" Type="String" DefaultValue="N/A" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="PC_Accessed_By" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS SITE_ID, '*All Sites' AS SITE_Name UNION ALL SELECT CONVERT (nvarchar(5), SITE_ID) AS SITE_ID, SITE_Name FROM SITE WHERE (SITE_Input = 1) ORDER BY SITE_Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), a.A_ID) AS A_ID, a.A_Asset_ID FROM PLANT_TIMESHEET AS p INNER JOIN ASSET AS a ON p.PLT_A_ID = a.A_ID WHERE (a.A_Status NOT IN ('Trash', 'Delete')) AND (a.A_Activity_Status &lt;&gt; 'Disposed') ORDER BY A_Asset_ID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Asset_Jobs" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), A.A_ID) AS A_ID, A.A_Asset_ID FROM EVENT AS E INNER JOIN ASSET AS A ON E.E_A_ID = A.A_ID INNER JOIN ATTRIBUTES AS ATTET ON E.E_ET_ID = ATTET.ATT_ID LEFT OUTER JOIN JOB ON JOB.J_E_ID = E.E_ID LEFT OUTER JOIN SITE ON E.E_SITE_ID = SITE.SITE_ID WHERE (A.A_Status NOT IN ('Trash', 'Delete')) AND (A.A_Activity_Status &lt;&gt; 'Disposed') AND (JOB.J_Status = 'Open') AND (CONVERT (nvarchar(5), E.E_SITE_ID) LIKE @E_SITE_ID) AND (JOB.J_JT_ID &lt;&gt; 660) AND (CONVERT (nvarchar(5), E.E_ET_ID) LIKE @E_ET_ID) AND (E.E_Status NOT IN ('Cancelled', 'Trash')) ORDER BY A_Asset_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Site" Name="E_SITE_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="RadCB_EventType" Name="E_ET_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Asset_Event_Plus" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT DISTINCT CONVERT(nvarchar(5), A.A_ID) AS A_ID, A.A_Asset_ID FROM EVENT AS E INNER JOIN ASSET AS A ON E.E_A_ID = A.A_ID INNER JOIN ATTRIBUTES AS ATTET ON E.E_ET_ID = ATTET.ATT_ID LEFT OUTER JOIN JOB ON JOB.J_E_ID = E.E_ID LEFT OUTER JOIN SITE ON E.E_SITE_ID = SITE.SITE_ID WHERE (A.A_Status NOT IN ('Trash', 'Delete')) AND (A.A_Activity_Status &lt;&gt; 'Disposed') AND (JOB.J_Status = 'Open') AND (CONVERT(nvarchar(5), E.E_SITE_ID) LIKE @E_SITE_ID) AND (JOB.J_JT_ID &lt;&gt; 660) AND (CONVERT(nvarchar(5), E.E_ET_ID) LIKE @E_ET_ID) AND (E.E_Status NOT IN ('Cancelled', 'Trash')) ORDER BY A_Asset_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Site" Name="E_SITE_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="RadCB_EventType" Name="E_ET_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_EVENT_Type" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS ATT_ID, '*All' AS ATT_Name UNION ALL SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'EVENT_Type') AND (ATT_Status NOT IN ('Trash', 'Delete')) ORDER BY ATT_Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_EVENT_Type_Jobs" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS ATT_ID, '*All' AS ATT_Name UNION ALL SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'EVENT_Type') AND (ATT_Status NOT IN ('Trash', 'Delete')) ORDER BY ATT_Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Model" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS ATT_ID, '*All Models' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT(nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name FROM ATTRIBUTES INNER JOIN ASSET AS a ON ATT_ID = A_MOD_ID INNER JOIN SMU_TRIGGER_MONITORING_ARCHIVE ON A_ID = STMA_A_ID WHERE (a.A_Status NOT IN ('Trash', 'Delete')) AND (a.A_Activity_Status &lt;&gt; 'Disposed') ORDER BY ATT_Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Company" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS ATT_ID, '*All Manufacturers' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT(nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name FROM ATTRIBUTES INNER JOIN ASSET AS a ON ATTRIBUTES.ATT_ID = a.A_COM_ID INNER JOIN EVENT ON a.A_ID = EVENT.E_A_ID WHERE (a.A_Status NOT IN ('Trash', 'Delete')) AND (a.A_Activity_Status &lt;&gt; 'Disposed') AND E_Status NOT IN ('Cancelled','Trash') ORDER BY ATT_Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Model_ECR" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS ATT_ID, '*All Models' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name FROM ATTRIBUTES INNER JOIN ASSET AS a ON ATTRIBUTES.ATT_ID = a.A_MOD_ID INNER JOIN SMU_TRIGGER_MONITORING ON a.A_ID = SMU_TRIGGER_MONITORING.STM_A_ID WHERE (a.A_Status NOT IN ('Trash', 'Delete')) AND (a.A_Activity_Status &lt;&gt; 'Disposed') ORDER BY ATT_Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Model_Company" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS ATT_ID, '*All Models' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name FROM ATTRIBUTES INNER JOIN ASSET AS a ON ATTRIBUTES.ATT_ID = a.A_MOD_ID INNER JOIN EVENT ON a.A_ID = EVENT.E_A_ID WHERE (a.A_Status NOT IN ('Trash', 'Delete')) AND (a.A_Activity_Status &lt;&gt; 'Disposed') AND (EVENT.E_Status NOT IN ('Cancelled', 'Trash')) AND (CONVERT (nvarchar(5), a.A_COM_ID) LIKE @Company) ORDER BY ATT_Name">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Company" Name="Company" PropertyName="SelectedValue" />
            </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Asset_Model" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), A_ID) AS A_ID, A_Asset_ID FROM ASSET WHERE (A_Status NOT IN ('Trash', 'Delete')) AND (A_Activity_Status &lt;&gt; 'Disposed') AND (CONVERT (nvarchar(5), A_MOD_ID) LIKE @Model) ORDER BY A_Asset_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Asset_Model_ECR" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM ASSET INNER JOIN SMU_TRIGGER_MONITORING ON SMU_TRIGGER_MONITORING.STM_A_ID = ASSET.A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (ASSET.A_Activity_Status &lt;&gt; 'Disposed') AND (CONVERT (nvarchar(5), ASSET.A_MOD_ID) LIKE @Model) AND (SMU_TRIGGER_MONITORING.STM_Planning_Status &lt;&gt; 'Trash') ORDER BY A_Asset_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Model_ECR" Name="Model" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Asset_Event" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT DISTINCT CONVERT (nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM EVENT INNER JOIN ASSET ON EVENT.E_A_ID = ASSET.A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (ASSET.A_Activity_Status &lt;&gt; 'Disposed') AND (EVENT.E_Status = 'Complete') AND (EVENT.E_A_ID NOT IN (1785, 1803, 1374, 1749, 1750, 1751, 1752, 1747, 1748, 1355, 1758, 1759)) ORDER BY ASSET.A_Asset_ID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Level3" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS ATT_ID, '*All' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name + ' : ' + ATTRIBUTES.ATT_Description AS ATT_Name FROM ATTRIBUTES INNER JOIN SMU_TRIGGER_MONITORING ON ATTRIBUTES.ATT_ID = SMU_TRIGGER_MONITORING.STM_Code_Level_3 WHERE (ATTRIBUTES.ATT_TABLE = 'SMU_Trigger_Task_Code_Header') AND (ATTRIBUTES.ATT_FLAG = 3) AND (ATTRIBUTES.ATT_Status &lt;&gt; 'Trash') ORDER BY ATT_Name"></asp:SqlDataSource>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Reset">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Events_Open">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Events_Open_Month">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Blank_Plug">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Timesheet_Summary_Report">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Jobs_Open">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Events_250">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Service">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_JobCard">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadBtn_JobCard_Complete">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Changeout_Report">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Event_Costing">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Event_Costing_Event_Only">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Component_Life">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Event_MTBS">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Service_Archive">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadBtn_Breakdown_Events">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_EventID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_JobID_2" />
                        <telerik:AjaxUpdatedControl ControlID="RadTxt_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Company" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                         <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_MTBS" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_EventType_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="HF_ET_ID" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDP_From">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_From" />
                        <telerik:AjaxUpdatedControl ControlID="HF_To" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Level1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Level2" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Level3" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDP_To">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_To" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Level1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Level2" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Level3" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadTxt_EventID">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_EventID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadTxt_JobID">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_JobID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Company">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Model_Company" />
                        <telerik:AjaxUpdatedControl ControlID="HF_COM_ID" />
                         <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Asset_MTBS">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Submit">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_EventType">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="HF_ET_ID" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadCB_EventType_Jobs">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="HF_ET_ID" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Jobs" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Event_Plus" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                         <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Asset_Model">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadCB_Asset_Jobs">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadCB_Asset_Event_Plus">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Asset_Model_ECR">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Model_ECR">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Model_ECR" />
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Level3">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
    </form>

</body>
</html>

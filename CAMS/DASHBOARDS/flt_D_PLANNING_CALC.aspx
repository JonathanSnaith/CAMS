<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET - Component Changeout Calculator" CodeFile="flt_D_PLANNING_CALC.aspx.vb" Inherits="DASHBOARDS_flt_D_PLANNING_CALC" %>
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
            width: 244px;
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

        .auto-style18 {
            width: 391px;
        }

        .auto-style19 {
            width: 90px;
        }

        .auto-style25 {
            width: 88px;
        }

        .auto-style26 {
            width: 150px;
            font-size: 16px;
            color: white;
        }

        .auto-style27 {
            width: 150px;
        }

        .auto-style28 {
            width: 213px;
        }

        .auto-style29 {
            width: 155px;
        }
        .auto-style30 {
            left: 105px;
            top: 1px;
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
            window.open('flt_D_PLANNING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
        }
        if (THISPP == 1) {
            window.open('flt_D_PLANNING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
        }
        if (THISPP == 2) {
            window.open('flt_D_PLANNING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
        }
    }
     function getAjaxManager()
                {
                    return $find("<%=RadAjaxManager1.ClientID%>");
                }
    (function (global, undefined) {
        global.OnClientSeriesClicked = function (sender, args) {
            var ajaxManager = global.getAjaxManager();

            if (args.get_seriesName() !== "OverallDate") {
                ajaxManager.ajaxRequest(args.get_category());
            }
        }
    })(window);
    function fn_report() {
        var Model = document.getElementById('HF_MOD_ID').value
        var Asset = document.getElementById('HF_A_ID').value
        var Level3 = document.getElementById('HF_Level3').value
        var Status = document.getElementById('HF_Status').value
        var FrequencyNew = document.getElementById('HF_New_Hours').value
        var TrendPeriod = document.getElementById('HF_New_Trend_Period').value
        var TrendNew = document.getElementById('HF_New_Trend').value
        var DateFrom = document.getElementById('HF_From').value
        var DateTo = document.getElementById('HF_To').value
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/ComponentChangeOutCalculator.rpt&@Model=' + Model + "&@Asset=" + Asset + "&@Level3=" + Level3 + "&@Status=" + Status + "&@FrequencyNew=" + FrequencyNew + "&@TrendPeriod=" + TrendPeriod + "&@TrendNew=" + TrendNew + "&@DateFrom=" + DateFrom + "&@DateTo=" + DateTo, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=1100');

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
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #E46C0A; text-align: right;" valign="middle">
                                  &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/metro_icon_printer_multi.png" id="Img1" onclick="fn_report()" style="cursor: pointer" />
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 14px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style18" rowspan="3">
                                 <strong>
                                 <asp:Label ID="lblTitle" runat="server" Font-Bold="True" ForeColor="White" Text="COMPONENT CHANGEOUT BUDGET CALCULATOR"></asp:Label>
                                 </strong>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style19" rowspan="3">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Default" Text="Reset" Width="60px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style27">
                                Model:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style9">
                                <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Model" DataTextField="Model" DataValueField="A_MOD_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style29">
                                Asset:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" EnableCheckAllItemsCheckBox="True" ResolvedRenderMode="Classic" Skin="Default" CheckBoxes="True">
                                     <Localization AllItemsCheckedString="*All Assets" CheckAllString="*All Assets" />
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style28">
                                 Component:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Level3" DataTextField="ATT_Name" DataValueField="ATT_ID_3" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default" Width="250px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style25">
                                Repair Code:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style15">
                                 <telerik:RadComboBox ID="RadCB_Repair_Code" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Repair_Code" DataTextField="ATT_Name" DataValueField="ATT_ID_RC" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default" Width="200px">
                                 </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="auto-style26" style="padding-left: 15px; background-color: #999999; text-align: right;">
                                <asp:Label ID="lblNewHours" runat="server" Text="New Hours" Visible="False"></asp:Label>
                            </td>
                            <td align="left" class="auto-style9" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadNumericTextBox ID="RadNumTxt_New_Hours" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="200000" MinValue="0" Width="70px" AutoPostBack="True" Visible="False">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                            </td>
                            <td align="left" class="auto-style29" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                                <asp:Label ID="lblNewTrend" runat="server" Text="New Trend"></asp:Label>
                            </td>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;">
                                <telerik:RadNumericTextBox ID="RadNumTxt_New_Trend" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="200" MinValue="0" Width="50px" AutoPostBack="True">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                            </td>
                            <td align="left" class="auto-style28" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">New Trend Period</td>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;">
                                <telerik:RadNumericTextBox ID="RadNumTxt_New_Trend_Period" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="24" MinValue="0" Width="50px" AutoPostBack="True">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                                (Months)</td>
                            <td align="left" class="auto-style25" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">Status: </td>
                            <td align="left" class="auto-style15" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Status" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Status" DataTextField="STM_Planning_Status_Text" DataValueField="STM_Planning_Status" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="auto-style26" style="padding-left: 15px; background-color: #999999; text-align: right;">From: </td>
                            <td align="left" class="auto-style9" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
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
                            <td align="left" class="auto-style29" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                                <telerik:RadButton ID="btn_ResetChart" runat="server" CssClass="auto-style30" Skin="Default" Text="Reset Chart" Visible="False" Width="70px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;">&nbsp;</td>
                            <td align="left" class="auto-style28" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">To: </td>
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
                            <td align="left" class="auto-style25" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">&nbsp;</td>
                            <td align="left" class="auto-style15" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">&nbsp;</td>
                        </tr>
                    </table>
                <table width="99%" >
                    <tr>
                        <td class="style7" colspan="2" style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; color: #000000;">
                              <telerik:RadHtmlChart ID="RadChart1" runat="server" BackColor="White" DataSourceID="SqlDS_RadGrid_PLANNING_CHART_YEAR" Skin="Silk" Width="100%" Height="500px" Visible="False"
                                  OnClientSeriesClicked="OnClientSeriesClicked">
                                                <ChartTitle Text="Current vs Projected Spend - (Financial Year)"></ChartTitle>
                                                <Legend>
                                                    <Appearance Position="Top"></Appearance>
                                                </Legend>
                                     <Zoom Enabled="true">
                                        <MouseWheel Enabled="true" />
                                        <Selection Enabled="true" ModifierKey="Shift"  />
                                    </Zoom>
                                     <Pan Enabled="true" ModifierKey="Alt" />
                                                <PlotArea>
                                                    <CommonTooltipsAppearance Color="#FFFFFF">
                                                                 <ClientTemplate>
                                                                    #=dataItem.YearSort#
                                                                </ClientTemplate>
                                                        </CommonTooltipsAppearance>
                                                    <Series>
                                                         <telerik:LineSeries DataFieldY="CustomCost" Name="Projected" >
                                                            <LabelsAppearance Visible="True" DataFormatString="{0:£#,##0}" ></LabelsAppearance>
                                                            <Appearance FillStyle-BackgroundColor="#2d96ff" />
                                                            <MarkersAppearance BorderColor="#2d96ff" />
                                                        </telerik:LineSeries>
                                                    </Series>
                                                     <Series>
                                                        <telerik:LineSeries DataFieldY="CurrentCost" Name="Current" >
                                                            <LabelsAppearance Visible="True" DataFormatString="{0:£#,##0}" ></LabelsAppearance>
                                                            <Appearance FillStyle-BackgroundColor="#e46c0a" />
                                                            <MarkersAppearance BorderColor="#e46c0a" />
                                                        </telerik:LineSeries>
                                                    </Series>
                                                    <XAxis DataLabelsField="YearSort" EnableBaseUnitStepAuto="False" Type="Auto" BaseUnit="Auto" Name="Year">
                                                        <LabelsAppearance RotationAngle="0" ></LabelsAppearance>
                                                    </XAxis>
                                                    <YAxis>
                                                        <LabelsAppearance DataFormatString="{0:£#,##0}" />
                                                    </YAxis>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9" style="text-align: left; vertical-align: top;" colspan="2">
                            <telerik:RadGrid ID="RadGrid_PLANNING" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_PLANNING" ResolvedRenderMode="Classic" Width="100%" Height="100%">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="STM_ID" DataKeyNames="STM_ID" DataSourceID="SqlDS_RadGrid_PLANNING" NoMasterRecordsText="No plans to display." PageSize="30">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="STM_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter STM_ID column" HeaderText="Trigger ID" ReadOnly="True" SortExpression="STM_ID" UniqueName="STM_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Asset" Display="True" FilterControlAltText="Filter Asset column" HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Model" Display="True" FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True" SortExpression="Model" UniqueName="Model">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column" HeaderText="Component" ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                            <HeaderStyle Width="250px" Wrap="False" />
                                            <ItemStyle Width="250px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Position" Display="True" FilterControlAltText="Filter Position column" HeaderText="Position" ReadOnly="True" SortExpression="Position" UniqueName="Position">
                                            <HeaderStyle Width="150px" Wrap="True" />
                                            <ItemStyle Width="150px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="RepairCode" Display="True" FilterControlAltText="Filter RepairCode column" HeaderText="Repair Code" ReadOnly="True" SortExpression="RepairCode" UniqueName="RepairCode">
                                            <HeaderStyle Width="150px" Wrap="True" />
                                            <ItemStyle Width="150px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Cost" DataFormatString="{0:£#,##0}" FilterControlAltText="Filter Cost column" HeaderText="Cost" ReadOnly="True" SortExpression="Cost" UniqueName="Cost">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Planning_Status" Display="False" FilterControlAltText="Filter STM_Planning_Status column" HeaderText="Status" ReadOnly="True" SortExpression="STM_Planning_Status" UniqueName="STM_Planning_Status">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Frequency" FilterControlAltText="Filter STM_Frequency column" HeaderText="Current Planned Hours" ReadOnly="True" SortExpression="STM_Frequency" UniqueName="STM_Frequency">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_SMU_Value" FilterControlAltText="Filter STM_SMU_Value column" HeaderText="Current Component Hours" ReadOnly="True" SortExpression="STM_SMU_Value" UniqueName="STM_SMU_Value">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ChangeDue" Display="True" FilterControlAltText="Filter ChangeDue column" HeaderText="Change Due (Hours)" ReadOnly="True" SortExpression="ChangeDue" UniqueName="ChangeDue">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Adjustment" Display="True" FilterControlAltText="Filter STM_Adjustment column" HeaderText="Adjustment" ReadOnly="True" SortExpression="STM_Adjustment" UniqueName="STM_Adjustment">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Trend_Current" FilterControlAltText="Filter Trend_Current column" HeaderText="Current Trend" ReadOnly="True" SortExpression="Trend_Current" UniqueName="Trend_Current">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="False" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Date_Estimate" DataFormatString="{0:dd MMM yyyy}" Display="True" FilterControlAltText="Filter STM_Date_Estimate column" HeaderText="Current Estimated Change Date" ReadOnly="True" SortExpression="STM_Date_Estimate" UniqueName="STM_Date_Estimate">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Frequency_Custom" FilterControlAltText="Filter STM_Frequency_Custom column" HeaderText="Projected Planned Hours" ReadOnly="True" SortExpression="STM_Frequency_Custom" UniqueName="STM_Frequency_Custom">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Trend_Custom" FilterControlAltText="Filter Trend_Custom column" HeaderText="Custom/Projected Trend" ReadOnly="True" SortExpression="Trend_Custom" UniqueName="Trend_Custom">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="False" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Date_Estimate_Custom" DataFormatString="{0:dd MMM yyyy}" Display="True" FilterControlAltText="Filter STM_Date_Estimate_Custom column" HeaderText="Projected Estimated Change Date" ReadOnly="True" SortExpression="STM_Date_Estimate_Custom" UniqueName="STM_Date_Estimate_Custom">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EstimateDiff" Display="True" FilterControlAltText="Filter EstimateDiff column" HeaderText="Difference (Days)" ReadOnly="True" SortExpression="EstimateDiff" UniqueName="EstimateDiff">
                                            <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="False" />
                                            <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" style="text-align: left; vertical-align: top;">
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
<asp:HiddenField ID="HF_MOD_ID" runat="server" Value="%" />
<asp:HiddenField ID="HF_Level3" runat="server" Value="%" />
<asp:HiddenField ID="HF_Repair_Code" runat="server" Value="%" />
<asp:HiddenField ID="HF_From" runat="server" Value="1900-01-01" />
<asp:HiddenField ID="HF_To" runat="server" Value="2100-01-01" />
<asp:HiddenField ID="HF_A_ID" runat="server" Value="%" />
<asp:HiddenField ID="HF_Status" runat="server" Value="%" />
<asp:HiddenField ID="HF_New_Hours" runat="server" Value="0" />
<asp:HiddenField ID="HF_New_Trend" runat="server" Value="0" />
<asp:HiddenField ID="HF_New_Trend_Period" runat="server" Value="0" />
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
            SelectCommand="SELECT DISTINCT CONVERT (nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM ASSET INNER JOIN SMU_TRIGGER_MONITORING ON SMU_TRIGGER_MONITORING.STM_A_ID = ASSET.A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (ASSET.A_Activity_Status &lt;&gt; 'Disposed') AND (CONVERT (nvarchar(5), ASSET.A_MOD_ID) LIKE @Model) AND (SMU_TRIGGER_MONITORING.STM_Planning_Status &lt;&gt; 'Trash') ORDER BY ASSET.A_Asset_ID">
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
            SelectCommand="EM_PLANNING_CALCULATOR_VIRTUAL_CB_L3" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HF_A_ID" Name="Asset" PropertyName="Value" DefaultValue="%" Type="String" />
                        </SelectParameters>
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDS_Repair_Code" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_CALCULATOR_VIRTUAL_CB_RC" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HF_A_ID" Name="Asset" PropertyName="Value" DefaultValue="%" Type="String" />
                        </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Status" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_CALCULATOR_VIRTUAL_CB_STATUS" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HF_A_ID" Name="Asset" PropertyName="Value" DefaultValue="%" Type="String" />
                        <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" />
                    </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_RadGrid_PLANNING" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_CALCULATOR_VIRTUAL" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
             <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                  <asp:ControlParameter ControlID="HF_A_ID" Name="Asset" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" DefaultValue="%" />
                  <asp:ControlParameter ControlID="RadCB_Repair_Code" Name="RepairCode" PropertyName="SelectedValue" DefaultValue="%" />
                 <asp:ControlParameter ControlID="RadCB_Status" Name="Status" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Hours" Name="FrequencyNew" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Trend_Period" Name="TrendPeriod" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Trend" Name="TrendNew" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="DateFrom" DbType="Date" Name="DateFrom" PropertyName="SelectedDate" DefaultValue="1900-01-01" />
                 <asp:ControlParameter ControlID="DateTo" DbType="Date" Name="DateTo" PropertyName="SelectedDate" DefaultValue="2100-01-01" />
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_RadGrid_PLANNING_CHART_MONTH" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_CALCULATOR_VIRTUAL_CHART_MONTH" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
             <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                 <asp:ControlParameter ControlID="HF_A_ID" Name="Asset" PropertyName="Value" Type="String" />
                 <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" DefaultValue="%" />
                  <asp:ControlParameter ControlID="RadCB_Repair_Code" Name="RepairCode" PropertyName="SelectedValue" DefaultValue="%" />
                 <asp:ControlParameter ControlID="RadCB_Status" Name="Status" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Hours" Name="FrequencyNew" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Trend_Period" Name="TrendPeriod" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Trend" Name="TrendNew" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="DateFrom" DbType="Date" Name="DateFrom" PropertyName="SelectedDate" DefaultValue="1900-01-01" />
                 <asp:ControlParameter ControlID="DateTo" DbType="Date" Name="DateTo" PropertyName="SelectedDate" DefaultValue="2100-01-01" />
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_RadGrid_PLANNING_CHART_QUARTER" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_CALCULATOR_VIRTUAL_CHART_QUARTER" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
                 <asp:Parameter Name="Year"></asp:Parameter>
             <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                    <asp:ControlParameter ControlID="HF_A_ID" Name="Asset" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" DefaultValue="%" />
                  <asp:ControlParameter ControlID="RadCB_Repair_Code" Name="RepairCode" PropertyName="SelectedValue" DefaultValue="%" />
                 <asp:ControlParameter ControlID="RadCB_Status" Name="Status" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Hours" Name="FrequencyNew" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Trend_Period" Name="TrendPeriod" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Trend" Name="TrendNew" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="DateFrom" DbType="Date" Name="DateFrom" PropertyName="SelectedDate" DefaultValue="1900-01-01" />
                 <asp:ControlParameter ControlID="DateTo" DbType="Date" Name="DateTo" PropertyName="SelectedDate" DefaultValue="2100-01-01" />
                  
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_RadGrid_PLANNING_CHART_YEAR" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_PLANNING_CALCULATOR_VIRTUAL_CHART_YEAR" 
            SelectCommandType="StoredProcedure" >
             <SelectParameters>
             <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                    <asp:ControlParameter ControlID="HF_A_ID" Name="Asset" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="RadCB_Level3" Name="Level3" PropertyName="SelectedValue" DefaultValue="%" />
                  <asp:ControlParameter ControlID="RadCB_Repair_Code" Name="RepairCode" PropertyName="SelectedValue" DefaultValue="%" />
                 <asp:ControlParameter ControlID="RadCB_Status" Name="Status" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Hours" Name="FrequencyNew" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Trend_Period" Name="TrendPeriod" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_New_Trend" Name="TrendNew" Type="Double" DefaultValue="0" />
                 <asp:ControlParameter ControlID="DateFrom" DbType="Date" Name="DateFrom" PropertyName="SelectedDate" DefaultValue="1900-01-01" />
                 <asp:ControlParameter ControlID="DateTo" DbType="Date" Name="DateTo" PropertyName="SelectedDate" DefaultValue="2100-01-01" />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" Skin="Silk">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" OnAjaxRequest="RadAjaxManager1_AjaxRequest" RequestQueueSize="1">
            <AjaxSettings>
                 <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="btn_ResetChart">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_New_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="HF_New_Trend" />
                            <telerik:AjaxUpdatedControl ControlID="HF_New_Trend_Period" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Repair_Code" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="lblNewHours" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Trend" />
                            <telerik:AjaxUpdatedControl ControlID="lblNewTrend" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Trend_Period" />
                            <telerik:AjaxUpdatedControl ControlID="DateFrom" />
                            <telerik:AjaxUpdatedControl ControlID="DateTo" />
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                            <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                          <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                          <telerik:AjaxUpdatedControl ControlID="HF_New_Hours" />
                          <telerik:AjaxUpdatedControl ControlID="HF_New_Trend" />
                          <telerik:AjaxUpdatedControl ControlID="HF_New_Trend_Period"/>
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Repair_Code" />
                          <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                          <telerik:AjaxUpdatedControl ControlID="lblNewHours" />
                          <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Hours" />
                          <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Trend" />
                          <telerik:AjaxUpdatedControl ControlID="lblNewTrend" />
                          <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Trend_Period" />
                          <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                          <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                          <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        <telerik:AjaxUpdatedControl ControlID="HF_New_Hours"/>
                        <telerik:AjaxUpdatedControl ControlID="HF_New_Trend" />
                        <telerik:AjaxUpdatedControl ControlID="HF_New_Trend_Period" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Repair_Code" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lblNewHours" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Hours" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Trend" />
                        <telerik:AjaxUpdatedControl ControlID="lblNewTrend" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Trend_Period" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Level3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="lblNewHours" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Trend" />
                            <telerik:AjaxUpdatedControl ControlID="lblNewTrend" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                            <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadCB_Repair_Code">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Repair_Code" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                            <telerik:AjaxUpdatedControl ControlID="lblNewHours" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Hours" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_New_Trend" />
                            <telerik:AjaxUpdatedControl ControlID="lblNewTrend" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                            <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_Status" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                          <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                          <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadNumTxt_New_Hours">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_New_Hours" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                          <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                          <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadNumTxt_New_Trend">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_New_Trend" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                          <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                          <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadNumTxt_New_Trend_Period">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_New_Trend_Period" />
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                          <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                          <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadGrid_PLANNING">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="DateFrom">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_From" />
<%--                          <telerik:AjaxUpdatedControl ControlID="DateTo" />
                          <telerik:AjaxUpdatedControl ControlID="HF_To" />--%>
                           <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                          <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                          <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="DateTo">
                      <UpdatedControls>
                          <telerik:AjaxUpdatedControl ControlID="HF_To" />
                          <telerik:AjaxUpdatedControl ControlID="DateTo" />
                           <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                          <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                          <telerik:AjaxUpdatedControl ControlID="btn_ResetChart" />
                      </UpdatedControls>
                  </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
                <asp:Literal ID="itemsClientSide" runat="server" />
</div>
    </form>
</body>
</html>


<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Dashboards - Brake Testing" CodeFile="flt_D_BRAKE_TESTING.aspx.vb" Inherits="DASHBOARDS_flt_D_BRAKE_TESTING" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
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

        .auto-style5 {
            width: 180px;
        }
        .auto-style6 {
            width: 260px;
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
    }
    function fn_1() {
        var Asset = document.getElementById('HF_Asset').value;
        var DateFrom = document.getElementById('HF_From').value
        var DateTo = document.getElementById('HF_To').value
        window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Average_Brake_Test_Time.rpt&@Asset=' + Asset + "&@DateFrom=" + DateFrom + "&@DateTo=" + DateTo, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
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
                                
                            </td>
                             <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: left;" valign="middle">
                            </td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style3" rowspan="2">
                                <asp:Label ID="lblTitle" runat="server" Text="BRAKE TESTING" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" rowspan="2">
                                <telerik:RadButton ID="RadBtn_Reset" runat="server" Text="Reset" Skin="Glow">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" rowspan="2">
                                Customer:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2" class="auto-style6">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="250px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" rowspan="2">
                                <asp:Label ID="lblFrom" runat="server" Text="From:"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadMonthYearPicker ID="RadDP_From" runat="server" AutoPostBack="True" Width="150px" Skin="Glow">
                                    <DateInput AutoPostBack="True" DateFormat="MMMM yyyy" DisplayDateFormat="MMMM yyyy" LabelWidth="40%">
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </DateInput>
                                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                    <MonthYearNavigationSettings DateIsOutOfRangeMessage="Cancel" />
                                </telerik:RadMonthYearPicker>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" rowspan="2">
                                <asp:Label ID="lblTo" runat="server" Text="To:"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadMonthYearPicker ID="RadDP_To" runat="server" AutoPostBack="True" Width="150px" Skin="Glow">
                                    <DateInput AutoPostBack="True" DateFormat="MMMM yyyy" DisplayDateFormat="MMMM yyyy" LabelWidth="40%">
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </DateInput>
                                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                    <MonthYearNavigationSettings DateIsOutOfRangeMessage="Cancel" />
                                </telerik:RadMonthYearPicker>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" rowspan="2">
                                <asp:Label ID="lblAsset" runat="server" Text="Asset:"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" CheckBoxes="True" DataTextField="A_Asset_ID" DataValueField="A_ID" EnableCheckAllItemsCheckBox="True" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                    <Localization AllItemsCheckedString="*All Assets" CheckAllString="*All Assets" />
                                </telerik:RadComboBox>
                                <asp:Label ID="lbl_AssetText" runat="server">*All Assets</asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadButton ID="Button1" runat="server" Text="Go" Skin="Glow">
                                </telerik:RadButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;">
                                <asp:Label ID="lbl_From" runat="server"></asp:Label>
                            </td>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;">
                                <asp:Label ID="lbl_To" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td class="style9" colspan="2" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid2" runat="server" Skin="Glow" ResolvedRenderMode="Classic" Visible="False">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="BRK_A_ID" NoMasterRecordsText="No records to display." >
                                        <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                        <Columns>
                                              <telerik:GridBoundColumn DataField="BRK_Date_Full" DataFormatString="{0:dd MMM yyyy}"
                                            Display="True" FilterControlAltText="Filter BRK_Date_Full column" HeaderText="Date"
                                            ReadOnly="True" SortExpression="BRK_Date_Full" UniqueName="BRK_Date_Full">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Asset" Display="True"
                                                FilterControlAltText="Filter Asset column" HeaderText="Asset" ReadOnly="True"
                                                SortExpression="Asset" UniqueName="Asset">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="BRK_Value" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter BRK_Value column" HeaderText="Efficiency (%)" ReadOnly="True"
                                                SortExpression="BRK_Value" UniqueName="BRK_Value">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn DataField="BRK_HandBrake" Display="True"
                                                FilterControlAltText="Filter BRK_HandBrake column" HeaderText="HandBrake Test Result" ReadOnly="True"
                                                SortExpression="BRK_HandBrake" UniqueName="BRK_HandBrake">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="BRK_SMU" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter BRK_SMU column" HeaderText="SMU" ReadOnly="True"
                                                SortExpression="BRK_SMU" UniqueName="BRK_SMU">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="DaysDiff" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter DaysDiff column" HeaderText="Days Since Last Test" ReadOnly="True"
                                                SortExpression="DaysDiff" UniqueName="DaysDiff">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="WeeksDiff" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter WeeksDiff column" HeaderText="Weeks Since Last Test" ReadOnly="True"
                                                SortExpression="WeeksDiff" UniqueName="WeeksDiff">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView><GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"></ExportSettings>
                                </telerik:RadGrid></td>
                        </tr>
                        <tr>
                            <td class="style9" style="text-align: left; vertical-align: top;">
                                <telerik:RadHtmlChart ID="RadHtmlChart11" runat="server" BackColor="White" Skin="Glow" Visible="False" Width="1800px">
                                    <ChartTitle Text="Brake Testing - Efficiency"></ChartTitle>
                                    <Legend>
                                        <Appearance Position="Top"></Appearance>
                                    </Legend>
                                       <Zoom Enabled="true">
                                        <MouseWheel Enabled="true" />
                                        <Selection Enabled="true" ModifierKey="Shift"  />
                                    </Zoom>
                                     <Pan Enabled="true" ModifierKey="Alt" />
                                    <PlotArea>
                                        <Series>
                                            <telerik:LineSeries DataFieldY="BRK_Value" Name="Efficiency (%)">
                                                <Appearance FillStyle-BackgroundColor="#000000" />
                                                <MarkersAppearance BorderColor="#000000" />
                                                <TooltipsAppearance Color="#FFFFFF" >
                                                 <ClientTemplate>
                                                     <b>Asset: #=dataItem.Asset# </b>
                                                     <br/>
                                                     <br/>
                                                       <b>Date: #= kendo.format(\'{0:dd MMM yyyy}\', dataItem.BRK_Date_Full)#</b>
                                                        <br/> 
                                                        <b>HandBrake: #=dataItem.BRK_HandBrake# </b>
                                                        <br/>
                                                        <b>SMU: #=dataItem.BRK_SMU# </b>
                                                        <br/> 
                                                      <br/> 
                                                      <b>Days Since Last Test: #=dataItem.DaysDiff# </b>
                                                        <br/> 
                                                     <b>Weeks Since Last Test: #=dataItem.WeeksDiff# </b>
                                                        <br/> 
                                                    </ClientTemplate>
                                                    </TooltipsAppearance>
                                            </telerik:LineSeries>
                                            <telerik:LineSeries DataFieldY="BRK_Ratio" Name="Target Ratio (%)">
                                                <Appearance FillStyle-BackgroundColor="#e46c0a" />
                                                <MarkersAppearance BorderColor="#e46c0a" />
                                            </telerik:LineSeries>
                                        </Series>
                                        <XAxis DataLabelsField="BRK_Date_Full" >
                                            <LabelsAppearance RotationAngle="75"  />
                                            <LabelsAppearance DataFormatString="MMM-yy">
                                            </LabelsAppearance>
                                        </XAxis>
                                        <YAxis MaxValue="100" Step="10">
                                        </YAxis>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
                            </td>
                            <td valign="middle">
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style9" style="text-align: left; vertical-align: top;">
                                <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" Skin="Glow" Visible="False" Width="1200px">
                                       <Zoom Enabled="true">
                                        <MouseWheel Enabled="true" />
                                        <Selection Enabled="true" ModifierKey="Shift"  />
                                    </Zoom>
                                     <Pan Enabled="true" ModifierKey="Alt" />
                                    <PlotArea>
                                        <Series>
                                            <telerik:LineSeries DataFieldY="FLPercent" Name="Front Left">
                                                <Appearance FillStyle-BackgroundColor="#7bb33e" />
                                                <MarkersAppearance BorderColor="#7bb33e" />
                                                <TooltipsAppearance BackgroundColor="#7BB33E" Color="White"> 
                                                     <ClientTemplate>
                                                                    #=dataItem.FrontLeft#
                                                                </ClientTemplate>
                                                  </TooltipsAppearance>
                                            </telerik:LineSeries>
                                             <telerik:LineSeries DataFieldY="FRPercent" Name="Front Right">
                                                <Appearance FillStyle-BackgroundColor="#008000" />
                                                <MarkersAppearance BorderColor="#008000" />
                                                 <TooltipsAppearance BackgroundColor="#008000" Color="White"> 
                                                     <ClientTemplate>
                                                                    #=dataItem.FrontRight#
                                                                </ClientTemplate>
                                                  </TooltipsAppearance>
                                            </telerik:LineSeries>
                                             <telerik:LineSeries DataFieldY="RLPercent" Name="Rear Left">
                                                <Appearance FillStyle-BackgroundColor="#349eb1" />
                                                <MarkersAppearance BorderColor="#349eb1" />
                                                  <TooltipsAppearance BackgroundColor="#349eb1" Color="White"> 
                                                     <ClientTemplate>
                                                                    #=dataItem.RearLeft#
                                                                </ClientTemplate>
                                                  </TooltipsAppearance>
                                            </telerik:LineSeries>
                                             <telerik:LineSeries DataFieldY="RRPercent" Name="Rear Right">
                                                <Appearance FillStyle-BackgroundColor="#0080ff" />
                                                <MarkersAppearance BorderColor="#0080ff" />
                                                 <TooltipsAppearance BackgroundColor="#0080ff" Color="White"> 
                                                     <ClientTemplate>
                                                                    #=dataItem.RearRight#
                                                                </ClientTemplate>
                                                  </TooltipsAppearance>
                                            </telerik:LineSeries>
                                        </Series>
                                        <XAxis DataLabelsField="J_Date_Closed">
                                            <LabelsAppearance RotationAngle="75" />
                                            <LabelsAppearance DataFormatString="MMM-yy">
                                            </LabelsAppearance>
                                        </XAxis>
                                        <YAxis>
                                            <TitleAppearance Text="BWM" />
                                        </YAxis>
                                    </PlotArea>
                                    <Legend>
                                        <Appearance Visible="True" />
                                    </Legend>
                                    <ChartTitle Text="Brake Wear Measurements">
                                    </ChartTitle>

                                </telerik:RadHtmlChart>
                            </td>
                            <td valign="middle">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6" style="text-align: left; vertical-align: top;"></td>
                            <td class="style5" style="text-align: left;"></td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_From" runat="server" />
            <asp:HiddenField ID="HF_To" runat="server" />
            <asp:HiddenField ID="HF_Asset" runat="server" Value="-1," />
            <asp:HiddenField ID="HF_A_BWM" runat="server" />
            <asp:HiddenField ID="HF_PlotBandFrom" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PlotBandTo" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PlotBandFrom2" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PlotBandTo2" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadBtn_Reset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_AssetText" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart11" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_From">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart11" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_To">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart11" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Button1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart11" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <asp:Literal ID="itemsClientSide" runat="server" />
        </div>
    </form>
</body>
</html>


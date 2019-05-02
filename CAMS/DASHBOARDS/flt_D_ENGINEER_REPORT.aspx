<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Dashboards - Engineer Report" CodeFile="flt_D_ENGINEER_REPORT.aspx.vb" Inherits="DASHBOARDS_flt_D_ENGINEER_REPORT" %>
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
            width: 213px;
        }
        .auto-style8 {
            width: 250px;
        }
        .auto-style9 {
            width: 270px;
        }
        .auto-style12 {
            width: 261px;
        }
        .auto-style13 {
            width: 239px;
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
    //function fn_report() {
    //    var SiteId = document.getElementById('HF_Site').value
    //    var DateFrom = document.getElementById('HF_From').value
    //    var DateTo = document.getElementById('HF_To').value
    //    var PEREMPId = document.getElementById('HF_Engineer').value
    //    if (SiteId == "0") {
    //        SiteId = "%"
    //    }
    //    if (PEREMPId == "0") {
    //        PEREMPId = "%"
    //    }
    //    window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Engineers_Jobs.rpt&@Site=' + SiteId + "&@DateFrom=" + DateFrom + "&@DateTo=" + DateTo + "&@Fitter=" + PEREMPId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
    //}
    function OnClientSeriesClicked(sender, args) {
        //Toggle the explode state of the clicked item
        args.get_dataItem().IsExploded = !args.get_dataItem().IsExploded;
        //Disable the animation
        sender.set_transitions(false);
        //Repaint the chart
        sender.repaint();
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style6">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle" class="auto-style8">
                    <%--          <telerik:RadButton ID="RadBtn_Report" runat="server" OnClientClicked="fn_report" Skin="Glow" Text="Data Report">
                                 </telerik:RadButton>--%>
                                <asp:Table ID="Table101" runat="server" BorderColor="White" BorderStyle="Dashed" BorderWidth="2px" CellSpacing="0" Height="75px" Style="cursor: pointer" Visible="False" Width="220px">
                                    <asp:TableRow ID="TableRow1" runat="server">
                                        <asp:TableCell ID="ID_1_A" runat="server" BackColor="#2c3338" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="lblCount_1" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip=""></asp:Label>
                                                            <%--<asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />--%>
                                                        </td>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="Label1" runat="server" Text="avg job time" ForeColor="White" Font-Size="10"></asp:Label>
                                                           
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
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle" class="auto-style8">
                                <asp:Table ID="Table102" runat="server" BorderColor="White" BorderStyle="Dashed" BorderWidth="2px" CellSpacing="0" Height="75px" Style="cursor: pointer" Visible="False" Width="220px">
                                    <asp:TableRow ID="TableRow2" runat="server">
                                        <asp:TableCell ID="ID_2_A" runat="server" BackColor="#2c3338" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="lblCount_2" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip=""></asp:Label>
                                                            <%--<asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />--%>
                                                        </td>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="Label2" runat="server" Text="avg time diff." ForeColor="White" Font-Size="10"></asp:Label>
                                                           
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
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle" class="auto-style9">
                                <asp:Table ID="Table103" runat="server" BorderColor="White" BorderStyle="Dashed" BorderWidth="2px" CellSpacing="0" Height="75px" Style="cursor: pointer" Visible="False" Width="250px">
                                    <asp:TableRow ID="TableRow3" runat="server">
                                        <asp:TableCell ID="ID_3_A" runat="server" BackColor="#2c3338" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="lblCount_3" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip=""></asp:Label>
                                                            <%--<asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />--%>
                                                        </td>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="Label3" runat="server" Text="avg job cost" ForeColor="White" Font-Size="10"></asp:Label>
                                                           
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
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                <asp:Table ID="Table104" runat="server" BorderColor="White" BorderStyle="Dashed" BorderWidth="2px" CellSpacing="0" Height="75px" Style="cursor: pointer" Visible="False" Width="220px">
                                    <asp:TableRow ID="TableRow4" runat="server">
                                        <asp:TableCell ID="ID_4_A" runat="server" BackColor="#2c3338" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="lblCount_4" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip=""></asp:Label>
                                                            <%--<asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />--%>
                                                        </td>
                                                        <td style="text-align: center; padding-top: 15px; padding-left: 5px;">
                                                            <asp:Label ID="Label4" runat="server" Text="avg utilisation" ForeColor="White" Font-Size="10"></asp:Label>
                                                           
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
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style3">
                                 <asp:Label ID="lblTitle" runat="server" Text="ENGINEERS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <telerik:RadButton ID="RadBtn_Reset" runat="server" Text="Reset" Skin="Glow">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <asp:Label ID="lblCustomer" runat="server" Font-Size="14px" Text="Customer:"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" class="auto-style12">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="250px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <asp:Label ID="lblSite" runat="server" Font-Size="14px" Text="Site:"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" class="auto-style13">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="200px" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <asp:Label ID="lblFrom" runat="server" Font-Size="14px" Text="From:"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                 <telerik:RadDatePicker ID="RadDP_From" runat="server" AutoPostBack="True" Skin="Glow">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                 <asp:Label ID="lblTo" runat="server" Text="To:" Font-Size="14px"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadDatePicker ID="RadDP_To" runat="server" AutoPostBack="True" Skin="Glow">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <asp:Label ID="lblFitter" runat="server" Text="Engineer:" Font-Size="14px"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                 <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True" AutoPostBack="True" CheckBoxes="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID"  Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" EnableCheckAllItemsCheckBox="True">
                                     <Localization AllItemsCheckedString="*All Engineers" CheckAllString="*All Engineers" />
                                 </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadButton ID="RadButton1" runat="server" Text="Go" Skin="Glow"></telerik:RadButton>
                            </td>
                        </tr>
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td style="vertical-align: top;" align="center">
                                <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" OnClientSeriesClicked="OnClientSeriesClicked" Skin="Glow" Width="600px">
                                    <ChartTitle Text="Engineer Analysis - Job Types">
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Position="Top" Visible="True">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries DataFieldY="PCT" ExplodeField="IsExploded" Name="PCT" NameField="Type" StartAngle="90">
                                                <LabelsAppearance DataField="TypeLabel" Position="OutsideEnd" />
                                                <TooltipsAppearance DataFormatString="{0}%" />
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
                               
                            </td>
                            <td style="vertical-align: top; " align="center">
               <telerik:RadHtmlChart runat="server" ID="RadarLineChart" Transitions="true" Skin="Glow" Width="400px">
                <PlotArea>
                    <Series>
                        <telerik:RadarLineSeries MissingValues="Gap" DataFieldY="Value1">
                            <Appearance>
                                <FillStyle BackgroundColor="#ff661c"></FillStyle>
                            </Appearance>
                            <LabelsAppearance Visible="false">
                            </LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" BackgroundColor="White" Size="8" BorderColor="#ff661c" BorderWidth="2">
                            </MarkersAppearance>
                            <TooltipsAppearance DataFormatString="{0}%"></TooltipsAppearance>
                        </telerik:RadarLineSeries>                               
                    </Series>
                    <Appearance>
                        <FillStyle BackgroundColor="Transparent"></FillStyle>
                    </Appearance>
                    <XAxis Color="White" MajorTickType="Outside" MinorTickType="Outside" Reversed="false">
                        <LabelsAppearance DataFormatString="{0}" RotationAngle="0" Step="1" Skip="0">
                        </LabelsAppearance>
                        <MajorGridLines Color="#c8c8c8" Width="1"></MajorGridLines>
                        <MinorGridLines Visible="false"></MinorGridLines>
                        <Items>
                          <telerik:AxisItem LabelText="Communication"></telerik:AxisItem>
                            <telerik:AxisItem LabelText="Competence"></telerik:AxisItem>
                            <telerik:AxisItem LabelText="Knowledge"></telerik:AxisItem>
                            <telerik:AxisItem LabelText="Organisation"></telerik:AxisItem>
                            <telerik:AxisItem LabelText="Person"></telerik:AxisItem>
                            <telerik:AxisItem LabelText="Safety"></telerik:AxisItem>
                            <telerik:AxisItem LabelText="Technical"></telerik:AxisItem>
                        </Items>
                    </XAxis>
                    <YAxis Visible="false">
                        <MajorGridLines Color="#c8c8c8" Width="1"></MajorGridLines>
                        <MinorGridLines Visible="false"></MinorGridLines>
                    </YAxis>
                </PlotArea>
                <Appearance>
                    <FillStyle BackgroundColor="Transparent"></FillStyle>
                </Appearance>
                <ChartTitle Text="Engineer Skills Feedback">
                    <Appearance Align="Center" BackgroundColor="Transparent" Position="Top">
                         <TextStyle Color="White" />
                    </Appearance>
                </ChartTitle>
                <Legend>
                    <Appearance BackgroundColor="Transparent" Position="Bottom">
                         <TextStyle Color="White" />
                    </Appearance>
                </Legend>
            </telerik:RadHtmlChart>

                            </td>
                            <td style="vertical-align: top; " align="center">
 <telerik:RadHtmlChart ID="RadHtmlChart2" runat="server" OnClientSeriesClicked="OnClientSeriesClicked" Skin="Glow" Width="600px">
                                    <ChartTitle Text="Engineer Analysis - Machine Types">
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Position="Top" Visible="True">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries DataFieldY="PCT" ExplodeField="IsExploded" Name="PCT" NameField="Type" StartAngle="90">
                                                <LabelsAppearance DataField="TypeLabel" Position="OutsideEnd" />
                                                <TooltipsAppearance DataFormatString="{0}%" />
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <MasterTableView  NoMasterRecordsText="[records rely on hours being entered for the associated timesheets]" DataKeyNames="J_ID" ClientDataKeyNames="J_ID" Name="Jobs">
                                         <DetailTables>
                    <telerik:GridTableView runat="server" Name="Timesheets" AutoGenerateColumns="False" 
                        GroupsDefaultExpanded="True" DataKeyNames="FTD_ID" BorderStyle="None" BackColor="Black" Width="100%" ClientDataKeyNames="FTD_ID" HierarchyDefaultExpanded="True">
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="FTD_J_ID" MasterKeyField="J_ID" />
                        </ParentTableRelation>
                        <Columns>                             
                                            <telerik:GridBoundColumn DataField="FTD_ID" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter FTD_ID column" HeaderText="Timesheet" ReadOnly="True"
                                                SortExpression="FTD_ID" UniqueName="FTD_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FTD_J_ID" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter FTD_J_ID column" HeaderText="Job" ReadOnly="True"
                                                SortExpression="FTD_J_ID" UniqueName="FTD_J_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobDay" DataFormatString="{0:dd MMM yyyy}"
                                                        Display="True" FilterControlAltText="Filter JobDay column" HeaderText="Date"
                                                        ReadOnly="True" SortExpression="JobDay" UniqueName="JobDay" >
                                                        <HeaderStyle Width="90px" Wrap="False" />
                                                        <ItemStyle Width="90px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Engineer" Display="True"
                                                FilterControlAltText="Filter Engineer column" HeaderText="Engineer"
                                                ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
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
                                             <telerik:GridBoundColumn DataField="FTD_Total_Time_Calc" FilterControlAltText="Filter FTD_Total_Time_Calc column"
                                                HeaderText="Total Hrs" ReadOnly="True" SortExpression="FTD_Total_Time_Calc" UniqueName="FTD_Total_Time_Calc">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FTD_Engineer_Rate" DataFormatString="{0:£#,##0.00}"
                                                Display="True" FilterControlAltText="Filter FTD_Engineer_Rate column" HeaderText="Engineer Cost"
                                                ReadOnly="True" SortExpression="FTD_Engineer_Rate" UniqueName="FTD_Engineer_Rate">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                        </Columns>                                                  
                                        <HeaderStyle ForeColor="#ff661c" BorderStyle="None" />
                        <ItemStyle BackColor="Black" ForeColor="White" BorderStyle="None" />
                        <GroupHeaderItemStyle BackColor="Black" ForeColor="#ff661c" BorderStyle="None" />
                        <MultiHeaderItemStyle ForeColor="#ff661c" />
                    </telerik:GridTableView>
                </DetailTables>
                                        <Columns>
                                              <telerik:GridBoundColumn DataField="Customer" Display="True" FilterControlAltText="Filter Customer column" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" UniqueName="Customer">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="E_ID" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter E_ID column" HeaderText="Event" ReadOnly="True"
                                                SortExpression="E_ID" UniqueName="E_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_ID" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter J_ID column" HeaderText="Job" ReadOnly="True"
                                                SortExpression="J_ID" UniqueName="J_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Engineer" Display="True" 
                                                FilterControlAltText="Filter Engineer column" HeaderText="Job Engineer"
                                                ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="JobType" FilterControlAltText="Filter JobType column" HeaderText="Job Type" ReadOnly="True" SortExpression="JobType" UniqueName="JobType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Instruction" FilterControlAltText="Filter Instruction column" HeaderText="Instruction" ReadOnly="True" SortExpression="Instruction" UniqueName="Instruction">
                                                <HeaderStyle Width="450px" Wrap="False" />
                                                <ItemStyle Width="450px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Asset" FilterControlAltText="Filter Asset column" HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Model" FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True" SortExpression="Model" UniqueName="Model">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level1" FilterControlAltText="Filter Level1 column" HeaderText="Level 1 Code" ReadOnly="True" SortExpression="Level1" UniqueName="Level1">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level2" FilterControlAltText="Filter Level2 column" HeaderText="Level 2 Code" ReadOnly="True" SortExpression="Level2" UniqueName="Level2">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column" HeaderText="Level 3 Code" ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="J_Planned_Start_Date" DataFormatString="{0:dd MMM yyyy}"
                                                        Display="True" FilterControlAltText="Filter J_Planned_Start_Date column" HeaderText="Planned Start Date"
                                                        ReadOnly="True" SortExpression="J_Planned_Start_Date" UniqueName="J_Planned_Start_Date" >
                                                        <HeaderStyle Width="90px" Wrap="False" />
                                                        <ItemStyle Width="90px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Estimated_Time" FilterControlAltText="Filter J_Estimated_Time column"
                                                HeaderText="Est. Hrs" ReadOnly="True" SortExpression="J_Estimated_Time" UniqueName="J_Estimated_Time">
                                                <HeaderStyle Width="70px" Wrap="True" />
                                                <ItemStyle Width="70px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_FTD_Total_Time" FilterControlAltText="Filter J_FTD_Total_Time column"
                                                HeaderText="Total Hrs" ReadOnly="True" SortExpression="J_FTD_Total_Time" UniqueName="J_FTD_Total_Time">
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
                                                Display="True" FilterControlAltText="Filter J_Engineer_Rate column" HeaderText="Total Engineer Cost"
                                                ReadOnly="True" SortExpression="J_Engineer_Rate" UniqueName="J_Engineer_Rate">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Date_Closed" DataFormatString="{0:dd MMM yyyy}"
                                                        Display="True" FilterControlAltText="Filter J_Date_Closed column" HeaderText="Closed Date"
                                                        ReadOnly="True" SortExpression="J_Date_Closed" UniqueName="J_Date_Closed" >
                                                        <HeaderStyle Width="90px" Wrap="False" />
                                                        <ItemStyle Width="90px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="J_Status" FilterControlAltText="Filter J_Status column"
                                                HeaderText="Status" ReadOnly="True" SortExpression="J_Status" UniqueName="J_Status">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
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
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_Engineer" runat="server" Value="-1," />
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="Table101" />
                            <telerik:AjaxUpdatedControl ControlID="Table102" />
                            <telerik:AjaxUpdatedControl ControlID="Table103" />
                            <telerik:AjaxUpdatedControl ControlID="Table104" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="Table101" />
                             <telerik:AjaxUpdatedControl ControlID="Table102" />
                             <telerik:AjaxUpdatedControl ControlID="Table103" />
                            <telerik:AjaxUpdatedControl ControlID="Table104" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Engineer" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_From">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" />
                            <telerik:AjaxUpdatedControl ControlID="RadarLineChart" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart2" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_To">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" />
                            <telerik:AjaxUpdatedControl ControlID="RadarLineChart" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart2" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadButton1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" />
                            <telerik:AjaxUpdatedControl ControlID="RadarLineChart" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart2" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                            <telerik:AjaxUpdatedControl ControlID="Table101" />
                             <telerik:AjaxUpdatedControl ControlID="Table102" />
                             <telerik:AjaxUpdatedControl ControlID="Table103" />
                            <telerik:AjaxUpdatedControl ControlID="Table104" />
                            <%--<telerik:AjaxUpdatedControl ControlID="Radbtn_Report" />--%>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadBtn_Reset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" />
                            <telerik:AjaxUpdatedControl ControlID="RadarLineChart" />
                            <telerik:AjaxUpdatedControl ControlID="RadHtmlChart2" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Engineer" />
                            <telerik:AjaxUpdatedControl ControlID="Table101" />
                             <telerik:AjaxUpdatedControl ControlID="Table102" />
                             <telerik:AjaxUpdatedControl ControlID="Table103" />
                            <telerik:AjaxUpdatedControl ControlID="Table104" />
                           <%-- <telerik:AjaxUpdatedControl ControlID="Radbtn_Report" />--%>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <asp:Literal ID="itemsClientSide" runat="server" />
        </div>
    </form>
</body>
</html>


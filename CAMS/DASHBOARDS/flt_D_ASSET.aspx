<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Asset Dashboard" CodeFile="flt_D_ASSET.aspx.vb" Inherits="DASHBOARD_flt_D_ASSET" %>
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
        .auto-style9 {
            width: 190px;
        }
        .auto-style10 {
            width: 96px;
        }
        .auto-style11 {
            width: 37px;
        }
        .auto-style12 {
            width: 100px;
        }
        .borderright
    {
        border-right:2px solid #a7a7a7;
        border-collapse: separate;
        padding-left: 10px;
    }
          .bordertopright
    {
        border-right:2px solid #a7a7a7;
        border-top:2px solid #a7a7a7;
    }
          .borderbottomright
    {
        border-right:2px solid #a7a7a7;
        border-bottom:2px solid #a7a7a7;
        padding-left: 10px;
    }
         .borderleft
    {
        border-left:2px solid #a7a7a7;
        border-collapse: separate;
    }
         .borderleftright
    {
        border-left:2px solid #a7a7a7;
        border-right:2px solid #a7a7a7;
    }
          .bordertopleft
    {
        border-left:2px solid #a7a7a7;
        border-top:2px solid #a7a7a7;
    }
          .borderbottomleft
    {
        border-left:2px solid #a7a7a7;
        border-bottom:2px solid #a7a7a7;
    }
          .bordertop
    {
        border-top:2px solid #a7a7a7;
        border-left:2px solid #a7a7a7;
        border-right:2px solid #a7a7a7;
    }
          .borderbottom
    {
        border-bottom:2px solid #a7a7a7;
        border-left:2px solid #a7a7a7;
        border-right:2px solid #a7a7a7;
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
    }
    function RowSelectedft(sender, eventArgs) {
        var ATTid2 = sender.get_selectedItems()[0].getDataKeyValue('FT_J_ID');
        document.getElementById('HF_J_ID').value = ATTid2;
    }
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
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: left;" valign="middle">
                            </td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style3">
                                 <asp:Label ID="lblTitle" runat="server" Text="ASSET DASHBOARD" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style11">
                                Customer:</td>
                            <td align="left" class="auto-style11" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="160px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" class="auto-style11" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">Status</td>
                            <td align="left" class="auto-style11" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <telerik:RadComboBox ID="RadCB_Activity_Status" runat="server" AutoPostBack="True" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="*All" Value="-1" />
                                        <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                        <telerik:RadComboBoxItem runat="server" Text="Standing" Value="Standing" />
                                        <telerik:RadComboBoxItem runat="server" Text="Off-Hire" Value="Off-Hire" />
                                        <telerik:RadComboBoxItem runat="server" Text="Disposed" Value="Disposed" />
                                    </Items>
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style10">
                                Asset:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" class="auto-style9">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_ASSET_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="160px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style12">
                                <asp:Label ID="lblSliderText" runat="server" Font-Size="14px" Text="Trend Slider: "></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                <telerik:RadSlider ID="RadSlider1" runat="server" DbValue="0" Font-Bold="True" ForeColor="White" Height="22px" Length="200" Skin="MetroTouch" Width="500px" >
                                </telerik:RadSlider>
                            </td>
                        </tr>
                    </table>
                                <asp:Table ID="AssetDetails" Visible="False" Font-Size="16px" ForeColor="White" Width="2100px" runat="server" BorderStyle="NotSet" CellSpacing="0">
                                     <asp:TableRow >
                                        <asp:TableCell CssClass="bordertop" HorizontalAlign="Center" Width="240px" VerticalAlign="Top" ColumnSpan="2" Font-Bold="True" >
                                            <asp:Label ID="Label1" runat="server" Text="Asset Live Info"></asp:Label>
                                        </asp:TableCell>
                                      <%--     <asp:TableCell CssClass="bordertop" HorizontalAlign="Center" Width="400px" VerticalAlign="Top" ColumnSpan="2" Font-Bold="True">
                                              Production Statistics
                                            </asp:TableCell>--%>
                                          <asp:TableCell HorizontalAlign="Center" Width="600px" VerticalAlign="Top" ColumnSpan="1" Font-Bold="True">
                                              
                                            </asp:TableCell>
                                          <asp:TableCell HorizontalAlign="Center" Width="600px" VerticalAlign="Top" ColumnSpan="1" Font-Bold="True">
                                             
                                            </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow >
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            <asp:Label ID="lblBasicText" runat="server" Text="Type: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            <asp:Label ID="lblBasic" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                     <%--     <asp:TableCell  CssClass="borderright" Width="400px" VerticalAlign="Top" ColumnSpan="2" HorizontalAlign="Center" Font-Size="14px" Font-Italic="True">
                                           (Last 12 Months)
                                        </asp:TableCell>--%>
                                        <asp:TableCell RowSpan="12" HorizontalAlign="center"  Width="600px" ColumnSpan="1">
                                           <%-- <asp:Label ID="lbl_LPH_Gauge" runat="server" Text="Engine Load Factor (Litres/Hr)" Visible="False" Font-Bold="True"></asp:Label>--%>
                                             <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                           <%-- <telerik:RadHtmlChart ID="RadC_MTBS" runat="server" DataSourceID="SqlDS_AssetMTBS" Skin="Glow" Width="600px" Height="300px">
                                                <ChartTitle Text="MTBS – Mean Time Between Stoppages (Last 12 Months)"></ChartTitle>
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
                                                        <telerik:LineSeries DataFieldY="MTBS_Chart" Name="MTBS">
                                                            <Appearance FillStyle-BackgroundColor="#000000" />
                                                            <MarkersAppearance BorderColor="#000000" />
                                                            <TooltipsAppearance Color="#FFFFFF" />
                                                        </telerik:LineSeries>
                                                    </Series>
                                                    <XAxis DataLabelsField="PLT_Date">
                                                         <LabelsAppearance RotationAngle="45" ></LabelsAppearance>
                                                    </XAxis>
                                                    <YAxis MaxValue="100" Step="10">
                                                        <PlotBands>
                                                            <telerik:PlotBand Alpha="100" Color="#e46c0a" From="30" To="31" />
                                                        </PlotBands>
                                                    </YAxis>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>--%>
                                            <telerik:RadHtmlChart ID="RadC_ServiceHistory" runat="server" Skin="Glow" Width="600px" Height="300px" Visible="False">
                                                <ChartTitle Text="Service History (Last 12 Months)"></ChartTitle>
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
                                                        <telerik:LineSeries DataFieldY="SERA_Service_SMU" Name="Service SMU">
                                                            <LabelsAppearance Visible="False"></LabelsAppearance>
                                                            <Appearance FillStyle-BackgroundColor="#000000" />
                                                            <MarkersAppearance BorderColor="#000000" />
                                                            <TooltipsAppearance Color="#FFFFFF" />
                                                        </telerik:LineSeries>
                                                    </Series>
                                                    <XAxis DataLabelsField="SERA_Date_Service" BaseUnit="Months" EnableBaseUnitStepAuto="True" Type="Date"></XAxis>
                                                    <YAxis>
                                                    </YAxis>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>
                                           
                                            <telerik:RadHtmlChart ID="RadC_EventTimes" runat="server"  Skin="Glow" Width="600px" Height="300px" Visible="False">
                                                <ChartTitle Text="Average Event Times (Last 12 Months)">
                                                </ChartTitle>
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
                                                        <telerik:BarSeries DataFieldY="Time" Name="Average time (hrs)">
                                                            <Appearance>
                                                                <FillStyle BackgroundColor="#3e77bd" />
                                                            </Appearance>
                                                            <TooltipsAppearance BackgroundColor="White" Color="Black">
                                                            </TooltipsAppearance>
                                                        </telerik:BarSeries>
                                                    </Series>
                                                    <XAxis DataLabelsField="EventType">
                                                    </XAxis>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>
                                            
                                             </asp:TableCell>
                                         <asp:TableCell RowSpan="12" HorizontalAlign="left" Width="600px" ColumnSpan="1">
                                             <asp:Image ID="Image1" runat="server" Height="300px" Width="400px" />
                                             
                                          <%--  <telerik:RadHtmlChart ID="RadP_PlanVsUnPlan" runat="server"  DataSourceID="SqlDS_PlanVsUnPlan" Skin="Glow" Visible="False" Width="600px" Height="300px" OnClientSeriesClicked="OnClientSeriesClicked">
                                                <ChartTitle Text="Planned vs Unplanned Stoppages (Last 12 Months)">
                                                </ChartTitle>
                                                <Legend>
                                                    <Appearance Position="Top" Visible="True">
                                                    </Appearance>
                                                </Legend>
                                                <PlotArea>
                                                    <Series>
                                                        <telerik:PieSeries DataFieldY="PCT" Name="PCT" NameField="Type" ExplodeField="IsExploded" StartAngle="90">
                                                            <LabelsAppearance Position="OutsideEnd" DataField="TypeLabel" />
                                                            <TooltipsAppearance DataFormatString="{0}%" />
                                                        </telerik:PieSeries>
                                                    </Series>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>--%>
                                            <telerik:RadHtmlChart ID="RadP_EventTypes" runat="server"  Skin="Glow" Visible="False" Width="600px" Height="300px" OnClientSeriesClicked="OnClientSeriesClicked">
                                                <ChartTitle Text="Event Types (Last 12 Months)"></ChartTitle>
                                                <Legend>
                                                    <Appearance Position="Top" Visible="True"></Appearance>
                                                </Legend>
                                                <PlotArea>
                                                    <Series>
                                                        <telerik:PieSeries DataFieldY="PCT" Name="PCT" NameField="Type" ExplodeField="IsExploded" StartAngle="90">
                                                            <LabelsAppearance Position="OutsideEnd" DataField="TypeLabel" />
                                                            <TooltipsAppearance DataFormatString="{0}%" />
                                                        </telerik:PieSeries>
                                                    </Series>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>
                                            <telerik:RadHtmlChart ID="RadP_JobTypes" runat="server"   Skin="Glow" Visible="False" Width="600px" Height="300px" OnClientSeriesClicked="OnClientSeriesClicked">
                                                <ChartTitle Text="Job Types (Last 12 Months)"></ChartTitle>
                                                <Legend>
                                                    <Appearance Position="Top" Visible="True"></Appearance>
                                                </Legend>
                                                <PlotArea>
                                                    <Series>
                                                        <telerik:PieSeries DataFieldY="PCT" Name="PCT" NameField="Type" ExplodeField="IsExploded" StartAngle="90">
                                                            <LabelsAppearance Position="OutsideEnd" DataField="TypeLabel" />
                                                            <TooltipsAppearance DataFormatString="{0}%" />
                                                        </telerik:PieSeries>
                                                    </Series>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>
                                             
                                            <asp:PlaceHolder ID="RadG_NextService" runat="server"></asp:PlaceHolder>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            <asp:Label ID="lblLocationText" runat="server" Text="Location: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            <asp:Label ID="lblLocation" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                      <%--    <asp:TableCell CssClass="borderright" Width="400px" VerticalAlign="Top" ColumnSpan="2" HorizontalAlign="Center">
                                           <asp:Label ID="lblAvailabilityText" runat="server" Text="Availability:" ></asp:Label>
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            <asp:Label ID="lblSMUText" runat="server" Text="Latest SMU: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            <asp:Label ID="lblSMU" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                        <%--   <asp:TableCell CssClass="borderright" Width="400px" VerticalAlign="Top" ColumnSpan="2" RowSpan="2" HorizontalAlign="Center">
                                          <asp:Label ID="lblAvailability" runat="server" Text="" Font-Bold="True" Font-Size="18px"></asp:Label>
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            <asp:Label ID="lblTrendText" runat="server" Text="Trend: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            <asp:Label ID="lblTrend" runat="server" Text="1"></asp:Label>
                                        </asp:TableCell>
                                        <%-- <asp:TableCell Width="400px" VerticalAlign="Top" ColumnSpan="2" HorizontalAlign="Center">
                                            
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            <asp:Label ID="lblCycleText" runat="server" Text="Cycle: " Visible="False"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            <asp:Label ID="lblCycle" runat="server" Text="" Visible="False"></asp:Label>
                                        </asp:TableCell>
                                       <%--    <asp:TableCell CssClass="borderright" Width="400px" VerticalAlign="Top" ColumnSpan="2" HorizontalAlign="Center">
                                          <asp:Label ID="lblUtilisationText" runat="server" Text="Utilisation: "></asp:Label>
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            <asp:Label ID="lblSerCounterText" runat="server" Text="Counter: " Visible="False"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            <asp:Label ID="lblSerCounter" runat="server" Text="" Visible="False"></asp:Label>
                                        </asp:TableCell>
                                     <%--    <asp:TableCell CssClass="borderright" Width="400px" VerticalAlign="Top" ColumnSpan="2" RowSpan="2" HorizontalAlign="Center">
                                            <asp:Label ID="lblUtilisation" runat="server" Text="" Font-Bold="True" Font-Size="18px"></asp:Label>
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            <asp:Label ID="lblSerLeftText" runat="server" Text="Remaining: " Visible="False"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                           <asp:Label ID="lblSerLeft" runat="server" Text="" Visible="False"></asp:Label>
                                        </asp:TableCell>
                                        <%-- <asp:TableCell Width="400px" VerticalAlign="Top" ColumnSpan="2"  HorizontalAlign="Center">
                                             
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                           
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                             
                                        </asp:TableCell>
                        <%--                   <asp:TableCell CssClass="borderright" Width="400px" VerticalAlign="Top" ColumnSpan="2" HorizontalAlign="Center"> 
                                               <asp:Label ID="lblProductionRateText" runat="server" Text="Production Rate: "></asp:Label> 
                                                 <asp:Label ID="lblPayLoadText" runat="server" Text="Pay Load: "></asp:Label>                              
                                        </asp:TableCell>--%>        
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                             <asp:Label ID="lblActivityStatusText" runat="server" Text="Activity Status: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            <asp:Label ID="lblActivityStatus" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                        <%--    <asp:TableCell CssClass="borderright" Width="400px" VerticalAlign="Top" ColumnSpan="2" RowSpan="2" HorizontalAlign="Center">  
                                             <asp:Label ID="lblProductionRate" runat="server" Text="" Font-Bold="True" Font-Size="16px"></asp:Label> 
                                                <asp:Label ID="lblPayLoad" runat="server" Text="" Font-Bold="True" Font-Size="16px"></asp:Label>                           
                                        </asp:TableCell>--%> 
                                    </asp:TableRow>
                                     <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            
                                        </asp:TableCell>
                                         <%--<asp:TableCell Width="400px" VerticalAlign="Top" ColumnSpan="2" HorizontalAlign="Center">
                                            
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                            
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                            
                                        </asp:TableCell>
                                     <%--     <asp:TableCell CssClass="borderright" Width="400px" VerticalAlign="Top" ColumnSpan="2" HorizontalAlign="Center">
                                          <asp:Label ID="lblLitresText" runat="server" Text="Litres/Hr (CO2/Hr): "></asp:Label>
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="borderbottomleft" Width="120px" VerticalAlign="Top" HorizontalAlign="Right" ColumnSpan="1">
                                           <asp:Label ID="lblStatusText" runat="server" Text="Current Actions: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="borderbottomright" Width="120px" VerticalAlign="Top" ColumnSpan="1">
                                          <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                  <%--             <asp:TableCell CssClass="borderbottom" Width="400px" VerticalAlign="Top" ColumnSpan="2" RowSpan="2" HorizontalAlign="Center">
                                      <asp:Label ID="lblLitres" runat="server" Text="" Font-Bold="True" Font-Size="18px"></asp:Label>
                                            (<asp:Label ID="lblCO2" runat="server" Text="" Font-Bold="True" Font-Size="18px"></asp:Label>)
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                </asp:Table>
                     <table class="style1" style="padding-top: 20px" cellspacing="0">
                        <tr>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left; vertical-align: top;">
                                <telerik:RadTabStrip ID="RadTabStrip1" runat="server" AutoPostBack="True" MultiPageID="RadMultiPage1" RenderMode="Lightweight" ResolvedRenderMode="Classic" SelectedIndex="0" Width="1660px" Skin="Glow">
                                    <Tabs>
                                        <telerik:RadTab PageViewID="RadPV_Asset_Details" Selected="True" Text="Asset Details" Value="0"/>
                                        <telerik:RadTab PageViewID="RadPV_Events_Jobs" Text="All Events & Jobs" Value="1" />
                                        <telerik:RadTab PageViewID="RadPV_Servicing" Text="Servicing" Value="2" />
<%--                                        <telerik:RadTab PageViewID="RadPV_SMU" Text="SMU Readings" Value="3" />
                                        <telerik:RadTab PageViewID="RadPV_FUEL" Text="Fuel Quantities" Value="4" />
                                        <telerik:RadTab PageViewID="RadPV_ChangeOutPlan" Text="Change-Out Plan" Value="6" />
                                        <telerik:RadTab PageViewID="RadPV_Parts" Text="Parts Assigned" Value="7" />
                                        <telerik:RadTab PageViewID="RadPV_Warranties" Text="Warranties" Value="8" />--%>
                                        <telerik:RadTab PageViewID="RadPV_Jobs" Text="All Jobs" Value="9" />
                                    </Tabs>
                                </telerik:RadTabStrip>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left; vertical-align: top;">&nbsp; </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" Width="1660px" SelectedIndex="3">
                        <telerik:RadPageView ID="RadPV_Asset_Details" runat="server" Selected="True" Style="text-align: left">
                             <telerik:RadSplitter ID="RadSplitter2" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar2" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane10" runat="server" BorderStyle="None" Scrolling="Both" Font-Names="Segoe UI" ForeColor="White">
                            <asp:Table ID="AssetMainDetails" Visible="False" Font-Size="16px" ForeColor="White" Width="100%" runat="server">
                                <asp:TableRow>
                                     <asp:TableCell ColumnSpan="2">
                                        <em><strong style="padding-left: 15px">ASSET INFORMATION</strong></em>
                                          </asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell ColumnSpan="2">
                                        <em><strong style="padding-left: 15px">MANUFACTURER INFORMATION</strong></em>
                                         </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">Manufacturer: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblManufacturer" runat="server"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px">Primary Group: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblPrimary" runat="server"></asp:Label>
                                     </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px" ></asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">Model: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblModel" runat="server"></asp:Label>
                                     </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px">Secondary Group: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblSecondary" runat="server"></asp:Label>
                                     </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px" > </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">Serial No: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                     </asp:TableCell>
                                </asp:TableRow>
                               <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px">Category: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px" > </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">Year: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblYear" runat="server"></asp:Label>
                                     </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px">Type:</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblType" runat="server"></asp:Label>
                                     </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px" > </asp:TableCell>
                                   <asp:TableCell style="padding-left: 20px">No. of Engines: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblEngine" runat="server"></asp:Label>
                                     </asp:TableCell>
                               </asp:TableRow>
                               <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px">Hired: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblHired" runat="server"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px" > </asp:TableCell>
                                    <asp:TableCell><em><strong style="padding-left: 15px">SPECIFICATIONS</strong></em> </asp:TableCell>
                                    <asp:TableCell> </asp:TableCell>
                               </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px"> Internal Hire Rate: </asp:TableCell>
                                   <asp:TableCell>
                                        £<asp:Label ID="lblHireRate" runat="server"></asp:Label>
                                     </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px"> </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">
                                        Face Shovel / Backhoe:
                                     </asp:TableCell>
                                        <asp:TableCell>
                                        <asp:Label ID="lblSpecType" runat="server"></asp:Label>
                                     </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px"> External Hire Rate: </asp:TableCell>
                                   <asp:TableCell>
                                        £<asp:Label ID="lblHireRateExternal" runat="server"></asp:Label>
                                     </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px"> </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">Blade / Bucket Size: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblBlade" runat="server"></asp:Label>
                                     </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px">Hire Unit: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblHireUnit" runat="server"></asp:Label>
                                     </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px"> </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">
                                        Track / Tyre Size:
                                     </asp:TableCell>
                                        <asp:TableCell>
                                        <asp:Label ID="lblTrack" runat="server"></asp:Label>
                                     </asp:TableCell>
                               </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px"> </asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px" ></asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">Body Type: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblBodyType" runat="server"></asp:Label>
                                     </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                         </asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px" > </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">Body Capacity: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblBodyCapacity" runat="server"></asp:Label>
                                     </asp:TableCell>
                                </asp:TableRow>
                               <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px"> </asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px" > </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px">Operating Weight: </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblWeight" runat="server"></asp:Label>
                                     </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell style="padding-right: 20px">
                                         </asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px"> </asp:TableCell>
                                    <asp:TableCell style="padding-left: 20px"></asp:TableCell>
                                    <asp:TableCell>
                                   
                                     </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                    </telerik:RadPane>
            </telerik:RadSplitter>
                            </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_Events_Jobs" runat="server" Selected="False" Style="text-align: left">
                            <telerik:RadGrid ID="RadGrid_Active_Events" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                AllowSorting="True" ResolvedRenderMode="Classic" Width="1650px" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"></ExportSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="E_ID" DataKeyNames="E_ID" 
                                    NoMasterRecordsText="No events to display.">
                                    <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add new event" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="E_ID" DataType="System.Int32"
                                            Display="True" FilterControlAltText="Filter E_ID column" HeaderText="ID"
                                            ReadOnly="True" SortExpression="E_ID" UniqueName="E_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Asset" FilterControlAltText="Filter Asset column" HeaderText="Asset ID"
                                            ReadOnly="True" SortExpression="Asset" UniqueName="Asset" Display="False">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_WeekEnding" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter E_WeekEnding column" HeaderText="WeekEnding"
                                            ReadOnly="True" SortExpression="E_WeekEnding" UniqueName="E_WeekEnding">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Site_Name" Display="True" FilterControlAltText="Filter Site_Name column" HeaderText="Site"
                                            ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Shift" Display="False" FilterControlAltText="Filter E_Shift column" HeaderText="Shift"
                                            ReadOnly="True" SortExpression="E_Shift" UniqueName="E_Shift">
                                            <HeaderStyle Width="60px" Wrap="False" />
                                            <ItemStyle Width="60px" Wrap="True" />
                                        </telerik:GridBoundColumn>
<%--                                        <telerik:GridBoundColumn DataField="E_Handler" FilterControlAltText="Filter E_Handler column" HeaderText="Owner"
                                            ReadOnly="True" SortExpression="E_Handler" UniqueName="E_Handler">
                                            <HeaderStyle Width="60px" Wrap="False" />
                                            <ItemStyle Width="60px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Company" FilterControlAltText="Filter Company column" HeaderText="Contractor"
                                            ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>--%>
                                        <%--<telerik:GridHyperLinkColumn AllowSorting="False"
                                            FilterControlAltText="Filter Company column"
                                            HeaderText="Contractor Link"
                                            UniqueName="Company" Target="_blank"
                                            HeaderButtonType="LinkButton" DataTextField="Company"
                                            DataNavigateUrlFields="E_COM_ID"
                                            DataNavigateUrlFormatString="../ADMIN/flt_ADMIN_ASSET_ATTRIBUTE_EDIT_RW.aspx?&ATT_TABLE=Company&ATT_ID={0}">
                                            <HeaderStyle Width="70px" HorizontalAlign="Center" Wrap="False" />
                                            <ItemStyle Width="70px" HorizontalAlign="Center" Wrap="False" />
                                        </telerik:GridHyperLinkColumn>--%>
                                        <telerik:GridBoundColumn DataField="Engineer" FilterControlAltText="Filter Engineer column" HeaderText="Engineer"
                                            ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EventType" FilterControlAltText="Filter EventType column" HeaderText="Event Type"
                                            ReadOnly="True" SortExpression="EventType" UniqueName="EventType">
                                            <HeaderStyle Width="150px" Wrap="False" />
                                            <ItemStyle Width="150px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Planned_Start_Date" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter E_Planned_Start_Date column"
                                            HeaderText="Planned Start Date" ReadOnly="True"
                                            SortExpression="E_Planned_Start_Date" UniqueName="E_Planned_Start_Date">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Date_Ended" DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter E_Date_Ended column"
                                            HeaderText="Date Closed" ReadOnly="True"
                                            SortExpression="E_Date_Ended" UniqueName="E_Date_Ended">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Date_Started" DataFormatString="{0:dd MMM yyyy}" Display="False"
                                            FilterControlAltText="Filter E_Date_Started column"
                                            HeaderText="Breakdown Called In" ReadOnly="True"
                                            SortExpression="E_Date_Started" UniqueName="E_Date_Started">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="E_Status" Display="False"
                                            FilterControlAltText="Filter E_Status column" HeaderText="Status"
                                            ReadOnly="True" SortExpression="E_Status" UniqueName="E_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>
                            </telerik:RadGrid><br />
                            <telerik:RadGrid ID="RadGrid_Active_Jobs" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                AllowSorting="True"  ResolvedRenderMode="Classic" Width="1650px" Visible="False" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="J_ID"
                                    DataKeyNames="J_ID" 
                                    NoMasterRecordsText="No jobs to display.">
                                    <CommandItemSettings AddNewRecordText="Add new job" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="J_ID" DataType="System.Int32" Display="True"
                                            FilterControlAltText="Filter J_ID column" HeaderText="ID"
                                            ReadOnly="True" SortExpression="J_ID" UniqueName="J_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="J_E_ID" DataType="System.Int32" Display="False"
                                            FilterControlAltText="Filter J_E_ID column" HeaderText="Event ID"
                                            ReadOnly="True" SortExpression="J_E_ID" UniqueName="J_E_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="JobType" FilterControlAltText="Filter JobType column" HeaderText="Job Type"
                                            ReadOnly="True" SortExpression="JobType" UniqueName="JobType">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="J_Handler" FilterControlAltText="Filter J_Handler column" HeaderText="Owner"
                                            ReadOnly="True" SortExpression="J_Handler" UniqueName="J_Handler">
                                            <HeaderStyle Width="60px" Wrap="False" />
                                            <ItemStyle Width="60px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Company" Display="True" FilterControlAltText="Filter Company column" HeaderText="Company"
                                            ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Engineer" Display="True" FilterControlAltText="Filter Engineer column" HeaderText="Engineer"
                                            ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                            <HeaderStyle Width="150px" Wrap="False" />
                                            <ItemStyle Width="150px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="J_Shift" FilterControlAltText="Filter J_Shift column" HeaderText="Shift" ReadOnly="True"
                                            SortExpression="J_Shift" UniqueName="J_Shift">
                                            <HeaderStyle Width="60px" Wrap="False" />
                                            <ItemStyle Width="60px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="J_Instruction" Display="True" FilterControlAltText="Filter J_Instruction column" HeaderText="Instruction"
                                            ReadOnly="True" SortExpression="J_Instruction" UniqueName="J_Instruction">
                                            <HeaderStyle Width="250px" Wrap="False" />
                                            <ItemStyle Width="250px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="J_Date_Closed" DataFormatString="{0:dd MMM yyyy}" Display="False"
                                            FilterControlAltText="Filter J_Date_Closed column" HeaderText="Date Closed"
                                            ReadOnly="True" SortExpression="J_Date_Closed" UniqueName="J_Date_Closed">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="J_Status" FilterControlAltText="Filter J_Status column" HeaderText="Status"
                                            ReadOnly="True" SortExpression="J_Status" UniqueName="J_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_Servicing" runat="server" Selected="False">
                            <telerik:RadGrid ID="RadGrid_Active_SER" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                AllowSorting="True" ResolvedRenderMode="Classic" Width="1000px" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="False">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="SER_ID" DataKeyNames="SER_ID" 
                                    NoMasterRecordsText="No services to display." PageSize="15">
                                    <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add new service" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="SER_ID" DataType="System.Int32"
                                            Display="False" FilterControlAltText="Filter SER_ID column" HeaderText="Servicing ID"
                                            ReadOnly="True" SortExpression="SER_ID" UniqueName="SER_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Asset" Display="False"
                                            FilterControlAltText="Filter Asset column" HeaderText="Asset"
                                            ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Site_Name" Display="False"
                                            FilterControlAltText="Filter Site_Name column" HeaderText="Site"
                                            ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_WeekEnding" Display="False"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_WeekEnding column" HeaderText="WeekEnding"
                                            ReadOnly="True" SortExpression="SER_WeekEnding" UniqueName="SER_WeekEnding">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_SMU_Counter"
                                            FilterControlAltText="Filter SER_SMU_Counter column" HeaderText="SMU Counter"
                                            ReadOnly="True" SortExpression="SER_SMU_Counter" UniqueName="SER_SMU_Counter">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_SMU_Left"
                                            FilterControlAltText="Filter SER_SMU_Left column" HeaderText="SMU Left"
                                            ReadOnly="True" SortExpression="SER_SMU_Left" UniqueName="SER_SMU_Left">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Cycle"
                                            FilterControlAltText="Filter SER_Cycle column" HeaderText="Cycle"
                                            ReadOnly="True" SortExpression="SER_Cycle" UniqueName="SER_Cycle">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Trend"
                                            FilterControlAltText="Filter SER_Trend column" HeaderText="Trend"
                                            ReadOnly="True" SortExpression="SER_Trend" UniqueName="SER_Trend">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Trigger"
                                            FilterControlAltText="Filter SER_Trigger column" HeaderText="Trigger"
                                            ReadOnly="True" SortExpression="SER_Trigger" UniqueName="SER_Trigger">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Sample" Display="True"
                                            FilterControlAltText="Filter SER_Sample column" HeaderText="Sample Rqd"
                                            ReadOnly="True" SortExpression="SER_Sample" UniqueName="SER_Sample">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Oil_Weeks"
                                            FilterControlAltText="Filter SER_Oil_Weeks column" HeaderText="Oil Wks"
                                            ReadOnly="True" SortExpression="SER_Oil_Weeks" UniqueName="SER_Oil_Weeks">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Service_Weeks"
                                            FilterControlAltText="Filter SER_Service_Weeks column" HeaderText="Service Wks"
                                            ReadOnly="True" SortExpression="SER_Service_Weeks" UniqueName="SER_Service_Weeks">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ServiceType"
                                            FilterControlAltText="Filter ServiceType column" HeaderText="Nxt Svc"
                                            ReadOnly="True" SortExpression="ServiceType" UniqueName="ServiceType">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Cal_Date_Due"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_Cal_Date_Due column" HeaderText="Cal Date Due"
                                            ReadOnly="True" SortExpression="SER_Cal_Date_Due" UniqueName="SER_Cal_Date_Due">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Cal_Event_Type"
                                            FilterControlAltText="Filter SER_Cal_Event_Type column"
                                            HeaderText="Cal Event Type" ReadOnly="True" SortExpression="SER_Cal_Event_Type"
                                            UniqueName="SER_Cal_Event_Type">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Cal_Status"
                                            FilterControlAltText="Filter SER_Cal_Status column" HeaderText="Cal Status"
                                            ReadOnly="True" SortExpression="SER_Cal_Status" UniqueName="SER_Cal_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Exam_Date"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_Exam_Date column" HeaderText="Exam Date"
                                            ReadOnly="True" SortExpression="SER_Exam_Date" UniqueName="SER_Exam_Date">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Exam_Status"
                                            FilterControlAltText="Filter SER_Exam_Status column" HeaderText="Exam Status"
                                            ReadOnly="True" SortExpression="SER_Exam_Status" UniqueName="SER_Exam_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Fire_Date"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SER_Fire_Date column" HeaderText="Fire Date"
                                            ReadOnly="True" SortExpression="SER_Fire_Date" UniqueName="SER_Fire_Date">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Fire_Status"
                                            FilterControlAltText="Filter SER_Fire_Status column" HeaderText="Fire Status"
                                            ReadOnly="True" SortExpression="SER_Fire_Status" UniqueName="SER_Fire_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Event_Status"
                                            FilterControlAltText="Filter SER_Event_Status column" HeaderText="Status"
                                            ReadOnly="True" SortExpression="SER_Event_Status" UniqueName="SER_Event_Status">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Status_Flag" Display="False"
                                            FilterControlAltText="Filter SER_Status_Flag column" HeaderText="Status Flag"
                                            ReadOnly="True" SortExpression="SER_Status_Flag" UniqueName="SER_Status_Flag">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid>
                            <br />
                            <telerik:RadGrid ID="RadGrid_Servicing_Archive" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                AllowSorting="True" ResolvedRenderMode="Classic" Width="800px" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="SERA_ID" DataKeyNames="SERA_ID" 
                                    NoMasterRecordsText="No records to display." PageSize="25">
                                    <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add new smu" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Asset" Display="False"
                                            FilterControlAltText="Filter Asset column" HeaderText="Asset"
                                            ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Site_Name" Display="False"
                                            FilterControlAltText="Filter Site_Name column" HeaderText="Site"
                                            ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Date_Service"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SERA_Date_Service column" HeaderText="Service Date"
                                            ReadOnly="True" SortExpression="SERA_Date_Service" UniqueName="SERA_Date_Service">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Fitter" Display="False"
                                            FilterControlAltText="Filter SERA_Fitter column" HeaderText="Engineer"
                                            ReadOnly="True" SortExpression="SERA_Fitter" UniqueName="SERA_Fitter">
                                            <HeaderStyle Width="150px" Wrap="True" />
                                            <ItemStyle Width="150px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ServiceType" Display="True"
                                            FilterControlAltText="Filter ServiceType column" HeaderText="Service Type"
                                            ReadOnly="True" SortExpression="ServiceType" UniqueName="ServiceType">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Service_SMU"
                                            FilterControlAltText="Filter SERA_Service_SMU column" HeaderText="Service SMU"
                                            ReadOnly="True" SortExpression="SERA_Service_SMU" UniqueName="SERA_Service_SMU">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Last_SMU"
                                            FilterControlAltText="Filter SERA_Last_SMU column" HeaderText="Last SMU"
                                            ReadOnly="True" SortExpression="SERA_Last_SMU" UniqueName="SERA_Last_SMU">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Event_Ref" Display="True"
                                            FilterControlAltText="Filter SERA_Event_Ref column" HeaderText="Event Ref."
                                            ReadOnly="True" SortExpression="SERA_Event_Ref" UniqueName="SERA_Event_Ref">
                                            <HeaderStyle Width="150px" Wrap="True" />
                                            <ItemStyle Width="150px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_Cal_Event_Type" Display="True"
                                            FilterControlAltText="Filter SERA_Cal_Event_Type column" HeaderText="Cal Event Type"
                                            ReadOnly="True" SortExpression="SERA_Cal_Event_Type" UniqueName="SERA_Cal_Event_Type">
                                            <HeaderStyle Width="150px" Wrap="False" />
                                            <ItemStyle Width="150px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_SMU_Diff"
                                            FilterControlAltText="Filter SERA_SMU_Diff column" HeaderText="SMU Difference"
                                            ReadOnly="True" SortExpression="SERA_SMU_Diff" UniqueName="SERA_SMU_Diff">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SERA_SMU_Left"
                                            FilterControlAltText="Filter SERA_SMU_Left column" HeaderText="SMU Left"
                                            ReadOnly="True" SortExpression="SERA_SMU_Left" UniqueName="SERA_SMU_Left">
                                            <HeaderStyle Width="70px" Wrap="False" />
                                            <ItemStyle Width="70px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                       <%-- <telerik:RadPageView ID="RadPV_SMU" runat="server" Selected="False">
                            <telerik:RadGrid ID="RadGrid_SMU" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                AllowSorting="True" DataSourceID="SqlDS_RadGrid_SMU" ResolvedRenderMode="Classic" Width="1000px" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="SMU_ID" DataKeyNames="SMU_ID" DataSourceID="SqlDS_RadGrid_SMU"
                                    NoMasterRecordsText="No SMUs to display." PageSize="25">
                                    <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add New SMU" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Asset" Display="False"
                                            FilterControlAltText="Filter Asset column" HeaderText="Asset"
                                            ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Site_Name" Display="False"
                                            FilterControlAltText="Filter Site_Name column" HeaderText="Site"
                                            ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SMU_WeekEnding"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SMU_WeekEnding column" HeaderText="WeekEnding"
                                            ReadOnly="True" SortExpression="SMU_WeekEnding" UniqueName="SMU_WeekEnding">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="SMU_Date"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter SMU_Date column" HeaderText="Date"
                                            ReadOnly="True" SortExpression="SMU_Date" UniqueName="SMU_Date">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SMU_Value"
                                            FilterControlAltText="Filter SMU_Value column" HeaderText="SMU"
                                            ReadOnly="True" SortExpression="SMU_Value" UniqueName="SMU_Value">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SMU_Usage"
                                            FilterControlAltText="Filter SMU_Usage column" HeaderText="Usage"
                                            ReadOnly="True" SortExpression="SMU_Usage" UniqueName="SMU_Usage">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="SMU_Notes"
                                                FilterControlAltText="Filter SMU_Notes column" HeaderText="Notes"
                                                ReadOnly="True" SortExpression="SMU_Notes" UniqueName="SMU_Notes">
                                                <HeaderStyle Width="600px" Wrap="true" />
                                                <ItemStyle Width="600px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                         <telerik:RadPageView ID="RadPV_FUEL" runat="server" Selected="False">
                            <telerik:RadGrid ID="RadGrid_FUEL" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                AllowSorting="True" DataSourceID="SqlDS_RadGrid_Fuel" ResolvedRenderMode="Classic" Width="1000px" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="FUEL_ID" DataKeyNames="FUEL_ID" DataSourceID="SqlDS_RadGrid_Fuel"
                                    NoMasterRecordsText="No fuel to display." PageSize="25">
                                    <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Asset" Display="False"
                                            FilterControlAltText="Filter Asset column" HeaderText="Asset"
                                            ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Site_Name" Display="False"
                                            FilterControlAltText="Filter Site_Name column" HeaderText="Site"
                                            ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                            <HeaderStyle Width="120px" Wrap="False" />
                                            <ItemStyle Width="120px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FUEL_WeekEnding"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter FUEL_WeekEnding column" HeaderText="WeekEnding"
                                            ReadOnly="True" SortExpression="FUEL_WeekEnding" UniqueName="FUEL_WeekEnding">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="FUEL_Date"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter FUEL_Date column" HeaderText="Date"
                                            ReadOnly="True" SortExpression="FUEL_Date" UniqueName="FUEL_Date">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FUEL_Quantity"
                                            FilterControlAltText="Filter FUEL_Quantity column" HeaderText="Quantity"
                                            ReadOnly="True" SortExpression="FUEL_Quantity" UniqueName="FUEL_Quantity">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_ChangeOutPlan" runat="server" Selected="False">
                            <telerik:RadGrid ID="RadGrid_PLANNING" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                AllowSorting="True" DataSourceID="SqlDS_RadGrid_PLANNING" ResolvedRenderMode="Classic" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Selecting AllowRowSelect="True" />
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" EnableRealTimeResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="STM_ID" DataKeyNames="STM_ID" DataSourceID="SqlDS_RadGrid_PLANNING"
                                    NoMasterRecordsText="No plans to display." PageSize="25">
                                    <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add New Service" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="STM_ID" DataType="System.Int32"
                                            Display="False" FilterControlAltText="Filter STM_ID column"
                                            HeaderText="Trigger ID" ReadOnly="True" SortExpression="STM_ID"
                                            UniqueName="STM_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Asset" Display="False"
                                            FilterControlAltText="Filter Asset column" HeaderText="Asset" ReadOnly="True"
                                            SortExpression="Asset" UniqueName="Asset">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Model" Display="False"
                                            FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True"
                                            SortExpression="Model" UniqueName="Model">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Level3"
                                            FilterControlAltText="Filter Level3 column" HeaderText="Component"
                                            ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                            <HeaderStyle Width="250px" Wrap="False" />
                                            <ItemStyle Width="250px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Position"
                                            FilterControlAltText="Filter Position column" HeaderText="Position"
                                            ReadOnly="True" SortExpression="Position" UniqueName="Position">
                                            <HeaderStyle Width="250px" Wrap="False" />
                                            <ItemStyle Width="250px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Trend" Display="False"
                                            FilterControlAltText="Filter SER_Trend column"
                                            HeaderText="Trend" ReadOnly="True"
                                            SortExpression="SER_Trend" UniqueName="SER_Trend">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Frequency"
                                            FilterControlAltText="Filter STM_Frequency column" HeaderText="Planned Component Hours"
                                            ReadOnly="True" SortExpression="STM_Frequency" UniqueName="STM_Frequency">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_SMU_Value"
                                            FilterControlAltText="Filter STM_SMU_Value column" HeaderText="Current Component Hours"
                                            ReadOnly="True" SortExpression="STM_SMU_Value" UniqueName="STM_SMU_Value">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Leadtime_Weeks" Display="False"
                                            FilterControlAltText="Filter STM_Leadtime_Weeks column"
                                            HeaderText="Leadtime (Wks)" ReadOnly="True" SortExpression="STM_Leadtime_Weeks"
                                            UniqueName="STM_Leadtime_Weeks">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Duration_Hours" Display="False"
                                            FilterControlAltText="Filter STM_Duration_Hours column"
                                            HeaderText="Duration Hrs" ReadOnly="True"
                                            SortExpression="STM_Duration_Hours" UniqueName="STM_Duration_Hours">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ChangeDue" Display="True"
                                            FilterControlAltText="Filter ChangeDue column"
                                            HeaderText="Change Due (Hours)" ReadOnly="True"
                                            SortExpression="ChangeDue" UniqueName="ChangeDue">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Adjustment" Display="False"
                                            FilterControlAltText="Filter STM_Adjustment column" HeaderText="Current Adjustment"
                                            ReadOnly="True" SortExpression="STM_Adjustment" UniqueName="STM_Adjustment">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Planning_Status" Display="False"
                                            FilterControlAltText="Filter STM_Planning_Status column" HeaderText="Status"
                                            ReadOnly="True" SortExpression="STM_Planning_Status"
                                            UniqueName="STM_Planning_Status">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_SMU_Changed" Display="False"
                                            FilterControlAltText="Filter STM_SMU_Changed column" HeaderText="SMU Changed"
                                            ReadOnly="True" SortExpression="STM_SMU_Changed" UniqueName="STM_SMU_Changed">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Original_Estimate"
                                            DataFormatString="{0:dd MMM yyyy}" Display="True"
                                            FilterControlAltText="Filter Original_Estimate column"
                                            HeaderText="Original Estimate Date" SortExpression="Original_Estimate"
                                            UniqueName="Original_Estimate">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Date_Estimate"
                                            DataFormatString="{0:dd MMM yyyy}" Display="True"
                                            FilterControlAltText="Filter STM_Date_Estimate column"
                                            HeaderText="New Estimate Date" SortExpression="STM_Date_Estimate"
                                            UniqueName="STM_Date_Estimate">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Date_Estimate"
                                            DataFormatString="{0:dd MMM yyyy}" Display="True"
                                            FilterControlAltText="Filter STM_Date_Estimate column"
                                            HeaderText="Estimated Change Date" SortExpression="STM_Date_Estimate"
                                            UniqueName="STM_Date_Estimate2">
                                            <HeaderStyle Width="90px" Wrap="False" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EstimateDiff" Display="True"
                                            FilterControlAltText="Filter EstimateDiff column" HeaderText="Difference (Days)"
                                            ReadOnly="True" SortExpression="EstimateDiff" UniqueName="EstimateDiff">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_Parts" runat="server" Selected="False">
                            <telerik:RadGrid ID="RadGrid_Part_List" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="SqlDS_RadGrid_SP_PART_LIST"
                                ResolvedRenderMode="Classic" Skin="Glow" AllowSorting="True">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="P_ID" DataKeyNames="P_ID" DataSourceID="SqlDS_RadGrid_SP_PART_LIST">
                                    <RowIndicatorColumn Visible="False">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True">
                                    </ExpandCollapseColumn>
                                    <CommandItemSettings AddNewRecordText="Add new part" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="P_ID" DataType="System.Int32"
                                            Display="False" FilterControlAltText="Filter P_ID column" HeaderText="ID"
                                            ReadOnly="True" SortExpression="P_ID" UniqueName="P_ID">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="P_Part_ID"
                                            FilterControlAltText="Filter P_Part_ID column" HeaderText="Part ID" ReadOnly="True"
                                            SortExpression="P_Part_ID" UniqueName="P_Part_ID">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Model" Display="False"
                                            FilterControlAltText="Filter Model column"
                                            HeaderText="Model" ReadOnly="True" SortExpression="Model"
                                            UniqueName="Model">
                                            <HeaderStyle Width="150px" Wrap="False" />
                                            <ItemStyle Width="150px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Level3" Display="True"
                                            FilterControlAltText="Filter Level3 column"
                                            HeaderText="Component" ReadOnly="True" SortExpression="Level3"
                                            UniqueName="Level3">
                                            <HeaderStyle Width="200px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Position" Display="True"
                                            FilterControlAltText="Filter Position column"
                                            HeaderText="Position" ReadOnly="True" SortExpression="Position"
                                            UniqueName="Position">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CurrentLocation" Display="False"
                                            FilterControlAltText="Filter CurrentLocation column"
                                            HeaderText="Current Location" ReadOnly="True" SortExpression="CurrentLocation"
                                            UniqueName="CurrentLocation">
                                            <HeaderStyle Width="200px" Wrap="True" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PD_Location_Date" Display="False"
                                            DataFormatString="{0:dd MMM yyyy}"
                                            FilterControlAltText="Filter PD_Location_Date column" HeaderText="Date at Location"
                                            ReadOnly="True" SortExpression="PD_Location_Date" UniqueName="PD_Location_Date">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ExpectedDays" Display="False"
                                            FilterControlAltText="Filter ExpectedDays column" HeaderText="Expected Days"
                                            ReadOnly="True" SortExpression="ExpectedDays" UniqueName="ExpectedDays">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ExpectedDaysText" Display="True"
                                            FilterControlAltText="Filter ExpectedDaysText column" HeaderText="Expected Days"
                                            ReadOnly="True" SortExpression="ExpectedDaysText" UniqueName="ExpectedDaysText">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ExpectedDaysCalc" Display="False"
                                            FilterControlAltText="Filter ExpectedDaysCalc column" HeaderText="ExpectedDaysCalc"
                                            ReadOnly="True" SortExpression="ExpectedDaysCalc" UniqueName="ExpectedDaysCalc">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ActualDays" Display="True"
                                            FilterControlAltText="Filter ActualDays column" HeaderText="Actual Days"
                                            ReadOnly="True" SortExpression="ActualDays" UniqueName="ActualDays">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="P_Status" Display="False"
                                            FilterControlAltText="Filter P_Status column" HeaderText="Status"
                                            ReadOnly="True" SortExpression="P_Status" UniqueName="P_Status">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PD_Location_Type" Display="False"
                                            FilterControlAltText="Filter PD_Location_Type column" HeaderText="Location Type"
                                            ReadOnly="True" SortExpression="PD_Location_Type" UniqueName="PD_Location_Type">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                        </EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_Warranties" runat="server" Selected="False">
                            <telerik:RadGrid ID="RadGrid_Warranty" runat="server" AllowAutomaticInserts="True"
                                AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_WARRANTY" ResolvedRenderMode="Classic" Skin="Glow">
                                <ClientSettings EnableAlternatingItems="True">
                                    <Resizing AllowResizeToFit="True" EnableRealTimeResize="True" ResizeGridOnColumnResize="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="STM_ID" DataKeyNames="STM_ID"
                                    DataSourceID="SqlDS_RadGrid_WARRANTY" NoMasterRecordsText="No warranties to display." PageSize="30">
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
                                        <telerik:GridBoundColumn DataField="Warranty_Days_Remaining" FilterControlAltText="Filter Warranty_Days_Remaining column"
                                            HeaderText="Warranty Days Remaining" ReadOnly="True" SortExpression="Warranty_Days_Remaining" UniqueName="Warranty_Days_Remaining">
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
                                         <telerik:GridBoundColumn DataField="STMC_Status" FilterControlAltText="Filter STMC_Status column"
                                            HeaderText="Status" ReadOnly="True" SortExpression="STMC_Status" UniqueName="STMC_Status">
                                            <HeaderStyle Width="100px" Wrap="True" />
                                            <ItemStyle Width="100px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                    <AlternatingItemStyle ForeColor="Black" />
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>--%>
                        <telerik:RadPageView ID="RadPV_Jobs" runat="server" Selected="False">
                            <table class="style1">
                                <tr>
                                    <td class="style9" style="font-size: 14px; color: #FFFFFF; font-family: 'segoe ui'; font-weight: bold;">Site: </td>
                                    <td align="left" class="style10">
                                        <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True"
                                            AutoPostBack="True"  DataTextField="SITE_Name"
                                            DataValueField="SITE_ID" Filter="Contains" ResolvedRenderMode="Classic"
                                            Skin="Glow" Font-Names="Segoe UI" Font-Size="10pt">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" class="style15" style="font-size: 14px; color: #FFFFFF; font-family: 'segoe ui'; font-weight: bold;">Type: </td>
                                    <td class="style16" align="left" style="font-size: 14px; color: black; font-family: 'segoe ui'; font-weight: bold;">
                                        <telerik:RadComboBox ID="RadCB_JobType" runat="server" AllowCustomText="True"
                                            AutoPostBack="True"  DataTextField="ATT_Name"
                                            DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic"
                                            Skin="Glow" Width="200px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" class="style17" style="font-size: 14px; color: #FFFFFF; font-family: 'segoe ui'; font-weight: bold;">Status: </td>
                                    <td align="left" class="style12">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server"
                                            AllowCustomText="True" AutoPostBack="True" 
                                            DataTextField="J_Status_Text" DataValueField="J_Status" Filter="Contains"
                                            ResolvedRenderMode="Classic" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" class="style14" style="font-size: 14px; color: #FFFFFF; font-family: 'segoe ui'; font-weight: bold;">Engineer: </td>
                                    <td align="left" class="style12">
                                        <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True"
                                            AutoPostBack="True" 
                                            DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains"
                                            Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td class="style13" style="font-size: 14px; color: #FFFFFF; font-family: 'segoe ui'; font-weight: bold;" align="right">Event ID: </td>
                                    <td align="left">
                                        <telerik:RadNumericTextBox ID="RadTxt_Number" runat="server"
                                            AutoPostBack="True" Culture="en-GB" DbValueFactor="1" LabelWidth="48px"
                                            MaxValue="9999999999" MinValue="0" ResolvedRenderMode="Classic" Skin="Glow"
                                            Width="120px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                            <table class="style1">
                                <tr>
                                    <td class="style7" style="text-align: left; vertical-align: top;"></td>
                                    <td class="style7" style="text-align: left; vertical-align: top;"></td>
                                    <td class="style4" style="text-align: left; vertical-align: top;" colspan="2"></td>
                                    <td class="style4" style="text-align: left;"></td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: left; vertical-align: top;">
                                        <telerik:RadGrid ID="RadGrid_Archive_Jobs" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                            AllowSorting="True" 
                                            ResolvedRenderMode="Classic" Skin="Glow" Width="1650px">
                                            <ClientSettings EnableAlternatingItems="True">
                                                <Selecting AllowRowSelect="True" />
                                                <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                            </ClientSettings>
                                            <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="J_ID" DataKeyNames="J_ID"
                                                 NoMasterRecordsText="No jobs to display." PageSize="15">
                                                <CommandItemSettings AddNewRecordText="Add New Job" />
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="J_ID" DataType="System.Int32" Display="True"
                                                        FilterControlAltText="Filter J_ID column" HeaderText="ID" ReadOnly="True"
                                                        SortExpression="J_ID" UniqueName="J_ID">
                                                        <HeaderStyle Width="50px" Wrap="False" />
                                                        <ItemStyle Width="50px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="J_E_ID" DataType="System.Int32" Display="True"
                                                        FilterControlAltText="Filter J_E_ID column" HeaderText="Event ID"
                                                        ReadOnly="True" SortExpression="J_E_ID" UniqueName="J_E_ID">
                                                        <HeaderStyle Width="50px" Wrap="False" />
                                                        <ItemStyle Width="50px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="JobType" FilterControlAltText="Filter JobType column"
                                                        HeaderText="Job Type" ReadOnly="True" SortExpression="JobType"
                                                        UniqueName="JobType">
                                                        <HeaderStyle Width="150px" Wrap="False" />
                                                        <ItemStyle Width="150px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Asset" Display="False" FilterControlAltText="Filter Asset column"
                                                        HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                                        <HeaderStyle Width="100px" Wrap="False" />
                                                        <ItemStyle Width="100px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="DefectType" Display="False"
                                                        FilterControlAltText="Filter DefectType column" HeaderText="Defect Type"
                                                        ReadOnly="True" SortExpression="DefectType" UniqueName="DefectType">
                                                        <HeaderStyle Width="150px" Wrap="False" />
                                                        <ItemStyle Width="150px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="DefectIssue" Display="False"
                                                        FilterControlAltText="Filter DefectIssue column" HeaderText="Defect Issue"
                                                        ReadOnly="True" SortExpression="DefectIssue" UniqueName="DefectIssue">
                                                        <HeaderStyle Width="150px" Wrap="False" />
                                                        <ItemStyle Width="150px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="DefectPosition" Display="False"
                                                        FilterControlAltText="Filter DefectPosition column"
                                                        HeaderText="Defect Position" ReadOnly="True" SortExpression="DefectPosition"
                                                        UniqueName="DefectPosition">
                                                        <HeaderStyle Width="150px" Wrap="False" />
                                                        <ItemStyle Width="150px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="J_Handler" FilterControlAltText="Filter J_Handler column"
                                                        HeaderText="Owner" ReadOnly="True" SortExpression="J_Handler" UniqueName="J_Handler">
                                                        <HeaderStyle Width="60px" Wrap="False" />
                                                        <ItemStyle Width="60px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Company" Display="True" FilterControlAltText="Filter Company column"
                                                        HeaderText="Company" ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                                        <HeaderStyle Width="150px" Wrap="False" />
                                                        <ItemStyle Width="150px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Engineer" Display="True"
                                                        FilterControlAltText="Filter Engineer column" HeaderText="Engineer"
                                                        ReadOnly="True" SortExpression="Engineer" UniqueName="Engineer">
                                                        <HeaderStyle Width="150px" Wrap="False" />
                                                        <ItemStyle Width="150px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="J_Shift" FilterControlAltText="Filter J_Shift column"
                                                        HeaderText="Shift" ReadOnly="True" SortExpression="J_Shift" UniqueName="J_Shift">
                                                        <HeaderStyle Width="60px" Wrap="False" />
                                                        <ItemStyle Width="60px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="J_Instruction" Display="True"
                                                        FilterControlAltText="Filter J_Instruction column" HeaderText="Instruction"
                                                        ReadOnly="True" SortExpression="J_Instruction" UniqueName="J_Instruction">
                                                        <HeaderStyle Width="250px" Wrap="False" />
                                                        <ItemStyle Width="250px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="J_Date_Closed" DataFormatString="{0:dd MMM yyyy}" Display="False"
                                                        FilterControlAltText="Filter J_Date_Closed column" HeaderText="Date Closed"
                                                        ReadOnly="True" SortExpression="J_Date_Closed" UniqueName="J_Date_Closed">
                                                        <HeaderStyle Width="90px" Wrap="False" />
                                                        <ItemStyle Width="90px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="J_Status" FilterControlAltText="Filter J_Status column"
                                                        HeaderText="Status" ReadOnly="True" SortExpression="J_Status"
                                                        UniqueName="J_Status">
                                                        <HeaderStyle Width="70px" Wrap="False" />
                                                        <ItemStyle Width="70px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="E_Status" Display="False"
                                                        FilterControlAltText="Filter E_Status column" HeaderText="E Status"
                                                        ReadOnly="True" SortExpression="E_Status" UniqueName="E_Status">
                                                        <HeaderStyle Width="70px" Wrap="False" />
                                                        <ItemStyle Width="70px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" runat="server" IsSticky="True" />
                                        <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel2">
                                            <AjaxSettings>
                                                <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                                                    <UpdatedControls>
                                                        <telerik:AjaxUpdatedControl ControlID="RadCB_JobType" />
                                                    </UpdatedControls>
                                                </telerik:AjaxSetting>
                                                <telerik:AjaxSetting AjaxControlID="RadCB_JobType">
                                                    <UpdatedControls>
                                                        <telerik:AjaxUpdatedControl ControlID="lbl_JobType" />
                                                        <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                                                    </UpdatedControls>
                                                </telerik:AjaxSetting>
                                                <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                                                    <UpdatedControls>
                                                        <telerik:AjaxUpdatedControl ControlID="RadCB_Engineer" />
                                                    </UpdatedControls>
                                                </telerik:AjaxSetting>
                                                <telerik:AjaxSetting AjaxControlID="RadCB_Engineer">
                                                    <UpdatedControls>
                                                        <telerik:AjaxUpdatedControl ControlID="RadTxt_Number" />
                                                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive_Jobs" />
                                                    </UpdatedControls>
                                                </telerik:AjaxSetting>
                                                <telerik:AjaxSetting AjaxControlID="RadTxt_Number">
                                                    <UpdatedControls>
                                                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Archive_Jobs" />
                                                    </UpdatedControls>
                                                </telerik:AjaxSetting>
                                            </AjaxSettings>
                                        </telerik:RadAjaxManager>
                                    </td>
                                    <td colspan="2" style="text-align: left; vertical-align: top;"></td>
                                </tr>
                                <tr>
                                    <td class="style6" colspan="4" style="text-align: left; vertical-align: top;"></td>
                                    <td class="style5" style="text-align: left;">
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
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
            <asp:HiddenField ID="HF_SER_ID" runat="server" />
            <asp:HiddenField ID="HF_Trend" runat="server" />
            <asp:HiddenField ID="HF_J_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Site" runat="server" Value="Test" />
             <asp:HiddenField ID="HF_Trigger" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_Event_Job_Total" runat="server" />
            <asp:HiddenField ID="HF_Servicing_Total" runat="server" />
            <asp:HiddenField ID="HF_Jobs_Total" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_18_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_18_RW" runat="server" Value="0" />
<%--            <asp:SqlDataSource ID="SqlDS_RadGrid_Servicing_Gauge" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT SER_Cycle, SER_SMU_Counter, SER_SMU_Left FROM SERVICING WHERE (SER_A_ID = @A_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
            <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" Skin="Glow" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="LoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lblSliderText" />
                            <telerik:AjaxUpdatedControl ControlID="RadSlider1" />
                            <telerik:AjaxUpdatedControl ControlID="AssetDetails" />
                            <telerik:AjaxUpdatedControl ControlID="RadTabStrip1" />
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Trend" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Event_Job_Total" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Servicing_Total" />
<%--                            <telerik:AjaxUpdatedControl ControlID="HF_SMU_Total" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Changeout_Total" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Parts_Total" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Warranties_Total" />--%>
                            <telerik:AjaxUpdatedControl ControlID="HF_Jobs_Total" />
                            <%--<telerik:AjaxUpdatedControl ControlID="HF_LPH" />--%>
                            <telerik:AjaxUpdatedControl ControlID="RadC_EventTimes" />
                            <telerik:AjaxUpdatedControl ControlID="RadP_EventTypes" />
                           <%-- <telerik:AjaxUpdatedControl ControlID="RadC_MTBS" />--%>
                           <%-- <telerik:AjaxUpdatedControl ControlID="RadP_PlanVsUnPlan" />--%>
                            <telerik:AjaxUpdatedControl ControlID="RadC_ServiceHistory" />
                            <telerik:AjaxUpdatedControl ControlID="RadG_NextService" />
                            <telerik:AjaxUpdatedControl ControlID="RadP_JobTypes" />
                             <telerik:AjaxUpdatedControl ControlID="Image1" />
                            <telerik:AjaxUpdatedControl ControlID="PlaceHolder1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                   <%-- <telerik:AjaxSetting AjaxControlID="RadSlider1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="AssetDetails" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_PLANNING" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>--%>
                    <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lblSliderText" />
                            <telerik:AjaxUpdatedControl ControlID="RadSlider1" />
                            <telerik:AjaxUpdatedControl ControlID="AssetDetails" />
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" />
                <%--            <telerik:AjaxUpdatedControl ControlID="HF_LPH" />--%>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lblSliderText" />
                            <telerik:AjaxUpdatedControl ControlID="RadSlider1" />
                            <telerik:AjaxUpdatedControl ControlID="AssetDetails" />
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" />
                    <%--        <telerik:AjaxUpdatedControl ControlID="HF_LPH" />--%>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Activity_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


﻿<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Dashboards - Carbon Emissions" CodeFile="flt_D_CARBON.aspx.vb" Inherits="DASHBOARDS_flt_D_CARBON" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
            width: 861px;
        }

        .auto-style7 {
            width: 224px;
        }

        .auto-style8 {
            width: 668px;
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
    }
    function getAjaxManager() {
        return $find("<%=RadAjaxManager1.ClientID%>");
     }
     (function (global, undefined) {
         global.OnClientSeriesClicked = function (sender, args) {
             var ajaxManager = global.getAjaxManager();

             if (args.get_seriesName() !== "SMU_Date") {
                 ajaxManager.ajaxRequest(args.get_category());
             }
         }
     })(window);
     function OnClientSeriesClicked1(sender, args) {
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" class="auto-style7">&nbsp;&nbsp;
                                <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />&nbsp;&nbsp;
                                <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" /></td>
                            <td align="right" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: right;" class="auto-style8">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label><asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label><asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label><asp:Label ID="lbl_Test" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label><asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label><asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label><asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label></td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">
                                <div id="cont_38931451cfb4f5b8a7c0ed8446ebd8b5">
                                    <script type="text/javascript" async src="https://www.yourweather.co.uk/wid_loader/38931451cfb4f5b8a7c0ed8446ebd8b5"></script>
                                </div>
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #E46C0A; text-align: left;" valign="middle">
                                <div id="cont_3fe1c13214bab6685b24e548f5cb541c">
                                    <script type="text/javascript" async src="https://www.yourweather.co.uk/wid_loader/3fe1c13214bab6685b24e548f5cb541c"></script>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 18px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style3" rowspan="2">
                                <asp:Label ID="lblTitle" runat="server" Text="PLANT RESOURCE EFFICIENCY" Font-Bold="False" ForeColor="White"></asp:Label></td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" rowspan="2">
                                <telerik:RadButton ID="RadBtn_Reset" runat="server" Text="Reset"></telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" rowspan="2">
                                <asp:Label ID="lblSite" runat="server" Text="Site:"></asp:Label></td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Site" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default"></telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" rowspan="2">
                                <asp:Label ID="lblFrom" runat="server" Text="From:"></asp:Label></td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadMonthYearPicker ID="RadDP_From" runat="server" AutoPostBack="True" Width="150px">
                                    <DateInput AutoPostBack="True" DateFormat="MMMM yyyy" DisplayDateFormat="MMMM yyyy" LabelWidth="40%">
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                    <MonthYearNavigationSettings DateIsOutOfRangeMessage="Cancel" />
                                </telerik:RadMonthYearPicker>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" rowspan="2">
                                <asp:Label ID="lblTo" runat="server" Text="To:"></asp:Label></td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadMonthYearPicker ID="RadDP_To" runat="server" AutoPostBack="True" Width="150px">
                                    <DateInput AutoPostBack="True" DateFormat="MMMM yyyy" DisplayDateFormat="MMMM yyyy" LabelWidth="40%">
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                    <MonthYearNavigationSettings DateIsOutOfRangeMessage="Cancel" />
                                </telerik:RadMonthYearPicker>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" rowspan="2">
                                <asp:Label ID="lblAsset" runat="server" Text="Asset:"></asp:Label></td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" CheckBoxes="True" DataSourceID="SqlDS_CB_Asset" DataTextField="Asset" DataValueField="A_ID" EnableCheckAllItemsCheckBox="True" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic">
                                    <Localization AllItemsCheckedString="*All Activity Assets" CheckAllString="*All Activity Assets" />
                                </telerik:RadComboBox>
                                <asp:Label ID="lbl_AssetText" runat="server">*All Assets</asp:Label></td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" rowspan="2">
                                <asp:Button ID="Button1" runat="server" Text="Go" /></td>
                        </tr>
                        <tr>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;">
                                <asp:Label ID="lbl_From" runat="server"></asp:Label></td>
                            <td align="left" class="auto-style5" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;">
                                <asp:Label ID="lbl_To" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td colspan="1" valign="middle">
                                <telerik:RadHtmlChart ID="RadChart_Carbon_LPH" runat="server" BackColor="White" DataSourceID="SqlDS_Carbon_LPH_Year" Skin="Silk" Visible="False" Width="1200px" OnClientSeriesClicked="OnClientSeriesClicked">
                                    <ChartTitle Text="Litres/Hr vs CO2/CH4/N2O/CO2E (kg) - Year View"></ChartTitle>
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
                                            <telerik:LineSeries DataFieldY="LitresPerHour" Name="Litres/Hr">
                                                <Appearance FillStyle-BackgroundColor="#000000" />
                                                <MarkersAppearance BorderColor="#000000" />
                                                <TooltipsAppearance Color="#FFFFFF" DataFormatString="{0:#,##0}" >
                                                <ClientTemplate>
                                                       <b>Fuel Quantity: #= kendo.format(\'{0:N0}\', dataItem.Fuel_Quantity)#</b>
                                                        <br/> 
                                                       <b>SMU Usage: #= kendo.format(\'{0:N0}\', dataItem.SMU_Usage)#</b>
                                                        <br/>
                                                    </ClientTemplate>
                                                     </TooltipsAppearance>
                                            </telerik:LineSeries>
                                             <telerik:LineSeries DataFieldY="CO2PerLitre" Name="CO2 (kg)">
                                                <Appearance FillStyle-BackgroundColor="#f8a058" />
                                                <MarkersAppearance BorderColor="#f8a058" />
                                            </telerik:LineSeries>
                                             <telerik:LineSeries DataFieldY="CH4PerLitre" Name="CH4 (kg)">
                                                <Appearance FillStyle-BackgroundColor="#97c962" />
                                                <MarkersAppearance BorderColor="#97c962" />
                                            </telerik:LineSeries>
                                             <telerik:LineSeries DataFieldY="N2OPerLitre" Name="N2O (kg)">
                                                <Appearance FillStyle-BackgroundColor="#4bb7ca" />
                                                <MarkersAppearance BorderColor="#4bb7ca" />
                                            </telerik:LineSeries>
                                             <telerik:LineSeries DataFieldY="CO2EPerLitre" Name="CO2e (kg)">
                                                <Appearance FillStyle-BackgroundColor="#ff2020" />
                                                <MarkersAppearance BorderColor="#ff2020" />
                                            </telerik:LineSeries>
                                        </Series>
                                        <XAxis DataLabelsField="YearType" Name="Year"></XAxis>
                                         <YAxis >
                                           <%-- <PlotBands>
                                                <telerik:PlotBand Alpha="100" Color="#e46c0a" From="80" To="80.25" />
                                            </PlotBands>--%>
                                        </YAxis>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
                            </td>
                            <td valign="middle">
                                 <td class="style6" style="text-align: left; vertical-align: top;">
                                <telerik:RadHtmlChart ID="RadP_Gas" runat="server" BackColor="White" DataSourceID="SqlDS_P_Gas" Skin="Silk" Visible="False" Width="500px" Height="400px" OnClientSeriesClicked="OnClientSeriesClicked1">
                                    <ChartTitle Text="CO2e (kg) Split"></ChartTitle>
                                    <Legend>
                                        <Appearance Position="Top" Visible="True"></Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries DataFieldY="PCT" Name="PCT" NameField="Type" ExplodeField="IsExploded" StartAngle="90">
                                                <LabelsAppearance Position="OutsideEnd" DataField="TypeLabel" />
                                                <TooltipsAppearance BackgroundColor="" Color="White" DataFormatString="{0:£#,##0}">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N2}\', dataItem.PCT)#%
                                                              
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
                            </td>
                            </td>
                        </tr>
                        <tr>
                             <td colspan="1" valign="middle">
                                <telerik:RadHtmlChart ID="RadChart_Litres" runat="server" BackColor="White" DataSourceID="SqlDS_Carbon_LPH_Year" Skin="Silk" Visible="False" Width="1200px" OnClientSeriesClicked="OnClientSeriesClicked">
                                    <ChartTitle Text="Total Litres - Year View"></ChartTitle>
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
                                            <telerik:LineSeries DataFieldY="Fuel_Quantity" Name="Total Litres">
                                                <Appearance FillStyle-BackgroundColor="#000000" />
                                                <MarkersAppearance BorderColor="#000000" />
                                                <TooltipsAppearance Color="#FFFFFF" DataFormatString="{0:#,##0}" >
                                                     </TooltipsAppearance>
                                                <LabelsAppearance DataFormatString="{0:#,##0}" />
                                            </telerik:LineSeries>
                                        </Series>
                                        <XAxis DataLabelsField="YearType" Name="Year"></XAxis>
                                         <YAxis >
                                           <%-- <PlotBands>
                                                <telerik:PlotBand Alpha="100" Color="#e46c0a" From="80" To="80.25" />
                                            </PlotBands>--%>
                                        </YAxis>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
                            </td>
                             <td valign="middle">
                                 <td class="style6" style="text-align: left; vertical-align: top;">
                                 <telerik:RadHtmlChart ID="RadP_Fuel" runat="server" BackColor="White" DataSourceID="SqlDS_P_Fuel" Height="400px" Skin="Silk" Visible="False" Width="500px" OnClientSeriesClicked="OnClientSeriesClicked1">
                                     <ChartTitle Text="Fuel Quantity Split">
                                     </ChartTitle>
                                     <Legend>
                                         <Appearance Position="Top" Visible="True">
                                         </Appearance>
                                     </Legend>
                                     <PlotArea>
                                         <Series>
                                             <telerik:PieSeries DataFieldY="PCT" ExplodeField="IsExploded" Name="PCT" NameField="Type" StartAngle="90">
                                                 <LabelsAppearance DataField="TypeLabel" Position="OutsideEnd" />
                                                 <TooltipsAppearance BackgroundColor="" Color="White" DataFormatString="{0:#,##0}">
                                                     <ClientTemplate>
                                                        #= kendo.format(\'{0:N0}\', dataItem.Count)#
                                                              
                                                    </ClientTemplate>
                                                 </TooltipsAppearance>
                                             </telerik:PieSeries>
                                         </Series>
                                     </PlotArea>
                                 </telerik:RadHtmlChart>
                                 </td>
                             </td>
                        </tr>
                        <tr>
                            <td colspan="1" valign="middle">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6" style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lblPreviousPage" runat="server" Font-Size="2pt" ForeColor="White"></asp:Label>
                            </td>
                            <td class="style5" style="text-align: left;"></td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Process" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Site" runat="server" Value="%" />
            <asp:HiddenField ID="HF_From" runat="server" />
            <asp:HiddenField ID="HF_To" runat="server" />
            <asp:HiddenField ID="HF_Asset" runat="server" />
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
            <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS SITE_ID, '*All Sites' AS SITE_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), SITE.SITE_ID) AS SITE_ID, SITE.SITE_Name FROM FUEL INNER JOIN ASSET AS A ON FUEL.FUEL_A_ID = A.A_ID INNER JOIN SITE ON A.A_SITE_ID = SITE.SITE_ID WHERE (SITE.SITE_ID NOT IN (1, 15)) ORDER BY SITE_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server" ConnectionString="<%$ ConnectionStrings:ICT_CENTRALConnectionString %>" SelectCommand="FleetCarbonReportAssetComboBox" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="SITE_ID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Carbon_LPH" runat="server"
                ConnectionString="<%$ ConnectionStrings:ICT_CENTRALConnectionString %>"
                SelectCommand="FleetCarbonAsset"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="Site" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="HF_From" Name="DateFrom" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_To" Name="DateTo" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_Asset" DefaultValue="%" Name="Asset" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Carbon_LPH_Year" runat="server"
                ConnectionString="<%$ ConnectionStrings:ICT_CENTRALConnectionString %>"
                SelectCommand="FleetCarbonAsset_Year"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="Site" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="HF_From" Name="DateFrom" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_To" Name="DateTo" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_Asset" DefaultValue="%" Name="Asset" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDS_P_Gas" runat="server"
                ConnectionString="<%$ ConnectionStrings:ICT_CENTRALConnectionString %>"
                SelectCommand="FleetCarbonAsset_PieChart"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="Site" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="HF_From" Name="DateFrom" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_To" Name="DateTo" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_Asset" DefaultValue="%" Name="Asset" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_P_Fuel" runat="server"
                ConnectionString="<%$ ConnectionStrings:ICT_CENTRALConnectionString %>"
                SelectCommand="FleetFuelSite_PieChart"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_From" Name="DateFrom" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_To" Name="DateTo" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Silk">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" OnAjaxRequest="RadAjaxManager1_AjaxRequest" RequestQueueSize="1">
                <AjaxSettings>
                     <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Carbon_LPH" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Litres" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Process" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_AssetText" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Carbon_LPH" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Litres" />
                            <telerik:AjaxUpdatedControl ControlID="RadP_Gas" />
                            <telerik:AjaxUpdatedControl ControlID="RadP_Fuel" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadBtn_Reset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Process" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_AssetText" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Carbon_LPH" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Litres" />
                             <telerik:AjaxUpdatedControl ControlID="RadP_Gas" />
                            <telerik:AjaxUpdatedControl ControlID="RadP_Fuel" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                             <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_From">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Carbon_LPH" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Litres" />
                             <telerik:AjaxUpdatedControl ControlID="RadP_Gas" />
                            <telerik:AjaxUpdatedControl ControlID="RadP_Fuel" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_To">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                           <telerik:AjaxUpdatedControl ControlID="RadChart_Carbon_LPH" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Litres" />
                             <telerik:AjaxUpdatedControl ControlID="RadP_Gas" />
                            <telerik:AjaxUpdatedControl ControlID="RadP_Fuel" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Button1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Process" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_AssetText" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Carbon_LPH" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_Litres" />
                             <telerik:AjaxUpdatedControl ControlID="RadP_Gas" />
                            <telerik:AjaxUpdatedControl ControlID="RadP_Fuel" />
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


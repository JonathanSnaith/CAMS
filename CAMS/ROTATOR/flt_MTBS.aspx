<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET Dashboards - Chart" CodeFile="flt_MTBS.aspx.vb" Inherits="ROTATOR_flt_MTBS" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
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
        .auto-style6 {
            width: 173px;
        }
        .auto-style7 {
            width: 7px;
        }
        .auto-style8 {
            width: 282px;
        }
      </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
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
                                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>
                                <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                - LIVE MTBS<asp:Label ID="lbl_Asset" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style3">
                                 &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style6">
                                &nbsp;</td>
                            <td align="right" style="color: White; font-family: 'Segoe UI'; font-size: 24px; padding-left: 15px; background-color: #999999; text-align: right; padding-top: 5px;" class="auto-style8">
                                <asp:Label ID="lbl_From" runat="server"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 24px; background-color: #999999; text-align: right;" class="auto-style7">
                                 -</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 24px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <asp:Label ID="lbl_To" runat="server"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                 &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                &nbsp;</td>
                        </tr>
                    </table>
                <table style="padding-top: 20px">
                    <tr>
                        <td class="style9" colspan="2" style="text-align: left; vertical-align: top;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9" style="text-align: left; vertical-align: top;">
                            <telerik:RadHtmlChart ID="RadHtmlChart6" runat="server" BackColor="White" DataSourceID="SqlDataSource2" Skin="Silk" Visible="False" Width="1400px" Height="700px">
                                <ChartTitle Text="MTBS – Mean Time Between Stoppages">
                                    </ChartTitle>
                                <Legend>
                                    <Appearance Position="Top"></Appearance>
                                </Legend>
                                <PlotArea>
                                    <Series>
                                        <telerik:LineSeries DataFieldY="MTBS_ALL" Name="All Sites">
                                            <Appearance FillStyle-BackgroundColor="#000000" />
                                            <MarkersAppearance BorderColor="#000000" />
                                            <TooltipsAppearance Color="#FFFFFF" />
                                        </telerik:LineSeries>
                                        <telerik:LineSeries DataFieldY="MTBS_3" Name="Brenkley">
                                            <Appearance FillStyle-BackgroundColor="#97c962" />
                                            <MarkersAppearance BorderColor="#97c962" />
                                        </telerik:LineSeries>
<%--                                        <telerik:LineSeries DataFieldY="MTBS_17" Name="Rusha">
                                            <Appearance FillStyle-BackgroundColor="#4bb7ca" />
                                            <MarkersAppearance BorderColor="#4bb7ca" />
                                        </telerik:LineSeries>--%>
                                        <telerik:LineSeries DataFieldY="MTBS_18" Name="Shotton">
                                            <Appearance FillStyle-BackgroundColor="#ff2020" />
                                            <MarkersAppearance BorderColor="#ff2020" />
                                        </telerik:LineSeries>
                                       <%-- <telerik:LineSeries DataFieldY="MTBS_26" Name="Ponesk">
                                            <Appearance FillStyle-BackgroundColor="#b56c8e" />
                                            <MarkersAppearance BorderColor="#b56c8e" />
                                        </telerik:LineSeries>--%>
                                         <telerik:LineSeries DataFieldY="MTBS_38" Name="Bradley">
                                                <Appearance FillStyle-BackgroundColor="#f8a058" />
                                                <MarkersAppearance BorderColor="#f8a058" />
                                            </telerik:LineSeries>
                                    </Series>
                                    <XAxis DataLabelsField="Month"></XAxis>
                                    <YAxis Step="10">
                                        <PlotBands>
                                            <telerik:PlotBand Alpha="100" Color="#e46c0a" From="40" To="41" />
                                        </PlotBands>
                                    </YAxis>
                                </PlotArea>
                            </telerik:RadHtmlChart>
                        </td>
                        <td valign="middle">
                            <asp:Label ID="lbl_MTBS" runat="server" ForeColor="Black" Text="Definition: MTBS is the average operating time between machine stoppages(planned and unplanned) and a function of the average frequency of equipment downtime events expressed in hours." Visible="False" Font-Names="Segoe UI" Font-Size="14pt" Width="200px"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="lbl_MTBS_Calc" runat="server" Font-Names="Segoe UI" Font-Size="14pt" ForeColor="Black" Text="Calculation: MTBS = Operating Hours / No. of Stoppages (hours)" Visible="False" Width="200px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" style="text-align: left; vertical-align: top;">
                            <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
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
<asp:HiddenField ID="HF_From" runat="server" />
<asp:HiddenField ID="HF_To" runat="server" />
         <asp:SqlDataSource ID="SqlDS_SYS" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT SYS_Name, SYS_Version FROM SYSTEM"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ICT_CENTRALConnectionString %>" 
            SelectCommand="FleetTimeSheetSummaryReportAsset_ALL" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="HF_From" DbType="Date" Name="DateFrom" PropertyName="Value" />
                <asp:ControlParameter ControlID="HF_To" DbType="Date" Name="DateTo" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" Skin="Silk">
        </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline">
        </telerik:RadAjaxManager>
         <asp:Literal ID="itemsClientSide" runat="server" />
</div>
    </form>
</body>
</html>


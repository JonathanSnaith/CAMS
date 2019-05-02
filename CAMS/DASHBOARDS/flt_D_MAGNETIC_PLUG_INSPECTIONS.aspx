<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Dashboards - Magnetic Plug Inspections" CodeFile="flt_D_MAGNETIC_PLUG_INSPECTIONS.aspx.vb" Inherits="DASHBOARDS_flt_D_MAGNETIC_PLUG_INSPECTIONS" %>

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
                             <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: left;" valign="middle">
                            </td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style3" rowspan="2">
                                <asp:Label ID="lblTitle" runat="server" Text="MAGNETIC PLUG ANALYSIS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" rowspan="2">
                                <telerik:RadButton ID="RadBtn_Reset" runat="server" Text="Reset" Skin="Glow">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" rowspan="2">
                                Customer:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="250px">
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
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True"  DataTextField="A_Asset_ID" DataValueField="A_ID"  Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" rowspan="2" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">Compartment:</td>
                            <td align="left" rowspan="2" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Compartment" runat="server" AllowCustomText="True" AutoPostBack="True" CheckBoxes="True" DataTextField="ATT_Name" DataValueField="ATT_ID_CP" EnableCheckAllItemsCheckBox="True" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="250px" Skin="Glow">
                                      <Localization AllItemsCheckedString="*All Compartments" CheckAllString="*All Compartments" />
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" rowspan="2">
                                <telerik:RadButton ID="Button1" runat="server" Skin="Glow" Text="Go" >
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
                                <telerik:RadGrid ID="RadGrid2" runat="server" DataSourceID="SqlDataSource4" Skin="Glow" ResolvedRenderMode="Classic" Visible="False">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource4" DataKeyNames="MPI_CP_ID1" NoMasterRecordsText="No records to display." >
                                        <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="Site" DataType="System.Int32" Display="False"
                                                FilterControlAltText="Filter Site column" HeaderText="Site" ReadOnly="True"
                                                SortExpression="Site" UniqueName="Site">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MPI_Date_Full" DataFormatString="{0:dd MMM yyyy}" Display="True"
                                                FilterControlAltText="Filter MPI_Date_Full column" HeaderText="Date" ReadOnly="True"
                                                SortExpression="MPI_Date_Full" UniqueName="MPI_Date_Full">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Compartment1_Rating" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter Compartment1_Rating column" HeaderText="Compartment1" ReadOnly="True"
                                                SortExpression="Compartment1_Rating" UniqueName="Compartment1_Rating">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Compartment2_Rating" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter Compartment2_Rating column" HeaderText="Compartment2" ReadOnly="True"
                                                SortExpression="Compartment2_Rating" UniqueName="Compartment2_Rating">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Compartment3_Rating" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter Compartment3_Rating column" HeaderText="Compartment3" ReadOnly="True"
                                                SortExpression="Compartment3_Rating" UniqueName="Compartment3_Rating">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Compartment4_Rating" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter Compartment4_Rating column" HeaderText="Compartment4" ReadOnly="True"
                                                SortExpression="Compartment4_Rating" UniqueName="Compartment4_Rating">
                                                <HeaderStyle Width="75px" />
                                                <ItemStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Compartment5_Rating" DataType="System.Int32" Display="True"
                                                FilterControlAltText="Filter Compartment5_Rating column" HeaderText="Compartment5" ReadOnly="True"
                                                SortExpression="Compartment5_Rating" UniqueName="Compartment5_Rating">
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
                                <telerik:RadHtmlChart ID="RadChart_MagPlug_Asset" runat="server"  DataSourceID="SqlDataSource4" Skin="Glow" Visible="False" Width="1200px">
                                    <ChartTitle Text="Magnetic Plug Inspections Analysis"></ChartTitle>
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
                                            <telerik:LineSeries DataFieldY="Compartment1_Rating" Name="Compartment1">
                                                <Appearance FillStyle-BackgroundColor="#FFFFFF" />
                                                <MarkersAppearance BorderColor="#FFFFFF" />
                                                <TooltipsAppearance BackgroundColor="" Color="Black">
                                                    <ClientTemplate>
                                                                <b>Asset:#=dataItem.Compartment1_Asset# </b>
                                                        <br/> 
                                                        <br/>
                                                              <img src=#=dataItem.Compartment1_Photo_Link# height="400" width="400"/>
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:LineSeries>
                                            <telerik:LineSeries DataFieldY="Compartment2_Rating" Name="Compartment2">
                                                <Appearance FillStyle-BackgroundColor="#97c962" />
                                                <MarkersAppearance BorderColor="#97c962" />
                                                <TooltipsAppearance BackgroundColor="" Color="Black">
                                                    <ClientTemplate>
                                                       <b>Asset:#=dataItem.Compartment2_Asset# </b>
                                                        <br/> 
                                                        <br/>
                                                                   <img src=#=dataItem.Compartment2_Photo_Link# height="400" width="400"/>
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:LineSeries>
                                            <telerik:LineSeries DataFieldY="Compartment3_Rating" Name="Compartment3">
                                                <Appearance FillStyle-BackgroundColor="#4bb7ca" />
                                                <MarkersAppearance BorderColor="#4bb7ca" />
                                                <TooltipsAppearance BackgroundColor="" Color="Black">
                                                    <ClientTemplate>
                                                      <b>Asset:#=dataItem.Compartment3_Asset# </b>
                                                        <br/>
                                                        <br/> 
                                                                  <img src=#=dataItem.Compartment3_Photo_Link# height="400" width="400"/>
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:LineSeries>
                                            <telerik:LineSeries DataFieldY="Compartment4_Rating" Name="Compartment4">
                                                <Appearance FillStyle-BackgroundColor="#ff2020" />
                                                <MarkersAppearance BorderColor="#ff2020" />
                                                <TooltipsAppearance BackgroundColor="" Color="Black">
                                                    <ClientTemplate>
                                                      <b>Asset:#=dataItem.Compartment_Asset# </b>
                                                        <br/> 
                                                        <br/>
                                                                   <img src=#=dataItem.Compartment4_Photo_Link# height="400" width="400"/>
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:LineSeries>
                                            <telerik:LineSeries DataFieldY="Compartment_Rating" Name="Compartment5">
                                                <Appearance FillStyle-BackgroundColor="#b56c8e" />
                                                <MarkersAppearance BorderColor="#b56c8e" />
                                                <TooltipsAppearance BackgroundColor="" Color="Black">
                                                    <ClientTemplate>
                                                       <b>Asset:#=dataItem.Compartment5_Asset# </b>
                                                        <br/> 
                                                        <br/>
                                                                   <img src=#=dataItem.Compartment5_Photo_Link# height="400" width="400"/>
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:LineSeries>
                                        </Series>
                                        <XAxis DataLabelsField="MPI_Date_Full">
                                            <LabelsAppearance RotationAngle="75" />
                                        </XAxis>
                                        <YAxis MaxValue="5" Step="1">
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
                            <td class="style9" style="text-align: left; vertical-align: top;"></td>
                            <td valign="middle">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6" style="text-align: left; vertical-align: top;">
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
            <asp:HiddenField ID="HF_Compartment" runat="server" />
            <asp:HiddenField ID="HF_PlotBandFrom" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PlotBandTo" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PlotBandFrom2" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PlotBandTo2" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="GetMagPlugIns_SummaryReport_Asset" SelectCommandType="StoredProcedure">
                <SelectParameters>
                   <asp:ControlParameter ControlID="RadCB_Customer" Name="Customer" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Asset" DefaultValue="-1" Name="Asset" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="HF_From" Name="DateFrom" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_To" Name="DateTo" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HF_Compartment" DefaultValue="%" Name="Compartment" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadBtn_Reset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Compartment" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Compartment" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_MagPlug_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                            <telerik:AjaxUpdatedControl ControlID="HF_From" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                            <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                             <telerik:AjaxUpdatedControl ControlID="Button1" />
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
                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_MagPlug_Asset" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_To">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_To" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_MagPlug_Asset" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Compartment" />
                            <telerik:AjaxUpdatedControl ControlID="Button1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="Button1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Compartment">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Compartment" />
                            <telerik:AjaxUpdatedControl ControlID="Button1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Button1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Compartment" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_MagPlug_Asset" />
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


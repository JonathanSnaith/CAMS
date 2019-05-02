<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Report Asset Management Home" CodeFile="flt_REPORT_ASSET.aspx.vb" Inherits="CLIENT_flt_REPORT_ASSET" %>

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
            width: 335px;
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
        var AssetId = document.getElementById('HF_Asset').value
        var Activity_Status = document.getElementById('HF_Activity_Status').value
        var SiteId = document.getElementById('HF_Site').value
        var CostId = document.getElementById('HF_Cost').value
        var DateFrom = document.getElementById('HF_From').value
        var DateTo = document.getElementById('HF_To').value
        var OK = 1
        if (WhichReport == "Plant Location") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Plant_Location.rpt&@A_SITE_ID=' + SiteId + "&@A_SC_ID=" + CostId + "&@A_Activity_Status=" + Activity_Status, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Hired Plant") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Hired_Plant.rpt&@A_SITE_ID=' + SiteId + "&@A_Activity_Status=" + Activity_Status + "&@A_SC_ID=" + CostId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Asset Insurance") {
            if (SiteId == "0" && OK == 1) {
                alert('You must select a Site')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Asset_Insurance.rpt&@A_SITE_ID=' + SiteId + "&@A_Activity_Status=" + Activity_Status, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
            }
        }
        if (WhichReport == "Asset Insurance Status") {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Asset_Insurance_Status.rpt', "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
        }
        if (WhichReport == "Asset Sale") {
            if (AssetId == "0" && OK == 1) {
                alert('You must select an Asset')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/Asset_Sale.rpt&@A_ID=' + AssetId, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=1200');
            }
        }
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
                                 <asp:Label ID="lblTitle" runat="server" Text="REPORTS - ASSET MANAGEMENT" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                                &nbsp;</td>
                        </tr>
                    </table>
            <table border="0" style="width: 100%">
                <tr>
                    <td width="15%" class="auto-style1">
                        
                    </td>
                    <td class="auto-style2">
                       
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
                    <td valign="top" class="auto-style6">
                        <telerik:RadButton ID="RadBtn_Plant_Location" runat="server" Skin="Silk" Text="Plant Location" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Asset_Sale" runat="server" Skin="Silk" Text="Asset Sale" Width="300px">
                        </telerik:RadButton>
                    </td>
                    <td style="width: 300px; height: 150px" valign="top">
                        <telerik:RadButton ID="RadBtn_Hired_Plant" runat="server" Skin="Silk" Text="Hired Plant" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Asset_Insurance" runat="server" Skin="Silk" Text="Asset Insurance" Width="300px">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadBtn_Asset_Insurance_Status" runat="server" Skin="Silk" Text="Asset Insurance Status" Width="300px">
                        </telerik:RadButton>
                    </td>
                    <td style="border-left: 10px solid #A8A8A8; padding-left: 25px; background-color: Black; text-align: left; vertical-align: top; padding-right: 25px; padding-bottom: 0px;" colspan="2">
                        <table width="400px">
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Label ID="lbl_Select" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Select a Report"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_Asset" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Asset:" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Asset" DataTextField="A_ASSET_ID" DataValueField="A_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_Site" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Site:" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Site" DataTextField="SITE_Name" DataValueField="SITE_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic"
                                        Skin="Default" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_From" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="From:" Visible="False"></asp:Label>
                                </td>
                                <td>
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
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_To" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="To:" Visible="False"></asp:Label>
                                </td>
                                <td>
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
                                <td class="auto-style5" align="right">
                                    <asp:Label ID="lbl_Activity_Status" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Activity Status:" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style5">
                                    <telerik:RadComboBox ID="RadCB_Activity_Status" Runat="server" AutoPostBack="True" Visible="False">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Text="*All" Value="%" />
                                            <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" Selected="True" />
                                            <telerik:RadComboBoxItem runat="server" Text="Standing" Value="Standing" />
                                             <telerik:RadComboBoxItem runat="server" Text="Off-Hire" Value="Off-Hire" />
                                            <telerik:RadComboBoxItem runat="server" Text="Disposed" Value="Disposed" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_Cost" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Cost:" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_Cost" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Cost" DataTextField="SC_Ref_Name" DataValueField="SC_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <telerik:RadButton ID="RadBtn_Submit" runat="server" Skin="Default" Text="Submit" Visible="False" OnClientClicked="fn_report">
                                    </telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td height="150px"></td>
                </tr>
                <tr>
                    <td style="height: 150px; padding-left: 15px;">
                        </td>
                    <td class="auto-style6"></td>
                    <td style="width: 300px; height: 150px"></td>
                    <td style="width: 150px; padding-left: 10px;"></td>
                </tr>
                <tr>
                    <td style="height: 150px"></td>
                    <td class="auto-style6"></td>
                    <td align="left" style="font-family: 'Segoe UI'; font-size: 10pt; color: #FFFFFF" valign="bottom">
                        <asp:Label ID="lblPreviousPage" runat="server" ForeColor="White"></asp:Label>
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
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <asp:HiddenField ID="HF_Username" runat="server" />
        <asp:HiddenField ID="HF_SessionIP" runat="server" />
        <asp:HiddenField ID="HF_Site" runat="server" Value="0" />
         <asp:HiddenField ID="HF_Cost" runat="server" Value="0" />
        <asp:HiddenField ID="HF_Asset" runat="server" Value="0" />
        <asp:HiddenField ID="HF_Activity_Status" runat="server" Value="Active"/>
        <asp:HiddenField ID="HF_From" runat="server" />
        <asp:HiddenField ID="HF_To" runat="server" />
        <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
        <asp:HiddenField ID="HF_Session_ID" runat="server" />
        <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
        <asp:HiddenField ID="HF_EMP_ID" runat="server" />
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
        <asp:SqlDataSource ID="SqlDS_CB_Cost" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS SC_ID, '*All Cost Locations' AS SC_Ref_Name UNION ALL SELECT CONVERT (nvarchar(5), SC_ID) AS SC_ID, SC_Ref_Name FROM SITE_Cost WHERE (SC_Status = 1) AND (SC_SITE_ID LIKE @Site) ORDER BY SC_Ref_Name">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Site" Name="Site" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_ASSET_ID UNION ALL SELECT CONVERT(nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM ASSET LEFT OUTER JOIN SERVICING ON SERVICING.SER_A_ID = ASSET.A_ID LEFT OUTER JOIN ATTRIBUTES ON SERVICING.SER_Status_ID = ATTRIBUTES.ATT_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND A_Hide = 0 ORDER BY A_ASSET_ID"></asp:SqlDataSource>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                 <telerik:AjaxSetting AjaxControlID="RadBtn_Plant_Location">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Hired_Plant">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadBtn_Asset_Insurance">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadBtn_Asset_Insurance_Status">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Asset_Sale">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Activity_Status" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                         <telerik:AjaxUpdatedControl ControlID="lbl_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Cost" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Cost" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadCB_Cost">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Cost" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Asset" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                  <telerik:AjaxSetting AjaxControlID="RadCB_Activity_Status">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Activity_Status" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDP_From">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="HF_From" />
                        <telerik:AjaxUpdatedControl ControlID="HF_To" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDP_To">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="HF_To" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
    </form>
</body>
</html>

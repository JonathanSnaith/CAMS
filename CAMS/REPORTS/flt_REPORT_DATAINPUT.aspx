<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Report Data Input Home" CodeFile="flt_REPORT_DATAINPUT.aspx.vb" Inherits="CLIENT_flt_REPORT_DATAINPUT" %>

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
            width: 237px;
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
        var FuelAssetId = document.getElementById('HF_Asset_Fuel').value
        var DateFrom = document.getElementById('HF_From').value
        var DateTo = document.getElementById('HF_To').value
        var OK = 1
        if (WhichReport == "Litres per SMU") {
            if (FuelAssetId == "0" && OK == 1) {
                alert('You must select an Asset')
                OK = 0
            }
            if (OK == 1) {
                window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/LitresPerSMU.rpt&@A_ID=' + FuelAssetId + "&@DateFrom=" + DateFrom + "&@DateTo=" + DateTo, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
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
                                 <asp:Label ID="lblTitle" runat="server" Text="REPORTS - DATA INPUT" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                                &nbsp;</td>
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
                        
                    </td>
                    <td style="width: 300px; height: 150px" valign="top">
                        <telerik:RadButton ID="RadBtn_Litres_per_SMU" runat="server" Skin="Silk" Text="Litres per SMU" Width="300px">
                        </telerik:RadButton>
                    </td>
                    <td style="width: 300px; height: 150px" valign="top">&nbsp;</td>
                    <td style="border-left: 10px solid #A8A8A8; padding-left: 25px; background-color: Black; text-align: left; vertical-align: top; padding-right: 25px; padding-bottom: 0px;" colspan="2">
                        <table width="400px">
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Label ID="lbl_Select" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Select a Report"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
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
                                    <asp:Label ID="lbl_Asset" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="Asset:" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_Asset_Fuel" runat="server" AllowCustomText="True" AutoPostBack="True"
                                        DataSourceID="SqlDS_CB_Asset_Fuel" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                        Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right"><asp:Label ID="lbl_From" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="From:" Visible="False"></asp:Label></td>
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
                                <td align="right"><asp:Label ID="lbl_To" runat="server" Font-Bold="True" Font-Names="Segoe UI" ForeColor="White" Text="To:" Visible="False"></asp:Label></td>
                                <td class="auto-style5"> <telerik:RadDatePicker ID="RadDP_To" runat="server" AutoPostBack="True" Skin="Default" Visible="False">
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
                                    </telerik:RadDatePicker></td>
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
        <asp:HiddenField ID="HF_Asset_Fuel" runat="server" Value="0" />
        <asp:HiddenField ID="HF_From" runat="server" />
        <asp:HiddenField ID="HF_To" runat="server" />
        <asp:HiddenField ID="HF_EventID" runat="server" />
        <asp:HiddenField ID="HF_JobID" runat="server" />
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
        <asp:SqlDataSource ID="SqlDS_CB_Asset_Fuel" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), a.A_ID) AS A_ID, a.A_Asset_ID FROM SMU AS s INNER JOIN FUEL AS f ON f.FUEL_A_ID = s.SMU_A_ID AND s.SMU_WeekEnding = f.FUEL_WeekEnding INNER JOIN ASSET AS a ON s.SMU_A_ID = a.A_ID WHERE (a.A_Status NOT IN ('Trash', 'Delete')) AND (a.A_Activity_Status &lt;&gt; 'Disposed') AND (s.SMU_WeekEnding &gt;= '01 Jan 2016') AND (f.FUEL_Quantity &gt; 0) ORDER BY A_Asset_ID"></asp:SqlDataSource>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadBtn_Litres_per_SMU">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lbl_Select" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                        <telerik:AjaxUpdatedControl ControlID="RadCB_Asset_Fuel" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_From" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_From" />
                        <telerik:AjaxUpdatedControl ControlID="lbl_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadDP_To" />
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="lblPageName" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam2" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam3" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam4" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam5" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam6" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCB_Asset_Fuel">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadBtn_Submit" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Asset_Fuel" />
                        <telerik:AjaxUpdatedControl ControlID="lblParam1" />
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

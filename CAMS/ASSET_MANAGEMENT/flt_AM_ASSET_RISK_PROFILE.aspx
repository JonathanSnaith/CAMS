<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET Asset Risk Profile" CodeFile="flt_AM_ASSET_RISK_PROFILE.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_RISK_PROFILE" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title>FLEET || FUEL </title>
    <link rel="shortcut icon" href="../../IMAGES/fleet_16.ico" />
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
    </style>
    <link href="../../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
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
            window.open('flt_AM_ASSET_LIST.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
    }

</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <table class="style1" cellspacing="0">
                <tr>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" class="auto-style3">&nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                        &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                    </td>
                    <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style2">
                        <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                        <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>

                    </td>
                    <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">&nbsp;</td>
                </tr>
            </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                <tr>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style3">
                        <asp:Label ID="lblTitle" runat="server" Text="ASSET RISK PROFILE" Font-Bold="False" ForeColor="White"></asp:Label>
                    </td>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                        <telerik:RadButton ID="RadBtn_Reset" runat="server" Text="Reset" Skin="Glow">
                        </telerik:RadButton>
                    </td>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                        <asp:Label ID="lblSite" runat="server" Text="Site:"></asp:Label>
                    </td>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                        <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Site" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                        </telerik:RadComboBox>
                    </td>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                        &nbsp;</td>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;">
                        <asp:Label ID="lblAsset" runat="server" Text="Years:"></asp:Label>
                    </td>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                        <telerik:RadComboBox ID="RadCB_Years" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="50px" Skin="Glow">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="1" Value="1" />
                                <telerik:RadComboBoxItem runat="server" Text="2" Value="2" />
                                <telerik:RadComboBoxItem runat="server" Text="3" Value="3" />
                                <telerik:RadComboBoxItem runat="server" Text="4" Value="4" />
                                <telerik:RadComboBoxItem runat="server" Text="5" Value="5" />
                                <telerik:RadComboBoxItem runat="server" Text="6" Value="6" />
                                <telerik:RadComboBoxItem runat="server" Text="7" Value="7" />
                                <telerik:RadComboBoxItem runat="server" Text="8" Value="8" />
                                <telerik:RadComboBoxItem runat="server" Text="9" Value="9" />
                                <telerik:RadComboBoxItem runat="server" Text="10" Value="10" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                    <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                        <asp:Button ID="Button1" runat="server" Text="Go" BackColor="Black" ForeColor="White" />
                    </td>
                </tr>
                </table>
            <table class="style1" border="0">
                <tr>
                    <td class="style5" style="text-align: left; vertical-align: top;" colspan="6">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" Skin="Glow">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ExportSettings ExportOnlyData="True" FileName="FLEET_EXPORT_ASSET_RISK_PROFILE">
                                <Excel Format="ExcelML" />
                            </ExportSettings>
                            <MasterTableView AllowSorting="False" CommandItemDisplay="Top" DataSourceID="SqlDataSource1">
                                <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToExcelButton="True" ShowRefreshButton="False" />
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:Label ID="lbl_Test" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                        <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                        <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                        <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#2c3338"></asp:Label>
                    </td>
                </tr>
            </table>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_ATT_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_Site" runat="server" Value="0" />
             <asp:HiddenField ID="HF_From" runat="server" />
            <asp:HiddenField ID="HF_To" runat="server" />
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
            <asp:SqlDataSource ID="SqlDS_Site" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT '%' AS Site_ID, '*All Sites' AS Site_Name UNION ALL SELECT DISTINCT CONVERT(nvarchar(5), A_SITE_ID) AS Site_ID, SITE.SITE_Name FROM ASSET INNER JOIN SERVICING ON SER_A_ID = ASSET.A_ID INNER JOIN SITE ON A_SITE_ID = SITE.SITE_ID INNER JOIN ATTRIBUTES ON A_MOD_ID = ATT_ID INNER JOIN MODEL_Detail ON A_MOD_ID = MD_MOD_ID WHERE (ASSET.A_Status &lt;&gt; 'Trash') AND (ASSET.A_Activity_Status IN ('Active', 'Standing')) AND (ASSET.A_Hide = 0) AND (SITE.SITE_ID &lt;&gt; 11) AND A_Fuel = 1 AND A_CAT_ID = 252 AND SER_Trend &gt; 1 ORDER BY Site_Name"></asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="ASSET_RISK_PROFILE" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Site" DefaultValue="%" Name="Site" PropertyName="SelectedValue" Type="String" />
                 <asp:ControlParameter ControlID="RadCB_Years"  Name="YearCount" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
                   </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Silk">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                 <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Years" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadBtn_Reset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Years" />
                             <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                   <%-- <telerik:AjaxSetting AjaxControlID="RadCB_Years">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>--%>
                      <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


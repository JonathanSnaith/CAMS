<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET - FUTURE COMPONENT CHANGEOUTS" CodeFile="flt_CC_FUTURE.aspx.vb" Inherits="ROTATOR_flt_CC_FUTURE" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
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
        .RadGrid_Default{border:1px solid;border-color:#a0a0a0;color:#333;background-color:#fff;font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px;line-height:16px}.RadGrid_Default{border:1px solid;border-color:#a0a0a0;color:#333;background-color:#fff;font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px;line-height:16px}.RadGrid_Default{border:1px solid;border-color:#a0a0a0;color:#333;background-color:#fff;font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px;line-height:16px}.RadGrid_Default .rgMasterTable{font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px;line-height:16px}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid_Default .rgMasterTable{font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px;line-height:16px}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid_Default .rgMasterTable{font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px;line-height:16px}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid table.rgMasterTable tr .rgExpandCol{padding-left:0;padding-right:0;text-align:center}.RadGrid table.rgMasterTable tr .rgExpandCol{padding-left:0;padding-right:0;text-align:center}.RadGrid table.rgMasterTable tr .rgExpandCol{padding-left:0;padding-right:0;text-align:center}.RadGrid_Default .rgHeader{color:#333}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}.RadGrid_Default .rgHeader{color:#333}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}.RadGrid_Default .rgHeader{color:#333}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}.RadGrid_Default .rgHeader a{color:#333}.RadGrid .rgHeader a{text-decoration:none}.RadGrid_Default .rgHeader a{color:#333}.RadGrid .rgHeader a{text-decoration:none}.RadGrid_Default .rgHeader a{color:#333}.RadGrid .rgHeader a{text-decoration:none}
        </style>
</head>
<script type="text/javascript">
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
                    <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                -<asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                FUTURE COMPONENT CHANGEOUTS (NEXT 3 MONTHS)</td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
                    <table width="100%" cellspacing="0">
                                       <tr>
                    <td valign="top" style="padding-left: 5px; padding-right: 5px">
                        <table width="100%" cellspacing="0" style="padding-top: 40px">
                            <tr>
                                <td height="100%" style="padding-left: 5px">
                            <telerik:RadGrid ID="RadGrid_PLANNING" runat="server" AllowAutomaticInserts="True"
                                AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_ROTATOR" ResolvedRenderMode="Classic" Skin="Default" Width="100%">
                                <ClientSettings EnableAlternatingItems="False">
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="STM_ID" DataKeyNames="STM_ID"
                                    DataSourceID="SqlDS_RadGrid_SP_ROTATOR" NoMasterRecordsText="No plans to display." PageSize="30">
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
                                        <%--<telerik:GridBoundColumn DataField="Model" Display="True" FilterControlAltText="Filter Model column"
                                            HeaderText="Model" ReadOnly="True" SortExpression="Model" UniqueName="Model">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Width="100px" Wrap="False" />
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn DataField="Level3" FilterControlAltText="Filter Level3 column"
                                            HeaderText="Component" ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                            <HeaderStyle Width="200px" Wrap="False" />
                                            <ItemStyle Width="200px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Position" Display="True" FilterControlAltText="Filter Position column" 
                                            HeaderText="Position" ReadOnly="True" SortExpression="Position"
                                            UniqueName="Position">
                                            <HeaderStyle Width="250px" Wrap="True" />
                                            <ItemStyle Width="250px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Trend" FilterControlAltText="Filter SER_Trend column" Display="False"
                                            HeaderText="Trend" ReadOnly="True" SortExpression="SER_Trend" UniqueName="SER_Trend">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SER_Trend_Override" FilterControlAltText="Filter  SER_Trend_Override column" Display="False"
                                            HeaderText="Trend Override" ReadOnly="True" SortExpression="SER_Trend_Override" UniqueName="SER_Trend_Override">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Frequency" FilterControlAltText="Filter STM_Frequency column" Display="False"
                                            HeaderText="Planned Component Hours" ReadOnly="True" SortExpression="STM_Frequency" UniqueName="STM_Frequency">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_SMU_Value" FilterControlAltText="Filter STM_SMU_Value column" Display="False"
                                            HeaderText="Current Component Hours" ReadOnly="True" SortExpression="STM_SMU_Value" UniqueName="STM_SMU_Value">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Leadtime_Weeks" Display="False" FilterControlAltText="Filter STM_Leadtime_Weeks column"
                                            HeaderText="Leadtime (Wks)" ReadOnly="True" SortExpression="STM_Leadtime_Weeks"
                                            UniqueName="STM_Leadtime_Weeks">
                                            <HeaderStyle Width="50px" Wrap="False" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ChangeDue" Display="False" FilterControlAltText="Filter ChangeDue column"
                                            HeaderText="Change Due (Hours)" ReadOnly="True" SortExpression="ChangeDue" UniqueName="ChangeDue">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Adjustment" Display="False" FilterControlAltText="Filter STM_Adjustment column" 
                                            HeaderText="Current Adjustment" ReadOnly="True" SortExpression="STM_Adjustment" UniqueName="STM_Adjustment">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Date_Estimate" DataFormatString="{0:dd MMM yyyy}"
                                            Display="True" FilterControlAltText="Filter STM_Date_Estimate column" HeaderText="Estimated Change Date"
                                            ReadOnly="True" SortExpression="STM_Date_Estimate" UniqueName="STM_Date_Estimate">
                                            <HeaderStyle Width="90px" Wrap="True" />
                                            <ItemStyle Width="90px" Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="STM_Planning_Status" Display="False" FilterControlAltText="Filter STM_Planning_Status column"
                                            HeaderText="Status" ReadOnly="True" SortExpression="STM_Planning_Status" UniqueName="STM_Planning_Status">
                                            <HeaderStyle Width="50px" Wrap="True" />
                                            <ItemStyle Width="50px" Wrap="True" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                    </EditFormSettings>
                                     <ItemStyle Font-Size="18px" />
                                                <AlternatingItemStyle Font-Size="18px" ForeColor="Black" />
                                                <HeaderStyle Font-Size="18px" />
                                </MasterTableView>
                            </telerik:RadGrid>
                                    </td>
                            </tr>
                            </table>
                    </td>
                </tr>
                    </table>
                    </div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <asp:SqlDataSource ID="SqlDS_SYS" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT SYS_Name, SYS_Version FROM SYSTEM"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ROTATOR" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_ROTATOR_PLANNING_CC_FUTURE_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
       
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
        </telerik:RadAjaxLoadingPanel>
    </form>
</body>
</html>

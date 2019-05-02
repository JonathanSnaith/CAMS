<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET - LIVE COMPONENT CHANGEOUTS" CodeFile="flt_CC_LIVE.aspx.vb" Inherits="ROTATOR_flt_CC_LIVE" %>

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
        .auto-style4 {
            border-color: #d9d9d9;
            background: #d9d9d9;
        }
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
                                LIVE COMPONENT CHANGEOUTS</td>
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
                                        <telerik:RadGrid ID="RadGrid_Active_Events" runat="server" AllowAutomaticInserts="True"
                                            AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_ROTATOR" ResolvedRenderMode="Classic" Width="100%">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <ClientSettings EnableAlternatingItems="True" >
                                            </ClientSettings>
                                            <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="E_ID" DataKeyNames="E_ID"
                                                DataSourceID="SqlDS_RadGrid_SP_ROTATOR" NoMasterRecordsText="No events to display." PageSize="35">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn Created="True">
                                                </ExpandCollapseColumn>
                                                <CommandItemSettings AddNewRecordText="Add new event" />
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="E_ID" DataType="System.Int32" Display="False"
                                                        FilterControlAltText="Filter E_ID column" HeaderText="ID" ReadOnly="True" SortExpression="E_ID"
                                                        UniqueName="E_ID">
                                                        <HeaderStyle Width="50px" Wrap="False" />
                                                        <ItemStyle Width="50px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Asset" FilterControlAltText="Filter Asset column"
                                                        HeaderText="Asset ID" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Site_Name" Display="True" FilterControlAltText="Filter Site_Name column"
                                                        HeaderText="Site" ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                                        <HeaderStyle Width="100px" Wrap="False" />
                                                        <ItemStyle Width="100px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="EngOrCom" Display="True" FilterControlAltText="Filter EngOrCom column"
                                                HeaderText="Event Manager" ReadOnly="True" SortExpression="EngOrCom" UniqueName="EngOrCom">
                                                <HeaderStyle Width="150px" Wrap="True" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="E_Description" Display="True" FilterControlAltText="Filter E_Description column"
                                                        HeaderText="Description" ReadOnly="True" SortExpression="E_Description" UniqueName="E_Description">
                                                        <HeaderStyle Width="200px" Wrap="False" />
                                                        <ItemStyle Width="200px" Wrap="True" />
                                                    </telerik:GridBoundColumn>   
                                                     <telerik:GridBoundColumn DataField="EventType" FilterControlAltText="Filter EventType column" Display="True"
                                                        HeaderText="Event Type" ReadOnly="True" SortExpression="EventType" UniqueName="EventType">
                                                        <HeaderStyle Width="120px" Wrap="False" />
                                                        <ItemStyle Width="120px" Wrap="True" />
                                                    </telerik:GridBoundColumn>                                                 
                                                    <telerik:GridBoundColumn DataField="E_Planned_Start_Date" DataFormatString="{0:dd MMM yyyy}"
                                                        Display="True" FilterControlAltText="Filter E_Planned_Start_Date column" HeaderText="Planned Start Date"
                                                        ReadOnly="True" SortExpression="E_Planned_Start_Date" UniqueName="E_Planned_Start_Date">
                                                        <HeaderStyle Width="80px" Wrap="False" />
                                                        <ItemStyle Width="80px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="E_Date_Estimated" DataFormatString="{0:dd MMM yyyy}"
                                                        FilterControlAltText="Filter E_Date_Estimated column" HeaderText="Estimated Due Back"
                                                        ReadOnly="True" SortExpression="E_Date_Estimated" UniqueName="E_Date_Estimated">
                                                        <HeaderStyle Width="80px" Wrap="True" />
                                                        <ItemStyle Width="80px" Wrap="False" />
                                                    </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="E_Modified_By" Display="False" FilterControlAltText="Filter E_Modified_By column"
                                                        HeaderText="Modified By" ReadOnly="True" SortExpression="E_Modified_By" UniqueName="E_Modified_By">
                                                        <HeaderStyle Width="120px" Wrap="False" />
                                                        <ItemStyle Width="120px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <%-- <telerik:GridImageColumn DataAlternateTextField="EventTypeImg" 
                                            HeaderText="" 
                                            ImageHeight="32px" ImageUrl="../IMAGES/warningflash.png" ImageWidth="32px"
                                            UniqueName="EventTypeImg" AlternateText="EventTypeImg">
                                            <HeaderStyle Width="100px" Wrap="False" HorizontalAlign="Center" />
                                            <ItemStyle Width="100px" Wrap="False" HorizontalAlign="Center" />
                                        </telerik:GridImageColumn>--%>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            <ItemStyle Font-Size="20px" />
                                                <AlternatingItemStyle Font-Size="20px" />
                                                <HeaderStyle Font-Size="20px" />
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
                SelectCommand="EM_ROTATOR_EVENTS_CC_LIVE_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
       
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
        </telerik:RadAjaxLoadingPanel>
    </form>
</body>
</html>

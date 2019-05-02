﻿<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET- Home - Service Adherence" CodeFile="view_SERVICE_ADHERENCE.aspx.vb" Inherits="VIEWS_SERVICE_ADHERENCE" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link href="../../../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .showitem {
            display: block;
        }

        .hideitem {
            display: none;
        }
    </style>
</head>
<body>
    <script type="text/javascript">
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <table cellspacing="0" style="height: 75px; background-color: #E46C0A; color: #FFFFFF;" width="100%">
                <tr>
                    <td style="padding-top: 3px; padding-left: 10px; font-family: 'Segoe UI'; font-size: 26px; vertical-align: bottom;">Service Adherence</td>
                    <td style="text-align: right; font-family: 'Microsoft Sans Serif'; font-size: 12pt; vertical-align: bottom; padding-top: 2px; padding-right: 10px; padding-left: 10px;"></td>
                </tr>

                <tr>
                    <td style="padding-bottom: 3px; padding-left: 10px; font-family: 'Segoe UI'; font-size: 9pt; vertical-align: top;">
                        <asp:Label ID="lblPageName" runat="server" ForeColor="#E46C0A"></asp:Label>
                        <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#E46C0A"></asp:Label>
                    </td>
                    <td style="padding: 2px 10px 2px 10px; text-align: right; font-family: 'Microsoft Sans Serif'; font-size: 12pt;"></td>
                </tr>
            </table>
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDS_Events" Skin="Silk" ResolvedRenderMode="Classic" AllowSorting="True">
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDS_Events" DataKeyNames="SER_ID" NoMasterRecordsText="No records to display." CommandItemDisplay="Top">
                    <CommandItemSettings ShowExportToExcelButton="True" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                    <Columns>
                         <telerik:GridBoundColumn DataField="SER_ID" 
                            FilterControlAltText="Filter SER_ID column" HeaderText="SER_ID"
                            ReadOnly="True" SortExpression="SER_ID" UniqueName="SER_ID"
                            DataType="System.Int32" Display="False">
                            <HeaderStyle Width="100px" Wrap="False" />
                            <ItemStyle Width="100px" Wrap="False" />
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="Site"
                            FilterControlAltText="Filter Site column" HeaderText="Site"
                            ReadOnly="True" SortExpression="Site" UniqueName="Site">
                            <HeaderStyle Width="50px" Wrap="False" />
                            <ItemStyle Width="50px" Wrap="False" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Asset"
                            FilterControlAltText="Filter Asset column" HeaderText="Asset No"
                            ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                            <HeaderStyle Width="50px" Wrap="False" />
                            <ItemStyle Width="50px" Wrap="False" />
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="SMU_Left" Display="True"
                            FilterControlAltText="Filter SMU_Left column" HeaderText="SMU Remaining"
                            ReadOnly="True" SortExpression="SMU_Left" UniqueName="SMU_Left">
                            <HeaderStyle Width="100px" Wrap="False" />
                            <ItemStyle Width="100px" Wrap="False" />
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true">
                </ExportSettings>
            </telerik:RadGrid>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_Site" runat="server" />
            <asp:HiddenField ID="HF_SiteID" runat="server" />
             <asp:HiddenField ID="HF_Site_ID" runat="server" Value="%" />
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_ParentID" runat="server" />
            <asp:HiddenField ID="HF_ParentRef" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
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
            <asp:SqlDataSource ID="SqlDS_Events" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SERVICE_ADHERENCE_SP" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                   <asp:ControlParameter ControlID="HF_Site_ID" Name="Site" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

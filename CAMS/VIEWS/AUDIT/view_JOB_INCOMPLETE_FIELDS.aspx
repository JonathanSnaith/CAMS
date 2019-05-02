<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET- Auditing - Incomplete Job Fields" CodeFile="view_JOB_INCOMPLETE_FIELDS.aspx.vb" Inherits="VIEWS_AUDIT_view_JOB_INCOMPLETE_FIELDS" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link href="../../../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
         .showitem
        {
          display: block; 
        }
      .hideitem
        {
           display: none; 
        }  
        </style>
    </head>
<body>
<script type="text/javascript">
</script>
    <form id="form1" runat="server" >
    <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;" >
    <table cellspacing="0" style="height: 75px; background-color: #E46C0A; color: #FFFFFF;" width="100%" >
            <tr>
                    <td  style="padding-top: 3px; padding-left: 10px; font-family: 'Segoe UI'; font-size: 26px; vertical-align: bottom;">
                        Incomplete Job Fields </td>
                    <td style="text-align: right;  font-family: 'Microsoft Sans Serif'; font-size: 12pt; vertical-align: bottom; padding-top: 2px; padding-right: 10px; padding-left: 10px;">
                        </td>
                    </tr>
            
                    <tr>
                    <td style="padding-bottom: 3px; padding-left: 10px; font-family: 'Segoe UI'; font-size: 9pt; vertical-align: top;">
                        </td>
                    <td style="padding: 2px 10px 2px 10px; text-align: right;  font-family: 'Microsoft Sans Serif'; font-size: 12pt;">
                       </td>
                    </tr>
            </table> 
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDS_Jobs" Skin="Silk" ResolvedRenderMode="Classic">
            <ClientSettings>
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDS_Jobs" 
            DataKeyNames="J_ID" NoMasterRecordsText="No records to display." CommandItemDisplay="Top">
                <CommandItemSettings ShowExportToExcelButton="True" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                <Columns>
                    <telerik:GridBoundColumn DataField="J_ID" DataType="System.Int32" Display = "True"
                        FilterControlAltText="Filter J_ID column" HeaderText="Job ID" ReadOnly="True" 
                        SortExpression="J_ID" UniqueName="J_ID">
                        <HeaderStyle Width="75px" />
                        <ItemStyle Width="75px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="J_E_ID" DataType="System.Int32" Display = "True"
                        FilterControlAltText="Filter J_E_ID column" HeaderText="Event ID" ReadOnly="True" 
                        SortExpression="J_E_ID" UniqueName="J_E_ID">
                        <HeaderStyle Width="75px" />
                        <ItemStyle Width="75px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="J_Created" 
                        DataType="System.DateTime" 
                        FilterControlAltText="Filter J_Created column" 
                        HeaderText="Date Created" SortExpression="A_Created" 
                        UniqueName="J_Created" DataFormatString="{0:dd MMM yyyy}">
                        <HeaderStyle  Width="100px"  Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle  Width="100px"  Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="A_Asset_ID" FilterControlAltText="Filter A_Asset_ID column" HeaderText="Asset" SortExpression="A_Asset_ID" UniqueName="A_Asset_ID">
                        <HeaderStyle Width="100px" />
                        <ItemStyle Width="100px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="JobType" FilterControlAltText="Filter JobType column" HeaderText="Job Type" SortExpression="JobType" UniqueName="EventType">
                        <HeaderStyle Width="100px" />
                        <ItemStyle Width="100px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridImageColumn DataAlternateTextField="Level1" 
                        HeaderText="Level 1 Code" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="Level1" AlternateText="Level1">
                        <HeaderStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridImageColumn>
                     <telerik:GridImageColumn DataAlternateTextField="Level2" 
                        HeaderText="Level 2 Code" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="Level2" AlternateText="Level2">
                        <HeaderStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridImageColumn>
                     <telerik:GridImageColumn DataAlternateTextField="Level3" 
                        HeaderText="Level 3 Code" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="Level3" AlternateText="Level3">
                        <HeaderStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridImageColumn>
                     <telerik:GridImageColumn DataAlternateTextField="IncCode" 
                        HeaderText="Incident Code" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="IncCode" AlternateText="IncCode">
                        <HeaderStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridImageColumn>
                </Columns>
            </MasterTableView>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
               <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true">
                </ExportSettings>
        </telerik:RadGrid>        
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_Site" runat="server" />
            <asp:HiddenField ID="HF_SiteID" runat="server" />
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
        <asp:SqlDataSource ID="SqlDS_Jobs" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="REPORT_AUDIT_JOB_INCOMPLETE_FIELDS_LIST_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:Label ID="lblPageName" runat="server" ForeColor="White"></asp:Label>
        <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="White"></asp:Label>
</div>
    </form>
</body>
</html>


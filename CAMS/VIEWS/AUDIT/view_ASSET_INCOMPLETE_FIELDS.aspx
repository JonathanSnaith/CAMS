<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET- Auditing - Incomplete Asset Fields" CodeFile="view_ASSET_INCOMPLETE_FIELDS.aspx.vb" Inherits="VIEWS_AUDIT_view_ASSET_INCOMPLETE_FIELDS" %>
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
                        Incomplete Asset Fields </td>
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
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDS_Assets" Skin="Silk" ResolvedRenderMode="Classic">
            <ClientSettings>
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDS_Assets" 
            DataKeyNames="A_ID" NoMasterRecordsText="No records to display." CommandItemDisplay="Top">
                <CommandItemSettings ShowExportToExcelButton="True" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                <Columns>
                    <telerik:GridBoundColumn DataField="A_ID" DataType="System.Int32" Display = "False"
                        FilterControlAltText="Filter A_ID column" HeaderText="ID" ReadOnly="True" 
                        SortExpression="A_ID" UniqueName="A_ID">
                        <HeaderStyle Width="75px" />
                        <ItemStyle Width="75px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="A_Created" 
                        DataType="System.DateTime" 
                        FilterControlAltText="Filter A_Created column" 
                        HeaderText="Date Created" SortExpression="A_Created" 
                        UniqueName="A_Created" DataFormatString="{0:dd MMM yyyy}">
                        <HeaderStyle  Width="100px"  Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle  Width="100px"  Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="A_Asset_ID" FilterControlAltText="Filter A_Asset_ID column" HeaderText="Asset" SortExpression="A_Asset_ID" UniqueName="A_Asset_ID">
                        <HeaderStyle Width="100px" />
                        <ItemStyle Width="100px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridImageColumn DataAlternateTextField="PrimaryGroup" 
                        HeaderText="Primary Group" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="PrimaryGroup" AlternateText="PrimaryGroup">
                        <HeaderStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridImageColumn>
                    <telerik:GridImageColumn DataAlternateTextField="SecondaryGroup" 
                        HeaderText="Secondary Group" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="SecondaryGroup" AlternateText="SecondaryGroup">
                        <HeaderStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridImageColumn>
                    <telerik:GridImageColumn DataAlternateTextField="Manufacturer" 
                        HeaderText="Manufacturer" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="Manufacturer" AlternateText="Manufacturer">
                        <HeaderStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridImageColumn>
                    <telerik:GridImageColumn DataAlternateTextField="Model" 
                        HeaderText="Model" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="Model" AlternateText="Model">
                        <HeaderStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                        <ItemStyle Width="32px" Wrap="False" HorizontalAlign="Center" />
                    </telerik:GridImageColumn>
                    <telerik:GridImageColumn DataAlternateTextField="Category" 
                        HeaderText="Category" 
                        ImageHeight="" ImageUrl="../../IMAGES/24x24/supplier_approved_24x24.png" ImageWidth="24px" 
                        UniqueName="Category" AlternateText="Category">
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
        <asp:SqlDataSource ID="SqlDS_Assets" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="REPORT_AUDIT_ASSET_INCOMPLETE_FIELDS_LIST_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:Label ID="lblPageName" runat="server" ForeColor="White"></asp:Label>
        <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="White"></asp:Label>
</div>
    </form>
</body>
</html>


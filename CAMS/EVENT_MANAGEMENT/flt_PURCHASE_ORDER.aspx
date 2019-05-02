<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - Focalpoint Lookup" CodeFile="flt_PURCHASE_ORDER.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_PURCHASE_ORDER" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <style type="text/css">    
        .pane_padding
        {
            padding: 15px 15px 15px 15px; 
        }
        .this_table_general
        {
             font-family: Segoe UI;
             font-size: 16px;
             color: white;             
             width: 100%;
             height: 100%;
             padding: 0px; 
             margin: 0px;
             vertical-align:top;
             text-align: left;  
             background:#35434B;    
        } 
        .style1
        {
            width: 633px;
        }
        </style>
</head>
<body bgcolor="#35434B">
<script type="text/javascript" language="javascript">
    function fn_selected() {
        document.getElementById('lblOrderHeader').innerHTML = 'Busy please wait!';
        document.getElementById('lblOrderItems').innerHTML = 'Busy please wait!'; 
    }
    function fn_selectedcomplete_header() {
        document.getElementById('lblOrderHeader').innerHTML = 'ORDER HEADER';
    }
    function fn_selectedcomplete_items() {
        document.getElementById('lblOrderItems').innerHTML = 'ORDER ITEMS';
    }

</script>
    <form id="form1" runat="server">
    <div>
        <table class="this_table_general" border="0" 
            style="height: 45px;  color: #FFFFFF;  font-size: 12pt;" >
                    <tr>
                        <td style="font-family: 'Segoe UI'; font-size: 16pt; color: #FFFFFF; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #80878C"
                            colspan="2" >
                            &nbsp;PURCHASE ORDER DETAILS</td>
                        <td style="text-align: right; padding-right: 20px; padding-top: 15px;"  >
                            FocalPoint Total £</td>
                    </tr>
                    <tr style="font-family: 'Segoe UI'; font-size: 12px; color: #FFFFFF">
                        <td style="padding-left: 10px">
                            &nbsp;</td>
                        
                        <td style="padding-left: 10px; text-align: right;" class="style1">
                            </td>
                        
                        <td style="padding-left: 10px; text-align: right; font-family: 'Segoe UI'; font-size: 12pt; color: #FFFFFF; padding-right: 20px; font-weight: bold;">
                            <asp:Label ID="lblFocalPoint_Total" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 10px">
                            <asp:Label ID="lblOrderHeader" runat="server" 
            Font-Names="Segoe UI" Font-Size="12pt" 
                    ForeColor="White" Text="ORDER HEADER" Font-Bold="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 15px; padding-right: 15px">
        <telerik:RadGrid ID="RadGrid_Header" runat="server" 
            DataSourceID="SqlDS_PO_Header">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

            <ClientSettings EnablePostBackOnRowClick="True">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDS_PO_Header" 
                DataKeyNames="PR_No" ClientDataKeyNames="PR_No">
                <Columns>
                    <telerik:GridBoundColumn DataField="PO_No" 
                        FilterControlAltText="Filter PO_No column" HeaderText="PO No" 
                        SortExpression="PO_No" UniqueName="PO_No">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PR_No" DataType="System.Int32" 
                        FilterControlAltText="Filter PR_No column" HeaderText="PR No" 
                        SortExpression="PR_No" UniqueName="PR_No">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Site" 
                        FilterControlAltText="Filter Site column" HeaderText="Site" 
                        SortExpression="Site" UniqueName="Site">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Analysis" 
                        FilterControlAltText="Filter Analysis column" HeaderText="Nominal Code" 
                        SortExpression="Analysis" UniqueName="Analysis">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="COST_CENTER" 
                        FilterControlAltText="Filter COST_CENTER column" HeaderText="CC" 
                        SortExpression="COST_CENTER" UniqueName="COST_CENTER">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="__PR_TYPE" 
                        FilterControlAltText="Filter __PR_TYPE column" HeaderText="PR Type" 
                        SortExpression="__PR_TYPE" UniqueName="__PR_TYPE">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Desc" 
                        FilterControlAltText="Filter Desc column" HeaderText="Desc" 
                        SortExpression="Desc" UniqueName="Desc">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Init" 
                        FilterControlAltText="Filter Init column" HeaderText="Init" 
                        SortExpression="Init" UniqueName="Init">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Supplier" 
                        FilterControlAltText="Filter Supplier column" HeaderText="Supplier" 
                        SortExpression="Supplier" UniqueName="Supplier">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" 
                        FilterControlAltText="Filter Status column" HeaderText="Status" 
                        SortExpression="Status" UniqueName="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Approval_Date" DataType="System.DateTime" 
                        FilterControlAltText="Filter Approval_Date column" HeaderText="Approval Date" 
                        ReadOnly="True" SortExpression="Approval_Date" UniqueName="Approval_Date">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Last_Action" 
                        FilterControlAltText="Filter Last_Action column" HeaderText="Last_Action" 
                        SortExpression="Last_Action" UniqueName="Last_Action">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Last_User" 
                        FilterControlAltText="Filter Last_User column" HeaderText="Last_User" 
                        SortExpression="Last_User" UniqueName="Last_User">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Next_Stage" 
                        FilterControlAltText="Filter Next_Stage column" HeaderText="Next_Stage" 
                        SortExpression="Next_Stage" UniqueName="Next_Stage">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Next_User" 
                        FilterControlAltText="Filter Next_User column" HeaderText="Next_User" 
                        SortExpression="Next_User" UniqueName="Next_User">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Total" DataType="System.Double" 
                        FilterControlAltText="Filter Total column" HeaderText="Total" 
                        SortExpression="Total" UniqueName="Total" DataFormatString="{0:£#,##0.00}">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 10px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 10px">
                            <br />
                <asp:Label ID="lblOrderItems" runat="server" Font-Names="Segoe UI" Font-Size="12pt" 
                    ForeColor="White" Text="ORDER ITEMS" Width="100%" Font-Bold="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-right: 15px; padding-left: 15px">
                            <telerik:RadGrid ID="RadGrid1" runat="server" 
                                DataSourceID="SqlDS_PO_Detail" Skin="Glow" Height="400px">
                                <ClientSettings EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView clientdatakeynames="Order_Number" datakeynames="Order_Number" 
                                    AutoGenerateColumns="False" DataSourceID="SqlDS_PO_Detail" 
                                    NoMasterRecordsText="No orders to display.">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Internal_Ref" 
                                            FilterControlAltText="Filter Internal_Ref column" HeaderText="Int Ref" 
                                            SortExpression="Internal_Ref" UniqueName="Internal_Ref">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TS_Details_Primary" 
                                            DataType="System.Double" 
                                            FilterControlAltText="Filter TS_Details_Primary column" 
                                            HeaderText="TS_Details_Primary" SortExpression="TS_Details_Primary" 
                                            UniqueName="TS_Details_Primary" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TS_Header_Primary" DataType="System.Double" 
                                            FilterControlAltText="Filter TS_Header_Primary column" 
                                            HeaderText="TS_Header_Primary" SortExpression="TS_Header_Primary" 
                                            UniqueName="TS_Header_Primary" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Analysis" 
                                            FilterControlAltText="Filter Analysis column" HeaderText="Nominal Code" 
                                            SortExpression="Analysis" UniqueName="Analysis">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Division" 
                                            FilterControlAltText="Filter Division column" HeaderText="Division" 
                                            SortExpression="Division" UniqueName="Division" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Cost_Centre" 
                                            FilterControlAltText="Filter Cost_Centre column" HeaderText="Cost Centre" 
                                            SortExpression="Cost_Centre" UniqueName="Cost_Centre">
                                            <ItemStyle Wrap="False" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Cost_Centre_Description" 
                                            FilterControlAltText="Filter Cost_Centre_Description column" 
                                            HeaderText="CC" SortExpression="Cost_Centre_Description" 
                                            UniqueName="Cost_Centre_Description" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SupplierCode" 
                                            FilterControlAltText="Filter SupplierCode column" HeaderText="Supplier Code" 
                                            SortExpression="SupplierCode" UniqueName="SupplierCode">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SupplierName" 
                                            FilterControlAltText="Filter SupplierName column" HeaderText="SupplierName" 
                                            SortExpression="SupplierName" UniqueName="SupplierName" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Project" 
                                            FilterControlAltText="Filter Project column" HeaderText="Project" 
                                            SortExpression="Project" UniqueName="Project" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Project_Name" 
                                            FilterControlAltText="Filter Project_Name column" HeaderText="Project_Name" 
                                            SortExpression="Project_Name" UniqueName="Project_Name" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Header_Ref" 
                                            FilterControlAltText="Filter Header_Ref column" HeaderText="Header_Ref" 
                                            SortExpression="Header_Ref" UniqueName="Header_Ref" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Description" 
                                            FilterControlAltText="Filter Description column" HeaderText="Description" 
                                            SortExpression="Description" UniqueName="Description">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Unit_Price" DataType="System.Double" 
                                            FilterControlAltText="Filter Unit_Price column" HeaderText="Unit Price" 
                                            SortExpression="Unit_Price" UniqueName="Unit_Price" 
                                            DataFormatString="{0:£#,##0.00}">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Quantity" DataType="System.Double" 
                                            FilterControlAltText="Filter Quantity column" HeaderText="Quantity" 
                                            SortExpression="Quantity" UniqueName="Quantity">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Nett" DataType="System.Double" 
                                            FilterControlAltText="Filter Nett column" HeaderText="Nett" 
                                            SortExpression="Nett" UniqueName="Nett" DataFormatString="{0:£#,##0.00}">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PR_No" DataType="System.Int32" 
                                            FilterControlAltText="Filter PR_No column" HeaderText="PR_No" 
                                            SortExpression="PR_No" UniqueName="PR_No" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Order_Number" 
                                            FilterControlAltText="Filter Order_Number column" HeaderText="Order_Number" 
                                            SortExpression="Order_Number" UniqueName="Order_Number" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Header_Desc" 
                                            FilterControlAltText="Filter Header_Desc column" HeaderText="Header_Desc" 
                                            SortExpression="Header_Desc" UniqueName="Header_Desc" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Status" DataType="System.Byte" 
                                            FilterControlAltText="Filter Status column" HeaderText="Status" 
                                            SortExpression="Status" UniqueName="Status" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Work_Order_No" 
                                            FilterControlAltText="Filter Work_Order_No column" HeaderText="Work_Order_No" 
                                            SortExpression="Work_Order_No" UniqueName="Work_Order_No" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Init" 
                                            FilterControlAltText="Filter Init column" HeaderText="Init" 
                                            SortExpression="Init" UniqueName="Init">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Initiator_Name" 
                                            FilterControlAltText="Filter Initiator_Name column" HeaderText="Initiator_Name" 
                                            SortExpression="Initiator_Name" UniqueName="Initiator_Name" 
                                            Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="InitDate" DataType="System.DateTime" 
                                            FilterControlAltText="Filter InitDate column" HeaderText="Initiated Date" 
                                            SortExpression="InitDate" UniqueName="InitDate">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Recip" 
                                            FilterControlAltText="Filter Recip column" HeaderText="Recip" 
                                            SortExpression="Recip" UniqueName="Recip" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Final_Approver" 
                                            FilterControlAltText="Filter Final_Approver column" HeaderText="Final_Approver" 
                                            SortExpression="Final_Approver" UniqueName="Final_Approver" 
                                            Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Last_Edited" DataType="System.DateTime" 
                                            FilterControlAltText="Filter Last_Edited column" HeaderText="Last_Edited" 
                                            SortExpression="Last_Edited" UniqueName="Last_Edited" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCheckBoxColumn DataField="Reopened" DataType="System.Boolean" 
                                            FilterControlAltText="Filter Reopened column" HeaderText="Reopened" 
                                            SortExpression="Reopened" UniqueName="Reopened" Display="False">
                                        </telerik:GridCheckBoxColumn>
                                        <telerik:GridCheckBoxColumn DataField="Printed" DataType="System.Boolean" 
                                            FilterControlAltText="Filter Printed column" HeaderText="Printed" 
                                            SortExpression="Printed" UniqueName="Printed" Display="False">
                                        </telerik:GridCheckBoxColumn>
                                        <telerik:GridCheckBoxColumn DataField="Ordered" DataType="System.Boolean" 
                                            FilterControlAltText="Filter Ordered column" HeaderText="Ordered" 
                                            SortExpression="Ordered" UniqueName="Ordered" Display="False">
                                        </telerik:GridCheckBoxColumn>
                                        <telerik:GridBoundColumn DataField="PRType" DataType="System.Double" 
                                            FilterControlAltText="Filter PRType column" HeaderText="PRType" 
                                            SortExpression="PRType" UniqueName="PRType" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Approval_History_Last_Action" 
                                            FilterControlAltText="Filter Approval_History_Last_Action column" 
                                            HeaderText="Last Action" 
                                            SortExpression="Approval_History_Last_Action" 
                                            UniqueName="Approval_History_Last_Action">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Approval_History_Last_User" 
                                            FilterControlAltText="Filter Approval_History_Last_User column" 
                                            HeaderText="Last User" 
                                            SortExpression="Approval_History_Last_User" 
                                            UniqueName="Approval_History_Last_User" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Approval_History_Last_User_ID" 
                                            FilterControlAltText="Filter Approval_History_Last_User_ID column" 
                                            HeaderText="Last User" 
                                            SortExpression="Approval_History_Last_User_ID" 
                                            UniqueName="Approval_History_Last_User_ID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Approval_History_Next_Stage" 
                                            FilterControlAltText="Filter Approval_History_Next_Stage column" 
                                            HeaderText="Next Stage" 
                                            SortExpression="Approval_History_Next_Stage" 
                                            UniqueName="Approval_History_Next_Stage">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Approval_History_Next_User" 
                                            FilterControlAltText="Filter Approval_History_Next_User column" 
                                            HeaderText="Next User" 
                                            SortExpression="Approval_History_Next_User" 
                                            UniqueName="Approval_History_Next_User">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Approval_History_Current_Status" 
                                            FilterControlAltText="Filter Approval_History_Current_Status column" 
                                            HeaderText="Current Status" 
                                            SortExpression="Approval_History_Current_Status" 
                                            UniqueName="Approval_History_Current_Status">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Approval_History_Note" 
                                            FilterControlAltText="Filter Approval_History_Note column" 
                                            HeaderText="Approval_History_Note" SortExpression="Approval_History_Note" 
                                            UniqueName="Approval_History_Note" Display="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ApprovalDate" 
                                            FilterControlAltText="Filter ApprovalDate column" 
                                            HeaderText="Approval Date" 
                                            SortExpression="ApprovalDate" 
                                            UniqueName="ApprovalDate"> 
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 10px">
                <asp:Label ID="lblInvoiceItems" runat="server" Font-Names="Segoe UI" Font-Size="12pt" 
                    ForeColor="White" Text="INVOICE" Width="100%" Font-Bold="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 10px"> 
                            <telerik:RadGrid ID="RadGrid2" runat="server" CellSpacing="0" GridLines="None" 
                                Skin="Glow" DataSourceID="SqlDS_Invoice">
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDS_Invoice" 
                                    NoMasterRecordsText="No invoices to display.">
                                    <Columns>
                                    <telerik:GridBoundColumn DataField="PT_TranType" 
                                            FilterControlAltText="Filter PT_TranType column" HeaderText="TranType" 
                                            SortExpression="PT_TranType" UniqueName="PT_TranType" Display="False" >
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_Header_Ref" 
                                            FilterControlAltText="Filter PT_Header_Ref column" HeaderText="HeaderRef" 
                                            SortExpression="PT_Header_Ref" UniqueName="PT_Header_Ref" Display="False" >
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Internal_Ref" 
                                            FilterControlAltText="Filter Internal_Ref column" HeaderText="Internal Ref" 
                                            SortExpression="Internal_Ref" UniqueName="Internal_Ref">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_Description" 
                                            FilterControlAltText="Filter PT_Description column" HeaderText="Description" 
                                            SortExpression="PT_Description" UniqueName="PT_Description">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_Date" DataType="System.DateTime" 
                                            FilterControlAltText="Filter PT_Date column" HeaderText="Date" 
                                            SortExpression="PT_Date" UniqueName="PT_Date">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_Nett" DataType="System.Double" 
                                             FilterControlAltText="Filter PT_Nett column" HeaderText="Nett" 
                                            SortExpression="PT_Nett" UniqueName="PT_Nett" DataFormatString="{0:£#,##0.00}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_VAT" DataType="System.Double" 
                                             FilterControlAltText="Filter PT_VAT column" HeaderText="VAT" 
                                            SortExpression="PT_VAT" UniqueName="PT_VAT" DataFormatString="{0:£#,##0}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_Gross" DataType="System.Double" 
                                             FilterControlAltText="Filter PT_Gross column" HeaderText="Gross" 
                                            SortExpression="PT_Gross" UniqueName="PT_Gross" DataFormatString="{0:£#,##0.00}">
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="PT_Date_Putin" DataType="System.DateTime" 
                                            FilterControlAltText="Filter PT_Date_Putin column" HeaderText="Date Put-In" 
                                            SortExpression="PT_Date_Putin" UniqueName="PT_Date_Putin" >
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_Order_Number" 
                                            FilterControlAltText="Filter PT_Order_Number column" HeaderText="Order No." 
                                            SortExpression="PT_Order_Number" UniqueName="PT_Order_Number" Display="False" >
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_Primary" 
                                            FilterControlAltText="Filter PT_Primary column" HeaderText="Primary" 
                                            SortExpression="PT_Primary" UniqueName="PT_Primary" Display="False" >
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PT_Header_Key" 
                                            FilterControlAltText="Filter PT_Header_Key column" HeaderText="HeaderKey" 
                                            SortExpression="PT_Header_Key" UniqueName="PT_Header_Key" Display="False" >
                                        </telerik:GridBoundColumn>
                                        </Columns>
                               </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
        <asp:HiddenField ID="HF_PO" runat="server" />
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" Height="100px" Skin="Default">
        </telerik:RadAjaxLoadingPanel>
        <asp:Label ID="lblJ_ID" runat="server" ForeColor="#35434B"></asp:Label>
                <asp:Label ID="lblORD_ID" runat="server" ForeColor="#35434B"></asp:Label>
        <asp:HiddenField ID="HF_FocalPoint_Commit" runat="server" Value="0" />
    </div>
     <asp:SqlDataSource ID="SqlDS_PO_List" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
        SelectCommand="SELECT ORD_PO, ORD_J_ID, ISNULL(ORD_PR, 0) AS ORD_PR, ORD_PO_TOTAL FROM ORDERS WHERE (ORD_ID = @ORD_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblORD_ID" Name="ORD_ID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDS_PO_Header" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HJB_DIM_LIVEConnectionString %>" 
        SelectCommand="SELECT [Order Number] AS PO_No, [PR No.] as PR_No, PROJECT AS Site, [XX-XX-XXXX] AS Analysis, DESCRIPTION AS [Desc], [##INITIATOR] AS Init, [SupplierCode] AS Supplier, APPROVAL_HISTORY_CURRENT_STATUS AS Status, CONVERT (datetime, APPROVAL_HISTORY_APPROVAL_DATE, 120) AS Approval_Date, APPROVAL_HISTORY_LAST_ACTION AS Last_Action, APPROVAL_HISTORY_LAST_USER AS Last_User, APPROVAL_HISTORY_NEXT_STAGE AS Next_Stage, APPROVAL_HISTORY_NEXT_USER AS Next_User, TOTAL AS Total, [Cost Centre] as COST_CENTER, __PR_TYPE FROM _CURRENT_PURCHASE_ORDERS_2012 WHERE ([Order Number] = @Order_No)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HF_PO" Name="Order_No" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDS_PO_Detail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HJB_DIM_LIVEConnectionString %>" 
        SelectCommand="SELECT TS_Details_Primary, TS_Header_Primary, Analysis, Division, Cost_Centre, Cost_Centre_Description, SupplierCode, SupplierName, Project, Project_Name, Internal_Ref, Header_Ref, Description, Unit_Price, Quantity, Nett, [PR No.] AS PR_No, Order_Number, Header_Desc, Status, [Work Order No] AS Work_Order_No, [##Initiator] AS Init, Initiator_Name, CONVERT (datetime, Initiated_Date, 120) AS InitDate, [##Recipient] AS Recip, [Final Approver] AS Final_Approver, [Last Edited] AS Last_Edited, Reopened, Printed, Ordered, __PR_TYPE AS PRType, Approval_History_Last_Action, Approval_History_Last_User, Approval_History_Last_User_ID, Approval_History_Next_Stage, Approval_History_Next_User, Approval_History_Current_Status, Approval_History_Note, CONVERT (datetime, Approval_History_Approval_Date, 120) AS ApprovalDate FROM _CURRENT_PURCHASE_ORDERS_LINES_2012 WHERE ([PR No.] = @PR_No)">
         <SelectParameters>
             <asp:ControlParameter ControlID="RadGrid_Header" Name="PR_No" PropertyName="SelectedValue" />
         </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDS_Invoice" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PROCUREMENTConnectionString %>" 
        SelectCommand="INVOICE_FP_SP" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadGrid1" Name="PO" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" 
        DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid_Header">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    </form>
</body>
</html>

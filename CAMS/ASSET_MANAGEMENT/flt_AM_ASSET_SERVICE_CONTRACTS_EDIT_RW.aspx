<%@ Page Language="VB" AutoEventWireup="false" Title="Fleet Asset Management - Asset Service Contracts - Edit Contract" CodeFile="flt_AM_ASSET_SERVICE_CONTRACTS_EDIT_RW.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_SERVICE_CONTRACTS_EDIT_RW" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style1 {
            text-align: right;
        }

        .style4 {
            text-align: right;
            height: 68px;
        }

        .style5 {
            height: 68px;
        }
        .auto-style1 {
            width: 52px;
        }
    .RadGrid_Default{border:1px solid;border-color:#a0a0a0;color:#333;background-color:#fff;font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px;line-height:16px}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid_Default .rgMasterTable{font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px;line-height:16px}.RadGrid_Default .rgCommandRow{background:#c5c5c5 0 -2099px repeat-x url('mvwres://Telerik.Web.UI, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif');color:#000}.RadGrid_Default .rgCommandCell{border:1px solid;border-color:#999 #f2f2f2;border-top-width:0;padding:0}.RadGrid_Default .rgCommandTable{border:0;border-top:1px solid #fdfdfd;border-bottom:1px solid #e7e7e7}.RadGrid .rgAdd{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid .rgAdd{width:18px;height:18px;vertical-align:bottom}.RadGrid_Default .rgAdd{background-image:url('mvwres://Telerik.Web.UI, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid_Default .rgAdd{margin-right:3px;background-position:0 -1650px}.RadGrid .rgRefresh{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid .rgRefresh{width:18px;height:18px;vertical-align:bottom}.RadGrid_Default .rgRefresh{background-image:url('mvwres://Telerik.Web.UI, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid_Default .rgRefresh{margin-right:3px;background-position:0 -1600px}.RadGrid table.rgMasterTable tr .rgExpandCol{padding-left:0;padding-right:0;text-align:center}.RadGrid .rgHeader{cursor:default}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid_Default .rgHeader{color:#333}
    </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        function saveandcloseWindowAdd() {
            var oWndadd = GetRadWindow();
            oWndadd.close();
            top.location.href = top.location.href;
        }
        function closeWindowAdd() {
            var oWndadd = GetRadWindow();
            oWndadd.close();
        }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; padding-right: 10px; background-color: #E46C0A;" class="auto-style1">
                                <img alt="" src="../IMAGES/metro_document_edit_58x58.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #E46C0A; padding-right: 10px;">
                                ASSET SERVICE CONTRACTS: EDIT CONTRACT
                                <asp:Label ID="LblPreviousPage" runat="server" BackColor="#E46C0A" ForeColor="#E46C0A" Text="" Visible="False" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#E46C0A" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#E46C0A"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style6">&#160;</td>
                                    <td class="style7"><strong>&nbsp; </strong></td>
                                    <td class="style7"></td>
                                    <td class="style7">&#160;</td>
                                    <td>&#160;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Asset ID:</td>
                                    <td>
                                        <asp:Label ID="lblAsset" runat="server"></asp:Label>
                                        <br />
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">Model:</td>
                                    <td>
                                        <asp:Label ID="lblModel" runat="server"></asp:Label>
                                    </td>
                                    <td rowspan="7" valign="top">
                                        <telerik:RadGrid ID="RadGrid_Attachments" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" DataSourceID="SqlDS_Documents" Height="150px" ResolvedRenderMode="Classic">
                                            <ClientSettings>
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <MasterTableView AllowPaging="True" AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="DOC_ID" DataSourceID="SqlDS_Documents" NoMasterRecordsText="No attachments.">
                                                <CommandItemSettings AddNewRecordText="Add new attachment" />
                                                <Columns>
                                                    <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="50px" />
                                                    </telerik:GridEditCommandColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_ID column" HeaderText="ID" ReadOnly="True" SortExpression="DOC_ID" UniqueName="DOC_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="DOC_Name" Display="True" FilterControlAltText="Filter DOC_Name column" HeaderText="Name" SortExpression="DOC_Name" UniqueName="DOC_Name">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox3" runat="server" LabelWidth="64px" Resize="None" Skin="Silk" Text='<%# Bind("DOC_Name") %>' Width="400px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="DOC_NameLabel0" runat="server" Text='<%# Eval("DOC_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="400px" />
                                                        <ItemStyle Width="400px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_P_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_P_ID column" HeaderText="Part ID" ReadOnly="True" SortExpression="DOC_P_ID" UniqueName="DOC_P_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="DOC_Link" Display="False" FilterControlAltText="Filter DOC_Link column" HeaderText="Link" SortExpression="DOC_Link" UniqueName="DOC_Link">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox4" runat="server" LabelWidth="64px" Resize="None" Skin="Silk" Text='<%# Bind("DOC_Link") %>' Width="400px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="DOC_LinkLabel0" runat="server" Text='<%# Eval("DOC_Link") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="DOC_Link" FilterControlAltText="Filter DOC_Link column" HeaderText="Link" ImageUrl="../IMAGES/24x24/document_tender_24x24.png" Target="_blank" UniqueName="DOC_Link">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="50px" />
                                                    </telerik:GridHyperLinkColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Manufacturer:</td>
                                    <td>
                                        <asp:Label ID="lblMan" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Serial No:</td>
                                    <td>
                                        <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Type:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Type" runat="server" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="PM" Value="PM" />
                                                <telerik:RadComboBoxItem runat="server" Text="PM+" Value="PM+" />
                                                <telerik:RadComboBoxItem runat="server" Text="R+M" Value="R+M" />
                                                <telerik:RadComboBoxItem runat="server" Text="Service" Value="Service" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Current SMU Counter:</td>
                                    <td>
                                        <asp:Label ID="lbl_Current_SMU" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Contract Length (months):</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Months" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="240" MinValue="0" Width="50px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Contract Length (Hrs):</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Hours" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000000" MinValue="0" Width="100px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Start Date:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_Start_Date" runat="server" AutoPostBack="True"
                                            Skin="Default">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"
                                                Skin="Default" UseColumnHeadersAsSelectors="False"
                                                UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy"
                                                DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">Start SMU:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Start_SMU" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="1000000" MinValue="0" Width="100px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">End Date:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_End_Date" runat="server"
                                            AutoPostBack="True" Skin="Default">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"
                                                Skin="Default" UseColumnHeadersAsSelectors="False"
                                                UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy"
                                                DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">Agreed Usage:</td>
                                    <td>
                                      
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Usage" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="500000" MinValue="0" Width="160px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                      
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Supplier:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Company" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Company" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        Rate:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Month_Cost" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="500000" MinValue="0" Type="Currency" Width="160px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                                 <telerik:RadComboBoxItem runat="server" Text="Due To Expire" Value="Due To Expire" />
                                                <telerik:RadComboBoxItem runat="server" Text="Expired" Value="Expired" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td style="padding-left: 60px">
                                        &nbsp;</td>
                                    <td align="right" style="padding-right: 60px;">
                                        <telerik:RadButton ID="Btn_Save" runat="server" BackColor="Red" Skin="Default" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                    </td>
                                    <td>&#160;</td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td style="padding-left: 60px">
                                        &nbsp;</td>
                                    <td align="right" style="padding-right: 60px;">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindowAdd" Skin="Default" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_ASC_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
             <asp:HiddenField ID="HF_EXCEPTION_18_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_18_RW" runat="server" Value="0" />
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
              <asp:SqlDataSource ID="SqlDS_Select" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_SC_RG_SELECT_RW_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_ASC_ID" Name="ASC_ID" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_UPDATE" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_SC_RG_UPDATE_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_ASC_ID" Name="ASC_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                     <asp:ControlParameter ControlID="RadCB_Type" Name="ASC_Type" PropertyName="SelectedValue" Type="String" DefaultValue="Active" />
                      <asp:ControlParameter ControlID="RadNumTxt_Start_SMU" Name="ASC_Start_SMU" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Company" Name="ASC_COM_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="112" />
                    <asp:ControlParameter ControlID="RadDP_Start_Date" Name="ASC_Start_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadDP_End_Date" Name="ASC_End_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadNumTxt_Months" Name="ASC_Months" Type="Double" DefaultValue="0" />
                     <asp:ControlParameter ControlID="RadNumTxt_Hours" Name="ASC_End_Hours" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Usage" Name="ASC_Agreed_Usage" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Month_Cost" Name="ASC_Month_Cost" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Status" Name="ASC_Status" PropertyName="SelectedValue" Type="String" DefaultValue="Active" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="ASC_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Company" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_Status NOT IN ('Trash', 'Delete')) AND (ATT_TABLE = 'ASSET_Company') ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Documents" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                InsertCommand="INSERT INTO DOCUMENTS(DOC_Name, DOC_ASC_ID, DOC_Link, DOC_Created_By, DOC_Date_Created, DOC_Sub) VALUES (@DOC_Name, @DOC_ASC_ID, @DOC_Link, @DOC_Created_By, GETDATE(), 4)"
                SelectCommand="SELECT DOC_ID, DOC_Name, DOC_ASC_ID, DOC_Link, DOC_Sub FROM DOCUMENTS WHERE (DOC_Sub = 4) AND (DOC_ASC_ID = @DOC_ASC_ID)"
                UpdateCommand="UPDATE DOCUMENTS SET DOC_Name = @DOC_Name, DOC_ASC_ID = @DOC_ASC_ID, DOC_Link = @DOC_Link, DOC_Date_Modified = GETDATE(), DOC_Modified_By = @DOC_Modified_By WHERE (DOC_ID = @DOC_ID)"
                DeleteCommand="DELETE FROM DOCUMENTS WHERE (DOC_ID = @DOC_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="DOC_ID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DOC_Name" />
                    <asp:ControlParameter ControlID="HF_ASC_ID" Name="DOC_ASC_ID" PropertyName="Value" />
                    <asp:Parameter Name="DOC_Link" />
                    <asp:ControlParameter ControlID="HF_Username" Name="DOC_Created_By" PropertyName="Value" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_ASC_ID" Name="DOC_ASC_ID" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DOC_Name" />
                   <asp:ControlParameter ControlID="HF_ASC_ID" Name="DOC_ASC_ID" PropertyName="Value" />
                    <asp:Parameter Name="DOC_Link" />
                    <asp:ControlParameter ControlID="HF_Username" Name="DOC_Modified_By" PropertyName="Value" />
                    <asp:Parameter Name="DOC_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


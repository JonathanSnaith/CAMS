<%@ Page Language="VB" AutoEventWireup="false" Title="Admin - Asset" CodeFile="flt_ADMIN_ASSET.aspx.vb" Inherits="ADMIN_flt_ADMIN_ASSET" %>

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

        .auto-style28 {
            width: 200px;
        }
    </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
    function fn_home() {
        var THISGUID = document.getElementById('HF_GUID').value;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    function fn_back() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISPP = document.getElementById('HF_PreviousPage').value;
        if (THISPP == 0) {
            window.open('../CLIENT/flt_ADMIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=11', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=11', '_self');
        }
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('ATT_ID');
        document.getElementById('HF_ATT_ID').value = ATTid;
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISATT = 0;
        var THISTABLE = document.getElementById('HF_Table').value;
       var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_ADMIN_ASSET_ATTRIBUTE_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&ATT_ID=' + THISATT + '&ATT_TABLE=' + THISTABLE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISATT = document.getElementById('HF_ATT_ID').value;
        var THISTABLE = document.getElementById('HF_Table').value;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_ADMIN_ASSET_ATTRIBUTE_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&ATT_ID=' + THISATT + '&ATT_TABLE=' + THISTABLE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function closeWindow_add_event(sender, args) {
        var x = args.get_argument();
        { __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow2.ClientID%>");
            oWnd.close();
        }
    }
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">&nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style2">
                               <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">&nbsp;</td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style27">
                                <asp:Label ID="lblTitle" runat="server" Text="ADMIN - ASSET & PARTS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style28">Attribute Type:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Attribute_Choice" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Table_English" DataValueField="ATT_Table" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_1" runat="server" onClick="fn_OnClickButton()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW ATTRIBUTE" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_2" runat="server" onClick="fn_panel_2()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                            <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow45" runat="server">
                                        <asp:TableCell ID="ID_CELL_3" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_3" runat="server" onClick="fn_panel_3()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T4" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow36" runat="server">
                                        <asp:TableCell ID="ID_CELL_4" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_4" runat="server" onClick="fn_panel_4()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label36" runat="server" Text="" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                        </tr>
                    </table>
                    <table class="style1">
                        <tr>
                            <td class="style5" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Attributes" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" ResolvedRenderMode="Classic" Skin="Glow" Visible="False" Width="95%">
                                    <ClientSettings EnableAlternatingItems="False" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="ATT_ID" DataKeyNames="ATT_ID" >
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new attribute" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ATT_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter ATT_ID column" HeaderText="ID" ReadOnly="True" SortExpression="ATT_ID" UniqueName="ATT_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Name" FilterControlAltText="Filter ATT_Name column" HeaderText="Name" ReadOnly="True" SortExpression="ATT_Name" UniqueName="ATT_Name">
                                                <HeaderStyle Width="300px" Wrap="False" />
                                                <ItemStyle Width="300px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Description" FilterControlAltText="Filter ATT_Description column" HeaderText="Description" ReadOnly="True" SortExpression="ATT_Description" UniqueName="ATT_Description">
                                                <HeaderStyle Width="400px" Wrap="False" />
                                                <ItemStyle Width="400px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Name_Secondary" Display="False" FilterControlAltText="Filter ATT_Name_Secondary column" HeaderText="Primary Group" ReadOnly="True" SortExpression="ATT_Name_Secondary" UniqueName="ATT_Name_Secondary">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Name_Model" Display="False" FilterControlAltText="Filter ATT_Name_Model column" HeaderText="Secondary Group" ReadOnly="True" SortExpression="ATT_Name_Model" UniqueName="ATT_Name_Model">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_FLAG" Display="False" FilterControlAltText="Filter ATT_FLAG column" HeaderText="Section" ReadOnly="True" SortExpression="ATT_FLAG" UniqueName="ATT_FLAG">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Status" FilterControlAltText="Filter ATT_Status column" HeaderText="Status" ReadOnly="True" SortExpression="ATT_Status" UniqueName="ATT_Status">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Date_Created" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter ATT_Date_Created column" HeaderText="Date Created" ReadOnly="True" SortExpression="ATT_Date_Created" UniqueName="ATT_Date_Created">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Created_By" FilterControlAltText="Filter ATT_Created_By column" HeaderText="Created By" ReadOnly="True" SortExpression="ATT_Created_By" UniqueName="ATT_Created_By">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Date_Modified" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter ATT_Date_Modified column" HeaderText="Date Modified" ReadOnly="True" SortExpression="ATT_Date_Modified" UniqueName="ATT_Date_Modified">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ATT_Modified_By" FilterControlAltText="Filter ATT_Modified_By column" HeaderText="Modified By" ReadOnly="True" SortExpression="ATT_Modified_By" UniqueName="ATT_Modified_By">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td class="style5" style="text-align: left" valign="top">
                                <telerik:RadGrid ID="RadGrid_Model_Detail" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" DataSourceID="SqlDS_Model_Detail" ResolvedRenderMode="Classic" Visible="False" Width="95%" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="False" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="MD_ID" DataKeyNames="MD_ID" DataSourceID="SqlDS_Model_Detail" CommandItemDisplay="Top">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add details for selected model" />
                                        <Columns>
                                            <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                            </telerik:GridEditCommandColumn>
                                            <telerik:GridBoundColumn DataField="MD_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter MD_ID column" HeaderText="ID" ReadOnly="True" SortExpression="MD_ID" UniqueName="MD_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn DataField="MD_Expected_Life" FilterControlAltText="Filter MD_Expected_Life column" HeaderText="Expected Life (Hrs)" SortExpression="MD_Expected_Life" UniqueName="MD_Expected_Life">
                                                <EditItemTemplate>
                                                    <telerik:RadNumericTextBox ID="RadNumericTextBox1" Runat="server" Culture="en-GB" DbValue='<%# Bind("MD_Expected_Life") %>' DbValueFactor="1" LabelWidth="64px" MaxValue="1000000" MinValue="0" Width="160px">
                                                    </telerik:RadNumericTextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MD_Expected_LifeLabel" runat="server" Text='<%# Eval("MD_Expected_Life") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn DataField="MD_Risk_Mechanical" FilterControlAltText="Filter MD_Risk_Mechanical column" HeaderText="Mechanical Risk" SortExpression="MD_Risk_Mechanical" UniqueName="MD_Risk_Mechanical">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadComboBox1" Runat="server" SelectedValue='<%# Bind("MD_Risk_Mechanical") %>' Width="50px">
                                                        <Items>
                                                            <telerik:RadComboBoxItem runat="server" Text="0" Value="0" />
                                                            <telerik:RadComboBoxItem runat="server" Text="1" Value="1" />
                                                            <telerik:RadComboBoxItem runat="server" Text="2" Value="2" />
                                                            <telerik:RadComboBoxItem runat="server" Text="3" Value="3" />
                                                            <telerik:RadComboBoxItem runat="server" Text="4" Value="4" />
                                                            <telerik:RadComboBoxItem runat="server" Text="5" Value="5" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MD_Risk_MechanicalLabel" runat="server" Text='<%# Eval("MD_Risk_Mechanical") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn DataField="MD_Risk_Production" FilterControlAltText="Filter MD_Risk_Production column" HeaderText="Production Risk" SortExpression="MD_Risk_Production" UniqueName="MD_Risk_Production">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadComboBox2" Runat="server" SelectedValue='<%# Bind("MD_Risk_Production") %>' Width="50px">
                                                        <Items>
                                                            <telerik:RadComboBoxItem runat="server" Text="0" Value="0" />
                                                            <telerik:RadComboBoxItem runat="server" Text="1" Value="1" />
                                                            <telerik:RadComboBoxItem runat="server" Text="2" Value="2" />
                                                            <telerik:RadComboBoxItem runat="server" Text="3" Value="3" />
                                                            <telerik:RadComboBoxItem runat="server" Text="4" Value="4" />
                                                            <telerik:RadComboBoxItem runat="server" Text="5" Value="5" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MD_Risk_ProductionLabel" runat="server" Text='<%# Eval("MD_Risk_Production") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn DataField="MD_Purchase_Price" FilterControlAltText="Filter MD_Purchase_Price column" HeaderText="Estimated Purchase Price" SortExpression="MD_Purchase_Price" UniqueName="MD_Purchase_Price" >
                                                <EditItemTemplate>
                                                    <telerik:RadNumericTextBox ID="RadNumericTextBox2" Runat="server" Culture="en-GB" DbValue='<%# Bind("MD_Purchase_Price") %>' DbValueFactor="1" LabelWidth="64px" MaxValue="10000000" MinValue="0" Type="Currency" Width="160px">
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
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MD_Purchase_PriceLabel" runat="server" Text='<%# Eval("MD_Purchase_Price", "{0:£#,##0}") %>'></asp:Label> 
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn DataField="MD_Resale_Price" FilterControlAltText="Filter MD_Resale_Price column" HeaderText="Estimated Resale Price" SortExpression="MD_Resale_Price" UniqueName="MD_Resale_Price">
                                                <EditItemTemplate>
                                                    <telerik:RadNumericTextBox ID="RadNumericTextBox3" Runat="server" Culture="en-GB" DbValue='<%# Bind("MD_Resale_Price") %>' DbValueFactor="1" LabelWidth="64px" MaxValue="10000000" MinValue="0" Type="Currency" Width="160px">
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
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MD_Resale_PriceLabel" runat="server" Text='<%# Eval("MD_Resale_Price", "{0:£#,##0}") %>'></asp:Label> 
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn DataField="MD_Status" FilterControlAltText="Filter MD_Status column" HeaderText="Status" SortExpression="MD_Status" UniqueName="MD_Status">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadComboBox3" Runat="server" SelectedValue='<%# Bind("MD_Status") %>'>
                                                        <Items>
                                                            <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                            <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MD_StatusLabel" runat="server" Text='<%# Eval("MD_Status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="MD_Created" Display="False" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter MD_Created column" HeaderText="Date Created" ReadOnly="True" SortExpression="MD_Created" UniqueName="MD_Created">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MD_Created_By" Display="False" FilterControlAltText="Filter MD_Created_By column" HeaderText="Created By" ReadOnly="True" SortExpression="MD_Created_By" UniqueName="MD_Created_By">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MD_Modified" Display="False" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter MD_Modified column" HeaderText="Date Modified" ReadOnly="True" SortExpression="MD_Modified" UniqueName="MD_Modified">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MD_Modified_By" Display="False" FilterControlAltText="Filter MD_Modified_By column" HeaderText="Modified By" ReadOnly="True" SortExpression="MD_Modified_By" UniqueName="MD_Modified_By">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                        <ItemStyle Font-Names="Segoe UI" Font-Size="10pt" ForeColor="Black" />
                                        <AlternatingItemStyle BackColor="#DBDBDB" Font-Names="Segoe UI" Font-Size="10pt" ForeColor="Black" />
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
             <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_ATT_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_11_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_11_RW" runat="server" Value="0" />
            <asp:SqlDataSource ID="SqlDS_RadCB_SP_ATTRIBUTES" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="ADMIN_ASSET_CB_ATTRIBUTES_SP"
                SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ATTRIBUTES" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="ADMIN_ASSET_RG_ATTRIBUTES_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Attribute_Choice" Name="ATT_Table" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_CB_ASSET_Secondary" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'ASSET_Primary') AND (ATT_Status NOT IN ('Trash', 'Delete')) ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_CB_ASSET_Model" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'ASSET_Secondary') AND (ATT_Status NOT IN ('Trash', 'Delete')) ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Model_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT MD_ID, MD_MOD_ID, MD_Expected_Life, MD_Risk_Mechanical, MD_Risk_Production, MD_Purchase_Price, MD_Resale_Price, MD_Status, MD_Created, MD_Created_By, MD_Modified, MD_Modified_By FROM MODEL_Detail WHERE (MD_Status &lt;&gt; 'Trash') AND (MD_MOD_ID = @MOD_ID)" InsertCommand="INSERT INTO MODEL_Detail(MD_MOD_ID, MD_Expected_Life, MD_Risk_Mechanical, MD_Risk_Production, MD_Purchase_Price, MD_Resale_Price, MD_Status, MD_Created, MD_Created_By) VALUES (@MD_MOD_ID, @MD_Expected_Life, @MD_Risk_Mechanical, @MD_Risk_Production, @MD_Purchase_Price, @MD_Resale_Price, @MD_Status, GETDATE(), @MD_Created_By)" UpdateCommand="UPDATE MODEL_Detail SET MD_MOD_ID = @MD_MOD_ID, MD_Expected_Life = @MD_Expected_Life, MD_Risk_Mechanical = @MD_Risk_Mechanical, MD_Risk_Production = @MD_Risk_Production, MD_Purchase_Price = @MD_Purchase_Price, MD_Resale_Price = @MD_Resale_Price, MD_Status = @MD_Status, MD_Modified = GETDATE(), MD_Modified_By = @MD_Modified_By WHERE (MD_ID = @MD_ID)">
                <InsertParameters>
                     <asp:ControlParameter ControlID="RadGrid_Attributes" Name="MD_MOD_ID" PropertyName="SelectedValue" />
                    <asp:Parameter Name="MD_Expected_Life" />
                    <asp:Parameter Name="MD_Risk_Mechanical" />
                    <asp:Parameter Name="MD_Risk_Production" />
                    <asp:Parameter Name="MD_Purchase_Price" />
                    <asp:Parameter Name="MD_Resale_Price" />
                    <asp:Parameter Name="MD_Status" />
                     <asp:ControlParameter ControlID="HF_Username" Name="MD_Created_By" PropertyName="Value" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadGrid_Attributes" Name="MOD_ID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                     <asp:ControlParameter ControlID="RadGrid_Attributes" Name="MD_MOD_ID" PropertyName="SelectedValue" />
                    <asp:Parameter Name="MD_Expected_Life" />
                    <asp:Parameter Name="MD_Risk_Mechanical" />
                    <asp:Parameter Name="MD_Risk_Production" />
                    <asp:Parameter Name="MD_Purchase_Price" />
                    <asp:Parameter Name="MD_Resale_Price" />
                    <asp:Parameter Name="MD_Status" />
                    <asp:ControlParameter ControlID="HF_Username" Name="MD_Modified_By" PropertyName="Value" Type="String" />
                    <asp:Parameter Name="MD_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Attribute_Choice">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="T1" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Attributes" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Model_Detail" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Table" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Attributes">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Model_Detail" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Attribute_Choice" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Attributes" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="375px" Width="700px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - Edit Component Changeout Plan" CodeFile="flt_EM_PLANNING_EDIT_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_PLANNING_EDIT_RW" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style3 {
            height: 45px;
            width: 221px;
        }

        .style12 {
            width: 144px;
        }

        .style13 {
            width: 143px;
        }

        .style17 {
            width: 338px;
        }

        .auto-style1 {
            height: 23px;
        }

        .auto-style2 {
            width: 210px;
        }

        .auto-style4 {
            width: 1148px;
        }

        div.greenProgressBar .rpbStateSelected,
        div.greenProgressBar .rpbStateSelected:hover,
        div.greenProgressBar .rpbStateSelected:link,
        div.greenProgressBar .rpbStateSelected:visited {
            background-color: green;
        }

        div.redProgressBar .rpbStateSelected,
        div.redProgressBar .rpbStateSelected:hover,
        div.redProgressBar .rpbStateSelected:link,
        div.redProgressBar .rpbStateSelected:visited {
            background-color: red;
        }

        div.yellowProgressBar .rpbStateSelected,
        div.yellowProgressBar .rpbStateSelected:hover,
        div.yellowProgressBar .rpbStateSelected:link,
        div.yellowProgressBar .rpbStateSelected:visited {
            background-color: yellow;
            color: black;
        }

        .auto-style6 {
            width: 842px;
        }
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
        function saveandcloseWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_STM_ID').value;
            oWnd.close(ThisVal);
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_STM_ID').value;
            oWnd.close(ThisVal);
        }
         function closeWindow_part(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Grid', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow_Part.ClientID%>");
            oWnd.close();
        }
      }
         function part_tracker(args) {
         var THISGUID = document.getElementById('lblGUID').innerHTML;
         var THISP = args
        var oWnd = $find("<%=RadWindow_Part.ClientID%>");
        oWnd.setUrl('../ASSET_MANAGEMENT/flt_AM_PART_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&P_ID=' + THISP + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    </script>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center; border-bottom-style: none;" class="auto-style4">Component Changeout Plan:
                                <asp:Label ID="lbl_Plan" runat="server" ForeColor="White"></asp:Label></td>
                            <td align="right" rowspan="2" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #E46C0A; text-align: right; padding-right: 15px;">
                                <img alt="" src="../IMAGES/Icons/EVENT_PLANNING_DETAIL.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" /></td>
                        </tr>
                        <tr>
                            <td align="center" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style4">
                                <asp:Label ID="lbl_CloseMessage" runat="server" ForeColor="Yellow" Visible="False"></asp:Label></td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td style="padding-right: 20px" class="auto-style2">Asset:</td>
                                    <td><strong>
                                        <telerik:RadComboBox ID="RadCB_Asset" runat="server"
                                            AllowCustomText="True" DataSourceID="SqlDS_CB_ASSET" DataTextField="A_Asset_ID"
                                            DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="150px" AutoPostBack="True">
                                        </telerik:RadComboBox>
                                    </strong></td>
                                    <td style="padding-left: 5px">Model:</td>
                                    <td style="padding-left: 5px">
                                        <asp:Label ID="lbl_Model" runat="server" Font-Bold="True"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbl_LatestSMU_Text" runat="server" Text="Latest SMU:" Width="100px"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbl_LatestSMU" runat="server" Font-Bold="True" Width="200px"></asp:Label></td>
                                    <td align="right">Trend:</td>
                                    <td><strong>
                                        <asp:Label ID="lbl_Trend" runat="server"></asp:Label>hrs</strong></td>
                                    <td valign="top">Site: </td>
                                    <td style="padding-left: 10px" valign="top">
                                        <asp:Label ID="lbl_Site" runat="server" Font-Bold="True" Width="120px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td align="right">Override:</td>
                                    <td><strong>
                                        <asp:Label ID="lbl_Trend_Override" runat="server"></asp:Label>hrs</strong></td>
                                    <td valign="top">&nbsp;</td>
                                    <td style="padding-left: 10px" valign="top">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 20px" class="auto-style2">
                                        <asp:Label ID="lbl_Frequency_Text" runat="server" Text="Planned Component Hours:" Width="200px"></asp:Label><asp:Label ID="lbl_MTD_Min_Text" runat="server" Text="Minimum Tread Depth:" Visible="False" Width="200px"></asp:Label></td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Frequency" runat="server" Width="70px" Culture="en-GB" DbValueFactor="1" LabelWidth="28px" MaxValue="500000" MinValue="1">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox><asp:Label ID="lbl_MTD_Min" runat="server" Font-Bold="False" Visible="False"></asp:Label></td>
                                    <td colspan="3">
                                        <asp:Label ID="lbl_SMU_Value_Text" runat="server" Text="Current Component Hours:" Width="230px"></asp:Label><asp:Label ID="lbl_MTD_Current_Text" runat="server" Text="Current Tread Depth:" Visible="False" Width="200px"></asp:Label></td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_SMU_Value" runat="server" AutoPostBack="True" Width="70px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox><asp:Label ID="lbl_MTD_Current" runat="server" Font-Bold="False" Visible="False"></asp:Label></td>
                                    <td align="center" colspan="4" rowspan="6" valign="top">
                                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 20px" class="auto-style2">
                                        <asp:Label ID="lbl_SMU_Changed_Text" runat="server" Text="Last Changed (Hrs):" Width="160px"></asp:Label><asp:Label ID="lbl_Tyre_Serial_Text" runat="server" Text="Serial No:" Visible="False" Width="200px"></asp:Label></td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_SMU_Changed" runat="server" AutoPostBack="True" Width="70px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox><asp:Label ID="lbl_Tyre_Serial" runat="server" Font-Bold="False" Visible="False"></asp:Label></td>
                                    <td colspan="3">Current Life:</td>
                                    <td>
                                        <telerik:RadProgressBar ID="RadProgressBar1" runat="server" BarType="Percent" Skin="Silk" Width="200px" MaxValue="100"></telerik:RadProgressBar>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 20px" class="auto-style2">
                                        <asp:Label ID="lbl_Change_Due_Text" runat="server" Text="Change Due (Hrs):" Width="160px"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbl_ChangeDue" runat="server" Font-Bold="True"></asp:Label></td>
                                    <td colspan="3">
                                        <asp:Label ID="lbl_Date_Estimate_Text" runat="server" Text="Estimated Change Date:"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbl_Estimated_Date" runat="server" Font-Bold="True" ToolTip="(((Planned Component Hours - Current Component Hours)/Trend)*7)+Previous SMU Date"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 20px" class="auto-style2">Cost:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Cost" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="28px" MaxValue="500000" MinValue="0" Type="Currency" Width="70px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox></td>
                                    <td colspan="3">
                                        <asp:Label ID="lbl_Adjustment_Text" runat="server" Text="Adjust by Hours:"></asp:Label></td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Adjustment" runat="server" AutoPostBack="True" Width="70px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox></td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 20px" class="auto-style2">
                                        <asp:Label ID="lbl_PCI_Text" runat="server" Text="Pre-Change Inspection (Hrs):"></asp:Label></td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_PCI" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="28px" MaxValue="500000" MinValue="0" Width="70px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox></td>
                                    <td colspan="3">
                                        <asp:Label ID="lbl_SMU_Initial_Text" runat="server" Text="Initial Component Hours:"></asp:Label></td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_SMU_Initial" runat="server" AutoPostBack="True" Width="70px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="padding-right: 20px">
                                        <asp:Label ID="lbl_PCI_Interval_Text" runat="server" Text="Pre-Change Inspection Interval (Hrs):"></asp:Label></td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_PCI_Interval" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="28px" MaxValue="500000" MinValue="0" Width="70px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox></td>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <table class="style_table_general">
                                <tr>
                                    <td style="padding-right: 20px" colspan="3" rowspan="7" valign="top"><strong>Component History</strong><telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="SqlDS_STMC" Width="700px">
                                        <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                        <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="STMC_ID" DataSourceID="SqlDS_STMC" NoMasterRecordsText="No previous components">
                                            <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                            <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                            <Columns>
                                                <telerik:GridEditCommandColumn ButtonType="ImageButton"></telerik:GridEditCommandColumn>
                                                <telerik:GridBoundColumn DataField="STMC_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter STMC_ID column" HeaderText="STMC_ID" ReadOnly="True" SortExpression="STMC_ID" UniqueName="STMC_ID"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="STMC_STM_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter STMC_STM_ID column" HeaderText="STMC_STM_ID" ReadOnly="True" SortExpression="STMC_STM_ID" UniqueName="STMC_STM_ID"></telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_J_ID" DataType="System.Int32" Display="True" FilterControlAltText="Filter STMC_J_ID column" HeaderText="Job ID" SortExpression="STMC_J_ID" UniqueName="STMC_J_ID">
                                                    <EditItemTemplate>
                                                        <telerik:RadComboBox ID="RadComboBox1" runat="server" AllowCustomText="True" DataSourceID="SqlDS_CB_JOB_ID" DataTextField="J_ID" DataValueField="J_ID" Filter="Contains" SelectedValue='<%# Bind("STMC_J_ID") %>'></telerik:RadComboBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_J_IDLabel" runat="server" Text='<%# Eval("STMC_J_ID") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_Component_ID" FilterControlAltText="Filter STMC_Component_ID column" HeaderText="Fitted Component ID" SortExpression="STMC_Component_ID" UniqueName="STMC_Component_ID">
                                                    <EditItemTemplate>
                                                        <telerik:RadTextBox ID="RadTextBox2" runat="server" LabelWidth="64px" Resize="None" Skin="Default" Text='<%# Bind("STMC_Component_ID") %>' Width="160px"></telerik:RadTextBox></EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_Component_IDLabel" runat="server" Text='<%# Eval("STMC_Component_ID") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_Date_Fitted" DataType="System.DateTime" FilterControlAltText="Filter STMC_Date_Fitted column" HeaderText="Date Fitted" SortExpression="STMC_Date_Fitted" UniqueName="STMC_Date_Fitted">
                                                    <EditItemTemplate>
                                                        <telerik:RadDatePicker ID="RadDatePicker4" runat="server" Culture="en-US" DbSelectedDate='<%# Bind("STMC_Date_Fitted", "{0:dd MMM yyyy}") %>'>
                                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"></Calendar>
                                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                                <EmptyMessageStyle Resize="None" />
                                                                <ReadOnlyStyle Resize="None" />
                                                                <FocusedStyle Resize="None" />
                                                                <DisabledStyle Resize="None" />
                                                                <InvalidStyle Resize="None" />
                                                                <HoveredStyle Resize="None" />
                                                                <EnabledStyle Resize="None" />
                                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                        </telerik:RadDatePicker>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_Date_FittedLabel" runat="server" Text='<%# Eval("STMC_Date_Fitted", "{0:dd MMM yyyy}") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_SMU_Fitted" DataType="System.Double" FilterControlAltText="Filter STMC_SMU_Fitted column" HeaderText="SMU Fitted" SortExpression="STMC_SMU_Fitted" UniqueName="STMC_SMU_Fitted">
                                                    <EditItemTemplate>
                                                        <telerik:RadNumericTextBox ID="RadNumericTextBox3" runat="server" Culture="en-GB" DbValue='<%# Bind("STMC_SMU_Fitted") %>' DbValueFactor="1" LabelWidth="64px" Skin="Default" Width="160px">
                                                            <NegativeStyle Resize="None" />
                                                            <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                                            <EmptyMessageStyle Resize="None" />
                                                            <ReadOnlyStyle Resize="None" />
                                                            <FocusedStyle Resize="None" />
                                                            <DisabledStyle Resize="None" />
                                                            <InvalidStyle Resize="None" />
                                                            <HoveredStyle Resize="None" />
                                                            <EnabledStyle Resize="None" />
                                                        </telerik:RadNumericTextBox></EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_SMU_FittedLabel" runat="server" Text='<%# Eval("STMC_SMU_Fitted") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_COM_ID" Display="False" FilterControlAltText="Filter STMC_COM_ID column" HeaderText="Supplier" SortExpression="STMC_COM_ID" UniqueName="STMC_COM_ID">
                                                    <EditItemTemplate>
                                                        <telerik:RadComboBox ID="RadComboBox2" runat="server" AllowCustomText="True" DataSourceID="SqlDS_Company" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" SelectedValue='<%# Bind("STMC_COM_ID") %>'></telerik:RadComboBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_COM_IDLabel" runat="server" Text='<%# Eval("STMC_COM_ID") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="Company" FilterControlAltText="Filter Company column" HeaderText="Supplier" ReadOnly="True" SortExpression="Company" UniqueName="Company"></telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_Warranty_Expiry_Date" DataType="System.DateTime" FilterControlAltText="Filter STMC_Warranty_Expiry_Date column" HeaderText="Warranty Expiry Date" SortExpression="STMC_Warranty_Expiry_Date" UniqueName="STMC_Warranty_Expiry_Date">
                                                    <EditItemTemplate>
                                                        <telerik:RadDatePicker ID="RadDatePicker3" runat="server" Culture="en-US" DbSelectedDate='<%# Bind("STMC_Warranty_Expiry_Date", "{0:dd MMM yyyy}") %>'>
                                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"></Calendar>
                                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                                <EmptyMessageStyle Resize="None" />
                                                                <ReadOnlyStyle Resize="None" />
                                                                <FocusedStyle Resize="None" />
                                                                <DisabledStyle Resize="None" />
                                                                <InvalidStyle Resize="None" />
                                                                <HoveredStyle Resize="None" />
                                                                <EnabledStyle Resize="None" />
                                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                        </telerik:RadDatePicker>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_Warranty_Expiry_DateLabel" runat="server" Text='<%# Eval("STMC_Warranty_Expiry_Date", "{0:dd MMM yyyy}") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_Warranty_Expiry_Hours" DataType="System.Double" FilterControlAltText="Filter STMC_Warranty_Expiry_Hours column" HeaderText="Warranty Expiry Hours" SortExpression="STMC_Warranty_Expiry_Hours" UniqueName="STMC_Warranty_Expiry_Hours">
                                                    <EditItemTemplate>
                                                        <telerik:RadNumericTextBox ID="RadNumericTextBox2" runat="server" Culture="en-GB" DbValue='<%# Bind("STMC_Warranty_Expiry_Hours") %>' DbValueFactor="1" LabelWidth="64px" Skin="Default" Width="160px">
                                                            <NegativeStyle Resize="None" />
                                                            <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                                            <EmptyMessageStyle Resize="None" />
                                                            <ReadOnlyStyle Resize="None" />
                                                            <FocusedStyle Resize="None" />
                                                            <DisabledStyle Resize="None" />
                                                            <InvalidStyle Resize="None" />
                                                            <HoveredStyle Resize="None" />
                                                            <EnabledStyle Resize="None" />
                                                        </telerik:RadNumericTextBox></EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_Warranty_Expiry_HoursLabel" runat="server" Text='<%# Eval("STMC_Warranty_Expiry_Hours") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="STMC_Reviewed" DataFormatString="{0:dd MMM yyyy}"
                                                    Display="True" FilterControlAltText="Filter STMC_Reviewed column" HeaderText="Warranty Reviewed Date"
                                                    ReadOnly="True" SortExpression="STMC_Reviewed" UniqueName="STMC_Reviewed">
                                                    <HeaderStyle Width="90px" Wrap="True" />
                                                    <ItemStyle Width="90px" Wrap="True" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="STMC_Reviewed_By" Display="True"
                                                    FilterControlAltText="Filter STMC_Reviewed_By column" HeaderText="Warranty Reviewed By"
                                                    ReadOnly="True" SortExpression="STMC_Reviewed_By" UniqueName="STMC_Reviewed_By">
                                                    <HeaderStyle Width="90px" Wrap="True" />
                                                    <ItemStyle Width="90px" Wrap="True" />
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="STMC_Current_Life" FilterControlAltText="Filter STMC_Current_Life column" HeaderText="Current Life %" ReadOnly="True" SortExpression="STMC_Current_Life" UniqueName="STMC_Current_Life"></telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_Status" FilterControlAltText="Filter STMC_Status column" HeaderText="Status" SortExpression="STMC_Status" UniqueName="STMC_Status">
                                                    <EditItemTemplate>
                                                        <telerik:RadComboBox ID="RadComboBox401" runat="server" SelectedValue='<%# Bind("STMC_Status") %>'>
                                                            <Items>
                                                                <telerik:RadComboBoxItem runat="server" Text="Under Warranty" Value="Under Warranty" />
                                                                <telerik:RadComboBoxItem runat="server" Text="Review Warranty" Value="Review Warranty" />
                                                                <telerik:RadComboBoxItem runat="server" Text="No Warranty" Value="No Warranty" />
                                                                <telerik:RadComboBoxItem runat="server" Text="Warranty Expired" Value="Warranty Expired" />
                                                            </Items>
                                                        </telerik:RadComboBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_StatusLabel" runat="server" Text='<%# Eval("STMC_Status") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn DataField="STMC_Trash" FilterControlAltText="Filter STMC_Trash column" HeaderText="Trash?" SortExpression="STMC_Trash" UniqueName="STMC_Trash" Display="False">
                                                    <EditItemTemplate>
                                                        <telerik:RadComboBox ID="RadComboBox400" runat="server" SelectedValue='<%# Bind("STMC_Trash") %>' Width="100px">
                                                            <Items>
                                                                <telerik:RadComboBoxItem runat="server" Value="0" />
                                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="1" />
                                                            </Items>
                                                        </telerik:RadComboBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="STMC_TrashLabel" runat="server" Text='<%# Eval("STMC_Trash") %>'></asp:Label></ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="Reason" FilterControlAltText="Filter Reason column" HeaderText="Reason" ReadOnly="True" SortExpression="Reason" UniqueName="Reason"></telerik:GridBoundColumn>
                                            </Columns>
                                            <EditFormSettings>
                                                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                            </EditFormSettings>
                                        </MasterTableView>
                                        </telerik:RadGrid>
                                         <telerik:RadTabStrip ID="RadTabStrip1" runat="server" AutoPostBack="True" MultiPageID="RadMultiPage2" RenderMode="Lightweight" ResolvedRenderMode="Classic" SelectedIndex="0" Width="700px" Skin="Default" Visible="False" Font-Size="10px" Font-Bold="True">
                                    <Tabs>
                                        <telerik:RadTab PageViewID="RadPV_Grid2" Selected="True" Text="Current Component History" Value="0"/>
                                        <telerik:RadTab PageViewID="RadPV_Grid3" Text="Component Position History" Value="1" />
                                    </Tabs>
                                </telerik:RadTabStrip>
                                         <telerik:RadMultiPage ID="RadMultiPage2" runat="server" Width="700px" SelectedIndex="3" Visible="False">
                        <telerik:RadPageView ID="RadPV_Grid2" runat="server" Selected="True" Style="text-align: left" Visible="False">
                                        <telerik:RadGrid ID="RadGrid2" runat="server" DataSourceID="SqlDS_PDI_Current" Width="700px" Visible="False">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="None" DataKeyNames="PDI_ID" DataSourceID="SqlDS_PDI_Current" AllowPaging="True">
                                                <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                                <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="PDI_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter PDI_ID column" HeaderText="PDI_ID" ReadOnly="True" SortExpression="PDI_ID" UniqueName="PDI_ID"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PDI_Inspection_Date" DataFormatString="{0:dd MMM yyyy}" Display="True" FilterControlAltText="Filter PDI_Inspection_Date column" HeaderText="Inspection Date" ReadOnly="True" SortExpression="PDI_Inspection_Date" UniqueName="PDI_Inspection_Date">
                                                        <HeaderStyle Width="90px" Wrap="True" />
                                                        <ItemStyle Width="90px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Location" FilterControlAltText="Filter Location column" HeaderText="Location" ReadOnly="True" SortExpression="Location" UniqueName="Location"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Position" FilterControlAltText="Filter Position column" HeaderText="Position" ReadOnly="True" SortExpression="Position" UniqueName="Position"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PDI_Tyre_MTD_Min" FilterControlAltText="Filter PDI_Tyre_MTD_Min column" Display="False" HeaderText="Minimum Tread Depth" ReadOnly="True" SortExpression="PDI_Tyre_MTD_Min" UniqueName="PDI_Tyre_MTD_Min"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PDI_Tyre_MTD_Current" FilterControlAltText="Filter PDI_Tyre_MTD_Current column" HeaderText="Inspection Tread Depth" ReadOnly="True" SortExpression="PDI_Tyre_MTD_Current" UniqueName="PDI_Tyre_MTD_Current"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PDI_Tyre_Hours" FilterControlAltText="Filter PDI_Tyre_Hours column" Display="True" HeaderText="Tyre Hours" ReadOnly="True" SortExpression="PDI_Tyre_Hours" UniqueName="PDI_Tyre_Hours"></telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView></telerik:RadGrid>
                             </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_Grid3" runat="server" Selected="False" Style="text-align: left" Visible="False">
                             <telerik:RadGrid ID="RadGrid3" runat="server" DataSourceID="SqlDS_PDI" Width="700px" Visible="False">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="None" DataKeyNames="PDI_ID" DataSourceID="SqlDS_PDI" AllowPaging="True">
                                                <RowIndicatorColumn Visible="False"></RowIndicatorColumn>
                                                <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="PDI_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter PDI_ID column" HeaderText="PDI_ID" ReadOnly="True" SortExpression="PDI_ID" UniqueName="PDI_ID"></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="P_ID" FilterControlAltText="Filter P_ID column" Display="False" HeaderText="P_ID" ReadOnly="True" SortExpression="P_ID" UniqueName="P_ID"></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="P_PART_ID" FilterControlAltText="Filter P_PART_ID column" Display="False" HeaderText="Serial No" ReadOnly="True" SortExpression="P_PART_ID" UniqueName="P_PART_ID"></telerik:GridBoundColumn>
                                                     <telerik:GridTemplateColumn FilterControlAltText="Filter PART_T column" HeaderText="Asset" UniqueName="PART_T" SortExpression="Serial No">
                                                        <ItemTemplate>
                                                            <table border="0" style="height: 100%; ">                                                      
                                                                <tr>                                                            
                                                                    <td >
                                                                        <telerik:RadLabel ID="RadLbl_Part_ID" runat="server" Text='<%# Bind("P_PART_ID") %>' 
                                                                            style="cursor: pointer; " Font-Underline="True"></telerik:RadLabel>                                                                        
                                                                    </td>                                                            
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="80px"/>
                                                <ItemStyle Wrap="False" Width="80px" />
                                                        </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="PDI_Inspection_Date" DataFormatString="{0:dd MMM yyyy}" Display="True" FilterControlAltText="Filter PDI_Inspection_Date column" HeaderText="Inspection Date" ReadOnly="True" SortExpression="PDI_Inspection_Date" UniqueName="PDI_Inspection_Date">
                                                        <HeaderStyle Width="90px" Wrap="True" />
                                                        <ItemStyle Width="90px" Wrap="True" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Location" FilterControlAltText="Filter Location column"  Display="False" HeaderText="Location" ReadOnly="True" SortExpression="Location" UniqueName="Location"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Position" FilterControlAltText="Filter Position column"  Display="False" HeaderText="Position" ReadOnly="True" SortExpression="Position" UniqueName="Position"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PDI_Tyre_MTD_Min" FilterControlAltText="Filter PDI_Tyre_MTD_Min column" Display="False" HeaderText="Minimum Tread Depth" ReadOnly="True" SortExpression="PDI_Tyre_MTD_Min" UniqueName="PDI_Tyre_MTD_Min"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PDI_Tyre_MTD_Current" FilterControlAltText="Filter PDI_Tyre_MTD_Current column" HeaderText="Inspection Tread Depth" ReadOnly="True" SortExpression="PDI_Tyre_MTD_Current" UniqueName="PDI_Tyre_MTD_Current"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PDI_Tyre_Hours" FilterControlAltText="Filter PDI_Tyre_Hours column" Display="True" HeaderText="Tyre Hours" ReadOnly="True" SortExpression="PDI_Tyre_Hours" UniqueName="PDI_Tyre_Hours"></telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1"></EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView></telerik:RadGrid>
                             </telerik:RadPageView>
                                             </telerik:RadMultiPage>
                                    </td>
                                    <td class="auto-style1" colspan="3" style="padding-right: 20px"><strong>Component Codes and Details</strong></td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" colspan="2" style="padding-right: 20px">Level 1:</td>
                                    <td class="auto-style1" style="padding-right: 20px">
                                        <telerik:RadComboBox ID="RadCB_Level1" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Level1" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="400px"></telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" colspan="2" style="padding-right: 20px">Level 2:</td>
                                    <td class="auto-style1" style="padding-right: 20px">
                                        <telerik:RadComboBox ID="RadCB_Level2" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Level2" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="400px"></telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" colspan="2" style="padding-right: 20px">Level 3:</td>
                                    <td class="auto-style1" style="padding-right: 20px">
                                        <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True" DataSourceID="SqlDS_Level3" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="400px"></telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" colspan="2" style="padding-right: 20px">Position:</td>
                                    <td class="auto-style1" style="padding-right: 20px">
                                        <telerik:RadComboBox ID="RadCB_Position" runat="server" AllowCustomText="True" DataSourceID="SqlDS_Position" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="400px"></telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" colspan="2" style="padding-right: 20px">Repair Code:</td>
                                    <td class="auto-style1" style="padding-right: 20px">
                                        <telerik:RadComboBox ID="RadCB_Repair_Code" runat="server" AllowCustomText="True" DataSourceID="SqlDS_Repair_Code" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="400px"></telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1" colspan="2" style="padding-right: 20px">Notes:</td>
                                    <td class="auto-style1" style="padding-right: 20px">
                                        <telerik:RadTextBox ID="RadTxt_Notes" runat="server" BackColor="#FFFFDD" Height="96px" TextMode="MultiLine" Width="100%"></telerik:RadTextBox></td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lbl_New_Number" runat="server" Font-Bold="True" Font-Size="1pt" ForeColor="White"></asp:Label><asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label><asp:Label ID="lbl_Date_Reading" runat="server" Font-Bold="True" Font-Size="1pt" ForeColor="White"></asp:Label><asp:Label ID="lbl_SMU_Changed_Value" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label><asp:Label ID="lbl_SMU_Value" runat="server" Font-Bold="True" Font-Size="1pt" ForeColor="White"></asp:Label><asp:Label ID="lbl_Asset" runat="server" Font-Bold="True" Font-Size="1pt" ForeColor="White"></asp:Label><asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label><asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label><asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label><asp:Label ID="LblPreviousPage" runat="server" BackColor="White" Font-Size="1pt" ForeColor="White" Visible="False"></asp:Label></td>
                                    <td class="style5" colspan="5">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 20px" colspan="2" align="right" class="auto-style6">
                                        <asp:Label ID="lbl_Status" runat="server" Text="Planning Status:"></asp:Label></td>
                                    <td style="padding-right: 20px;" align="left" colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" ResolvedRenderMode="Classic" Width="120px" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="*New" Value="*New" />
                                                <telerik:RadComboBoxItem runat="server" Text="Planning" Value="*Planning" />
                                                <telerik:RadComboBoxItem runat="server" Text="Monitoring" Value="Monitoring" />
                                                <telerik:RadComboBoxItem runat="server" Text="Event Cancelled" Value="*Event Cancelled" />
                                                <telerik:RadComboBoxItem runat="server" Text="Not In Use" Value="Not In Use" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right"></td>
                                    <td align="right" style="padding-right: 20px;">
                                        <telerik:RadButton ID="Btn_Save" runat="server" BackColor="Red" Font-Bold="True" ForeColor="Red" Text="Save" Width="100px"></telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 20px;" colspan="2" align="right" class="auto-style6">
                                        <asp:Label ID="lbl_Reason" runat="server" Text="Planning Reason:" Visible="False"></asp:Label></td>
                                    <td style="padding-right: 20px;" align="left" colspan="3"><strong>
                                        <telerik:RadComboBox ID="RadCB_Reason" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Reason" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="320px" Visible="False"></telerik:RadComboBox>
                                    </strong></td>
                                    <td align="right" style="padding-right: 20px;">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Text="Cancel" Width="100px"></telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="auto-style6" colspan="2" style="padding-right: 20px;">
                                        <asp:Label ID="lbl_Reason_Note_Text" runat="server" Text="Planning Reason Note:" Visible="False"></asp:Label></td>
                                    <td align="left" colspan="4" style="padding-right: 20px;">
                                        <telerik:RadTextBox ID="RadTxt_Reason_Notes" runat="server" AutoPostBack="True" BackColor="#FFFFDD" Height="50px" TextMode="MultiLine" Width="500px" Visible="False"></telerik:RadTextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding-right: 20px; font-family: 'Segoe UI'; font-style: italic;" class="auto-style6">Last Modified <strong>
                                        <asp:Label ID="lbl_Modified" runat="server"></asp:Label></strong>&nbsp;by <strong>
                                            <asp:Label ID="lbl_Modified_By" runat="server"></asp:Label></strong></td>
                                    <td align="right" colspan="4" style="padding-right: 20px;">&nbsp;</td>
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
            <asp:HiddenField ID="HF_Planning" runat="server" Value="0" />
            <asp:HiddenField ID="HF_STM_ID" runat="server" />
            <asp:HiddenField ID="HF_SMU_Last" runat="server" />
            <asp:HiddenField ID="HF_SMULastReading" runat="server" />
            <asp:HiddenField ID="HF_Trend" runat="server" />
            <asp:HiddenField ID="HF_SMU_Initial" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_PD_P_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_4_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_4_RW" runat="server" Value="0" />
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
                SelectCommand="EM_PLANNING_SELECT_RW_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STM_ID" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Update" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_PLANNING_RG_UPDATE_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STM_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="STM_A_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lbl_Date_Reading" Name="STM_Date_Reading" PropertyName="Text" Type="String" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadNumTxt_SMU_Value" Name="STM_SMU_Value" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_SMU_Initial" Name="STM_SMU_Initial" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Level1" Name="STM_Code_Level_1" PropertyName="SelectedValue" Type="Int32" DefaultValue="2661" />
                    <asp:ControlParameter ControlID="RadCB_Level2" Name="STM_Code_Level_2" PropertyName="SelectedValue" Type="Int32" DefaultValue="2662" />
                    <asp:ControlParameter ControlID="RadCB_Level3" Name="STM_Code_Level_3" PropertyName="SelectedValue" Type="Int32" DefaultValue="2663" />
                    <asp:ControlParameter ControlID="RadCB_Position" Name="STM_Position_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="1107" />
                    <asp:ControlParameter ControlID="RadCB_Repair_Code" Name="STM_Repair_Code" PropertyName="SelectedValue" Type="Int32" DefaultValue="3068" />
                    <asp:ControlParameter ControlID="lbl_Estimated_Date" Name="STM_Date_Estimate" PropertyName="Text" Type="String" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadNumTxt_Frequency" Name="STM_Frequency" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_PCI" Name="STM_PCI" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_PCI_Interval" Name="STM_PCI_Interval" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Adjustment" Name="STM_Adjustment" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Cost" Name="STM_Cost" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Status" Name="STM_Planning_Status" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Reason" Name="STM_Reason_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_SMU_Changed" Name="STM_SMU_Changed" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadTxt_Reason_Notes" Name="STM_Reason_Notes" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="RadTxt_Notes" Name="STM_Notes" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="STM_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Planning" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_PLANNING_RG_UPDATE_CREATE_PLANNING_EVENT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STM_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Manual_Email" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_JOB_CC_New_sp"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STM_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Component_Changeout_Request_Email" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_COMPONENT_CHANGEOUT_PLAN_REQUEST_sp"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STM_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_PDI_Current" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_PLANNING_TYRE_INSPECTIONS_HISTORY_CURRENT_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_PD_P_ID" Name="PD_P_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_PDI" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_PLANNING_TYRE_INSPECTIONS_HISTORY_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="Asset" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="RadCB_Position" Name="Position" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Planning_Estimate_Date" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EM_PLANNING_ESTIMATE_DATE"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STM_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadNumTxt_Adjustment" Name="Adjustment" Type="Double" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_STMC" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT STMC.STMC_ID, STMC.STMC_STM_ID, STMC.STMC_Component_ID, STMC.STMC_Date_Fitted, STMC.STMC_SMU_Fitted, STMC.STMC_J_ID, STMC.STMC_COM_ID, ATTCOM.ATT_Name AS Company, STMC.STMC_Warranty_Expiry_Date, STMC.STMC_Warranty_Expiry_Hours, STMC.STMC_Current_Life, STMC.STMC_Trash, STMC.STMC_Status, STMC.STMC_Reviewed, STMC.STMC_Reviewed_By, ATTREA.ATT_Name AS Reason FROM SMU_TRIGGER_MONITORING_Component_Fitting AS STMC LEFT OUTER JOIN ATTRIBUTES AS ATTCOM ON STMC.STMC_COM_ID = ATTCOM.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTREA ON STMC.STMC_Reason_ID = ATTREA.ATT_ID WHERE (STMC.STMC_STM_ID = @STM_ID) AND (STMC.STMC_Trash = 0) ORDER BY STMC.STMC_ID DESC"
                UpdateCommand="EM_PLANNING_STMC_RG_UPDATE_SP" UpdateCommandType="StoredProcedure" InsertCommand="EM_PLANNING_STMC_RG_INSERT_SP" InsertCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STMC_STM_ID" PropertyName="Value" />
                    <asp:Parameter Name="STMC_J_ID" Type="String" />
                    <asp:Parameter Name="STMC_Component_ID" Type="String" />
                    <asp:Parameter DbType="Date" Name="STMC_Date_Fitted" />
                    <asp:Parameter Name="STMC_SMU_Fitted" Type="String" />
                    <asp:Parameter Name="STMC_COM_ID" Type="String" />
                    <asp:Parameter DbType="Date" Name="STMC_Warranty_Expiry_Date" />
                    <asp:Parameter Name="STMC_Warranty_Expiry_Hours" Type="String" />
                    <asp:Parameter Name="STMC_Status" Type="String" />
                    <asp:Parameter Name="STMC_Trash" Type="Int32" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="STMC_Created_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STM_ID" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="STMC_ID" />
                    <asp:ControlParameter ControlID="HF_STM_ID" Name="STMC_STM_ID" PropertyName="Value" />
                    <asp:Parameter Name="STMC_J_ID" />
                    <asp:Parameter Name="STMC_Component_ID" />
                    <asp:Parameter Name="STMC_Date_Fitted" />
                    <asp:Parameter Name="STMC_SMU_Fitted" />
                    <asp:Parameter Name="STMC_COM_ID" />
                    <asp:Parameter Name="STMC_Warranty_Expiry_Date" />
                    <asp:Parameter Name="STMC_Warranty_Expiry_Hours" />
                    <asp:Parameter Name="STMC_Status" />
                    <asp:Parameter Name="STMC_Trash" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="STMC_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_ASSET" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT A_ID, A_Asset_ID FROM ASSET WHERE (A_Status NOT IN ('Trash', 'Delete')) AND (A_Activity_Status NOT IN ('Disposed')) ORDER BY A_Asset_ID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Reason" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name + ' - ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_Status NOT IN ('Trash', 'Delete')) AND (ATT_TABLE = 'COMPONENT_CHANGEOUT_Reasons') ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_JOB_ID" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT JOB.J_ID FROM JOB INNER JOIN EVENT ON JOB.J_E_ID = EVENT.E_ID INNER JOIN ASSET ON EVENT.E_A_ID = ASSET.A_ID WHERE (JOB.J_Status NOT IN ('Trash', 'Open', 'Cancelled')) AND (JOB.J_STM_ID IS NOT NULL) AND (ASSET.A_ID = @A_ID) OR (JOB.J_Status NOT IN ('Trash', 'Open', 'Cancelled')) AND (ASSET.A_ID = @A_ID) AND (EVENT.E_STM_ID IS NOT NULL) ORDER BY JOB.J_ID DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Company" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_Status &lt;&gt; 'Trash') AND (ATT_TABLE = 'ASSET_Company') ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Status" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'Service_Status') ORDER BY ATT_SP_ID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Level1" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'SMU_Trigger_Task_Code_Header') AND (ATT_FLAG = 1) AND (ATT_Status &lt;&gt; 'Trash') ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Level2" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '2662' AS ATT_ID, '0000 : *NOT SPECIFIED' AS ATT_Name UNION ALL SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'SMU_Trigger_Task_Code_Header') AND (ATT_FLAG = 2) AND (ATT_LOOKUP_ID = @Level1) and ATT_Status &lt;&gt; 'Trash' ORDER BY ATT_Name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Level1" Name="Level1" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Level3" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '2663' AS ATT_ID, '0000 : *NOT SPECIFIED' AS ATT_Name UNION ALL SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'SMU_Trigger_Task_Code_Header') AND (ATT_FLAG = 3) AND (ATT_LOOKUP_ID = @Level2) and ATT_Status &lt;&gt; 'Trash' ORDER BY ATT_Name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Level2" Name="Level2" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_TriggerCode" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'SMU_Trigger_Code') AND (ATT_ID &lt;&gt; 553) ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Position" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'Defect_Position') ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Repair_Code" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name + ' : ' + ATT_Description as ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'REPAIR_Codes') ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_LastSMUReading" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT TOP (1) SMU_Value FROM SMU WHERE (SMU_A_ID = @Asset) ORDER BY SMU_ID DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="Asset" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Trend" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT SER_A_ID, SER_Trend FROM SERVICING WHERE (SER_A_ID = @SER_A_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="SER_A_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_SMU_Changed">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_SMU_Value" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level2" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Adjustment">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Estimated_Date" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Frequency">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Estimated_Date" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_SMU_Value">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Estimated_Date" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_SMU_Initial">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_SMU_Value" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Estimated_Date" />
                            <telerik:AjaxUpdatedControl ControlID="HF_SMU_Initial" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_STM_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Reason" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Reason" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Reason_Note_Text" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Reason_Notes" />
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Reason">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Planning" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTxt_Reason_Notes">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Planning" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
              <telerik:RadWindow ID="RadWindow_Part" runat="server" Height="900px" Width="1250px" OnClientClose="closeWindow_part" Behaviors="Close, Move" Modal="True" Title="Part Tracker" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


<%@ Page Language="VB" AutoEventWireup="false" Title="Admin - TRIGGERS" CodeFile="flt_ADMIN_TRIGGERS.aspx.vb" Inherits="ADMIN_TRIGGERS" %>
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
        .auto-style4 {
            width: 203px;
        }
        .auto-style5 {
            width: 251px;
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
        //alert(THISPP);
        if (THISPP == 0) {
            window.open('../CLIENT/flt_ADMIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_EVENT_MANAGEMENT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
            //window.open('../EVENT_MANAGEMENT/flt_EM_PLANNING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 2) {
            window.open('../DASHBOARDS/flt_D_PLANNING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
        }
        if (THISPP == 3) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=11', '_self');
        }
    }
    function fn_general() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISPP = document.getElementById('HF_PreviousPage').value;
        window.open('flt_ADMIN_TRIGGERS_MOD.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=' + THISPP, '_self');
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('SJ_ID');
        document.getElementById('HF_SJ_ID').value = ATTid;
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISSJ = document.getElementById('HF_SJ_ID').value;
        var THISMODEL = document.getElementById('HF_Model').value;
        var oWndadd = $find("<%=RadWindow1.ClientID%>");
        oWndadd.setUrl('flt_ADMIN_TRIGGERS_ADD_TO_ASSET_RW.aspx?FLT_GUID=' + THISGUID + '&SJ_ID=' + THISSJ + '&MODEL=' + THISMODEL + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
    }
    function fn_OnClickButtonCost() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var oWndadd = $find("<%=RadWindow3.ClientID%>");
        oWndadd.setUrl('flt_ADMIN_TRIGGERS_UPDATE_COSTS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISSJ = document.getElementById('HF_SJ_ID').value;
        var THISMODEL = document.getElementById('HF_Model').value;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_ADMIN_TRIGGERS_ADD_TO_ALL_MODEL_RW.aspx?FLT_GUID=' + THISGUID + '&SJ_ID=' + THISSJ + '&MODEL=' + THISMODEL + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function closeWindow_add_event_new_item(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWndadd = $find("<%=RadWindow1.ClientID%>");
            oWndadd.close();
        }
    }
    function closeWindow_add_event(sender, args) {
        var x = args.get_argument();
        //        { __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWnd = $find("<%=RadWindow2.ClientID%>");
            oWnd.close();
        }
    }
     function closeWindow_add_event_new_item2(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWndadd = $find("<%=RadWindow3.ClientID%>");
            oWndadd.close();
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style2">
                               <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr >
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style5">
                                 <asp:Label ID="lblTitle" runat="server" Text="ADMIN - JOB TRIGGERS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style4">
                                Model:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                    </table>
                     <table style="padding-top: 20px">
                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px" >
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_1" runat="server" onClick="fn_general()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="COPY MODEL" ForeColor="Black"></asp:Label>
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
                                     <asp:Panel ID="Panel_2" runat="server" onClick="fn_OnClickButton()" CssClass="roundcorners" BackColor="#d9ffd9">
                                        <table border="0">
                                            <tr>
                                               <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                      <img src="../../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="ADD TO SPECIFIC ASSET" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px" >
                                    <asp:TableRow ID="TableRow45" runat="server">
                                        <asp:TableCell ID="ID_CELL_3" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_3" runat="server" onClick="fn_OnClickButtonCost()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                            <td class="metro_400x75_cell_content_top" colspan="2" >
                                                     <img src="../../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="UPDATE COSTS" ForeColor="Black"></asp:Label>
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
                                                      <img src="../../IMAGES/Icons_Black/metro_setting_58x58.png" />
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
                    <table class="style1" width="100%">
                        <tr>
                            <td class="style4" style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_Msg" runat="server" ForeColor="Red" Visible="False" Font-Bold="True"></asp:Label>
                                <asp:Label ID="lbl_Msg2" runat="server" ForeColor="White" Visible="False" Font-Bold="True"></asp:Label>
                            </td>
                             <td style="text-align: left"></td>
                        </tr>
                        <tr>
                            <td style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Triggers" runat="server" AllowAutomaticInserts="True"
                                    AllowAutomaticUpdates="True" DataSourceID="SqlDS_RadGrid_Triggers"
                                    ResolvedRenderMode="Classic" Width="100%"
                                    AllowSorting="True" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="False" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="SJ_ID"
                                        DataKeyNames="SJ_ID" DataSourceID="SqlDS_RadGrid_Triggers"
                                        CommandItemDisplay="Top">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new job trigger" />
                                        <Columns>
                                            <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                            </telerik:GridEditCommandColumn>
                                            <telerik:GridBoundColumn DataField="SJ_ID" DataType="System.Int32"
                                                Display="False" FilterControlAltText="Filter SJ_ID column" HeaderText="ID"
                                                ReadOnly="True" SortExpression="SJ_ID" UniqueName="SJ_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn DataField="SJ_MOD_ID" Display="False"
                                                FilterControlAltText="Filter SJ_MOD_ID column" HeaderText="Model"
                                                SortExpression="SJ_MOD_ID" UniqueName="SJ_MOD_ID">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadComboBox1" runat="server" AllowCustomText="True"
                                                        Filter="Contains" ResolvedRenderMode="Classic"
                                                        SelectedValue='<%# Bind("SJ_MOD_ID") %>' Skin="Default"
                                                        DataSourceID="SqlDS_ModelGrid" DataTextField="ATT_Name" DataValueField="ATT_ID">
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_MOD_IDLabel" runat="server" Text='<%# Eval("SJ_MOD_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Model"
                                                FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True"
                                                SortExpression="Model" UniqueName="Model">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn DataField="SJ_Code_Level_1"
                                                FilterControlAltText="Filter SJ_Code_Level_1 column" HeaderText="Level 1"
                                                SortExpression="SJ_Code_Level_1" UniqueName="SJ_Code_Level_1" Display="False">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadCB_Level1" runat="server" AllowCustomText="True"
                                                        Filter="Contains" ResolvedRenderMode="Classic"
                                                        SelectedValue='<%# Bind("SJ_Code_Level_1") %>' Width="300px"
                                                        DataSourceID="SqlDS_Level1" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                                        Skin="Default" AutoPostBack="True">
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_Code_Level_1Label" runat="server" Text='<%# Eval("SJ_Code_Level_1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Level1"
                                                FilterControlAltText="Filter Level1 column" HeaderText="Level 1" ReadOnly="True"
                                                SortExpression="Level1" UniqueName="Level1">
                                                <HeaderStyle Width="300px" Wrap="False" />
                                                <ItemStyle Width="300px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn DataField="SJ_Code_Level_2"
                                                FilterControlAltText="Filter SJ_Code_Level_2 column" HeaderText="Level 2"
                                                SortExpression="SJ_Code_Level_2" UniqueName="SJ_Code_Level_2" Display="False">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadCB_Level2" runat="server" AllowCustomText="True"
                                                        Filter="Contains" ResolvedRenderMode="Classic"
                                                        SelectedValue='<%# Bind("SJ_Code_Level_2") %>' Width="300px"
                                                        DataSourceID="SqlDS_Level2" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                                        Skin="Default" AutoPostBack="True">
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_Code_Level_2Label" runat="server" Text='<%# Eval("SJ_Code_Level_2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Level2"
                                                FilterControlAltText="Filter Level2 column" HeaderText="Level 2" ReadOnly="True"
                                                SortExpression="Level2" UniqueName="Level2">
                                                <HeaderStyle Width="300px" Wrap="False" />
                                                <ItemStyle Width="300px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn DataField="SJ_Code_Level_3"
                                                FilterControlAltText="Filter SJ_Code_Level_3 column" HeaderText="Level 3"
                                                SortExpression="SJ_Code_Level_3" UniqueName="SJ_Code_Level_3" Display="False">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadCB_Level3" runat="server" AllowCustomText="True"
                                                        Filter="Contains" ResolvedRenderMode="Classic"
                                                        SelectedValue='<%# Bind("SJ_Code_Level_3") %>' Width="300px"
                                                        DataSourceID="SqlDS_Level3" DataTextField="ATT_Name" DataValueField="ATT_ID"
                                                        Skin="Default" AutoPostBack="True">
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_Code_Level_3Label" runat="server" Text='<%# Eval("SJ_Code_Level_3") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Level3"
                                                FilterControlAltText="Filter Level3 column" HeaderText="Level 3" ReadOnly="True"
                                                SortExpression="Level3" UniqueName="Level3">
                                                <HeaderStyle Width="300px" Wrap="False" />
                                                <ItemStyle Width="300px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn DataField="SJ_Position_ID" Display="False" FilterControlAltText="Filter SJ_Position_ID column" HeaderText="Position" SortExpression="SJ_Position_ID" UniqueName="SJ_Position_ID">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadCB_Position" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Position" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" SelectedValue='<%# Bind("SJ_Position_ID") %>' Width="300px">
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_Position_IDLabel" runat="server" Text='<%# Eval("SJ_Position_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Position" FilterControlAltText="Filter Position column" HeaderText="Position" SortExpression="Position" UniqueName="Position" ReadOnly="True">
                                            </telerik:GridBoundColumn>
                                             <telerik:GridTemplateColumn DataField="SJ_Repair_Code" Display="False" FilterControlAltText="Filter SJ_Repair_Code column" HeaderText="Repair Code" SortExpression="SJ_Repair_Code" UniqueName="SJ_Repair_Code">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadCB_Repair_Code" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Repair_Code" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" SelectedValue='<%# Bind("SJ_Repair_Code") %>' Width="300px">
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_Repair_CodeLabel" runat="server" Text='<%# Eval("SJ_Repair_Code") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="RepairCode" FilterControlAltText="Filter RepairCode column" HeaderText="Repair Code" SortExpression="RepairCode" UniqueName="RepairCode" ReadOnly="True">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn DataField="SJ_Frequency"
                                                FilterControlAltText="Filter SJ_Frequency column" HeaderText="Planned Component Hours"
                                                SortExpression="SJ_Frequency" UniqueName="SJ_Frequency">
                                                <EditItemTemplate>
                                                    <telerik:RadNumericTextBox ID="RadNumericTextBox1" Runat="server" Culture="en-GB" DbValue='<%# Bind("SJ_Frequency") %>' DbValueFactor="1" LabelWidth="64px" MaxValue="500000" MinValue="1" Width="160px">
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
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_FrequencyLabel" runat="server"
                                                        Text='<%# Eval("SJ_Frequency") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                             <telerik:GridTemplateColumn DataField="SJ_Cost"
                                                FilterControlAltText="Filter SJ_Cost column" HeaderText="Cost"
                                                SortExpression="SJ_Cost" UniqueName="SJ_Cost">
                                                <EditItemTemplate>
                                                    <telerik:RadNumericTextBox ID="RadNumericTextBox2" Runat="server" Culture="en-GB" DbValue='<%# Bind("SJ_Cost") %>' DbValueFactor="1" LabelWidth="64px" MaxValue="500000" MinValue="1" Width="160px">
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
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_CostLabel" runat="server"
                                                        Text='<%# Eval("SJ_Cost") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn DataField="SJ_Status"
                                                FilterControlAltText="Filter SJ_Status column" HeaderText="Status"
                                                SortExpression="SJ_Status" UniqueName="SJ_Status">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadComboBox5" runat="server"
                                                        ResolvedRenderMode="Classic" SelectedValue='<%# Bind("SJ_Status") %>'>
                                                        <Items>
                                                            <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                                            <telerik:RadComboBoxItem runat="server" Text="Reviewed" Value="Reviewed" />
                                                            <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_StatusLabel" runat="server" Text='<%# Eval("SJ_Status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Created" Display="False"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter SJ_Created column" HeaderText="Date Created"
                                                ReadOnly="True" SortExpression="SJ_Created" UniqueName="SJ_Created">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Created_By" Display="False"
                                                FilterControlAltText="Filter SJ_Created_By column" HeaderText="Created By"
                                                ReadOnly="True" SortExpression="SJ_Created_By" UniqueName="SJ_Created_By">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Modified" Display="False"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter SJ_Modified column"
                                                HeaderText="Date Modified" ReadOnly="True" SortExpression="SJ_Modified"
                                                UniqueName="SJ_Modified">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Modified_By" Display="False"
                                                FilterControlAltText="Filter SJ_Modified_By column" HeaderText="Modified By"
                                                ReadOnly="True" SortExpression="SJ_Modified_By" UniqueName="SJ_Modified_By">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                        <ItemStyle Font-Names="Segoe UI" Font-Size="10pt" ForeColor="Black" />
                                        <AlternatingItemStyle BackColor="#DBDBDB" Font-Names="Segoe UI"
                                            Font-Size="10pt" ForeColor="Black" />
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td style="text-align: left">
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
             <asp:HiddenField ID="HF_Model" runat="server"/>
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_SJ_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_11_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_11_RW" runat="server" Value="0" />
            <asp:SqlDataSource ID="SqlDS_RadGrid_Triggers" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                InsertCommand="INSERT INTO SMU_JOB(SJ_MOD_ID, SJ_Code_Level_1, SJ_Code_Level_2, SJ_Code_Level_3, SJ_Position_ID, SJ_Repair_Code, SJ_Frequency, SJ_Status, SJ_Created, SJ_Created_By, SJ_Cost) VALUES (@SJ_MOD_ID, @SJ_Code_Level_1, @SJ_Code_Level_2, @SJ_Code_Level_3, @SJ_Position_ID, @SJ_Repair_Code, @SJ_Frequency, @SJ_Status, GETDATE(), @SJ_Created_By, @SJ_Cost)"
                SelectCommand="SELECT SJ.SJ_ID, SJ.SJ_MOD_ID, ATTMOD.ATT_Name AS Model, SJ.SJ_Code_Level_1, ATT1.ATT_Name + ' : ' + ATT1.ATT_Description AS Level1, SJ.SJ_Code_Level_2, ATT2.ATT_Name + ' : ' + ATT2.ATT_Description AS Level2, SJ.SJ_Code_Level_3, ATT3.ATT_Name + ' : ' + ATT3.ATT_Description AS Level3, ATTPOS.ATT_Name AS Position, SJ_Repair_Code, ATTREP.ATT_Name + ' : ' + ATTREP.ATT_Description AS RepairCode, SJ.SJ_Frequency, SJ.SJ_Status, SJ.SJ_Created, SJ.SJ_Created_By, SJ.SJ_Modified, SJ.SJ_Modified_By, SJ.SJ_Position_ID, SJ.SJ_Cost FROM SMU_JOB AS SJ LEFT OUTER JOIN ATTRIBUTES AS ATTMOD ON SJ.SJ_MOD_ID = ATTMOD.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATT1 ON SJ.SJ_Code_Level_1 = ATT1.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATT2 ON SJ.SJ_Code_Level_2 = ATT2.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATT3 ON SJ.SJ_Code_Level_3 = ATT3.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTPOS ON SJ.SJ_Position_ID = ATTPOS.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATTREP ON SJ.SJ_Repair_Code = ATTREP.ATT_ID WHERE (SJ.SJ_MOD_ID LIKE @ATT_ID) AND (SJ.SJ_Status NOT IN ('Trash', 'Delete')) ORDER BY Model, SJ.SJ_Code_Level_1, SJ.SJ_Code_Level_2, SJ.SJ_Code_Level_3"
                UpdateCommand="UPDATE SMU_JOB SET SJ_MOD_ID = @SJ_MOD_ID, SJ_Code_Level_1 = @SJ_Code_Level_1, SJ_Code_Level_2 = @SJ_Code_Level_2, SJ_Code_Level_3 = @SJ_Code_Level_3, SJ_Position_ID = @SJ_Position_ID, SJ_Repair_Code = @SJ_Repair_Code, SJ_Frequency = @SJ_Frequency, SJ_Status = @SJ_Status, SJ_Modified = GETDATE(), SJ_Modified_By = @SJ_Modified_By, SJ_Cost = @SJ_Cost WHERE (SJ_ID = @SJ_ID)">
                <InsertParameters>
                    <asp:Parameter Name="SJ_MOD_ID" />
                    <asp:Parameter Name="SJ_Code_Level_1" />
                    <asp:Parameter Name="SJ_Code_Level_2" />
                    <asp:Parameter Name="SJ_Code_Level_3" />
                    <asp:Parameter Name="SJ_Position_ID" />
                    <asp:Parameter Name="SJ_Repair_Code" />
                    <asp:Parameter Name="SJ_Frequency" />
                    <asp:Parameter Name="SJ_Status" />
                    <asp:ControlParameter ControlID="HF_Username" Name="SJ_Created_By" PropertyName="Value" Type="String" />
                    <asp:Parameter Name="SJ_Cost" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Model" Name="ATT_ID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SJ_MOD_ID" />
                    <asp:Parameter Name="SJ_Code_Level_1" />
                    <asp:Parameter Name="SJ_Code_Level_2" />
                    <asp:Parameter Name="SJ_Code_Level_3" />
                    <asp:Parameter Name="SJ_Position_ID" />
                    <asp:Parameter Name="SJ_Repair_Code" />
                    <asp:Parameter Name="SJ_Frequency" />
                    <asp:Parameter Name="SJ_Status" />
                    <asp:ControlParameter ControlID="HF_Username" Name="SJ_Modified_By" PropertyName="Value" Type="String" />
                    <asp:Parameter Name="SJ_Cost" />
                    <asp:Parameter Name="SJ_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_ModelGrid" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'ASSET_Model') AND (ATT_Status NOT IN ('Trash', 'Delete')) ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Level1" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'SMU_Trigger_Task_Code_Header') AND (ATT_FLAG = 1) and ATT_Status &lt;&gt; 'Trash' ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Level2" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'SMU_Trigger_Task_Code_Header') AND (ATT_FLAG = 2) and ATT_Status &lt;&gt; 'Trash' ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Level3" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'SMU_Trigger_Task_Code_Header') AND (ATT_FLAG = 3) and ATT_Status &lt;&gt; 'Trash' ORDER BY ATT_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Position" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'DEFECT_Position') AND (ATT_Status &lt;&gt; 'Trash') ORDER BY ATT_Name"></asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Repair_Code" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATT_ID) AS ATT_ID, ATT_Name + ' : ' + ATT_Description AS ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'REPAIR_Codes') AND (ATT_Status &lt;&gt; 'Trash') ORDER BY ATT_Name"></asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Triggers" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Triggers" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Triggers" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Model" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Msg" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Msg2" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Triggers">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="T2" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Triggers" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Msg" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Msg2" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow1" runat="server" Height="650px" Width="500px" OnClientClose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True" Skin="Glow">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="650px" Width="500px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True" Skin="Glow">
            </telerik:RadWindow>
             <telerik:RadWindow ID="RadWindow3" runat="server" Height="450px" Width="500px" OnClientClose="closeWindow_add_event_new_item2" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


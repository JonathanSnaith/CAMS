<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - Component Parts Tracker" CodeFile="flt_AM_PART_LIST.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_PART_LIST" %>

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

        .auto-style5 {
            width: 180px;
        }

        .auto-style9 {
            width: 230px;
        }

        .auto-style10 {
            width: 204px;
        }

        .auto-style11 {
            width: 169px;
        }

        .auto-style13 {
            width: 337px;
        }

        .auto-style15 {
            width: 282px;
        }

        .auto-style17 {
            width: 325px;
        }

        .auto-style18 {
            width: 527px;
        }

        .auto-style19 {
            width: 184px;
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
            window.open('../CLIENT/flt_ASSET_MANAGEMENT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=7', '_self');
        }
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('P_ID');
        document.getElementById('HF_P_ID').value = ATTid;
        sessionStorage.setItem("P_ID", ATTid);
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }

    function fn_OnClickButton() {
        var THISGUID = document.getElementById('HF_GUID').value;
       var THISP = 0;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_AM_PART_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&P_ID=' + THISP + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickRequest() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISP =0;
        var oWnd = $find("<%=RadWindow4.ClientID%>");
        oWnd.setUrl('flt_AM_PART_LIST_EDIT_REQUEST_RW.aspx?FLT_GUID=' + THISGUID + '&PR_ID=' + THISP + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISP = sessionStorage.getItem("P_ID");
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_AM_PART_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&P_ID=' + THISP + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function RowSelected2(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('PR_ID');
        document.getElementById('HF_PR_ID').value = ATTid;
        sessionStorage.setItem("PR_ID", ATTid);
    }
    function fn_onrowdblclick2() {
        fn_OnClickWindow2();
    }
    function fn_OnClickWindow2() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISP = sessionStorage.getItem("PR_ID");
        var oWnd = $find("<%=RadWindow4.ClientID%>");
        oWnd.setUrl('flt_AM_PART_LIST_EDIT_REQUEST_RW.aspx?FLT_GUID=' + THISGUID + '&PR_ID=' + THISP + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
     function closeWindow_add_event(sender, args) {
         var x = args.get_argument();
         { __doPostBack('Refresh_Grid', 0); }
         //alert(x);
         if (x > 0) {
             var oWnd = $find("<%=RadWindow2.ClientID%>");
            oWnd.close();
        }
    }
  function closeWindow_add_event_new_item(sender, args) {
         var x = args.get_argument();
         { __doPostBack('Refresh_Grid', 0); }
         //alert(x);
         if (x > 0) {
             var oWnd = $find("<%=RadWindow4.ClientID%>");
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
                    <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 14px; padding-left: 5px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style18">
                                <asp:Label ID="lblTitle" runat="server" Text="COMPONENT PARTS TRACKER"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style10">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Glow" Text="Refresh" Width="100px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style11">Component:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" class="auto-style9">
                                <telerik:RadComboBox ID="RadCB_Level3" runat="server" AutoPostBack="True" Filter="Contains" ResolvedRenderMode="Classic" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Font-Names="Segoe UI" Font-Size="10pt" Width="200px" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style19">Model:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style3">
                                <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style13">Part:&nbsp;
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Part" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="Part" DataValueField="P_Part_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="100px" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style17">Current Location: </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" class="auto-style15">
                                <telerik:RadComboBox ID="RadCB_LT" runat="server" AutoPostBack="True" Skin="Glow">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="*All" Value="-1" />
                                        <telerik:RadComboBoxItem runat="server" Text="Asset" Value="Asset" />
                                        <telerik:RadComboBoxItem runat="server" Text="Company" Value="Company" />
                                        <telerik:RadComboBoxItem runat="server" Text="Site" Value="Site" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadComboBox ID="RadCB_Location" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="Name" DataValueField="ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Visible="False" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">Status:</td>
                            <td align="left" class="auto-style15" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" Skin="Glow">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="*All" Value="-1" />
                                        <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                        <telerik:RadComboBoxItem runat="server" Text="Ordered" Value="Ordered" />
                                        <telerik:RadComboBoxItem runat="server" Text="Allocated" Value="Allocated" />
                                        <telerik:RadComboBoxItem runat="server" Text="Unallocated" Value="Unallocated" />
                                        <telerik:RadComboBoxItem runat="server" Text="Request Disposal" Value="Request Disposal" />
                                        <telerik:RadComboBoxItem runat="server" Text="Disposed" Value="Disposed" />
                                    </Items>
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_1" runat="server" onClick="fn_OnClickButton()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/ASSET_PARTS.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW PART" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="True">
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_2" runat="server" onClick="fn_OnClickRequest()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/ASSET_PARTS.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="REQUEST PART" ForeColor="Black"></asp:Label>
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
                                                        <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                            <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="PRINT" ForeColor="Black"></asp:Label>
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
                                <asp:Label ID="lbl_Pending_Requests" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="12pt" ForeColor="White" Text="Pending Requests"></asp:Label>
                                <telerik:RadGrid ID="RadGrid_Part_Requests" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" ResolvedRenderMode="Classic" Skin="Glow">
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick2" OnRowSelected="RowSelected2" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="PR_ID" DataKeyNames="PR_ID" >
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new part" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="PR_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter PR_ID column" HeaderText="ID" ReadOnly="True" SortExpression="PR_ID" UniqueName="PR_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Customer" FilterControlAltText="Filter Customer column" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" UniqueName="Customer">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Asset" FilterControlAltText="Filter Asset column" HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Model" Display="True" FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True" SortExpression="Model" UniqueName="Model">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level3" Display="True" FilterControlAltText="Filter Level3 column" HeaderText="Component" ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Stock" FilterControlAltText="Filter Stock column" HeaderText="Stock Status" ReadOnly="True" SortExpression="Stock" UniqueName="Stock">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PR_Reason" FilterControlAltText="Filter PR_Reason column" HeaderText="Request Reason" ReadOnly="True" SortExpression="PR_Reason" UniqueName="PR_Reason">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PR_Status" Display="False" FilterControlAltText="Filter PR_Status column" HeaderText="Status" ReadOnly="True" SortExpression="PR_Status" UniqueName="PR_Status">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PR_Created" DataFormatString="{0:dd MMM yyyy}" Display="True" FilterControlAltText="Filter PR_Created column" HeaderText="Requested Date" ReadOnly="True" SortExpression="PR_Created" UniqueName="PR_Created">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PR_Created_By" Display="False" FilterControlAltText="Filter PR_Created_By column" HeaderText="Requested By" ReadOnly="True" SortExpression="PR_Created_By" UniqueName="PR_Created_By">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:Label ID="lbl_Current_Parts" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="12pt" ForeColor="White" Text="Current Parts"></asp:Label>
                                <telerik:RadGrid ID="RadGrid_Part_List" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" ResolvedRenderMode="Classic" AllowPaging="True" PageSize="50" Skin="Glow">
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="P_ID" DataKeyNames="P_ID" >
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new part" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="P_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter P_ID column" HeaderText="ID" ReadOnly="True" SortExpression="P_ID" UniqueName="P_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="P_Part_ID" FilterControlAltText="Filter P_Part_ID column" HeaderText="Part ID" ReadOnly="True" SortExpression="P_Part_ID" UniqueName="P_Part_ID">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Model" Display="True" FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True" SortExpression="Model" UniqueName="Model">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Level3" Display="True" FilterControlAltText="Filter Level3 column" HeaderText="Component" ReadOnly="True" SortExpression="Level3" UniqueName="Level3">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Position" Display="True" FilterControlAltText="Filter Position column" HeaderText="Position" ReadOnly="True" SortExpression="Position" UniqueName="Position">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Customer" FilterControlAltText="Filter Customer column" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" UniqueName="Customer">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CurrentLocation" Display="True" FilterControlAltText="Filter CurrentLocation column" HeaderText="Current Location" ReadOnly="True" SortExpression="CurrentLocation" UniqueName="CurrentLocation">
                                                <HeaderStyle Width="200px" Wrap="True" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PD_Location_Date" DataFormatString="{0:dd MMM yyyy}" Display="False" FilterControlAltText="Filter PD_Location_Date column" HeaderText="Date at Location" ReadOnly="True" SortExpression="PD_Location_Date" UniqueName="PD_Location_Date">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ExpectedDays" Display="False" FilterControlAltText="Filter ExpectedDays column" HeaderText="Expected Days" ReadOnly="True" SortExpression="ExpectedDays" UniqueName="ExpectedDays">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ExpectedDaysText" Display="True" FilterControlAltText="Filter ExpectedDaysText column" HeaderText="Expected Days" ReadOnly="True" SortExpression="ExpectedDaysText" UniqueName="ExpectedDaysText">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ExpectedDaysCalc" Display="False" FilterControlAltText="Filter ExpectedDaysCalc column" HeaderText="ExpectedDaysCalc" ReadOnly="True" SortExpression="ExpectedDaysCalc" UniqueName="ExpectedDaysCalc">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ActualDays" Display="True" FilterControlAltText="Filter ActualDays column" HeaderText="Actual Days" ReadOnly="True" SortExpression="ActualDays" UniqueName="ActualDays">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="P_Status" Display="True" FilterControlAltText="Filter P_Status column" HeaderText="Status" ReadOnly="True" SortExpression="P_Status" UniqueName="P_Status">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PD_Location_Type" Display="False" FilterControlAltText="Filter PD_Location_Type column" HeaderText="Location Type" ReadOnly="True" SortExpression="PD_Location_Type" UniqueName="PD_Location_Type">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
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
            <asp:HiddenField ID="HF_Row" runat="server" />
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_P_ID" runat="server" />
            <asp:HiddenField ID="HF_PR_ID" runat="server" />
            <asp:HiddenField ID="HF_PD_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_Location" runat="server" />
            <asp:HiddenField ID="HF_Location_Type" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_4_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_4_RW" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_15" runat="server" Value="0" />              
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Silk">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow4">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_Requests" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadBtn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Level3" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Part" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_LT" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Location" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_Requests" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Level3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Part" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Part" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Part">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_LT">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Location" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Location">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Location" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Location_Type" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="900px" Width="1250px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow4" runat="server" Height="550px" Width="600px" OnClientClose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="Edit Part Request" VisibleStatusbar="False" KeepInScreenBounds="True" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


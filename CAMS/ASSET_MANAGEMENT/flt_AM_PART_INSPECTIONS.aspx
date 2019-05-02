<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - Component Parts Inspections" CodeFile="flt_AM_PART_INSPECTIONS.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_PART_INSPECTIONS" %>

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
        .auto-style20 {
            height: 45px;
            width: 704px;
        }
    </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
    function fn_home() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    function fn_back() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISPP = document.getElementById('lblPreviousPage').innerHTML;
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
        var IDid = sender.get_selectedItems()[0].getDataKeyValue('ID');
        document.getElementById('HF_ID_ID').value = IDid;
        sessionStorage.setItem("ID", IDid);
        var PDid = sender.get_selectedItems()[0].getDataKeyValue('PD_ID');
        document.getElementById('HF_PD_ID').value = PDid;
        sessionStorage.setItem("PD_ID", PDid);
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISPD = sessionStorage.getItem("PD_ID");
        var THISID = sessionStorage.getItem("ID");
        var THISL3 = document.getElementById('HF_L3').value;
        var THISMOD = document.getElementById('HF_MOD_ID').value;
        var THISPART = document.getElementById('HF_Part_ID').value;
        var oWndadd = $find("<%=RadWindow3.ClientID%>");
        oWndadd.setUrl('flt_AM_PART_INSPECTIONS_ADD_RW.aspx?FLT_GUID=' + THISGUID + '&ID=' + THISID + '&PD_ID=' + THISPD + '&P_Level_3=' + THISL3 + '&P_MOD_ID=' + THISMOD + '&P_Part_ID=' + THISPART + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISP = sessionStorage.getItem("P_ID");
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_AM_PART_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&P_ID=' + THISP + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function RowSelected2(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('PDI_ID');
        document.getElementById('HF_PDI_ID').value = ATTid;
        sessionStorage.setItem("PDI_ID", ATTid);
    }
    function fn_onrowdblclick2() {
        fn_OnClickWindow2();
    }
    function fn_OnClickWindow2() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISP = sessionStorage.getItem("PDI_ID");
        var oWnd = $find("<%=RadWindow4.ClientID%>");
        oWnd.setUrl('flt_AM_PART_INSPECTIONS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&PDI_ID=' + THISP + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function closeWindow_add_event_new_item(sender, args) {
        var x = args.get_argument();
        if (x > 0) {
            var oWndadd = $find("<%=RadWindow1.ClientID%>");
             oWndadd.close();
         }
     }
     function closeWindow_add_event(sender, args) {
         var x = args.get_argument();
         { __doPostBack('Refresh_Grid', 0); }
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" class="auto-style3">&nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>
                                <asp:Label ID="lbl_Site" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lbl_Asset" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">&nbsp;</td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 12px; padding-left: 5px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style18">
                                <asp:Label ID="lblTitle" runat="server" Text="COMPONENT PARTS INSPECTIONS"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style10">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Default" Text="Refresh" Width="100px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style11">Component:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style9">
                                <telerik:RadComboBox ID="RadCB_Desc" runat="server" AutoPostBack="True" Filter="Contains" ResolvedRenderMode="Classic" AllowCustomText="True" DataSourceID="SqlDS_CB_Desc" DataTextField="PartDesc" DataValueField="P_Level_3" Font-Names="Segoe UI" Font-Size="10pt" Width="200px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style19">Model:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style3">
                                <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Model" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style13">Part:&nbsp;
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Part" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_PART" DataTextField="Part" DataValueField="P_Part_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="100px">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: right;" class="auto-style17">&nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;" class="auto-style15">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">&nbsp;</td>
                            <td align="left" class="auto-style15" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                &nbsp;</td>
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
                                                            <img src="../IMAGES/Icons_Black/ASSET_PARTS.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW INSPECTION" ForeColor="Black"></asp:Label>
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
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
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
                                                        <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
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
                            <td class="auto-style20" style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_Inspections_Due" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="12pt" ForeColor="Black" Text="Inspections Due"></asp:Label>
                                <telerik:RadGrid ID="RadGrid_Part_List" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_PART_LIST" ResolvedRenderMode="Classic" Skin="Default" Width="1000px">
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="ID, P_ID, PD_ID" DataKeyNames="ID, P_ID, PD_ID" DataSourceID="SqlDS_RadGrid_SP_PART_LIST">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new part" />
                                        <Columns>
                                             <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter ID column" HeaderText="Identity" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="P_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter P_ID column" HeaderText="ID" ReadOnly="True" SortExpression="P_ID" UniqueName="P_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PD_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter PD_ID column" HeaderText="Detail ID" ReadOnly="True" SortExpression="PD_ID" UniqueName="PD_ID">
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
                                            <telerik:GridBoundColumn DataField="Position" Display="False" FilterControlAltText="Filter Position column" HeaderText="Position" ReadOnly="True" SortExpression="Position" UniqueName="Position">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CurrentLocation" Display="False" FilterControlAltText="Filter CurrentLocation column" HeaderText="Current Location" ReadOnly="True" SortExpression="CurrentLocation" UniqueName="CurrentLocation">
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
                                            <telerik:GridBoundColumn DataField="ExpectedDaysText" Display="False" FilterControlAltText="Filter ExpectedDaysText column" HeaderText="Expected Days" ReadOnly="True" SortExpression="ExpectedDaysText" UniqueName="ExpectedDaysText">
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
                                            <telerik:GridBoundColumn DataField="PD_Inspection_Due" Display="False" FilterControlAltText="Filter PD_Inspection_Due column" HeaderText="Inspection Due" ReadOnly="True" SortExpression="PD_Inspection_Due" UniqueName="PD_Inspection_Due">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PD_Inspection_Due_Days" Display="True" FilterControlAltText="Filter PD_Inspection_Due_Days column" HeaderText="Days Since Previous Inspection" ReadOnly="True" SortExpression="PD_Inspection_Due_Days" UniqueName="PD_Inspection_Due_Days">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="PD_Due_Date" DataFormatString="{0:dd MMM yyyy}" Display="True" FilterControlAltText="Filter PD_Due_Date column" HeaderText="Date Due" ReadOnly="True" SortExpression="PD_Due_Date" UniqueName="PD_Due_Date">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="P_Status" Display="False" FilterControlAltText="Filter P_Status column" HeaderText="Status" ReadOnly="True" SortExpression="P_Status" UniqueName="P_Status">
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
                                <asp:Label ID="lbl_Table" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblPageName" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblRun" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lbl_Test" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                            </td>
                            <td class="style5" style="text-align: left; vertical-align: top;">
                                <asp:Label ID="lbl_Inspections_Previous" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="12pt" ForeColor="Black" Text="Previous Inspections" Visible="False"></asp:Label>
                                <telerik:RadGrid ID="RadGrid_Previous_List" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_PREVIOUS_LIST" ResolvedRenderMode="Classic" Skin="Default" Visible="False" Width="500px">
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick2" OnRowSelected="RowSelected2" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="PDI_ID, PDI_PD_ID" DataKeyNames="PDI_ID, PDI_PD_ID" DataSourceID="SqlDS_RadGrid_SP_PREVIOUS_LIST">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new part" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="PDI_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter PDI_ID column" HeaderText="ID" ReadOnly="True" SortExpression="PDI_ID" UniqueName="PDI_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PDI_PD_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter PDI_PD_ID column" HeaderText="Detail ID" ReadOnly="True" SortExpression="PDI_PD_ID" UniqueName="PDI_PD_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PDI_Inspection_Date" DataFormatString="{0:dd MMM yyyy}" Display="True" FilterControlAltText="Filter PDI_Inspection_Date column" HeaderText="Inspection Date" ReadOnly="True" SortExpression="PDI_Inspection_Date" UniqueName="PDI_Inspection_Date">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Inspector" Display="True" FilterControlAltText="Filter Inspector column" HeaderText="Inspector" ReadOnly="True" SortExpression="Inspector" UniqueName="Inspector">
                                                <HeaderStyle Width="200px" Wrap="True" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PDI_Inspection_Overdue_Days" Display="False" FilterControlAltText="Filter PDI_Inspection_Overdue_Days column" HeaderText="Days Overdue" ReadOnly="True" SortExpression="PDI_Inspection_Overdue_Days" UniqueName="PDI_Inspection_Overdue_Days">
                                                <HeaderStyle Width="100px" Wrap="True" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PDI_Comments" Display="True" FilterControlAltText="Filter PDI_Comments column" HeaderText="Comments" ReadOnly="True" SortExpression="PDI_Comments" UniqueName="PDI_Comments">
                                                <HeaderStyle Width="200px" Wrap="True" />
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
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_ID_ID" runat="server" />
            <asp:HiddenField ID="HF_P_ID" runat="server" />
            <asp:HiddenField ID="HF_L3" runat="server" Value="%" />
            <asp:HiddenField ID="HF_MOD_ID" runat="server" Value="%" />
            <asp:HiddenField ID="HF_Part_ID" runat="server" Value="%" />
            <asp:HiddenField ID="HF_PDI_ID" runat="server" />
            <asp:HiddenField ID="HF_PD_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_Location" runat="server" />
            <asp:HiddenField ID="HF_Location_Type" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_4_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_4_RW" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_93" runat="server" Value="0" />
            <asp:SqlDataSource ID="SqlDS_SYS" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT SYS_Name, SYS_Version FROM SYSTEM"></asp:SqlDataSource>
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
            <asp:SqlDataSource ID="SqlDS_CB_Desc" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS P_Level_3, '*All Components' AS PartDesc UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), PART.P_Level_3) AS P_PS_ID, ATTRIBUTES.ATT_Name + ' : ' + ATTRIBUTES.ATT_Description AS PartDesc FROM PART INNER JOIN ATTRIBUTES ON PART.P_Level_3 = ATTRIBUTES.ATT_ID INNER JOIN PART_Detail ON PART_Detail.PD_P_ID = PART.P_ID WHERE (PART.P_Status NOT IN ('Trash', 'Delete')) AND (PART_Detail.PD_Inspection_Due = 1) ORDER BY PartDesc"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_PART" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS P_Part_ID, '*All Parts' AS Part UNION ALL SELECT DISTINCT PART.P_Part_ID, PART.P_Part_ID AS Part FROM PART INNER JOIN PART_Detail ON PART_Detail.PD_P_ID = PART.P_ID WHERE (PART.P_Status NOT IN ('Trash', 'Delete')) AND (CONVERT (nvarchar(5), PART.P_MOD_ID) LIKE @P_MOD_ID) AND (CONVERT (nvarchar(5), PART.P_Level_3) LIKE @P_Level_3) AND (PART_Detail.PD_Inspection_Due = 1) ORDER BY Part">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Model" Name="P_MOD_ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Desc" Name="P_Level_3" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Model" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS ATT_ID, '*All Models' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name FROM ATTRIBUTES INNER JOIN PART ON PART.P_MOD_ID = ATTRIBUTES.ATT_ID INNER JOIN PART_Detail ON PART_Detail.PD_P_ID = PART.P_ID WHERE (ATTRIBUTES.ATT_Status NOT IN ('Trash', 'Delete')) AND (ATTRIBUTES.ATT_TABLE = 'ASSET_Model') AND (PART.P_Status &lt;&gt; 'Trash') AND (CONVERT (nvarchar(5), PART.P_Level_3) LIKE @P_Level_3) AND (PART_Detail.PD_Inspection_Due = 1) ORDER BY ATT_Name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Desc" Name="P_Level_3" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_PART_REQUESTS" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_PART_LIST_RG_REQUEST_SELECT_SP"
                SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_PART_LIST" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_PART_INSPECTIONS_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Desc" Name="P_Level_3" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Model" Name="P_MOD_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Part" Name="P_Part_ID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_PREVIOUS_LIST" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_PART_INSPECTIONS_PREVIOUS_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_PD_ID" Name="PDI_PD_ID" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Silk">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                   <%-- <telerik:AjaxSetting AjaxControlID="RadWindow3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_Inspections" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow4">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_Inspections" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>--%>
                    <telerik:AjaxSetting AjaxControlID="RadBtn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Desc" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Part" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                   <%--         <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_Inspections" />--%>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Desc">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Part" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                            <telerik:AjaxUpdatedControl ControlID="HF_L3" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Part" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                            <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Part">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Part_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Part_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadGrid_Part_List">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_PD_ID" />
                            <telerik:AjaxUpdatedControl ControlID="T1" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Inspections_Previous" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Previous_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow1" runat="server" Height="575px" Width="1250px" OnClientClose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="700px" Width="1250px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow3" runat="server" Height="550px" Width="600px" OnClientClose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="New Part Inspection" VisibleStatusbar="False" KeepInScreenBounds="True">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow4" runat="server" Height="550px" Width="600px" OnClientClose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="Edit Part Inspection" VisibleStatusbar="False" KeepInScreenBounds="True">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


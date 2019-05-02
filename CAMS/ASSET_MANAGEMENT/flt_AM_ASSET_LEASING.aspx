<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Asset Management - Asset Leasing" CodeFile="flt_AM_ASSET_LEASING.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_LEASING" %>

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
            width: 375px;
        }
        .auto-style14 {
            width: 179px;
        }
        .auto-style15 {
            width: 282px;
        }
        .auto-style16 {
            width: 159px;
        }
        .auto-style17 {
            width: 224px;
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('AL_ID');
        document.getElementById('HF_AL_ID').value = ATTid;
        //sessionStorage.setItem("AL_ID", ATTid);
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }

    function fn_OnClickButton() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var oWndadd = $find("<%=RadWindow1.ClientID%>");
        oWndadd.setUrl('flt_AM_ASSET_LEASING_ADD_RW.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISAL = document.getElementById('HF_AL_ID').value;
        //var THISAL = sessionStorage.getItem("AL_ID");
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_AM_ASSET_LEASING_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&AL_ID=' + THISAL + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
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
        //{ __doPostBack('Refresh_Grid', 0); }
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="Label2" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lbl_Site" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lbl_Asset" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style17">
                                 <asp:Label ID="lblTitle" runat="server" Text="ASSET LEASING" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style10">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Glow" Text="Refresh" Width="100px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                            
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style16">
                                Site:</td>
                            <td align="left" class="auto-style16" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Site" DataTextField="Site_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" class="auto-style16" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">Asset: </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style13">
                                 Model:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Model" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style14">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" class="auto-style15">
                                 &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                &nbsp;</td>
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
                                                    <img src="../IMAGES/Icons_Black/ASSET_LIST.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW ASSET LEASE" ForeColor="Black"></asp:Label>
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
                                     <asp:Panel ID="Panel_2" runat="server" onClick="fn_OpenAssetList()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                     <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="PRINT" ForeColor="Black"></asp:Label>
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
                   
                    <table >
                        <tr>
                            <td class="style8" style="text-align: left; vertical-align: top;" colspan="2">
                                <asp:Label ID="lbl_Active_Lease_Text" runat="server" Font-Bold="True" Font-Size="16px" ForeColor="White" Text="Active Leases"></asp:Label>
                                </td>
                            <td class="style8" style="text-align: left; vertical-align: top;" colspan="2">
                                <asp:Label ID="lbl_Archive_Lease_Text" runat="server" Font-Bold="True" Font-Size="16px" ForeColor="White" Text="Archive Leases"></asp:Label>
                                </td>
                            </tr>
                        <tr>
                            <td class="style8" style="text-align: left; vertical-align: top;" colspan="2">
                               <telerik:RadGrid ID="RadGrid_Asset_Leasing" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True"
                                    DataSourceID="SqlDS_RadGrid_SP_ASSET_LEASING" ResolvedRenderMode="Classic" Skin="Glow" RegisterWithScriptManager="True">
                                    <ClientSettings EnableAlternatingItems="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="AL_ID" DataKeyNames="AL_ID" DataSourceID="SqlDS_RadGrid_SP_ASSET_LEASING">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new attribute" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="AL_ID" DataType="System.Int32"
                                                Display="False" FilterControlAltText="Filter AL_ID column" HeaderText="ID"
                                                ReadOnly="True" SortExpression="AL_ID" UniqueName="AL_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Asset_ID"
                                                FilterControlAltText="Filter A_Asset_ID column" HeaderText="Asset ID"
                                                ReadOnly="True" SortExpression="A_Asset_ID" UniqueName="A_Asset_ID">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Model" Display="True"
                                                FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True"
                                                SortExpression="Model" UniqueName="Model">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AL_Months"
                                                FilterControlAltText="Filter AL_Months column" HeaderText="Months"
                                                ReadOnly="True" SortExpression="AL_Months" UniqueName="AL_Months">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="AL_Agreed_Usage"
                                                FilterControlAltText="Filter AL_Agreed_Usage column" HeaderText="Agreed Usage"
                                                ReadOnly="True" SortExpression="AL_Agreed_Usage" UniqueName="AL_Agreed_Usage">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="AL_Month_Cost" DataFormatString="{0:£#,##0.00}"
                                                FilterControlAltText="Filter AL_Month_Cost column" HeaderText="Monthly Cost"
                                                ReadOnly="True" SortExpression="AL_Month_Cost" UniqueName="AL_Month_Cost">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="AL_Final_Payment" DataFormatString="{0:£#,##0}"
                                                FilterControlAltText="Filter AL_Final_Payment column" HeaderText="Final Payment"
                                                ReadOnly="True" SortExpression="AL_Final_Payment" UniqueName="AL_Final_Payment">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AL_Start_Date"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter AL_Start_Date column" HeaderText="Start Date"
                                                ReadOnly="True" SortExpression="AL_Start_Date" UniqueName="AL_Start_Date">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AL_End_Date"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter AL_End_Date column" HeaderText="End Date"
                                                ReadOnly="True" SortExpression="AL_End_Date" UniqueName="AL_End_Date">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Company"
                                                FilterControlAltText="Filter Company column" HeaderText="Finance Company"
                                                ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AL_Status"
                                                FilterControlAltText="Filter AL_Status column" HeaderText="Status"
                                                ReadOnly="True" SortExpression="AL_Status" UniqueName="AL_Status">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
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
                                 <telerik:RadGrid ID="RadGrid_Asset_Leasing_Archive" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True"
                                    DataSourceID="SqlDS_RadGrid_SP_ASSET_LEASING_ARCHIVE" ResolvedRenderMode="Classic" Skin="Glow" RegisterWithScriptManager="True">
                                    <ClientSettings EnableAlternatingItems="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="AL_ID" DataKeyNames="AL_ID" DataSourceID="SqlDS_RadGrid_SP_ASSET_LEASING_ARCHIVE">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new attribute" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="AL_ID" DataType="System.Int32"
                                                Display="False" FilterControlAltText="Filter AL_ID column" HeaderText="ID"
                                                ReadOnly="True" SortExpression="AL_ID" UniqueName="AL_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Asset_ID"
                                                FilterControlAltText="Filter A_Asset_ID column" HeaderText="Asset ID"
                                                ReadOnly="True" SortExpression="A_Asset_ID" UniqueName="A_Asset_ID">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Model" Display="True"
                                                FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True"
                                                SortExpression="Model" UniqueName="Model">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AL_Months"
                                                FilterControlAltText="Filter AL_Months column" HeaderText="Months"
                                                ReadOnly="True" SortExpression="AL_Months" UniqueName="AL_Months">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="AL_Agreed_Usage"
                                                FilterControlAltText="Filter AL_Agreed_Usage column" HeaderText="Agreed Usage"
                                                ReadOnly="True" SortExpression="AL_Agreed_Usage" UniqueName="AL_Agreed_Usage">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="AL_Month_Cost" DataFormatString="{0:£#,##0.00}"
                                                FilterControlAltText="Filter AL_Month_Cost column" HeaderText="Monthly Cost"
                                                ReadOnly="True" SortExpression="AL_Month_Cost" UniqueName="AL_Month_Cost">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="AL_Final_Payment" DataFormatString="{0:£#,##0}"
                                                FilterControlAltText="Filter AL_Final_Payment column" HeaderText="Final Payment"
                                                ReadOnly="True" SortExpression="AL_Final_Payment" UniqueName="AL_Final_Payment">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AL_Start_Date"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter AL_Start_Date column" HeaderText="Start Date"
                                                ReadOnly="True" SortExpression="AL_Start_Date" UniqueName="AL_Start_Date">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AL_End_Date"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter AL_End_Date column" HeaderText="End Date"
                                                ReadOnly="True" SortExpression="AL_End_Date" UniqueName="AL_End_Date">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Company"
                                                FilterControlAltText="Filter Company column" HeaderText="Finance Company"
                                                ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AL_Status" Display="False"
                                                FilterControlAltText="Filter AL_Status column" HeaderText="Status"
                                                ReadOnly="True" SortExpression="AL_Status" UniqueName="AL_Status">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ThisCount" Display="False"
                                                FilterControlAltText="Filter ThisCount column" HeaderText="Active Leases"
                                                ReadOnly="True" SortExpression="ThisCount" UniqueName="ThisCount">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
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
                    <asp:Label ID="lblPageName" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                    <asp:Label ID="lblRun" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                    <asp:Label ID="lbl_Test" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                    <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                    <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                    <asp:Label ID="lbl_Table" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                    <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1pt" ForeColor="#2c3338"></asp:Label>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadNotification ID="RadNotify" runat="server" Position="Center" Title="FLEET - Problem" Height="100px" Skin="Silk" TitleMenuToolTip="" Width="600px">
            </telerik:RadNotification>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_AL_ID" runat="server" />
            <asp:HiddenField ID="HF_A_ID" runat="server" />
            <asp:HiddenField ID="HF_AS_ID" runat="server" />
            <asp:HiddenField ID="HF_MOD_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_18_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_18_RW" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
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
            <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ASSET.A_ID) AS A_ID, ASSET.A_Asset_ID FROM ASSET INNER JOIN ASSET_LEASING ON ASSET_LEASING.AL_A_ID = ASSET.A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @Site) ORDER BY A_Asset_ID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="Site" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS SITE_ID, '*All Sites' AS Site_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), SITE.SITE_ID) AS SITE_ID, SITE.SITE_Name FROM SITE INNER JOIN ASSET ON SITE.SITE_ID = ASSET.A_SITE_ID INNER JOIN ASSET_LEASING ON ASSET_LEASING.AL_A_ID = ASSET.A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) ORDER BY Site_Name">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Model" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS ATT_ID, '*All Models' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name FROM ATTRIBUTES INNER JOIN ASSET ON ASSET.A_MOD_ID = ATTRIBUTES.ATT_ID INNER JOIN ASSET_LEASING ON ASSET_LEASING.AL_A_ID = ASSET.A_ID WHERE (ATTRIBUTES.ATT_Status NOT IN ('Trash', 'Delete')) AND (ATTRIBUTES.ATT_TABLE = 'ASSET_Model') AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @Site) ORDER BY ATT_Name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="Site" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ASSET_LEASING" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_LEASING_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="A_SITE_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Model" Name="ATT_ID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDS_RadGrid_SP_ASSET_LEASING_ARCHIVE" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_LEASING_ARCHIVE_RG_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="A_SITE_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Model" Name="ATT_ID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" IsSticky="True" Skin="Default">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing" />
                             <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing_Archive" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing_Archive" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadBtn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                           <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing_Archive" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing_Archive" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                             <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing_Archive" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                             <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_Leasing_Archive" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow1" runat="server" Height="400px" Width="700px" OnClientClose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="New Asset Lease" VisibleStatusbar="False" KeepInScreenBounds="True">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="400px" Width="1400px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Asset Lease" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


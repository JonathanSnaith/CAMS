<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Asset Management - Asset List" CodeFile="flt_AM_ASSET_LIST.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_LIST" %>
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
            font-size: 16px;
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=6', '_self');
        }
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('A_ID');
        document.getElementById('HF_A_ID').value = ATTid;
        sessionStorage.setItem("A_ID", ATTid);
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISA = 0;
       var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_AM_ASSET_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&A_ID=' + THISA + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISA = sessionStorage.getItem("A_ID");
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_AM_ASSET_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&A_ID=' + THISA + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
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
    function fn_Risk_Profile() {
        var THISGUID = document.getElementById('HF_GUID').value;
        window.open('flt_AM_ASSET_RISK_PROFILE.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    //function fn_OpenAssetList() {
    //    var Asset = document.getElementById('HF_A_ID').value;
    //    var Model = document.getElementById('HF_MOD_ID').value;
    //    var ActivityStatus = document.getElementById('HF_AS_ID').value;
    //    window.open('http://hoerpweb/BanksReportViewer/default.aspx?Filename=FleetReports/AssetList.rpt&@A_ID=' + Asset + "&@ATT_ID=" + Model + "&@A_Activity_Status=" + ActivityStatus, "mywindow", 'target=_blank, resizable=yes, scrollbars=yes, width=900');
    //}
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
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style3">
                                 <asp:Label ID="lblTitle" runat="server" Text="ASSET LIST" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style10">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Glow" Text="Refresh" Width="100px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style11">
                                Customer:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" class="auto-style9">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AutoPostBack="True" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow"  DataTextField="CUS_Name" DataValueField="CUS_ID">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style16">
                                Site:</td>
                            <td align="left" class="auto-style16" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="Site_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" class="auto-style16" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">Asset: </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True"  DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style13">
                                 Model:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
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
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW ASSET" ForeColor="Black"></asp:Label>
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
                                     <asp:Panel ID="Panel_2" runat="server" onClick="fn_Risk_Profile()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2" >
                                                     <img src="../IMAGES/Icons_Black/ASSET_MANAGEMENT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="ASSET RISK PROFILE" ForeColor="Black"></asp:Label>
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
                                    <asp:Panel ID="Panel_3" runat="server" onClick="fn_OpenAssetList()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                     <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
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
                   
                    <table >
                        <tr>
                            <td class="style8" style="text-align: left; vertical-align: top;" colspan="2">
                                <telerik:RadGrid ID="RadGrid_Asset_List" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True"
                                     ResolvedRenderMode="Classic" Skin="Glow" Width="95%" RegisterWithScriptManager="True">
                                    <ClientSettings EnableAlternatingItems="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="A_ID" DataKeyNames="A_ID" >
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new attribute" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="A_ID" DataType="System.Int32"
                                                Display="True" FilterControlAltText="Filter A_ID column" HeaderText="ID"
                                                ReadOnly="True" SortExpression="A_ID" UniqueName="A_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Customer" Display="True"
                                                FilterControlAltText="Filter Customer column" HeaderText="Customer"
                                                ReadOnly="True" SortExpression="Customer" UniqueName="Customer">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Asset_ID"
                                                FilterControlAltText="Filter A_Asset_ID column" HeaderText="Asset ID"
                                                ReadOnly="True" SortExpression="A_Asset_ID" UniqueName="A_Asset_ID">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="Company" Display="True"
                                                FilterControlAltText="Filter Company column" HeaderText="Manufacturer"
                                                ReadOnly="True" SortExpression="Company" UniqueName="Company">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Model" Display="True"
                                                FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True"
                                                SortExpression="Model" UniqueName="Model">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Site_Name" Display="True"
                                                FilterControlAltText="Filter Site_Name column" HeaderText="Current Location"
                                                ReadOnly="True" SortExpression="Site_Name" UniqueName="Site_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PrimaryGroup" Display="True"
                                                FilterControlAltText="Filter PrimaryGroup column" HeaderText="Primary Group"
                                                ReadOnly="True" SortExpression="PrimaryGroup" UniqueName="PrimaryGroup">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SecondaryGroup" Display="True"
                                                FilterControlAltText="Filter SecondaryGroup column"
                                                HeaderText="Secondary Group" ReadOnly="True" SortExpression="SecondaryGroup"
                                                UniqueName="SecondaryGroup">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn DataField="A_Activity_Status"
                                                FilterControlAltText="Filter A_Activity_Status column"
                                                HeaderText="Activity Status" ReadOnly="True" SortExpression="A_Activity_Status"
                                                UniqueName="A_Activity_Status">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="HireCompany" Display="True"
                                                FilterControlAltText="Filter HireCompany column" HeaderText="Hire Co."
                                                ReadOnly="True" SortExpression="HireCompany" UniqueName="HireCompany">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="A_Plant_Rate_Insitu" DataFormatString="{0:#,##0}" Display="False"
                                                FilterControlAltText="Filter A_Plant_Rate_Insitu column" HeaderText="Plant Rate - Insitu (m3/Hr)"
                                                SortExpression="A_Plant_Rate_Insitu" UniqueName="A_Plant_Rate_Insitu">
                                                <HeaderStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                                <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="A_Plant_Rate_Soils" DataFormatString="{0:#,##0}" Display="False"
                                                FilterControlAltText="Filter A_Plant_Rate_Soils column" HeaderText="Plant Rate - Soils (m3/Hr)"
                                                SortExpression="A_Plant_Rate_Soils" UniqueName="A_Plant_Rate_Soils">
                                                <HeaderStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                                <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Serial_No" Display="False"
                                                FilterControlAltText="Filter A_Serial_No column" HeaderText="Serial No."
                                                ReadOnly="True" SortExpression="A_Serial_No" UniqueName="A_Serial_No">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Year" Display="False"
                                                FilterControlAltText="Filter A_Year column" HeaderText="Year" ReadOnly="True"
                                                SortExpression="A_Year" UniqueName="A_Year">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Date_Purchase" Display="False"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter A_Date_Purchase column" HeaderText="Purchase Date"
                                                ReadOnly="True" SortExpression="A_Date_Purchase" UniqueName="A_Date_Purchase">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Date_Delivery" Display="False"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter A_Date_Delivery column" HeaderText="Delivery Date"
                                                ReadOnly="True" SortExpression="A_Date_Delivery" UniqueName="A_Date_Delivery">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Engine" Display="False"
                                                FilterControlAltText="Filter A_Engine column" HeaderText="Engine(s)"
                                                ReadOnly="True" SortExpression="A_Engine" UniqueName="A_Engine">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Eng_SMU_1" Display="False"
                                                FilterControlAltText="Filter A_Eng_SMU_1 column" HeaderText="Engine 1 SMU"
                                                ReadOnly="True" SortExpression="A_Eng_SMU_1" UniqueName="A_Eng_SMU_1">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Eng_SMU_2" Display="False"
                                                FilterControlAltText="Filter A_Eng_SMU_2 column" HeaderText="Engine 2 SMU"
                                                ReadOnly="True" SortExpression="A_Eng_SMU_2" UniqueName="A_Eng_SMU_2">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Hire_Rate" DataFormatString="{0:£#,##0.00}" Display="False"
                                                FilterControlAltText="Filter A_Hire_Rate column" HeaderText="Hire Rate £"
                                                SortExpression="A_Hire_Rate" UniqueName="A_Hire_Rate">
                                                <HeaderStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                                <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Hire_Rate_Unit" Display="False"
                                                FilterControlAltText="Filter A_Hire_Rate_Unit column"
                                                HeaderText="Hire Rate Unit" ReadOnly="True" SortExpression="A_Hire_Rate_Unit"
                                                UniqueName="A_Hire_Rate_Unit">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="BrakeTest" Display="False"
                                                FilterControlAltText="Filter BrakeTest column" HeaderText="Brake Test"
                                                ReadOnly="True" SortExpression="BrakeTest" UniqueName="BrakeTest">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Timesheet" Display="False"
                                                FilterControlAltText="Filter Timesheet column" HeaderText="Timesheet"
                                                ReadOnly="True" SortExpression="Timesheet" UniqueName="Timesheet">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Part" Display="False"
                                                FilterControlAltText="Filter Part column" HeaderText="Part List"
                                                ReadOnly="True" SortExpression="Part" UniqueName="Part">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Servicable" Display="False"
                                                FilterControlAltText="Filter Servicable column" HeaderText="Servicable"
                                                ReadOnly="True" SortExpression="Servicable" UniqueName="Servicable">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Hired" Display="False"
                                                FilterControlAltText="Filter Hired column" HeaderText="Hired"
                                                ReadOnly="True" SortExpression="Hired" UniqueName="Hired">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ServiceType" Display="False"
                                                FilterControlAltText="Filter ServiceType column" HeaderText="Service Cycle"
                                                ReadOnly="True" SortExpression="ServiceType" UniqueName="ServiceType">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Order_Number" Display="False"
                                                FilterControlAltText="Filter A_Order_Number column" HeaderText="Order No."
                                                ReadOnly="True" SortExpression="A_Order_Number" UniqueName="A_Order_Number">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Plant_Number" Display="False"
                                                FilterControlAltText="Filter A_Plant_Number column" HeaderText="Plant No."
                                                ReadOnly="True" SortExpression="A_Plant_Number" UniqueName="A_Plant_Number">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Status" Display="False"
                                                FilterControlAltText="Filter A_Status column" HeaderText="Status"
                                                ReadOnly="True" SortExpression="A_Status" UniqueName="A_Status">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Notes" Display="False"
                                                FilterControlAltText="Filter A_Notes column" HeaderText="Notes" ReadOnly="True"
                                                SortExpression="A_Notes" UniqueName="A_Notes">
                                                <HeaderStyle Width="400px" Wrap="False" />
                                                <ItemStyle Width="400px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Created" Display="False"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter A_Created column" HeaderText="Date Created"
                                                ReadOnly="True" SortExpression="A_Created" UniqueName="A_Created">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Created_By" Display="False"
                                                FilterControlAltText="Filter A_Created_By column" HeaderText="Created By"
                                                ReadOnly="True" SortExpression="A_Created_By" UniqueName="A_Created_By">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Modified" Display="False"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter A_Modified column" HeaderText="Date Modified"
                                                ReadOnly="True" SortExpression="A_Modified" UniqueName="A_Modified">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="A_Modified_By" Display="False"
                                                FilterControlAltText="Filter A_Modified_By column" HeaderText="Modified By"
                                                ReadOnly="True" SortExpression="A_Modified_By" UniqueName="A_Modified_By">
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
                            <td class="style5" style="text-align: left"></td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadNotification ID="RadNotify" runat="server" Position="Center" Title="FLEET - Problem" Height="100px" Skin="Silk" TitleMenuToolTip="" Width="600px">
            </telerik:RadNotification>
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
            <asp:HiddenField ID="HF_A_ID" runat="server" />
            <asp:HiddenField ID="HF_SITE_ID" runat="server" />
            <asp:HiddenField ID="HF_CUS_ID" runat="server" />
            <asp:HiddenField ID="HF_MOD_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_2_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_2_RW" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" IsSticky="True" Skin="Glow">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadBtn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_SITE_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_MOD_ID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_CUS_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Asset_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="700px" Width="1350px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Asset" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET Data Input - Magnetic Plug Inspections" CodeFile="flt_MAGNETIC_PLUG_INSPECTIONS.aspx.vb" Inherits="DATA_INPUT_flt_MAGNETIC_PLUG_INSPECTIONS" %>

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
            window.open('../../CLIENT/flt_DATA_INPUT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=4', '_self');
        }
    }
    function RowSelectedjob(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('MPI_ID');
        document.getElementById('HF_MPI_ID').value = ATTid;
        sessionStorage.setItem("MPI_ID", ATTid);
    }
    function fn_onrowdblclickjob(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('MPI_ID');
        sessionStorage.setItem("MPI_ID", ATTid);
        fn_OnClickWindowjob();
    }
    function fn_OnClickWindowjob() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISMPISess = sessionStorage.getItem("MPI_ID");
        var THISMPI = document.getElementById('HF_MPI_ID').value;
        var oWnd = $find("<%=RadWindow4.ClientID%>");
        oWnd.setUrl('flt_MAGNETIC_PLUG_INSPECTIONS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&MPI_ID=' + THISMPISess + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function closeWindow_add_eventjob(sender, args) {
        var x = args.get_argument();
        { __doPostBack('Refresh_Grid_Combo', 0); }
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
                                <asp:Label ID="lblTitle" runat="server" Text="MAGNETIC PLUG INSPECTIONS" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Text="Reset" Width="100px" Skin="Glow">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="250px" EmptyMessage="Customer" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="100px" EmptyMessage="Asset" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Compartment" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID_CP" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow" Width="250px" EmptyMessage="Compartment">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Inspector" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" EmptyMessage="Inspector" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Rating" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" DataValueField="ATT_ID_VR" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="150px" EmptyMessage="Rating" Skin="Glow">
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
                                            <asp:Panel ID="Panel_1" runat="server" onClick="fn_panel_1()" CssClass="roundcorners" BackColor="#d9ffd9">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="" ForeColor="Black"></asp:Label>
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
                                                            <img src="../IMAGES/Icons_Black/metro_icon_printer.png" />
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
                            <td colspan="7" style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_All_MPI" runat="server" AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" PageSize="25" ResolvedRenderMode="Classic" Skin="Glow">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclickjob" OnRowSelected="RowSelectedjob" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="MPI_ID" DataKeyNames="MPI_ID"
                                         NoMasterRecordsText="No inspections to display." PageSize="25">
                                         <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new inspection" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="MPI_ID" 
                                                Display="False" FilterControlAltText="Filter MPI_ID column" HeaderText="Inspection ID"
                                                ReadOnly="True" SortExpression="MPI_ID" UniqueName="MPI_ID">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn> 
                                            <telerik:GridBoundColumn DataField="Customer" FilterControlAltText="Filter Customer column" Display="False"
                                                HeaderText="Customer" ReadOnly="True" SortExpression="Customer" UniqueName="Customer">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Asset" Display="True" FilterControlAltText="Filter Asset column"
                                                HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Compartment" FilterControlAltText="Filter Compartment column"
                                                HeaderText="Compartment" ReadOnly="True" SortExpression="Compartment"
                                                UniqueName="Compartment">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Rating" FilterControlAltText="Filter Rating column"
                                                HeaderText="Visual Rating" ReadOnly="True" SortExpression="Rating"
                                                UniqueName="Rating">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MPI_SMU"
                                                FilterControlAltText="Filter MPI_SMU column" HeaderText="SMU" ReadOnly="True" Display="False"
                                                SortExpression="MPI_SMU" UniqueName="MPI_SMU">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Inspector" Display="True"
                                                FilterControlAltText="Filter Inspector column" HeaderText="Inspector"
                                                ReadOnly="True" SortExpression="Inspector" UniqueName="Inspector">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MPI_Date" DataFormatString="{0:dd MMM yyyy}"
                                                Display="True" FilterControlAltText="Filter MPI_Date column" HeaderText="Inspection Date"
                                                ReadOnly="True" SortExpression="MPI_Date" UniqueName="MPI_Date">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td colspan="2" style="text-align: left; vertical-align: top;"></td>
                        </tr>
                        <tr>
                            <td class="style6" colspan="4" style="text-align: left; vertical-align: top;"></td>
                            <td class="style5" style="text-align: left;">
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
            <asp:HiddenField ID="HF_MPI_ID" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Sunset">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                     <telerik:AjaxSetting AjaxControlID="RadWindow4">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_MPI" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Compartment" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Inspector" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Rating" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_MPI" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Compartment" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Inspector" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Rating" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_MPI" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Compartment" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Inspector" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Rating" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_MPI" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Compartment">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Inspector" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Rating" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_MPI" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Rating">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_MPI" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Inspector">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Rating" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_All_MPI" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow4" runat="server" Height="800px" Width="1050px" OnClientClose="closeWindow_add_eventjob" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>

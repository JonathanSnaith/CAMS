<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Customer Management - Contact List" CodeFile="flt_CONTACT_LIST.aspx.vb" Inherits="CUSTOMER_MANAGEMENT_flt_CONTACT_LIST" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
         .RadGrid a img
            {
                border: none;
            }
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=12', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=12', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=12', '_self');
        }
    }
    function RowSelected(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('CON_ID');
        document.getElementById('HF_CON_ID').value = ATTid;
        sessionStorage.setItem("CON_ID", ATTid);
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISCON = 0;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_CONTACT_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&CON_ID=' + THISCON + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();

    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISCON = sessionStorage.getItem("CON_ID");
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_CONTACT_LIST_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&CON_ID=' + THISCON + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
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
                                 <asp:Label ID="lblTitle" runat="server" Text="CONTACT LIST" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style10">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Skin="Glow" Text="Refresh" Width="100px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style11">
                                Customer:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;" class="auto-style9">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AutoPostBack="True" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" DataTextField="CUS_Name" DataValueField="CUS_ID">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style16">
                                Site:
                            </td>
                            <td align="left" class="auto-style16" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AutoPostBack="True" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" DataTextField="SITE_Name" DataValueField="SITE_ID">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" class="auto-style16" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                Contact:
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
                                 <telerik:RadComboBox ID="RadCB_Contact" runat="server" AutoPostBack="True" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" DataTextField="CON_Name" DataValueField="CON_ID">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style13"></td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left; padding-top: 5px;" class="auto-style5">
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
                                                    <img src="../IMAGES/Icons_Black/CUSTOMER_CONTACT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW CONTACT" ForeColor="Black"></asp:Label>
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
                                    <asp:TableRow ID="TableRow45" runat="server">
                                        <asp:TableCell ID="ID_CELL_3" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_3" runat="server" onClick="fn_panel_2()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
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
                                <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                     <asp:Panel ID="Panel_2" runat="server" onClick="fn_panel_3()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2" >
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
                                <telerik:RadGrid ID="RadGrid_Contact_List" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True"
                                    ResolvedRenderMode="Classic" Skin="Glow" Width="95%" RegisterWithScriptManager="True">
                                    <ClientSettings EnableAlternatingItems="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="CON_ID" DataKeyNames="CON_ID" >
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new contact" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="CON_ID" DataType="System.Int32"
                                                Display="True" FilterControlAltText="Filter CON_ID column" HeaderText="ID"
                                                ReadOnly="True" SortExpression="CON_ID" UniqueName="CON_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="CUS_Name" Display="True"
                                                FilterControlAltText="Filter CUS_Name column" HeaderText="Customer"
                                                ReadOnly="True" SortExpression="CUS_Name" UniqueName="CUS_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SITE_Name" Display="True"
                                                FilterControlAltText="Filter SITE_Name column" HeaderText="Site"
                                                ReadOnly="True" SortExpression="SITE_Name" UniqueName="SITE_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="CON_Name" Display="True"
                                                FilterControlAltText="Filter CON_Name column" HeaderText="Contact"
                                                ReadOnly="True" SortExpression="CON_Name" UniqueName="CON_Name">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="CON_Position" Display="True"
                                                FilterControlAltText="Filter CON_Position column" HeaderText="Position"
                                                ReadOnly="True" SortExpression="CON_Position" UniqueName="CON_Position">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CON_Level" Display="True"
                                                FilterControlAltText="Filter CON_Level column" HeaderText="Level"
                                                ReadOnly="True" SortExpression="CON_Level" UniqueName="CON_Level">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridHyperLinkColumn AllowSorting="False"
                                                FilterControlAltText="Filter CON_Email column" 
                                                HeaderText="Email"
                                                UniqueName="CON_Email"
                                                DataTextField="CON_Email" 
                                                DataNavigateUrlFields="CON_Email"
                                                DataNavigateUrlFormatString="mailto:{0}"
                                                ImageUrl="../../IMAGES/24x24/mail_24x24.png" HeaderButtonType="LinkButton">
                                                <HeaderStyle HorizontalAlign="Center" Width="50px" Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="False"/>
                                            </telerik:GridHyperLinkColumn>
                                            <telerik:GridBoundColumn DataField="CON_Phone" Display="True"
                                                FilterControlAltText="Filter CON_Phone column" HeaderText="Phone"
                                                ReadOnly="True" SortExpression="CON_Phone" UniqueName="CON_Phone">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="CON_Status"
                                                FilterControlAltText="Filter CON_Status column"
                                                HeaderText="Status" ReadOnly="True" SortExpression="CON_Status"
                                                UniqueName="CON_Status">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CON_Date_Created" Display="True"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter CON_Date_Created column" HeaderText="Date Created"
                                                ReadOnly="True" SortExpression="CON_Date_Created" UniqueName="CON_Date_Created">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CON_Created_By" Display="False"
                                                FilterControlAltText="Filter CON_Created_By column" HeaderText="Created By"
                                                ReadOnly="True" SortExpression="CON_Created_By" UniqueName="CON_Created_By">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CON_Date_Modified" Display="False"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter CON_Date_Modified column" HeaderText="Date Modified"
                                                ReadOnly="True" SortExpression="CON_Date_Modified" UniqueName="CON_Date_Modified">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CON_Modified_By" Display="False"
                                                FilterControlAltText="Filter CON_Modified_By column" HeaderText="Modified By"
                                                ReadOnly="True" SortExpression="CON_Modified_By" UniqueName="CON_Modified_By">
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
            <asp:HiddenField ID="HF_CUS_ID" runat="server" />
            <asp:HiddenField ID="HF_CON_ID" runat="server" />
            <asp:HiddenField ID="HF_SITE_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_19_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_19_RW" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />           
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" IsSticky="True" Skin="Glow">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" RequestQueueSize="1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Contact_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadBtn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Customer" />
                             <telerik:AjaxUpdatedControl ControlID="HF_CUS_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="HF_SITE_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Contact" />
                            <telerik:AjaxUpdatedControl ControlID="HF_CON_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Contact_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_CUS_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="HF_SITE_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Contact" />
                            <telerik:AjaxUpdatedControl ControlID="HF_CON_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Contact_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_SITE_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Contact" />
                            <telerik:AjaxUpdatedControl ControlID="HF_CON_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Contact_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Contact">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_CON_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Contact_List" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="500px" Width="700px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Contact" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


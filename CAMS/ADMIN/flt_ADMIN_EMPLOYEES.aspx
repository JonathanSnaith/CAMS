<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET Admin - Employees" CodeFile="flt_ADMIN_EMPLOYEES.aspx.vb" Inherits="ADMIN_flt_ADMIN_EMPLOYEES" %>
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
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=11', '_self');
        }
        if (THISPP == 1) {
            window.open('../DASHBOARDS/flt_D_EVENT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=11', '_self');
        }
    }
    function RowSelected1(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('PER_EMP_ID');
        document.getElementById('HF_ENG_ID').value = ATTid;
    }
     function RowSelected(sender, eventArgs) {
         var ATTid = sender.get_selectedItems()[0].getDataKeyValue('ENGD_ID');
        document.getElementById('HF_ENGD_ID').value = ATTid;
    }
    function fn_onrowdblclick() {
        fn_OnClickWindow();
    }
    function fn_OnClickButton() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISENGD = 0;
       var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_ADMIN_ENGINEER_DETAIL_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&ENGD_ID=' + THISENGD + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function fn_OnClickWindow() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISENGD = document.getElementById('HF_ENGD_ID').value;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('flt_ADMIN_ENGINEER_DETAIL_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&ENGD_ID=' + THISENGD + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
    function closeWindow_add_event(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Combo', 0); }
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
                            <img alt="" src="../../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
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
                                <asp:Label ID="lblTitle" runat="server" Text="ADMIN - EMPLOYEES" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">&nbsp;</td>
                        </tr>
                    </table>
                    <table class="style1" style="padding-top: 20px">
                        <tr>
                            <td style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 18px; font-weight: bold;">
                                ENGINEERS</td>
                            <td style="text-align: left; vertical-align: top; font-family: 'Segoe UI'; font-size: 18px; font-weight: bold;" valign="top">
                                DETAILS
                                </td>
                        </tr>
                        <tr>
                            <td style="text-align: left; vertical-align: top;"></td>
                            <td style="text-align: left" valign="top">
                                <telerik:RadButton ID="RadBtn_Add_Details" runat="server" Skin="Glow" Text="Add New Details" Visible="False" OnClientClicked="fn_OnClickButton" AutoPostBack="False">
                                </telerik:RadButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Admin" runat="server" AllowSorting="True" ResolvedRenderMode="Classic" Skin="Glow" Width="99%">
                                    <ClientSettings EnableAlternatingItems="False" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowSelected="RowSelected1" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="PER_EMP_ID" DataKeyNames="PER_EMP_ID">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="PER_EMP_ID" DataType="System.Int32" Display="True" FilterControlAltText="Filter PER_EMP_ID column" HeaderText="ID" ReadOnly="True" SortExpression="PER_EMP_ID" UniqueName="PER_EMP_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PER_Fullname" Display="True" FilterControlAltText="Filter PER_Fullname column" HeaderText="Employee" ReadOnly="True" SortExpression="PER_Fullname" UniqueName="PER_Fullname">
                                                <HeaderStyle Width="250px" Wrap="False" />
                                                <ItemStyle Width="250px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PER_Role" Display="True" FilterControlAltText="Filter PER_Role column" HeaderText="Job Title" ReadOnly="True" SortExpression="PER_Role" UniqueName="PER_Role">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PER_Status" Display="True" FilterControlAltText="Filter PER_Status column" HeaderText="Status" ReadOnly="True" SortExpression="PER_Status" UniqueName="PER_Status">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td style="text-align: left" valign="top">
                                <telerik:RadGrid ID="RadGrid_Details" runat="server" AllowSorting="True" ResolvedRenderMode="Classic" Skin="Glow" Width="99%" Visible="False">
                                    <ClientSettings EnableAlternatingItems="False" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclick" OnRowSelected="RowSelected" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="ENGD_ID" DataKeyNames="ENGD_ID">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ENGD_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter ENGD_ID column" HeaderText="ID" ReadOnly="True" SortExpression="ENGD_ID" UniqueName="ENGD_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ENGD_Date_From" Display="True" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter ENGD_Date_From column" HeaderText="From" ReadOnly="True" SortExpression="ENGD_Date_From" UniqueName="ENGD_Date_From">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ENGD_Date_To" Display="True" DataFormatString="{0:dd MMM yyyy}" FilterControlAltText="Filter ENGD_Date_To column" HeaderText="To" ReadOnly="True" SortExpression="ENGD_Date_To" UniqueName="ENGD_Date_To">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ENGD_Rate" Display="True" DataFormatString="{0:£#,##0.00}" FilterControlAltText="Filter ENGD_Rate column" HeaderText="Peak Rate" ReadOnly="True" SortExpression="ENGD_Rate" UniqueName="ENGD_Rate">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ENGD_Off_Peak_Rate" Display="True" DataFormatString="{0:£#,##0.00}" FilterControlAltText="Filter ENGD_Off_Peak_Rate column" HeaderText="Off-Peak Rate" ReadOnly="True" SortExpression="ENGD_Off_Peak_Rate" UniqueName="ENGD_Off_Peak_Rate">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ENGD_Mileage_Rate" Display="True" DataFormatString="{0:£#,##0.00}" FilterControlAltText="Filter ENGD_Mileage_Rate column" HeaderText="Mileage Rate" ReadOnly="True" SortExpression="ENGD_Mileage_Rate" UniqueName="ENGD_Mileage_Rate">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ENGD_Status" Display="True" FilterControlAltText="Filter ENGD_Status column" HeaderText="Status" ReadOnly="True" SortExpression="ENGD_Status" UniqueName="ENGD_Status">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
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
            <asp:HiddenField ID="HF_SITE_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_ENGD_ID" runat="server" />
             <asp:HiddenField ID="HF_ENG_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_11_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_11_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Admin">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Admin" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Details" />
                             <telerik:AjaxUpdatedControl ControlID="RadBtn_Add_Details" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Details" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <%-- <telerik:AjaxSetting AjaxControlID="RadBtn_Add_Details">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadWindow2" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>--%>
                </AjaxSettings>
            </telerik:RadAjaxManager>
             <telerik:RadWindow ID="RadWindow2" runat="server" Height="500px" Width="700px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="Edit Attribute" VisibleStatusbar="False" KeepInScreenBounds="True" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


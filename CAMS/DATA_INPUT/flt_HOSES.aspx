<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET Data Input - Hoses" CodeFile="flt_HOSES.aspx.vb" Inherits="DATA_INPUT_flt_HOSES" %>

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
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    function fn_back() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISPP = document.getElementById('lblPreviousPage').innerHTML;
        if (THISPP == 0) {
            window.open('../../CLIENT/flt_DATA_INPUT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=4', '_self');
        }
    }
    function RowSelectedjob(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('HOS_ID');
        document.getElementById('HF_HOS_ID').value = ATTid;
        sessionStorage.setItem("HOS_ID", ATTid);
    }
    function fn_onrowdblclickjob(sender, eventArgs) {
        var ATTid = sender.get_selectedItems()[0].getDataKeyValue('HOS_ID');
        sessionStorage.setItem("HOS_ID", ATTid);
        fn_OnClickWindowjob();
    }
    function fn_OnClickWindowjob() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISHOSSess = sessionStorage.getItem("HOS_ID");
        var THISHOS = document.getElementById('HF_HOS_ID').value;
        var oWnd = $find("<%=RadWindow4.ClientID%>");
        oWnd.setUrl('flt_HOSES_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&HOS_ID=' + THISHOSSess + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
     function fn_OnClickButton() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var oWndadd = $find("<%=RadWindow3.ClientID%>");
         oWndadd.setUrl('flt_HOSES_ADD_RW.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWndadd.show();
     }
      function closeWindow_add_event_new_item(sender, args) {
        var x = args.get_argument();
        //{ __doPostBack('Refresh_Combo', 0); }
        //alert(x);
        if (x > 0) {
            var oWndadd = $find("<%=RadWindow3.ClientID%>");
            oWndadd.close();
        }
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
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" class="auto-style3">&nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style2">
                                 <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">&nbsp;</td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #999999; text-align: center; font-weight: bold;" class="auto-style27">
                                <asp:Label ID="lblTitle" runat="server" Text="HOSES" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadButton ID="btn_Refresh" runat="server" Text="Refresh" Width="100px">
                                </telerik:RadButton>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Site" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="150px" EmptyMessage="Site">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="100px" EmptyMessage="Asset">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_EventType" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_EventType" DataTextField="ATT_Name" DataValueField="ATT_ID_ET" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Default" Width="250px" EmptyMessage="Event Type">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Component" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Component" DataTextField="ATT_Name" DataValueField="ATT_ID_CP" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" EmptyMessage="Component">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #999999; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Reason" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Reason" DataTextField="ATT_Name" DataValueField="ATT_ID_REA" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Width="150px" EmptyMessage="Reason">
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
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="NEW HOSE" ForeColor="Black"></asp:Label>
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
                                <telerik:RadGrid ID="RadGrid_Hoses" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                                    AllowSorting="True" DataSourceID="SqlDS_RadGrid_SP_HOSES" PageSize="25" ResolvedRenderMode="Classic" Skin="Default">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                    <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowDblClick="fn_onrowdblclickjob" OnRowSelected="RowSelectedjob" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="HOS_ID" DataKeyNames="HOS_ID"
                                        DataSourceID="SqlDS_RadGrid_SP_HOSES" NoMasterRecordsText="No hoses to display." PageSize="25">
                                        <CommandItemSettings AddNewRecordText="Add new hose" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="HOS_ID" 
                                                Display="False" FilterControlAltText="Filter HOS_ID column" HeaderText="Hose ID"
                                                ReadOnly="True" SortExpression="HOS_ID" UniqueName="HOS_ID">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="HOS_Date" DataFormatString="{0:dd MMM yyyy}"
                                                Display="True" FilterControlAltText="Filter HOS_Date column" HeaderText="Date Fitted"
                                                ReadOnly="True" SortExpression="HOS_Date" UniqueName="HOS_Date">
                                                <HeaderStyle Width="90px" Wrap="False" />
                                                <ItemStyle Width="90px" Wrap="False" />
                                            </telerik:GridBoundColumn> 
                                            <telerik:GridBoundColumn DataField="SITE_Name" FilterControlAltText="Filter SITE_Name column" Display="True"
                                                HeaderText="Site" ReadOnly="True" SortExpression="SITE_Name" UniqueName="SITE_Name">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Asset" Display="True" FilterControlAltText="Filter Asset column"
                                                HeaderText="Asset" ReadOnly="True" SortExpression="Asset" UniqueName="Asset">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EventType" FilterControlAltText="Filter EventType column"
                                                HeaderText="Event Type" ReadOnly="True" SortExpression="EventType"
                                                UniqueName="EventType">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Component" FilterControlAltText="Filter Component column"
                                                HeaderText="Component" ReadOnly="True" SortExpression="Component"
                                                UniqueName="Component">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Position" FilterControlAltText="Filter Position column"
                                                HeaderText="Position" ReadOnly="True" SortExpression="Position"
                                                UniqueName="Position">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="Reason" FilterControlAltText="Filter Reason column"
                                                HeaderText="Reason" ReadOnly="True" SortExpression="Reason"
                                                UniqueName="Reason">
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle Width="150px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="HOS_Prevented"
                                                FilterControlAltText="Filter HOS_Prevented column" HeaderText="Prevented?" ReadOnly="True" Display="True"
                                                SortExpression="HOS_Prevented" UniqueName="HOS_Prevented">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="HOS_Tag"
                                                FilterControlAltText="Filter HOS_Tag column" HeaderText="Tag Fitted" ReadOnly="True" Display="True"
                                                SortExpression="HOS_Tag" UniqueName="HOS_Tag">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="HOS_OldTag"
                                                FilterControlAltText="Filter HOS_OldTag column" HeaderText="Tag Removed" ReadOnly="True" Display="True"
                                                SortExpression="HOS_OldTag" UniqueName="HOS_OldTag">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="HOS_SMU"
                                                FilterControlAltText="Filter HOS_SMU column" HeaderText="SMU" ReadOnly="True" Display="True"
                                                SortExpression="HOS_SMU" UniqueName="HOS_SMU">
                                                <HeaderStyle Width="60px" Wrap="False" />
                                                <ItemStyle Width="60px" Wrap="True" />
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
                                <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lbl_EventType" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                 <asp:Label ID="lbl_Component" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lbl_Reason" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lbl_Site" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                 <asp:Label ID="lbl_TestJob" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lbl_Asset" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_HOS_ID" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Site" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_7_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_7_RW" runat="server" Value="0" />
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
            <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS SITE_ID, '*All Sites' AS SITE_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), SITE.SITE_ID) AS SITE_ID, SITE.SITE_Name FROM HOSES INNER JOIN ASSET ON HOSES.HOS_A_ID = ASSET.A_ID INNER JOIN SITE ON ASSET.A_SITE_ID = SITE.SITE_ID WHERE (HOSES.HOS_Status &lt;&gt; 'Trash') ORDER BY SITE_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS A_ID, '*All Assets' AS A_Asset_ID UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), HOSES.HOS_A_ID) AS A_ID, ASSET.A_Asset_ID FROM HOSES LEFT OUTER JOIN SITE ON HOSES.HOS_SITE_ID = SITE.SITE_ID LEFT OUTER JOIN ASSET ON ASSET.A_ID = HOSES.HOS_A_ID WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) AND (HOSES.HOS_Status &lt;&gt; 'Trash') AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @Site) ORDER BY A_Asset_ID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" DefaultValue="%" Name="Site" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDS_EventType" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS ATT_ID_ET, '*All Event Types' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID_ET, ATTRIBUTES.ATT_Name FROM HOSES AS HOS LEFT OUTER JOIN ATTRIBUTES ON HOS.HOS_ET_ID = ATTRIBUTES.ATT_ID INNER JOIN ASSET ON HOS.HOS_A_ID = ASSET.A_ID WHERE (HOS.HOS_Status NOT IN ('Trash', 'Delete')) AND (CONVERT (nvarchar(5), HOS.HOS_A_ID) LIKE @A_ID) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @SITE_ID) ORDER BY ATT_ID_ET">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" DefaultValue="%" Name="A_ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Site" DefaultValue="%" Name="SITE_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Component" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS ATT_ID_CP, '*All Components' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID_CP, ATTRIBUTES.ATT_Name + ' : ' + ATT_Description as ATT_Name FROM HOSES AS HOS LEFT OUTER JOIN ATTRIBUTES ON HOS.HOS_Area_ID = ATTRIBUTES.ATT_ID INNER JOIN ASSET ON HOS.HOS_A_ID = ASSET.A_ID WHERE (HOS.HOS_Status NOT IN ('Trash', 'Delete')) AND (CONVERT (nvarchar(5), HOS.HOS_A_ID) LIKE @A_ID) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @SITE_ID) AND (CONVERT (nvarchar(5), HOS.HOS_Area_ID) LIKE @ET_ID) ORDER BY ATT_ID_CP">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" DefaultValue="%" Name="A_ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Site" DefaultValue="%" Name="SITE_ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_EventType" DefaultValue="%" Name="ET_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Reason" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS ATT_ID_REA, '*All Reasons' AS ATT_Name UNION ALL SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID_REA, ATTRIBUTES.ATT_Description FROM HOSES AS HOS LEFT OUTER JOIN ATTRIBUTES ON HOS.HOS_Reason_ID = ATTRIBUTES.ATT_ID INNER JOIN ASSET ON HOS.HOS_A_ID = ASSET.A_ID WHERE (HOS.HOS_Status NOT IN ('Trash', 'Delete')) AND (CONVERT (nvarchar(5), HOS.HOS_ET_ID) LIKE @ET_ID) AND (CONVERT (nvarchar(5), HOS.HOS_A_ID) LIKE @A_ID) AND (CONVERT (nvarchar(5), HOS.HOS_Area_ID) LIKE @CP_ID) AND (CONVERT (nvarchar(5), ASSET.A_SITE_ID) LIKE @SITE_ID) ORDER BY ATT_ID_REA">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_EventType" DefaultValue="%" Name="ET_ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Asset" DefaultValue="%" Name="A_ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Component" DefaultValue="%" Name="CP_ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Site" DefaultValue="%" Name="SITE_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_SP_Hoses" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="DATA_INPUT_HOSES_SELECT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Site" Name="SITE_ID" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                    <asp:ControlParameter ControlID="RadCB_EventType" Name="ET_ID" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                    <asp:ControlParameter ControlID="RadCB_Component" Name="CP_ID" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                     <asp:ControlParameter ControlID="RadCB_Reason" Name="REA_ID" PropertyName="SelectedValue" Type="String" DefaultValue="%" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Sunset">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
                <AjaxSettings>
                     <telerik:AjaxSetting AjaxControlID="RadWindow3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Hoses" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindow4">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Hoses" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Component" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Reason" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Hoses" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Component" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Reason" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Hoses" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="lbl_Asset" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Component" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Reason" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Hoses" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_EventType">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_EventType" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Component" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Reason" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Hoses" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Component">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="lbl_Component" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Reason" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Hoses" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Reason">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Reason" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Hoses" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
             <telerik:RadWindow ID="RadWindow3" runat="server" Height="500px" Width="850px" OnClientClose="closeWindow_add_event_new_item" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RadWindow4" runat="server" Height="500px" Width="850px" OnClientClose="closeWindow_add_eventjob" Behaviors="Close, Move" Modal="True" Title="FLEET - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>

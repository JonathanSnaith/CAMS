<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Edit Timesheet" CodeFile="flt_EM_FT_EDIT_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_FT_EDIT_RW" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style1 {
            text-align: right;
        }

        .style3 {
            height: 45px;
            width: 592px;
        }

        .style11 {
            text-align: left;
            width: 343px;
        }

        .style12 {
            width: 272px;
        }

        .style13 {
            text-align: left;
            width: 272px;
        }

        .auto-style1 {
            height: 45px;
            width: 79px;
        }

        .auto-style4 {
            height: 45px;
            width: 118px;
        }

        .auto-style8 {
            width: 100%;
        }

        .auto-style12 {
            width: 82px;
        }

        .auto-style13 {
            width: 157px;
        }

        .auto-style17 {
            font-weight: bold;
        }
        .auto-style19 {
            width: 43px;
        }
        .auto-style20 {
            width: 129px;
        }
        .auto-style21 {
            height: 45px;
            width: 91px;
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
            var ThisVal = document.getElementById('lbl_Event').innerHTML;
            oWnd.close(ThisVal);
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            oWnd.close();
        }
        function RowSelectedftd(sender, eventArgs) {
            var ATTid = sender.get_selectedItems()[0].getDataKeyValue('FTD_ID');
            document.getElementById('HF_FTD_ID').value = ATTid;
            sessionStorage.setItem("HF_FTD_ID", ATTid);
        }
        function fn_onrowdblclickftd(sender, eventArgs) {
            var ATTid = sender.get_selectedItems()[0].getDataKeyValue('FTD_ID');
            sessionStorage.setItem("HF_FTD_ID", ATTid);
            fn_OnClickWindowftd();
        }
         function fn_OnClickButton() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISJ = document.getElementById('HF_J_ID').value;
        var THISFTD = 0;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
             oWnd.setUrl('flt_EM_FTD_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&J_ID=' + THISJ + '&FTD_ID=' + THISFTD + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
         }
         function fn_OnClickWindowftd() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISJ = document.getElementById('HF_J_ID').value;
        var THISFTD = document.getElementById('HF_FTD_ID').value;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
             oWnd.setUrl('flt_EM_FTD_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&J_ID=' + THISJ + '&FTD_ID=' + THISFTD + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }
        function closeWindow_add_ftd(sender, args) {
        var x = args.get_argument();
        { __doPostBack('Refresh_Grid', 0); }
        if (x > 0) {
            var oWnd = $find("<%=RadWindow2.ClientID%>");
            oWnd.close();
        }
    }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" class="auto-style8">
                        <tr>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c;" class="auto-style1" rowspan="2">
                                <img alt="" src="../IMAGES/Icons/EVENT_FITTER_TIMESHEET.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; padding-right: 10px;" class="auto-style4" rowspan="2">EDIT TIMESHEET 
                            </td>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;">Job:&nbsp;</td>
                            <td align="left" class="auto-style20" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;">
                                <asp:Label ID="lbl_Job" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                            </td>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;">Job Type:&nbsp;</td>
                            <td style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;" align="left" class="auto-style13">
                                <asp:Label ID="lbl_JT" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                            </td>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;">Event Started:</td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; height: 45px; background-color: #ff661c;">
                                <asp:Label ID="lbl_Date_Start" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;">Event:&nbsp;</td>
                            <td align="left" class="auto-style20" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;">
                                <asp:Label ID="lbl_Event" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                            </td>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;">
                                <asp:Label ID="lbl_Fitter_Text" runat="server" Text="Engineer:" Visible="False"></asp:Label>
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;" class="auto-style13">
                                <asp:Label ID="lbl_Fitter" runat="server" Font-Bold="True" Font-Italic="True" Visible="False"></asp:Label>
                            </td>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; background-color: #ff661c;">Event Ended:</td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 12px; font-weight: bold; height: 45px; background-color: #ff661c;">
                                <asp:Label ID="lbl_Date_End" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style17" colspan="2">NOTES</td>
                                    <td valign="middle">
                                        <strong>TIMESHEETS FOR JOB</strong>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Description Of Activity</strong></td>
                                    <td valign="top">
                                        <telerik:RadButton ID="RadBtn_Add_Engineer" runat="server" AutoPostBack="False" OnClientClicked="fn_OnClickButton" Skin="Glow" Text="Add Engineer">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <telerik:RadTextBox ID="RadTxt_Notes" runat="server" Height="70px" Skin="Glow" TabIndex="3" TextMode="MultiLine" Width="500px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td rowspan="5" valign="top">
                                        <telerik:RadGrid ID="RadGrid1" runat="server" Skin="Glow" Width="350px">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <ClientSettings EnableAlternatingItems="True" EnablePostBackOnRowClick="True">
                                                <Selecting AllowRowSelect="True" />
                                                <ClientEvents OnRowDblClick="fn_onrowdblclickftd" OnRowSelected="RowSelectedftd" />
                                                <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                            </ClientSettings>
                                            <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="FTD_ID" DataKeyNames="FTD_ID" NoMasterRecordsText="No engineers to display.">
                                                <CommandItemSettings AddNewRecordText="Add new engineer" />
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="FTD_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter FTD_ID column" HeaderText="FTD_ID" ReadOnly="True" SortExpression="FTD_ID" UniqueName="FTD_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="FTD_J_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter FTD_J_ID column" HeaderText="FTD_J_ID" ReadOnly="True" SortExpression="FTD_J_ID" UniqueName="FTD_J_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PER_Fullname" FilterControlAltText="Filter PER_Fullname column" HeaderText="Engineer" ReadOnly="True" SortExpression="PER_Fullname" UniqueName="PER_Fullname">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="FTD_Total_Time_Calc"  FilterControlAltText="Filter FTD_Total_Time_Calc column" HeaderText="Total Time" SortExpression="FTD_Total_Time_Calc" UniqueName="FTD_Total_Time_Calc">
                                                    </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn DataField="FTD_Engineer_Rate" DataFormatString="{0:£#,##0.00}" FilterControlAltText="Filter FTD_Engineer_Rate column" HeaderText="Engineer Cost" SortExpression="FTD_Engineer_Rate" UniqueName="FTD_Engineer_Rate">
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
                                <tr>
                                    <td colspan="2">
                                        <strong>Additional Work Required</strong></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <telerik:RadTextBox ID="RadTxt_Tests_Notes" runat="server"
                                            Height="70px" Skin="Glow" TabIndex="2" TextMode="MultiLine" Width="500px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                         <strong>Risk Safety or Delay Issues</strong></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <telerik:RadTextBox ID="RadTxt_Issues_Notes" runat="server"
                                            Height="70px" Skin="Glow" TabIndex="1" TextMode="MultiLine" Width="500px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold">Status:</td>
                                    <td style="font-weight: bold">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="4">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                                <telerik:RadComboBoxItem runat="server" Text="Cancelled" Value="Cancelled" />
                                                <telerik:RadComboBoxItem runat="server" Text="Complete" Value="Complete" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" Skin="Glow" TabIndex="5" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" TabIndex="6" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
             <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Previous_Status" runat="server" />
            <asp:HiddenField ID="HF_ET_ID" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_FT_ID" runat="server" />
             <asp:HiddenField ID="HF_FTD_ID" runat="server" />
            <asp:HiddenField ID="HF_PageFTD" runat="server" />
            <asp:HiddenField ID="HF_J_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
<%--                    <telerik:AjaxSetting AjaxControlID="RadBtn_Add_Engineer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadWindow2" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>--%>
                     <telerik:AjaxSetting AjaxControlID="RadWindow2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Event" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
             <telerik:RadWindow ID="RadWindow2" runat="server" Height="700px" Width="850px" OnClientClose="closeWindow_add_ftd" Behaviors="Close, Move" Modal="True" Title="CAMS - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


<%@ Page Language="VB" AutoEventWireup="false" Title="Fleet Data Input - Edit Magnetic Plug Inspection" CodeFile="flt_MAGNETIC_PLUG_INSPECTIONS_EDIT_RW.aspx.vb" Inherits="DATA_INPUT_flt_MAGNETIC_PLUG_INSPECTIONS_EDIT_RW" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .RadGrid a img {
            border: none;
        }

        .style1 {
            text-align: right;
        }

        .style3 {
            height: 45px;
            width: 443px;
        }

        .style4 {
            text-align: right;
            height: 68px;
            width: 175px;
        }

        .style5 {
            height: 68px;
        }

        .style6 {
            height: 25px;
        }

        .style7 {
            font-size: 20px;
            height: 25px;
        }

        .style8 {
            text-align: right;
            height: 25px;
            width: 175px;
        }

        .style22 {
            width: 198px;
        }

        .style23 {
            font-size: 20px;
            height: 25px;
            width: 198px;
        }

        .style24 {
            width: 317px;
        }

        .style25 {
            font-size: 20px;
            height: 25px;
            width: 317px;
        }

        .style26 {
            text-align: right;
            width: 175px;
        }

        .style31 {
            width: 21px;
        }

        .style32 {
            width: 17px;
        }

        .style36 {
            width: 400px;
        }

        .style38 {
            height: 25px;
            width: 532px;
        }

        .auto-style3 {
            height: 45px;
            width: 91px;
        }

        .auto-style4 {
            width: 475px;
        }

        .auto-style10 {
            text-align: right;
            height: 25px;
            width: 112px;
        }

        .auto-style11 {
            text-align: right;
            width: 112px;
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
            //var ThisVal = document.getElementById('HF_MPI_ID').value;
            oWnd.close();
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            oWnd.close();
        }

    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" class="auto-style3" rowspan="2" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c;">
                                <img alt="" src="../IMAGES/Icons/EVENT_JOB_MANAGEMENT.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" /></td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c; padding-right: 10px;" rowspan="2" class="auto-style4">EDIT MAGNETIC PLUG INSPECTION
                                <asp:Label ID="lbl_MPI_ID" runat="server" ForeColor="White"></asp:Label></td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #ff661c; text-align: right;">created&nbsp;
                                <asp:Label ID="lbl_Created" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #ff661c; text-align: right;">modified&nbsp;
                                <asp:Label ID="lbl_Modified" runat="server" Text=""></asp:Label>&nbsp;</td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style10" style="padding-right: 20px">Customer:</td>
                                    <td class="style6">
                                        <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="1" Width="250px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="left" colspan="2" rowspan="8" valign="top">
                                        <asp:Image ID="Image1" runat="server" Height="500px" Width="400px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style10" style="padding-right: 20px">Asset:</td>
                                    <td class="style6">
                                        <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="1" Width="200px">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">Compartment:</td>
                                    <td class="style7">
                                        <telerik:RadComboBox ID="RadCB_Compartment" runat="server" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="2" Width="300px" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style10" style="padding-right: 20px">Visual Rating:</td>
                                    <td class="style7">
                                        <telerik:RadComboBox ID="RadCB_Visual_Rating" runat="server" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="3" Width="300px" AutoPostBack="True" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">Inspector:</td>
                                    <td class="style7">
                                        <telerik:RadComboBox ID="RadCB_Inspector" runat="server" AllowCustomText="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="4" Width="300px" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">Date:</td>
                                    <td class="style7">
                                        <telerik:RadDatePicker ID="RadDP_Date" runat="server" MinDate="1960-01-01" TabIndex="5" Skin="Glow">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Skin="Glow">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
                                                        <ItemStyle BackColor="#FFC5A8" />
                                                    </telerik:RadCalendarDay>
                                                </SpecialDays>
                                            </Calendar>
                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="5">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="5" />
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">SMU:</td>
                                    <td class="style7">
                                        <telerik:RadNumericTextBox ID="RadTxt_SMU" runat="server" AutoPostBack="True" TabIndex="6" Skin="Glow">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">Photo Link:</td>
                                    <td class="style7">
                                        <telerik:RadTextBox ID="RadTxt_Link" runat="server" AutoPostBack="True" Width="100%" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" TabIndex="7" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="left" class="style22" style="padding-left: 20px;">&nbsp;</td>
                                    <td align="right" style="padding-right: 20px;">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" TabIndex="8" Text="Save" Width="100px" Skin="Glow">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">Signature:</td>
                                    <td rowspan="4" valign="top">
                                        <asp:Image ID="Image2" runat="server" Height="100px" Width="300px" BackColor="White" />
                                    </td>
                                    <td align="left" class="style22" style="padding-left: 20px;">&nbsp;</td>
                                    <td align="right" style="padding-right: 20px;">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" TabIndex="9" Text="Cancel" Width="100px" Skin="Glow">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">&nbsp;</td>
                                    <td align="left" class="style22" style="padding-left: 20px;">&nbsp;</td>
                                    <td align="right" style="padding-right: 20px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">&nbsp;</td>
                                    <td align="left" class="style22" style="padding-left: 20px;">&nbsp;</td>
                                    <td align="right" style="padding-right: 20px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">&nbsp;</td>
                                    <td style="padding-left: 20px" class="style22" colspan="2">
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
            <asp:HiddenField ID="HF_ThisID" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_MPI_ID" runat="server" />
            <asp:HiddenField ID="HF_A_ID" runat="server" />
            <asp:HiddenField ID="HF_Event_Status" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_SMU" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_7_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_7_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadTxt_Link">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Image1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


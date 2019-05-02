<%@ Page Language="VB" AutoEventWireup="false" CodeFile="flt_DATA_INPUT_BRK_EDIT_RW.aspx.vb" Inherits="DATA_INPUT_flt_DATA_INPUT_BRK_EDIT_RW" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="shortcut icon" href="../../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style1 {
            text-align: right;
        }

        .style2 {
            font-size: 20px;
        }

        .style3 {
            height: 45px;
            width: 592px;
        }

        .style4 {
            text-align: right;
            height: 68px;
        }

        .style5 {
            height: 68px;
        }

        .auto-style1 {
            height: 45px;
            width: 63px;
        }
        .auto-style2 {
            height: 28px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style6 {
            height: 44px;
        }
        .styletablecell {
            padding-left: 95px;
        }
        .auto-style7 {
            height: 34px;
        }
        .auto-style8 {
            width: 82px;
        }
        .auto-style9 {
            height: 34px;
            width: 82px;
        }
        .auto-style10 {
            height: 28px;
            width: 82px;
        }
        .auto-style11 {
            height: 44px;
            width: 82px;
        }
    </style>
    <link href="../../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
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
            //var ThisVal = document.getElementById('lbl_Table').innerHTML;
            oWnd.close();
            //top.location.href = top.location.href;
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_BRK_ID').value;
            oWnd.close(ThisVal);
        }
        function confirmCallBackFn(arg)
    {
        if (arg) //the user clicked OK
        {
            __doPostBack("<%=HiddenButton.UniqueID %>", "");
        }
        }
         function confirmCallBackFnHB(arg)
    {
        if (arg) //the user clicked OK
        {
            __doPostBack("<%=HiddenButton2.UniqueID %>", "");
        }
    }
    </script>
    <form id="form1" runat="server" defaultfocus="txtSMU">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 5px; background-color: #ff661c; text-align: right;" class="auto-style1">
                                <img alt="" src="../../IMAGES/Icons/DATA_INPUT_BRAKE2.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" /></td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 5px; height: 45px; background-color: #ff661c; text-align: left;">
                                 <asp:Label ID="lblTitle" runat="server" Font-Size="16px" ForeColor="White" ></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style8">
                                        Customer:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td colspan="2">Site:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="2" Width="250px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td>
                                        <telerik:RadButton ID="btn_Save" runat="server" ForeColor="Red" Skin="Glow" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:Label ID="lblAsset" runat="server" Text="Asset :"></asp:Label>
                                    </td>
                                    <td class="auto-style7">
                                        <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="1" Width="150px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td colspan="2" class="auto-style7">Date:</td>
                                    <td class="auto-style7">
                                        <telerik:RadDatePicker ID="RadDP_Date" Runat="server" Skin="Glow">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Glow" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td class="auto-style7">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" TabIndex="20" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">Engineer:</td>
                                    <td class="auto-style7">
                                        <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AllowCustomText="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" TabIndex="8" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td class="auto-style7" colspan="2">&nbsp;</td>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td class="auto-style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">
                                        <asp:Label ID="lblSMU" runat="server" Text="SMU :"></asp:Label></td>
                                    <td class="auto-style2">
                                        <telerik:RadTextBox ID="txtSMU" runat="server" TabIndex="1" Skin="Glow"></telerik:RadTextBox></td>
                                    <td class="auto-style2" colspan="2">Ground Condition:</td>
                                    <td class="auto-style2">
                                        <telerik:RadComboBox ID="RadCB_Ground_Condition" Runat="server" Width="250px" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Selected="True" Text="*Not Specified" Value="*Not Specified" />
                                                <telerik:RadComboBoxItem runat="server" Text="C1 - Wet Ground" Value="C1 - Wet Ground" />
                                                <telerik:RadComboBoxItem runat="server" Text="C2 - Dry Ground" Value="C2 - Dry Ground" />
                                                <telerik:RadComboBoxItem runat="server" Text="C3 - Snow/Ice" Value="C3 - Snow/Ice" />
                                                <telerik:RadComboBoxItem runat="server" Text="C4 - Tarmac" Value="C4 - Tarmac" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td class="auto-style2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="lblValue" runat="server" Text="Result (%) :"></asp:Label></td>
                                    <td>
                                        <telerik:RadTextBox ID="txtValue" runat="server" onFocus="this.select()" TabIndex="2" AutoPostBack="True" Skin="Glow"></telerik:RadTextBox>&nbsp;&nbsp;
                                        <asp:Label ID="lbl_Brake" runat="server"></asp:Label>

                                    </td>
                                    <td colspan="2">Handbrake Test:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Handbrake" Runat="server" AutoPostBack="True" Width="100px" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Selected="True" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Text="Pass" Value="1" />
                                                <telerik:RadComboBoxItem runat="server" Text="Fail" Value="2" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">Photo:</td>
                                    <td rowspan="7" valign="top">
                                        <asp:Image ID="Img_Photo_Link" runat="server" Height="400px" Width="300px" />
                                    </td>
                                    <td rowspan="7" valign="top" colspan="2">Handbrake
                                        <br />
                                        Photo:</td>
                                    <td rowspan="7" valign="top">
                                        <asp:Image ID="Img_Handbrake_Photo_Link" runat="server" Height="400px" Width="300px" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style11"></td>
                                    <td class="auto-style6"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                         <asp:Table ID="Table_ReTest" runat="server" CssClass="auto-style3" Visible="False">
                                             <asp:TableRow>
                                                <asp:TableCell Width="90px">Retest Result (%):</asp:TableCell>
                                                 <asp:TableCell Width="350px">
                                                 <telerik:RadTextBox ID="txtRetestValue" runat="server" AutoPostBack="True" Skin="Glow"></telerik:RadTextBox>
                                                      &nbsp;
                                                     &nbsp;
                                                     &nbsp;
                                                      <asp:Label ID="lbl_Brake_Retest" runat="server"></asp:Label>
                                                 </asp:TableCell>
                                                <asp:TableCell Width="150px" CssClass="styletablecell">Handbrake Retest:</asp:TableCell>
                                                 <asp:TableCell Width="350px">
                                                     <telerik:RadComboBox ID="RadCB_Handbrake_Retest" Runat="server" AutoPostBack="True" Width="100px" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Selected="True" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Text="Pass" Value="1" />
                                                <telerik:RadComboBoxItem runat="server" Text="Fail" Value="2" />
                                            </Items>
                                        </telerik:RadComboBox>
                                                 </asp:TableCell>
                                                 <asp:TableCell>&nbsp;</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                  <asp:TableCell Width="90px" VerticalAlign="Top">Retest Photo:</asp:TableCell>
                                                 <asp:TableCell Width="350px">
                                                     <asp:Image ID="Img_Retest_Photo_Link" runat="server" Height="400px" Width="300px" /></asp:TableCell>
                                                  <asp:TableCell Width="150px" CssClass="styletablecell" VerticalAlign="Top">Handbrake Retest Photo:</asp:TableCell>
                                                 <asp:TableCell Width="350px">
                                                     <asp:Image ID="Img_Handbrake_Retest_Photo_Link" runat="server" Height="400px" Width="300px" /></asp:TableCell>
                                                 <asp:TableCell>&nbsp;</asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="lblNotes" runat="server" Text="Notes :"></asp:Label>
                                    </td>
                                    <td colspan="4">
                                        <telerik:RadTextBox ID="txtNotes" runat="server" onkeydown="trigger(event.keyCode)" Rows="10" TabIndex="3" TextMode="MultiLine" Width="100%" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">Signature:</td>
                                    <td colspan="2">
                                        <asp:Image ID="Img_Signature_Link" runat="server" Height="100px" Width="300px" />
                                    </td>
                                    <td colspan="2">
                                        Name:
                                        <asp:Label ID="lbl_Created_By" runat="server"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" TabIndex="7" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td colspan="2">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        &nbsp;</td>
                                    <td colspan="5">
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadNotification ID="RadNotify" runat="server" Position="Center" Title="CAMS - Problem" Height="100px" Skin="Glow" TitleMenuToolTip="" Width="600px" EnableRoundedCorners="True">
            </telerik:RadNotification>
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Skin="Glow">
            </telerik:RadWindowManager>
             <asp:Button ID="HiddenButton" Text="" Style="display: none;" OnClick="HiddenButton_Click" runat="server" />
             <asp:Button ID="HiddenButton2" Text="" Style="display: none;" OnClick="HiddenButton2_Click" runat="server" />
             <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_ThisID" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_BRK_ID" runat="server" />
            <asp:HiddenField ID="HF_ATT_ID" runat="server" />
            <asp:HiddenField ID="HF_CAT_ID" runat="server" />
             <asp:HiddenField ID="HF_Handbrake" runat="server" />
            <asp:HiddenField ID="HF_MOD_ID" runat="server" />
            <asp:HiddenField ID="HF_Ratio" runat="server" />
            <asp:HiddenField ID="HF_ThisCount" runat="server" Value="0" />
             <asp:HiddenField ID="HF_ThisCount2" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_EXCEPTION_7_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_7_RW" runat="server" Value="0" />
              <asp:SqlDataSource ID="SqlDS_BrakeTestFailureEmail" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_BRAKE_TEST_FAILURE_sp" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_HandBrakeTestFailureEmail" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_HANDBRAKE_TEST_FAILURE_sp" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Asset" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNotify" />
                            <telerik:AjaxUpdatedControl ControlID="HF_ThisID" />
                              <telerik:AjaxUpdatedControl ControlID="HF_BRK_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_HandBrake">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="HF_ThisCount2" />
                            <telerik:AjaxUpdatedControl ControlID="Table_ReTest" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Handbrake_Retest">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_ThisCount2" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="txtValue">
                        <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="HF_ThisCount" />
                            <telerik:AjaxUpdatedControl ControlID="Table_ReTest" />
                             <telerik:AjaxUpdatedControl ControlID="lbl_Brake" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="txtRetestValue">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_ThisCount" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Brake_Retest" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNotify">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="txtAsset" />
                            <telerik:AjaxUpdatedControl ControlID="txtSMU" />
                            <telerik:AjaxUpdatedControl ControlID="txtValue" />
                            <telerik:AjaxUpdatedControl ControlID="txtNotes" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadWindowManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HiddenButton" />
                            <telerik:AjaxUpdatedControl ControlID="HiddenButton2" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
        </div>
    </form>
</body>
</html>


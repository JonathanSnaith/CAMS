<%@ Page Language="VB" AutoEventWireup="false" Title="Fleet Data Input - Edit Hoses" CodeFile="flt_HOSES_EDIT_RW.aspx.vb" Inherits="DATA_INPUT_flt_HOSES_EDIT_RW" %>

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
        .auto-style12 {
            width: 109px;
        }
        .auto-style13 {
            width: 194px;
        }
        .auto-style14 {
            width: 109px;
            height: 25px;
        }
        .auto-style15 {
            width: 194px;
            height: 25px;
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
                            <td align="left" class="auto-style3" rowspan="2" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #E46C0A;">
                                <img alt="" src="../IMAGES/Icons/EVENT_JOB_MANAGEMENT.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" /></td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; padding-right: 10px;" rowspan="2" class="auto-style4">EDIT HOSES
                                <asp:Label ID="lbl_HOS_ID" runat="server" ForeColor="White"></asp:Label></td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #E46C0A; text-align: right;">created&nbsp;
                                <asp:Label ID="lbl_Created" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #E46C0A; text-align: right;">modified&nbsp;
                                <asp:Label ID="lbl_Modified" runat="server" Text=""></asp:Label>&nbsp;</td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style10" style="padding-right: 20px">Asset:</td>
                                    <td class="style6">
                                        <telerik:RadComboBox ID="RadCB_Asset" runat="server" AllowCustomText="True" AutoPostBack="False" DataSourceID="SqlDS_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="100px" TabIndex="1">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" valign="top" class="auto-style12" style="padding-right: 20px">
                                        Site:</td>
                                    <td align="left" class="auto-style13" valign="top">
                                        <telerik:RadComboBox ID="RadCB_Site" runat="server" AllowCustomText="True" AutoPostBack="False" DataSourceID="SqlDS_Site" DataTextField="SITE_Name" DataValueField="SITE_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="1" Width="200px">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style10" style="padding-right: 20px">Event Type:</td>
                                    <td class="style7">
                                        <telerik:RadComboBox ID="RadCB_EventType" runat="server" AllowCustomText="True" DataSourceID="SqlDS_EventType" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="2" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" class="auto-style14" style="padding-right: 20px" valign="top">Date:</td>
                                    <td align="left" class="auto-style15" valign="top">
                                        <telerik:RadDatePicker ID="RadDP_Date" runat="server" MinDate="1960-01-01" TabIndex="5">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                                    <td class="auto-style10" style="padding-right: 20px">Component:</td>
                                    <td class="style7">
                                        <telerik:RadComboBox ID="RadCB_Component" runat="server" AllowCustomText="True" DataSourceID="SqlDS_Component" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="4" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" style="padding-right: 20px" valign="top">Order No:</td>
                                    <td align="left" valign="top">
                                        <telerik:RadTextBox ID="RadTxt_Order" runat="server" AutoPostBack="True" Width="200px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">Position:</td>
                                    <td class="style7">
                                        <telerik:RadComboBox ID="RadCB_Position" runat="server" AllowCustomText="True" DataSourceID="SqlDS_Position" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="4" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" style="padding-right: 20px" valign="top">Reason:</td>
                                    <td align="left" valign="top">
                                        <telerik:RadComboBox ID="RadCB_Reason" runat="server" AllowCustomText="True" AutoPostBack="False" DataSourceID="SqlDS_Reason" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" TabIndex="3" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">SMU:</td>
                                    <td class="style7">
                                        <telerik:RadNumericTextBox ID="RadTxt_SMU" runat="server" AutoPostBack="False" TabIndex="6">
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
                                    <td align="right" style="padding-right: 20px" valign="top">Prevented:</td>
                                    <td align="left" valign="top">
                                        <telerik:RadComboBox ID="RadCB_Prevented" Runat="server">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="" Value="" />
                                                <telerik:RadComboBoxItem runat="server" Text="Prevented" Value="Prevented" />
                                                <telerik:RadComboBoxItem runat="server" Text="Not Prevented" Value="Not Prevented" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">Status:</td>
                                    <td class="style7">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="False" ResolvedRenderMode="Classic" TabIndex="7">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td align="right" style="padding-right: 20px" valign="top">Tag Fitted:</td>
                                    <td align="left" valign="top">
                                        <telerik:RadTextBox ID="RadTxt_Tag" runat="server" AutoPostBack="True" Width="200px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">&nbsp;</td>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td align="right" style="padding-right: 20px" valign="top">Tag Removed:</td>
                                    <td align="left" valign="top">
                                        <telerik:RadTextBox ID="RadTxt_OldTag" runat="server" AutoPostBack="True" Width="200px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td align="left" class="auto-style12" style="padding-left: 20px;">&nbsp;</td>
                                    <td align="right" style="padding-right: 20px;" class="auto-style13">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" TabIndex="8" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td align="left" class="auto-style12" style="padding-left: 20px;">&nbsp;</td>
                                    <td align="right" style="padding-right: 20px;" class="auto-style13">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" TabIndex="9" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px" class="style22" colspan="2">
                                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lbl_Asset" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                                        <asp:Label ID="LblPreviousPage" runat="server" Font-Size="1pt" ForeColor="White" Visible="False"></asp:Label>
                                        <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="White"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_HOS_ID" runat="server" />
            <asp:HiddenField ID="HF_A_ID" runat="server" />
            <asp:HiddenField ID="HF_MOD_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_SMU" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_7_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_7_RW" runat="server" Value="0" />
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
            <asp:SqlDataSource ID="SqlDS_Select" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="DATA_INPUT_HOSES_SELECT_RW_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_HOS_ID" Name="HOS_ID" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Update" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="DATA_INPUT_HOSES_UPDATE_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_HOS_ID" Name="HOS_ID" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="HOS_A_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="RadCB_Site" Name="HOS_SITE_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="RadCB_EventType" Name="HOS_ET_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="RadCB_Reason" Name="HOS_Reason_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="RadTxt_SMU" Name="HOS_SMU" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Component" Name="HOS_Area_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="RadCB_Position" Name="HOS_POS_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="RadTxt_Tag" Name="HOS_Tag" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="RadTxt_OldTag" Name="HOS_OldTag" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="RadTxt_Order" Name="HOS_Order" PropertyName="Text" Type="String" DefaultValue="abc" />
                     <asp:ControlParameter ControlID="RadCB_Prevented" Name="HOS_Prevented" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="RadDP_Date" Name="HOS_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadCB_Status" Name="HOS_Status" PropertyName="Text"  Type="String" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="HOS_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Asset" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT CONVERT (nvarchar(5), A_ID) AS A_ID, ASSET.A_Asset_ID FROM ASSET WHERE (ASSET.A_Status NOT IN ('Trash', 'Delete')) and A_Hide = 0 ORDER BY A_Asset_ID">
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Site" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT CONVERT (nvarchar(5), SITE_ID) AS SITE_ID, SITE_Name FROM SITE WHERE (SITE_Input = 1) ORDER BY SITE_Name">
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDS_EventType" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name FROM ATTRIBUTES WHERE ATT_Status <> 'Trash' and ATT_Table = 'EVENT_Type' ORDER BY ATT_Name">
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Component" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name + ' : ' + ATT_Description as ATT_Name FROM ATTRIBUTES WHERE ATT_Status <> 'Trash' and ATT_Table = 'SMU_Trigger_Task_Code_Header' and ATT_ID NOT IN (2661,2662) ORDER BY ATT_Name">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Position" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name FROM ATTRIBUTES where ATT_Status <> 'Trash' and ATT_Table = 'DEFECT_Position' ORDER BY ATT_Name">
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Reason" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT DISTINCT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name + ' - ' + ATTRIBUTES.ATT_Description as ATT_Name FROM ATTRIBUTES where ATT_Status <> 'Trash' and ATT_Table = 'INCIDENT_CODES' ORDER BY ATT_Name">
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
              </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


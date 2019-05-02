<%@ Page Language="VB" AutoEventWireup="false" Title="Fleet Asset Management - Asset Movements - Edit Movement" CodeFile="flt_AM_ASSET_MOVEMENTS_EDIT_RW.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_MOVEMENTS_EDIT_RW" %>

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

        .style4 {
            text-align: right;
            height: 68px;
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

        .auto-style1 {
            width: 63px;
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
            var ThisVal = document.getElementById('HF_AM_ID').value;
            oWnd.close(ThisVal);
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_AM_ID').value;
            oWnd.close(ThisVal);
        }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; padding-right: 10px; background-color: #E46C0A;" class="auto-style1">
                               <img alt="" src="../IMAGES/Icons/ASSET_MOVEMENT_NEW.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #E46C0A; padding-right: 10px;">
                                ASSET MOVEMENTS : EDIT MOVEMENT 
                                 <asp:Label ID="LblPreviousPage" runat="server" BackColor="#E46C0A" ForeColor="#E46C0A" Text="" Visible="False" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#E46C0A" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#E46C0A"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style6">&nbsp;</td>
                                    <td class="style7">
                                        <strong>&nbsp; </strong></td>
                                    <td class="style7"></td>
                                    <td class="style7">
                                        <asp:Label ID="lbl_AM_A_ID" runat="server" Font-Bold="False" ForeColor="White" Style="font-style: italic; font-weight: 700;"></asp:Label>
                                    </td>
                                    <td class="style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Asset ID:</td>
                                    <td>
                                        <asp:Label ID="lbl_Asset" runat="server" Font-Bold="False"
                                            Style="font-style: italic; font-weight: 700;"></asp:Label>
                                        <br />
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        ID:</td>
                                    <td>
                                        <asp:Label ID="lbl_ID" runat="server" Font-Bold="False" Style="font-style: italic; font-weight: 700;"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Proposed Date of Movement:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_Date" runat="server" AutoPostBack="True"
                                            Skin="Default">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"
                                                Skin="Default" UseColumnHeadersAsSelectors="False"
                                                UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy"
                                                DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
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
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        <asp:Label ID="lbl_WeekEnding" runat="server" Font-Bold="False"
                                            Style="font-style: italic" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Actual Date of Movement:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_Date_Started" runat="server" AutoPostBack="True"
                                            Skin="Default">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"
                                                Skin="Default" UseColumnHeadersAsSelectors="False"
                                                UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy"
                                                DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
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
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Transport Company:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Company" runat="server" AllowCustomText="True" DataSourceID="SqlDS_CB_Company" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="200px" AutoPostBack="True">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Previous Location:</td>
                                    <td>
                                        <asp:Label ID="lbl_Site_Prev" runat="server" Font-Bold="False"
                                            Style="font-style: italic; font-weight: 700;"></asp:Label>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Previous Cost Location:</td>
                                    <td>
                                        <asp:Label ID="lbl_Cost_Prev" runat="server" Font-Bold="False"
                                            Style="font-style: italic; font-weight: 700;"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">New Location:</td>
                                    <td>
                                        <asp:Label ID="lbl_Site" runat="server" Font-Bold="False"
                                            Style="font-style: italic; font-weight: 700;"></asp:Label>
                                        <telerik:RadComboBox ID="RadCB_Site" runat="server" DataSourceID="SqlDS_CB_Site" DataTextField="SITE_Name" DataValueField="SITE_ID" ResolvedRenderMode="Classic" Skin="Default" Width="200px" AutoPostBack="True" Visible="False">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Cost Location:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Cost" runat="server" DataSourceID="SqlDS_CB_SC" DataTextField="SC_Ref_Name" DataValueField="SC_ID" ResolvedRenderMode="Classic" Skin="Default" Width="200px">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">SMU:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_SMU" runat="server" Skin="Default" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        Move Costed To:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Cost_1" Runat="server">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="*Not Specified" Value="*Not Specified" />
                                                <telerik:RadComboBoxItem runat="server" Text="Mining" Value="Mining" />
                                                <telerik:RadComboBoxItem runat="server" Text="Plant" Value="Plant" />
                                            </Items>
                                        </telerik:RadComboBox>
                                        <telerik:RadComboBox ID="RadCB_Cost_2" runat="server" DataSourceID="SqlDS_CB_Cost" DataTextField="SC_Ref_Name" DataValueField="SC_ID" ResolvedRenderMode="Classic" Skin="Default" Width="200px">
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Reason for Movement:</td>
                                    <td colspan="4">
                                        <telerik:RadTextBox ID="RadTxt_Reason" runat="server" BackColor="#FFFFDD" Height="96px" Skin="Default" TextMode="MultiLine" Width="500px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" style="padding-right: 20px">Notes:</td>
                                    <td colspan="4" class="style5">
                                        <telerik:RadTextBox ID="RadTxt_Notes" runat="server" BackColor="#FFFFDD"
                                            Height="96px" Skin="Default" TextMode="MultiLine" Width="500px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Planning" Value="Planning" />
                                                <telerik:RadComboBoxItem runat="server" Text="Approved" Value="Approved" />
                                                <telerik:RadComboBoxItem runat="server" Text="Rejected" Value="Rejected" />
                                                <telerik:RadComboBoxItem runat="server" Text="Complete" Value="Complete" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-left: 60px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Reject_Note" runat="server" Text="Rejection Reason:" Visible="False"></asp:Label>
                                    </td>
                                    <td colspan="4" rowspan="2">
                                        <telerik:RadTextBox ID="RadTxt_Reject_Note" runat="server" BackColor="#FFFFDD" Height="48px" Skin="Default" TextMode="MultiLine" Width="500px" Visible="False">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;
                                    <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="3">
                                        <asp:Label ID="lbl_Site_ID" runat="server" Font-Bold="False" ForeColor="White" Style="font-style: italic; font-weight: 700;"></asp:Label>
                                        <asp:Label ID="lbl_SC_ID" runat="server" Font-Bold="False" ForeColor="White" Style="font-style: italic; font-weight: 700;"></asp:Label>
                                    </td>
                                    <td style="padding-left: 60px">
                                        <telerik:RadButton ID="Btn_Save" runat="server" BackColor="Red" Skin="Default" Text="Save" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                    <td style="padding-left: 60px">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Default" Text="Cancel" Width="100px">
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
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_AM_ID" runat="server" />
            <asp:HiddenField ID="HF_Company" runat="server" />
            <asp:HiddenField ID="HF_Site_ID" runat="server" />
            <asp:HiddenField ID="HF_Actual_Date" runat="server" Value="1900-01-01" />
            <asp:HiddenField ID="HF_Movement_Flag" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
             <asp:HiddenField ID="HF_Created_By" runat="server" />
            <asp:HiddenField ID="HF_Rejected_By" runat="server" />
            <asp:HiddenField ID="HF_Approved_By" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_2_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_2_RW" runat="server" Value="0" />
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
                SelectCommand="AM_ASSET_MOVEMENTS_RG_SELECT_RW_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_AM_ID" Name="AM_ID" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Update" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_MOVEMENTS_RG_UPDATE_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_AM_ID" Name="AM_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_Site_ID" Name="AM_Site_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Company" Name="AM_COM_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="RadCB_Cost" Name="AM_SC_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                     <asp:ControlParameter ControlID="RadCB_Cost_1" Name="AM_Cost_Dept" PropertyName="SelectedValue" Type="String" DefaultValue="*Not Specified" />
                     <asp:ControlParameter ControlID="RadCB_Cost_2" Name="AM_Cost_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lbl_WeekEnding" Name="AM_WeekEnding" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadDP_Date" Name="AM_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadDP_Date_Started" Name="AM_Date_Started" Type="DateTime" DefaultValue="1900-01-01" />
                     <asp:ControlParameter ControlID="RadTxt_Reason" Name="AM_Reason" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="RadTxt_Notes" Name="AM_Note" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="RadCB_Status" Name="AM_Status" PropertyName="SelectedValue" Type="String" DefaultValue="Planning" />
                    <asp:ControlParameter ControlID="HF_Movement_Flag" Name="AM_Movement_Flag" PropertyName="Value" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadTxt_Reject_Note" Name="AM_Reject_Note" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="AM_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_Rejected_By" Name="AM_Rejected_By" PropertyName="Value" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="HF_Approved_By" Name="AM_Approved_By" PropertyName="Value" Type="String" DefaultValue="abc" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Update_AssetList" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_MOVEMENTS_AL_UPDATE_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl_AM_A_ID" Name="AM_A_ID" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lbl_Site_ID" Name="AM_SITE_ID" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="RadCB_Cost" Name="AM_SC_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadDP_Date" Name="AM_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="HF_Movement_Flag" Name="AM_Movement_Flag" PropertyName="Value" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Email_Approved" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_ASSET_MOVEMENT_APPROVED_sp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Email_Date_Amended" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_ASSET_MOVEMENT_DATE_AMENDED_sp" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_AM_ID" Name="AM_ID" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Email_Rejected" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_ASSET_MOVEMENT_REJECTED_sp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_GetWeekEnding" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="WEEKENDING_FROM_DATE" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadDP_Date" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS SITE_ID, '*Not Specified' AS SITE_Name UNION ALL SELECT SITE_ID, SITE_Name FROM SITE WHERE (SITE_Status = 1) AND (SITE_Category = 'Site') ORDER BY SITE_Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_CB_Company" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT - 1 AS ATT_ID, '*Banks Bros Transport' AS ATT_Name UNION ALL SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'ASSET_Company') AND (ATT_Status NOT IN ('Trash', 'Delete')) ORDER BY ATT_Name">
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_SC" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS SC_ID, '*Not Specified' AS SC_Ref_Name UNION ALL SELECT SC_ID, SC_Ref_Name FROM SITE_Cost WHERE (SC_Status = 1) ORDER BY SC_Ref_Name"></asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_CB_Cost" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS SC_ID, '*Not Specified' AS SC_Ref_Name UNION ALL SELECT SC_ID, SC_Ref_Name FROM SITE_Cost WHERE (SC_Status = 1) AND SC_ID NOT IN (1,2,3,4,6,7,8,9,10,18,12,13, 20,14,22,16) ORDER BY SC_Ref_Name"></asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadDP_Date">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_WeekEnding" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Site">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Site_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Movement_Flag" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Rejected_By" />
                            <telerik:AjaxUpdatedControl ControlID="HF_Approved_By" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                             <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                             <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Reject_Note" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Reject_Note" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_AM_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


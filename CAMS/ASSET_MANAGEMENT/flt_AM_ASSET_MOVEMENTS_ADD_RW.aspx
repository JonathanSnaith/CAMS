<%@ Page Language="VB" AutoEventWireup="false" Title="Fleet Asset Management - Asset Movements - Add Movement" CodeFile="flt_AM_ASSET_MOVEMENTS_ADD_RW.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_MOVEMENTS_ADD_RW" %>

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
        .auto-style1 {
            width: 52px;
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
        function saveandcloseWindowAdd() {
            var oWndadd = GetRadWindow();
            oWndadd.close();
            top.location.href = top.location.href;
        }
        function closeWindowAdd() {
            var oWndadd = GetRadWindow();
            oWndadd.close();
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
                                ASSET MOVEMENTS: ADD NEW MOVEMENT
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
                                    <td class="style6">&#160;</td>
                                    <td class="style7"><strong>&nbsp; </strong></td>
                                    <td class="style7"></td>
                                    <td class="style7">&#160;</td>
                                    <td>&#160;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Asset ID:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Asset" runat="server"
                                            DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID"
                                            ResolvedRenderMode="Classic" Skin="Default" AllowCustomText="True"
                                            Filter="Contains" AutoPostBack="True">
                                        </telerik:RadComboBox>
                                        <br />
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td>&#160;</td>
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
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">WeekEnding:</td>
                                    <td>
                                        <asp:Label ID="lbl_WeekEnding" runat="server" Font-Bold="False"
                                            Style="font-style: italic"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Actual Date of Movement:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_Date_Started" runat="server"
                                            AutoPostBack="True" Skin="Default">
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
                                            </DateInput><DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td>&#160;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Current Location:</td>
                                    <td>
                                        <asp:Label ID="lbl_Prev_Site" runat="server" Font-Bold="False"
                                            Style="font-style: italic; font-weight: 700;"></asp:Label></td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Current_Cost_Location" runat="server" Text="Current Cost Location:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Prev_Cost" runat="server" Font-Bold="False"
                                            Style="font-style: italic; font-weight: 700;"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">New Location:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Site" runat="server"
                                            DataSourceID="SqlDS_CB_Site" DataTextField="SITE_Name" DataValueField="SITE_ID"
                                            ResolvedRenderMode="Classic" Skin="Default" Width="200px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Cost_Location" runat="server" Text="Cost Location:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Cost" runat="server" DataSourceID="SqlDS_CB_SC"
                                            DataTextField="SC_Ref_Name" DataValueField="SC_ID" ResolvedRenderMode="Classic"
                                            Skin="Default" Width="200px">
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
                                        </telerik:RadTextBox></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Planning" Value="Planning" />
                                                <telerik:RadComboBoxItem runat="server" Text="Complete" Value="Complete" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td style="padding-left: 60px">
                                        <telerik:RadButton ID="Btn_Save" runat="server"
                                            Skin="Default" Text="Save" Width="100px" BackColor="Red">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                    </td>
                                    <td>&#160;</td>
                                    <td style="padding-left: 20px">&#160;</td>
                                    <td class="style1" style="padding-left: 20px">&#160;</td>
                                    <td style="padding-left: 60px">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindowAdd" Skin="Default" Text="Cancel" Width="100px">
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
            <asp:HiddenField ID="HF_PrevSiteID" runat="server" />
            <asp:HiddenField ID="HF_PrevCostID" runat="server" />
            <asp:HiddenField ID="HF_Movement_Flag" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
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
            <asp:SqlDataSource ID="SqlDS_Insert" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_MOVEMENTS_RG_INSERT_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="AM_A_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_PrevSiteID" Name="AM_SITE_ID_Prev" PropertyName="Value" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_PrevCostID" Name="AM_SC_ID_Prev" PropertyName="Value" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Site" Name="AM_SITE_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Cost" Name="AM_SC_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lbl_WeekEnding" Name="AM_WeekEnding" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadDP_Date" Name="AM_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadDP_Date_Started" Name="AM_Date_Started" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadTxt_Reason" Name="AM_Reason" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="RadTxt_Notes" Name="AM_Note" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:ControlParameter ControlID="RadCB_Status" Name="AM_Status" PropertyName="SelectedValue" Type="String" DefaultValue="Planning" />
                    <asp:ControlParameter ControlID="HF_Movement_Flag" Name="AM_Movement_Flag" PropertyName="Value" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="AM_Created_By" PropertyName="Text" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="AM_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Update_AssetList" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="AM_ASSET_MOVEMENTS_AL_UPDATE_SP"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="AM_A_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadDP_Date" Name="AM_Date" Type="DateTime" DefaultValue="1900-01-01" />
                    <asp:ControlParameter ControlID="RadCB_Site" Name="AM_SITE_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="RadCB_Cost" Name="AM_SC_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    <asp:ControlParameter ControlID="HF_Movement_Flag" Name="AM_Movement_Flag" PropertyName="Value" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS SITE_ID, '*Not Specified' AS SITE_Name UNION ALL SELECT SITE_ID, SITE_Name FROM SITE WHERE (SITE_Status = 1) AND (SITE_Category = 'Site') ORDER BY SITE_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_SC" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS SC_ID, '*Not Specified' AS SC_Ref_Name UNION ALL SELECT SC_ID, SC_Ref_Name FROM SITE_Cost WHERE (SC_Status = 1) ORDER BY SC_Ref_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_Asset" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS A_ID, '*Not Specified' AS A_Asset_ID UNION ALL SELECT A_ID, A_Asset_ID FROM ASSET WHERE (A_Status NOT IN ('Trash', 'Delete')) AND (A_ID NOT IN (SELECT AM_A_ID FROM ASSET_MOVEMENT WHERE (AM_Status IN ('Planning', 'Approved')))) ORDER BY A_Asset_ID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_GetSite" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT ASSET.A_SITE_ID AS PrevSiteID, SITE.SITE_Name AS PrevSite, ASSET.A_SC_ID AS PrevCostID, SITE_Cost.SC_Ref_Name AS PrevCost FROM ASSET INNER JOIN SITE ON ASSET.A_SITE_ID = SITE.SITE_ID LEFT OUTER JOIN SITE_Cost ON ASSET.A_SC_ID = SITE_Cost.SC_ID WHERE (ASSET.A_ID = @A_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Email" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_ASSET_MOVEMENT_sp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Request_Email" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_ASSET_MOVEMENT_REQUEST_sp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_GetWeekEnding" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="WEEKENDING_FROM_DATE" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadDP_Date" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_PrevSiteID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_PrevCostID" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Prev_Site" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Prev_Cost" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_Date">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_WeekEnding" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_Movement_Flag" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET - Request Movement" CodeFile="flt_AM_ASSET_MOVEMENTS_ADD_REQUEST_RW.aspx.vb" Inherits="AM_ASSET_MOVEMENTS_ADD_REQUEST_RW" %>

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

        .style7 {
            font-size: 20px;
            height: 25px;
        }

        .style13 {
            width: 143px;
        }

        .auto-style1 {
            width: 4px;
        }

        .auto-style2 {
            height: 45px;
            width: 74px;
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
            //var ThisVal = document.getElementById('lbl_Table').innerHTML;
            oWnd.close();
            top.location.href = top.location.href;
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
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #E46C0A;" class="auto-style2">
                                <img alt="" src="../IMAGES/Icons/ASSET_MOVEMENT.PNG" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #E46C0A;">REQUEST MOVEMENT
                        <asp:Label ID="LblPreviousPage" runat="server" BackColor="#E46C0A" ForeColor="#E46C0A" Visible="False" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#E46C0A" Font-Size="1pt"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
                        <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style13">&nbsp;</td>
                                    <td class="style7">
                                        <strong>&nbsp; 
                                        </strong></td>
                                    <td class="style7"></td>
                                    <td class="style7">&nbsp;</td>
                                    <td class="style7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Asset:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Asset" runat="server" AutoPostBack="True" AllowCustomText="True" DataSourceID="SqlDS_CB_Asset" DataTextField="A_Asset_ID" DataValueField="A_ID" Filter="Contains">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Current Location:</td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Prev_Site" runat="server"></asp:Label>
                                        
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Current_Cost_Location" runat="server" Text="Current Cost Location:"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label ID="lbl_Prev_Cost" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">New Location:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Site" runat="server" DataSourceID="SqlDS_CB_Site" DataTextField="SITE_Name" DataValueField="SITE_ID" ResolvedRenderMode="Classic" Skin="Default" Width="200px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Cost_Location" runat="server" Text="New Cost Location:"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Cost" runat="server" DataSourceID="SqlDS_CB_SC" DataTextField="SC_Ref_Name" DataValueField="SC_ID" ResolvedRenderMode="Classic" Skin="Default" Width="200px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Proposed Date of Movement:</td>
                                    <td colspan="2">
                                        <telerik:RadDatePicker ID="RadDP_Date" runat="server" AutoPostBack="True" Skin="Default">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Default" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput AutoPostBack="True" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
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
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">Reason for Movement:</td>
                                    <td colspan="2">
                                        <telerik:RadTextBox ID="RadTxt_Reason" Runat="server" Height="78px" TextMode="MultiLine" Width="100%">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="padding-right: 20px"></td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <table class="style_table_general">
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lbl_WeekEnding" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                    </td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Skin="Default"
                                            Text="Submit" Width="100px" Visible="False">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13" style="padding-right: 20px">
                                        <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                        &nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow"
                                            Skin="Default" Text="Cancel" Width="100px">
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
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_A_ID" runat="server" />
            <asp:HiddenField ID="HF_PrevSiteID" runat="server" />
            <asp:HiddenField ID="HF_PrevCostID" runat="server" />
            <asp:HiddenField ID="HF_Movement_Flag" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Status" runat="server" />
            <telerik:RadNotification ID="RadNotify" runat="server" Position="Center" Title="FLEET - Asset ID of Movement Issue" Height="150px" Skin="Default" TitleMenuToolTip="" Width="400px" EnableRoundedCorners="True" Font-Names="Segoe UI">
            </telerik:RadNotification>
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
            <asp:SqlDataSource ID="SqlDS_CB_Site" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS SITE_ID, '*Not Specified' AS SITE_Name UNION ALL SELECT SITE_ID, SITE_Name FROM SITE WHERE (SITE_Status = 1) AND (SITE_Category = 'Site') ORDER BY SITE_Name"></asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_CB_SC" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT 0 AS SC_ID, '*Not Specified' AS SC_Ref_Name UNION ALL SELECT SC_ID, SC_Ref_Name FROM SITE_Cost WHERE (SC_Status = 1) ORDER BY SC_Ref_Name"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_GetWeekEnding" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="WEEKENDING_FROM_DATE" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadDP_Date" DbType="Date" Name="Date" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Request_Email" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="EMAIL_ASSET_MOVEMENT_REQUEST_sp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
                    <asp:Parameter DefaultValue="1900-01-01" Name="AM_Date_Started" Type="DateTime" />
                    <asp:ControlParameter ControlID="RadTxt_Reason" Name="AM_Reason" PropertyName="Text" Type="String" DefaultValue="abc" />
                    <asp:Parameter DefaultValue="abc" Name="AM_Note" Type="String" />
                    <asp:Parameter DefaultValue="Planning" Name="AM_Status" Type="String" />
                    <asp:ControlParameter ControlID="HF_Movement_Flag" Name="AM_Movement_Flag" Type="Int32" DefaultValue="0" PropertyName="Value" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="AM_Created_By" PropertyName="Text" Type="String" DefaultValue="0" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="AM_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_PrevSiteID" />
                            <telerik:AjaxUpdatedControl ControlID="HF_PrevCostID" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Prev_Site" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Prev_Cost" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadDP_Date">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_WeekEnding" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Save" />
                             <telerik:AjaxUpdatedControl ControlID="RadNotify" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


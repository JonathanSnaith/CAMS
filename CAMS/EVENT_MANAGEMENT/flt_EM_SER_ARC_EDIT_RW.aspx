<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Edit Last Service Archive Entry" CodeFile="flt_EM_SER_ARC_EDIT_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_SER_ARC_EDIT_RW" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
     <link rel="shortcut icon" href="../IMAGES/fleet_16.ico"/> 
    <style type="text/css">    
        .style1
        {
            text-align: right;
        }
        .style3
        {
            height: 45px;
            width: 592px;
        }
        .style7
        {
            height: 36px;
        }
        .style9
        {
            text-align: right;
            width: 137px;
        }
        .style12
        {
            text-align: right;
            height: 36px;
            width: 140px;
        }
        .style13
        {
            text-align: right;
            width: 140px;
        }
        .auto-style1 {
            height: 45px;
            width: 77px;
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
    <form id="form1" runat="server" >
    <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;" >
    <telerik:RadSplitter ID="RadSplitter1" Runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
        <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
        <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
            <table cellspacing="0" style="width: 100%">
                <tr>
                    <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 10px; background-color: #E46C0A;" class="auto-style1">
                        <img alt=""  src="../IMAGES/Icons/EVENT_SERVICE.png" id="ImgHome"  onclick="fn_home()" style="cursor: pointer"/>
                    </td>
                    <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #E46C0A; padding-right: 10px;">
                        EDIT LAST ARCHIVE ENTRY
                        <asp:Label ID="LblPreviousPage" runat="server" BackColor="#E46C0A" ForeColor="#E46C0A" Text="" Visible="False" Font-Size="1pt"></asp:Label>
                        <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#E46C0A" Font-Size="1pt" ></asp:Label>
                        <asp:Label ID="lbl_Site_ID" runat="server" ForeColor="#E46C0A" Font-Size="1pt" ></asp:Label>
                        <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#E46C0A"></asp:Label>
                    </td>
                </tr>
                </table>
                        <telerik:RadMultiPage ID="RadMultiPage1" runat="server"> 
                                <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                        <table class="style_table_general" >
                            <tr>
                                <td class="style12">
                                    &nbsp;</td> 
                                <td class="style7">
                                    <strong>&nbsp; </strong></td>
                                <td class="style7">
                                    </td>
                                <td class="style7">
                                    &nbsp;</td>
                                <td class="style7">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    Asset:</td>
                                <td>
                                    <asp:Label ID="lbl_Asset" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-left: 20px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    Site:</td>
                                <td>
                                    <asp:Label ID="lbl_Site" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-left: 20px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    <asp:Label ID="lbl_Date_Text" runat="server" Text="Service Date:"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadDatePicker ID="RadDP_Date" Runat="server" Skin="Default">
                                        <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" 
                                            Skin="Default" UseColumnHeadersAsSelectors="False" 
                                            UseRowHeadersAsSelectors="False">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today" />
                                            </SpecialDays>
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
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-left: 20px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            </table>
                            <table ID="TableSMU" runat="server" class="style_table_general" >
                            <tr>
                                <td class="style9" style="padding-right: 20px">
                                    <asp:Label ID="lbl_Cycle_Text" runat="server" Text="Cycle:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Cycle" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-left: 20px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9" style="padding-right: 20px">
                                    <asp:Label ID="lbl_Service_SMU_Text" runat="server" Text="Service SMU:"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadNumericTextBox ID="RadNumTxt_ServiceSMU" Runat="server" AutoPostBack="True" Skin="Default" Width="100px">
                                        <NegativeStyle Resize="None" />
                                        <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </telerik:RadNumericTextBox>
                                </td>
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-right: 5px;">
                                    <asp:Label ID="lbl_Previous_SMU_Text" runat="server" Text="Previous SMU:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Previous_SMU" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                                <tr>
                                    <td class="style9" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Counter_Text" runat="server" Text="Counter:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Counter" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td style="padding-left: 20px">
                                        &nbsp;</td>
                                    <td class="style1" style="padding-right: 5px;">
                                        <asp:Label ID="lbl_Left_Text" runat="server" Text="Left:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Left" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                            <tr>
                                <td class="style9" style="padding-right: 20px">
                                    <asp:Label ID="lbl_Current_Service_Type_Text" runat="server" Text="Service Type:"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_ServiceType" Runat="server" 
                                        AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_ServiceType" 
                                        DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" 
                                        ResolvedRenderMode="Classic" Skin="Default" Width="100px">
                                    </telerik:RadComboBox>
                                </td>
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-left: 20px">
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="lbl_Service_Type_ID" runat="server" Font-Bold="False" ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                            </table>
                            <table class="style_table_general" >
                            <tr>
                                <td class="style9" style="padding-right: 20px">
                                    <asp:Label ID="lbl_SERA_ID" runat="server" Font-Bold="False" ForeColor="White"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-left: 20px">
                                    &nbsp;</td>
                                <td style="padding-left: 20px">
                                    <telerik:RadButton ID="Btn_Save" runat="server" BackColor="Red" Skin="Default" Text="Save" Width="100px" Font-Bold="True" ForeColor="Red">
                                    </telerik:RadButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9" style="padding-right: 20px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-left: 20px">
                                            <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                            <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                    &nbsp;</td>
                                <td style="padding-left: 20px">
                                    <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Default" Text="Cancel" Width="100px">
                                    </telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>
            </telerik:RadMultiPage>
                    </telerik:RadPane>
    </telerik:RadSplitter>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
                <asp:HiddenField ID="HF_Username" runat="server" />
                <asp:HiddenField ID="HF_GetDate" runat="server" />
                <asp:HiddenField ID="HF_SessionIP" runat="server" />
                <asp:HiddenField ID="HF_ServiceType" runat="server" />
                <asp:HiddenField ID="HF_Asset" runat="server" />
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
        <asp:SqlDataSource ID="SqlDS_Update" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_ARC_RG_UPDATE_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="lbl_SERA_ID" Name="SERA_ID" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="HF_Asset" Name="SERA_A_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadDP_Date" Name="SERA_Date_Service" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="lbl_Service_Type_ID" Name="SERA_SERT_ID" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadNumTxt_ServiceSMU" Name="SERA_Service_SMU" Type="Double" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Previous_SMU" Name="SERA_Last_SMU" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Counter" Name="SERA_SMU_Diff" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Left" Name="SERA_SMU_Left" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="SERA_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
            </SelectParameters>
           </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlDS_SetNextServiceType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SERVICING_SET_DETAIL" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="HF_Asset" Name="SER_A_ID" PropertyName="Value" Type="String" />
             </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_ServiceType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_RG_INSERT_CB_SERVICE_TYPE_SP" 
            SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="HF_Asset" Name="SER_A_ID" PropertyName="Value" Type="String" />
             </SelectParameters>
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDS_Select" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_ARC_RG_SELECT_RW_SP" 
            SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lbl_SERA_ID" Name="SERA_ID" PropertyName="Text" Type="String" />
                        </SelectParameters>
        </asp:SqlDataSource>
                    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                        <AjaxSettings>
                            <telerik:AjaxSetting AjaxControlID="RadCB_ServiceType">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Service_Type_ID" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                        </AjaxSettings>
        </telerik:RadAjaxManager>
</div>
    </form>
</body>
</html>


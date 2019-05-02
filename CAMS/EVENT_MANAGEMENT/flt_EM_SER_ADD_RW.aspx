<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Add New Asset Service" CodeFile="flt_EM_SER_ADD_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_SER_ADD_RW" %>
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
        .style14
        {
            text-align: right;
            width: 140px;
            height: 26px;
        }
        .style15
        {
            height: 26px;
        }
        .auto-style1 {
            height: 45px;
            width: 84px;
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
                        NEW SERVICE
                        <asp:Label ID="LblPreviousPage" runat="server" BackColor="#E46C0A" ForeColor="#E46C0A" Text="Label" Visible="False" Font-Size="1pt"></asp:Label>
                        <asp:Label ID="lblWhoIsIt" runat="server" ForeColor="#E46C0A" Font-Size="1pt" ></asp:Label>
                        <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#E46C0A"></asp:Label>
                    </td>
                </tr>
                </table>
                        <telerik:RadMultiPage ID="RadMultiPage1" runat="server"> 
                                <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                        <table class="style_table_general" >
                            <tr>
                                <td class="style12">
                                    <em><strong style="padding-left: 15px">GENERAL</strong></em></td> 
                                <td class="style7">
                                    <strong>&nbsp; </strong></td>
                                <td class="style7">
                                    &nbsp;</td>
                                <td class="style7">
                                    &nbsp;</td>
                                <td class="style7">
                                    &nbsp;</td>
                                <td class="style7">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    Asset:</td>
                                <td>
                                    <strong>
                                    <telerik:RadComboBox ID="RadCB_Asset" Runat="server" 
                                        AllowCustomText="True" DataSourceID="SqlDS_CB_ASSET" DataTextField="A_Asset_ID" 
                                        DataValueField="A_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="150px" AutoPostBack="True">
                                    </telerik:RadComboBox>
                                    </strong>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style14" style="padding-right: 20px">
                                    Site:</td>
                                <td class="style15">
                                    <asp:Label ID="lbl_Site" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td class="style15">
                                    <asp:Label ID="lbl_Left_Text" runat="server" Text="Hrs Left:"></asp:Label>
                                </td>
                                <td class="style15">
                                    <asp:Label ID="lbl_Left" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td class="style15">
                                    <asp:Label ID="lbl_Sample_Text" runat="server" Text="Has Sample:"></asp:Label>
                                </td>
                                <td class="style15">
                                    <telerik:RadComboBox ID="RadCB_Sample" Runat="server" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    Trigger:</td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_Trigger" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Text="SMU" Value="SMU" />
                                            <telerik:RadComboBoxItem runat="server" Text="Calendar" Value="Calendar" />
                                            <telerik:RadComboBoxItem runat="server" Text="SMU &amp; Calendar" Value="SMU and Calendar" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Trend_Text" runat="server" Text="Trend:"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadNumericTextBox ID="RadNumTxt_Trend" Runat="server" 
                                        Width="70px">
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
                                <td>
                                    External:</td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_External" Runat="server" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_External" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_External" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    <em><strong style="padding-left: 15px">SMU</strong></em></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <strong><em>CALENDAR</em></strong></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="lbl_Fire_Suppression_Text0" runat="server" Font-Italic="True" style="font-weight: 700" Text="FIRE SUPPRESSION"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Fire_Suppression_Text1" runat="server" Font-Italic="True" style="font-weight: 700" Text="THOROUGH EXAMINATION"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    
                                    
                                    <asp:Label ID="lbl_Cycle_Text" runat="server" Text="Cycle:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Cycle" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Cal_Event_Type_Text" runat="server" Text="Type:"></asp:Label>
                                </td>
                                <td valign="top">
                                    <telerik:RadComboBox ID="RadCB_Cal_Event_Type" Runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Visible="False" Width="250px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" />
                                            <telerik:RadComboBoxItem runat="server" Text="3-Monthly Service" Value="3-Monthly Service" />
                                            <telerik:RadComboBoxItem runat="server" Text="4-Monthly Service" Value="4-Monthly Service" />
                                            <telerik:RadComboBoxItem runat="server" Text="6-Monthly Service" Value="6-Monthly Service" />
                                            <telerik:RadComboBoxItem runat="server" Text="Brake Test" Value="Brake Test" />
                                            <telerik:RadComboBoxItem runat="server" Text="6 Wk Inspection" Value="6 Wk Inspection" />
                                            <telerik:RadComboBoxItem runat="server" Text="6 Wk Inspection (Annual Service)" Value="6 Wk Inspection (Annual Service)" />
                                            <telerik:RadComboBoxItem runat="server" Text="Quarterly Service" Value="Quarterly Service" />
                                            <telerik:RadComboBoxItem runat="server" Text="Service Events" Value="Service Events" />
                                            <telerik:RadComboBoxItem runat="server" Text="Annual Service" Value="Annual Service" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top">
                                    <telerik:RadComboBox ID="RadCB_Fire" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fire" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fire" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top">
                                    <telerik:RadComboBox ID="RadCB_Exam" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    <asp:Label ID="lbl_Counter_Text" runat="server" Text="Hrs Since Last SVC:"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadNumericTextBox ID="RadNumTxt_Counter" Runat="server" AutoPostBack="True" Width="100px">
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
                                <td>
                                    <asp:Label ID="lbl_Cal_Cycle_Text" runat="server" Text="Cycle (Months):"></asp:Label>
                                </td>
                                <td valign="top">
                                    <asp:Label ID="lbl_Cal_Cycle" runat="server"></asp:Label>
                                </td>
                                <td valign="top">
                                    <telerik:RadComboBox ID="RadCB_Fire_Cycle" Runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Visible="False" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fire_Cycle" Text="6" Value="6" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fire_Cycle" Text="12" Value="12" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top">
                                    <telerik:RadComboBox ID="RadCB_Exam_Cycle" Runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Visible="False" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam_Cycle" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam_Cycle" Text="6" Value="6" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam_Cycle" Text="12" Value="12" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    <asp:Label ID="lbl_ServiceType_Text" runat="server" Text="Next Service Type:"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_ServiceType" Runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_ServiceType" 
                                        DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="100px">
                                    </telerik:RadComboBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Cal_Due_Date_Text0" runat="server" Text="Due Date:"></asp:Label>
                                </td>
                                <td valign="top">
                                    <telerik:RadDatePicker ID="RadDP_Due_Date" Runat="server" Visible="False">
                                        <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" 
                                            UseRowHeadersAsSelectors="False">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today" >
                                                    <ItemStyle BackColor="#FFC5A8" />
                                                </telerik:RadCalendarDay>
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
                                <td valign="top">
                                    <telerik:RadDatePicker ID="RadDP_Fire_Date" Runat="server" Visible="False">
                                        <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" 
                                            UseRowHeadersAsSelectors="False">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today" >
                                                    <ItemStyle BackColor="#FFC5A8" />
                                                </telerik:RadCalendarDay>
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
                                <td valign="top">
                                    <telerik:RadDatePicker ID="RadDP_Exam_Date" Runat="server" Visible="False">
                                        <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" 
                                            UseRowHeadersAsSelectors="False">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today" >
                                                    <ItemStyle BackColor="#FFC5A8" />
                                                </telerik:RadCalendarDay>
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
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    <asp:Label ID="lbl_Status" runat="server" Text="Status:" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="RadCB_Status" Runat="server" 
                                        DataSourceID="SqlDS_CB_Status" DataTextField="ATT_Name" DataValueField="ATT_ID" 
                                        ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Cal_Status0" runat="server" Text="Status:"></asp:Label>
                                </td>
                                <td valign="top">
                                    <telerik:RadComboBox ID="RadCB_Cal_Status" Runat="server" 
                                        DataSourceID="SqlDS_CB_Cal_Status" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" ResolvedRenderMode="Classic" 
                                        Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top">
                                    <telerik:RadComboBox ID="RadCB_Fire_Status" Runat="server" 
                                        DataSourceID="SqlDS_CB_Cal_Status" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" ResolvedRenderMode="Classic" 
                                        Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top">
                                    <telerik:RadComboBox ID="RadCB_Exam_Status" Runat="server" 
                                        DataSourceID="SqlDS_CB_Cal_Status" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" ResolvedRenderMode="Classic" 
                                        Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td valign="top">
                                    &nbsp;</td>
                                <td valign="top">
                                    &nbsp;</td>
                                <td valign="top">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    Notes:</td>
                                <td colspan="5">
                                    <telerik:RadTextBox ID="RadTxt_Notes" Runat="server" BackColor="#FFFFDD" Height="100%" LabelWidth="" Rows="4" TextMode="MultiLine" Width="100%">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            </table>
                            <table class="style_table_general" >
                            <tr>
                                <td class="style9" style="padding-right: 20px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td style="padding-left: 20px">
                                    &nbsp;</td>
                                <td class="style1" style="padding-left: 20px">
                                    &nbsp;</td>
                                <td style="padding-left: 20px" align="right">
                                    <telerik:RadButton ID="Btn_Save" runat="server" Text="Save" Width="100px" BackColor="Red" Font-Bold="True" ForeColor="Red">
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
                                <td style="padding-left: 20px" align="right">
                                    <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindowAdd" Text="Cancel" Width="100px">
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
            SelectCommand="EM_SERVICING_RG_INSERT_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="RadCB_Asset" Name="SER_A_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadNumTxt_Counter" Name="SER_SMU_Counter" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Left" Name="SER_SMU_Left" PropertyName="Text"  DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Cycle" Name="SER_Cycle" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadNumTxt_Trend" Name="SER_Trend" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Trigger" Name="SER_Trigger"  DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Sample" Name="SER_Sample"  DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_External" Name="SER_External" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_ServiceType" Name="SER_SERT_ID" PropertyName="SelectedValue" DefaultValue="1006" />
                <asp:ControlParameter ControlID="RadCB_Status" Name="SER_Status_ID" PropertyName="SelectedValue" DefaultValue="1039" />
                <asp:ControlParameter ControlID="RadCB_Cal_Status" Name="SER_Cal_Status_ID" PropertyName="SelectedValue" DefaultValue="1039" />
                <asp:ControlParameter ControlID="RadCB_Fire_Status" Name="SER_Fire_Status_ID" PropertyName="SelectedValue"  DefaultValue="1039" />
                <asp:ControlParameter ControlID="RadCB_Exam_Status" Name="SER_Exam_Status_ID" PropertyName="SelectedValue" DefaultValue="1039" />
                <asp:ControlParameter ControlID="RadTxt_Notes" Name="SER_Notes" PropertyName="Text" Type="String" DefaultValue="abc" />
                <asp:ControlParameter ControlID="RadDP_Due_Date" Name="SER_Cal_Date_Due" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="RadCB_Cal_Event_Type" Name="SER_Cal_Event_Type"  DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Fire" Name="SER_Fire" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Fire_Cycle" Name="SER_Fire_Cycle" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadDP_Fire_Date" Name="SER_Fire_Date" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="RadCB_Exam" Name="SER_Exam" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Exam_Cycle" Name="SER_Exam_Cycle" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadDP_Exam_Date" Name="SER_Exam_Date" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="SER_Created_By" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="SER_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
            </SelectParameters>
           </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_AssetLocation" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT ASSET.A_SITE_ID, SITE.SITE_Name AS SiteName, ATTRIBUTES.ATT_Name AS ServiceType FROM ASSET INNER JOIN SITE ON ASSET.A_SITE_ID = SITE.SITE_ID INNER JOIN ATTRIBUTES ON ASSET.A_ST_ID = ATTRIBUTES.ATT_ID WHERE (ASSET.A_ID = @A_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Asset" Name="A_ID" PropertyName="SelectedValue" />
                </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_ASSET" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT A_ID, A_Asset_ID FROM ASSET WHERE (NOT EXISTS (SELECT SER_A_ID FROM SERVICING WHERE (SER_A_ID = ASSET.A_ID))) AND (A_Status NOT IN ('Trash', 'Delete')) AND (A_Activity_Status NOT IN ('Disposed')) AND (A_Service = 1) ORDER BY A_Asset_ID">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_CB_Cal_Status" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'Service_Status') AND (ATT_ID NOT IN (1038, 1043, 1040, 1242, 1033, 1126, 1115, 1240)) ORDER BY ATT_SP_ID">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_CB_Status" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'Service_Status') AND (ATT_ID &lt;&gt; 1038) ORDER BY ATT_SP_ID">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_ServiceType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_RG_INSERT_CB_SERVICE_TYPE_SP" 
            SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="RadCB_Asset" Name="SER_A_ID" PropertyName="SelectedValue" Type="String" />
             </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_SetMode" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SERVICING_MODE" 
            SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_SetDetail" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SERVICING_SET_DETAIL" 
            SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="RadCB_Asset" Name="SER_A_ID" PropertyName="SelectedValue" Type="String" />
             </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_GetWeekEnding" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="WEEKENDING_FROM_DATE" SelectCommandType="StoredProcedure">
             <SelectParameters>
                   <asp:ControlParameter ControlID="HF_GetDate" Name="Date" PropertyName="Value"  />
             </SelectParameters>
        </asp:SqlDataSource>
                    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                        <AjaxSettings>
                            <telerik:AjaxSetting AjaxControlID="RadCB_Asset">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Site" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_SMU_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cycle_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Counter_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Counter" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Left_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Left" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_ServiceType" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                             <telerik:AjaxSetting AjaxControlID="RadCB_Trigger">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="lbl_WeekEnding_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_WeekEnding" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Cal_Event_Type" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Sample_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Sample" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Due_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Fire_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Exam_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Cal_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cycle_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Counter_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Counter" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Left_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Left" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Mode_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_ServiceMode" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Trend_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Trend" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_ServiceType_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_ServiceType" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_ServiceType" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                             <telerik:AjaxSetting AjaxControlID="RadCB_Fire">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Fire_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Status" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadCB_Exam">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Exam_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Status" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                        </AjaxSettings>
        </telerik:RadAjaxManager>
</div>
    </form>
</body>
</html>


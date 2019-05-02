<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Event Management - Edit Asset Service" CodeFile="flt_EM_SER_EDIT_RW.aspx.vb" Inherits="EVENT_MANAGEMENT_flt_EM_SER_EDIT_RW" %>
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
            width: 203px;
        }
        .style7
        {
            font-size: 20px;
            height: 25px;
        }
        .style13
        {
        }
        .style20
        {
            width: 339px;
        }
        .style21
        {
            width: 115px;
        }
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            height: 45px;
            width: 70px;
        }
        .auto-style3 {
            width: 634px;
        }
        .auto-style6 {
            width: 223px;
        }
        .auto-style8 {
            width: 148px;
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
    }
    function closeWindow() {
        var oWnd = GetRadWindow();
        var ThisVal = document.getElementById('HF_SER_ID').value;
        oWnd.close(ThisVal);
    }
    </script>
    <form id="form1" runat="server" >
    <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;" >
    <telerik:RadSplitter ID="RadSplitter1" Runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
        <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
        <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
            <table cellspacing="0" style="width: 100%">
                <tr>
                    <td align="left" class="auto-style2" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #E46C0A;">
                        <img alt=""  src="../IMAGES/Icons/EVENT_SERVICE.png" id="ImgHome"  onclick="fn_home()" style="cursor: pointer"/>
                        
                        </td>
                    <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; padding-right: 10px;" class="auto-style3">
                        EDIT SERVICE
                        <asp:Label ID="lblGUID" runat="server" Font-Size="1pt" ForeColor="#E46C0A"></asp:Label>
                        <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1pt" ForeColor="#E46C0A"></asp:Label>
                        <asp:Label ID="LblPreviousPage" runat="server" BackColor="#E46C0A" Font-Size="1pt" ForeColor="#E46C0A" Visible="False"></asp:Label>
                    </td>
                    <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;">
                        modified
                        <asp:Label ID="lbl_Modified" runat="server" Text=""></asp:Label>
                        &nbsp;by
                        <asp:Label ID="lbl_Modified_By" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                </table>
                        <telerik:RadMultiPage ID="RadMultiPage1" runat="server"> 
                 <telerik:RadPageView ID="RadPV_GENERAL" runat="server" Selected="True">
                        <table class="style_table_general" cellspacing="0" >
                            <tr>
                                <td class="style13" style="border-top-style: solid; border-top-color: #000000; border-top-width: 2px; border-left-width: 2px; border-left-color: #000000; border-bottom-width: 2px; border-bottom-color: #000000; border-bottom-style: solid; border-left-style: solid; background-color: #CCCCCC;">
                                    <em><strong>GENERAL</strong></em></td> 
                                <td class="style7" style="border-top-style: solid; border-top-color: #000000; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-bottom-color: #000000; background-color: #CCCCCC;">
                                    <strong>&nbsp; </strong></td>
                                <td class="style7" style="border-top-style: solid; border-top-color: #000000; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-bottom-color: #000000; background-color: #CCCCCC;">
                                    &nbsp;</td>
                                <td class="style21" style="border-top-style: solid; border-top-color: #000000; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-bottom-color: #000000; background-color: #CCCCCC;">
                                    &nbsp;</td>
                                <td class="auto-style6" style="border-top-style: solid; border-top-color: #000000; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-bottom-color: #000000; background-color: #CCCCCC;">
                                    &nbsp;</td>
                                <td class="auto-style8" style="border-top-style: solid; border-top-color: #000000; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-bottom-color: #000000; background-color: #CCCCCC;">&nbsp;</td>
                                <td class="style13" style="border-top-style: solid; border-top-color: #000000; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-bottom-color: #000000; background-color: #CCCCCC;">
                                    &nbsp;</td>
                                <td class="style13" style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000; border-top-style: solid; border-top-width: 2px; border-top-color: #000000; background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
                                    Asset:</td>
                                <td>
                                    <asp:Label ID="lbl_Asset" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style21">
                                    Model:</td>
                                <td align="center" class="auto-style6">
                                    <asp:Label ID="lbl_Model" runat="server" Font-Bold="False"></asp:Label>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>
                                    <asp:Label ID="lbl_Latest_SMU_Date_Text" runat="server" Text="Latest SMU Reading:"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <asp:Label ID="lbl_Latest_SMU_Date" runat="server" Font-Bold="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
                                    Site:</td>
                                <td>
                                    <asp:Label ID="lbl_Site" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td align="left">
                                    &nbsp;</td>
                                <td align="left" class="style21">
                                    <asp:Label ID="lbl_Left_Text" runat="server" Text="Hrs Left:"></asp:Label>
                                </td>
                                <td align="center" class="auto-style6">
                                    <asp:Label ID="lbl_Left" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td align="left" class="auto-style8">&nbsp;</td>
                                <td align="left">
                                    <asp:Label ID="lbl_Sample_Text" runat="server" Text="Has Sample:"></asp:Label>
                                </td>
                                <td align="left" style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_Sample" Runat="server" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
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
                                    &nbsp;</td>
                                <td class="style21">
                                    <asp:Label ID="lbl_Trend_Text" runat="server" Text="Trend:"></asp:Label>
                                </td>
                                <td align="center" class="auto-style6">
                                    <asp:Label ID="lbl_Trend" runat="server" Font-Bold="True" ToolTip="(Average Usage across previous year where Usage is between 1 and 500)"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:Label ID="lbl_TrueTrend" runat="server" Font-Bold="True" ForeColor="Red" ToolTip="(Average Usage across previous year where Usage is between 1 and 500)" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    External:</td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_External" Runat="server" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_External" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_External" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr >
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
                                    &nbsp;</td>
                                <td >
                                    <asp:Label ID="lbl_ServiceType" runat="server" Font-Bold="False" ForeColor="White"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style21">
                                    <asp:Label ID="lbl_Trend_Override_Text" runat="server" Text="Trend Override:"></asp:Label>
                                </td>
                                <td align="center" class="auto-style6">
                                    <telerik:RadNumericTextBox ID="RadNumTxt_Trend_Override" Runat="server" AutoPostBack="True" Width="50px">
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
                                <td class="auto-style8">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000; border-top-style: solid; border-top-width: 2px; border-top-color: #000000; border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000;" bgcolor="#CCCCCC">
                                    <em><strong>SMU</strong></em></td>
                                <td bgcolor="#CCCCCC" style="border-top-style: solid; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-top-color: #000000; border-bottom-color: #000000; border-right-style: solid; border-right-width: 2px; border-right-color: #000000;">
                                    &nbsp;</td>
                                <td bgcolor="#CCCCCC" style="border-top-style: solid; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-top-color: #000000; border-bottom-color: #000000">
                                    &nbsp;</td>
                                <td class="style21" bgcolor="#CCCCCC" style="border-top-style: solid; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-top-color: #000000; border-bottom-color: #000000">
                                    <strong><em>CALENDAR</em></strong></td>
                                <td bgcolor="#CCCCCC" style="border-top-style: solid; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-top-color: #000000; border-bottom-color: #000000; border-right-style: dashed; border-right-width: 2px; border-right-color: #000000;" colspan="2">
                                    &nbsp;</td>
                                <td bgcolor="#CCCCCC" style="border-top-style: solid; border-bottom-style: solid; border-top-width: 2px; border-bottom-width: 2px; border-top-color: #000000; border-bottom-color: #000000; border-right-style: dashed; border-right-width: 2px; border-right-color: #000000;">
                                    <asp:Label ID="lbl_Fire_Suppression_Text" runat="server" Font-Italic="True" style="font-weight: 700" Text="FIRE SUPPRESSION"></asp:Label>
                                </td>
                                <td bgcolor="#CCCCCC" style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000; border-top-style: solid; border-top-width: 2px; border-top-color: #000000; border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000;">
                                    <asp:Label ID="lbl_Fire_Suppression_Text0" runat="server" Font-Italic="True" style="font-weight: 700" Text="THOROUGH EXAMINATION"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
                                    <asp:Label ID="lbl_Cycle_Text" runat="server" Text="Cycle:"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadNumericTextBox ID="RadNumTxt_Cycle" Runat="server" AutoPostBack="True" Width="100px">
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
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                                <td style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000" colspan="2">
                                    &nbsp;</td>
                                <td style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000">
                                    &nbsp;</td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
                                    <asp:Label ID="lbl_Counter_Text" runat="server" Text="Hrs Since Last Svc:"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
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
                                    &nbsp;</td>
                                <td class="style21">
                                    <asp:Label ID="lbl_Cal_Event_Type_Text" runat="server" Text="Type:"></asp:Label>
                                </td>
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000" colspan="2">
                                    <telerik:RadComboBox ID="RadCB_Cal_Event_Type" Runat="server" 
                                        AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="250px">
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
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_Fire" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fire" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fire" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top" style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_Exam" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
                                    <asp:Label ID="lbl_Mode_Text" runat="server" Text="Mode:"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_ServiceMode" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Text="Mode A" Value="1" />
                                            <telerik:RadComboBoxItem runat="server" Text="Mode B" Value="2" />
                                            <telerik:RadComboBoxItem runat="server" Text="Mode C" Value="3" />
                                            <telerik:RadComboBoxItem runat="server" Text="Mode D" Value="4" />
                                            <telerik:RadComboBoxItem runat="server" Text="Mode E" Value="5" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style21">
                                    <asp:Label ID="lbl_Cal_Cycle_Text" runat="server" Text="Cycle (Months):"></asp:Label>
                                </td>
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000" colspan="2">
                                    <asp:Label ID="lbl_Cal_Cycle" runat="server"></asp:Label>
                                </td>
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_Fire_Cycle" Runat="server" 
                                        AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fire_Cycle" Text="6" Value="6" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fire_Cycle" Text="12" Value="12" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top" style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_Exam_Cycle" Runat="server" 
                                        AllowCustomText="True" AutoPostBack="True" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam_Cycle" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam_Cycle" Text="6" Value="6" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Exam_Cycle" Text="12" Value="12" />
                                            <telerik:RadComboBoxItem runat="server" Text="18" Value="18" />
                                            <telerik:RadComboBoxItem runat="server" Text="24" Value="24" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
                                    <asp:Label ID="lbl_ServiceType_Text" runat="server" Text="Next Service Type:"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_ServiceType" Runat="server" AutoPostBack="True" 
                                        DataSourceID="SqlDS_ServiceType0" DataTextField="ATT_Name" 
                                        DataValueField="SERD_ID" ResolvedRenderMode="Classic" Width="100px">
                                    </telerik:RadComboBox>
                                    <asp:Label ID="lbl_ST" runat="server" Font-Italic="True" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style21" valign="top">
                                    <asp:Label ID="lbl_Cal_Due_Date_Text" runat="server" Text="Due Date:"></asp:Label>
                                </td>
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000" colspan="2">
                                    <telerik:RadDatePicker ID="RadDP_Due_Date" Runat="server">
                                        <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" 
                                            UseRowHeadersAsSelectors="False">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
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
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadDatePicker ID="RadDP_Fire_Date" Runat="server">
                                        <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" 
                                            UseRowHeadersAsSelectors="False">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
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
                                <td valign="top" style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadDatePicker ID="RadDP_Exam_Date" Runat="server">
                                        <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay ItemStyle-BackColor="#FFC5A8" Repeatable="Today">
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
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;">
                                    <asp:Label ID="lbl_SMU_Override_Text" runat="server" Text="Override:"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_Override_SMU" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Override_SMU" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Override_SMU" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style21">
                                    <asp:Label ID="lbl_Cal_Override_Text" runat="server" Text="Override:"></asp:Label>
                                </td>
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000" colspan="2">
                                    <telerik:RadComboBox ID="RadCB_Override_Cal" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Override_Cal" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Override_Cal" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_Override_Fire" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Override_Fire" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Override_Fire" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top" style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000">
                                    <telerik:RadComboBox ID="RadCB_Override_Exam" Runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Width="100px">
                                        <Items>
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Override_Exam" Value="0" />
                                            <telerik:RadComboBoxItem runat="server" Owner="RadCB_Override_Exam" Text="Yes" Value="1" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000; border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000;">
                                    <asp:Label ID="lbl_Status" runat="server" Text="Status:" Visible="False"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000; border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000;">
                                    <telerik:RadComboBox ID="RadCB_Status" Runat="server" AutoPostBack="True" 
                                        DataSourceID="SqlDS_CB_Status" DataTextField="ATT_Name" DataValueField="ATT_ID" 
                                        ResolvedRenderMode="Classic" Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td style="border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000">
                                    &nbsp;</td>
                                <td class="style21" style="border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000">
                                    <asp:Label ID="lbl_Cal_Status" runat="server" Text="Status:"></asp:Label>
                                </td>
                                <td valign="top" style="border-right-style: dashed; border-right-width: 2px; border-right-color: #000000; border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000;" colspan="2">
                                    <telerik:RadComboBox ID="RadCB_Cal_Status" Runat="server" 
                                        DataSourceID="SqlDS_CB_Cal_Status" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" ResolvedRenderMode="Classic" 
                                        Visible="False">
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top" style="border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000; border-right-style: dashed; border-right-width: 2px; border-right-color: #000000;">
                                    <telerik:RadComboBox ID="RadCB_Fire_Status" Runat="server" 
                                        DataSourceID="SqlDS_CB_Cal_Status" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" ResolvedRenderMode="Classic">
                                    </telerik:RadComboBox>
                                </td>
                                <td valign="top" style="border-right-style: solid; border-right-width: 2px; border-right-color: #000000; border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000;">
                                    <telerik:RadComboBox ID="RadCB_Exam_Status" Runat="server" 
                                        DataSourceID="SqlDS_CB_Cal_Status" DataTextField="ATT_Name" 
                                        DataValueField="ATT_ID" ResolvedRenderMode="Classic">
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
                                <td class="style21">
                                    &nbsp;</td>
                                <td valign="top" class="auto-style6">
                                    &nbsp;</td>
                                <td class="auto-style8" valign="top">&nbsp;</td>
                                <td valign="top">
                                    &nbsp;</td>
                                <td valign="top">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
                                    Notes:</td>
                                <td colspan="7">
                                    <telerik:RadTextBox ID="RadTxt_Notes" Runat="server" BackColor="#FFFFDD" 
                                        Height="100%" LabelWidth="" Rows="4" TextMode="MultiLine" Width="100%">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            </table>
                            <table class="style_table_general" >
                            <tr>
                                <td class="auto-style1" style="padding-left: 20px;" colspan="4">
                                    <asp:Label ID="lbl_CloseMessage" runat="server" Font-Bold="True" ForeColor="Red" Visible="False" Font-Italic="True"></asp:Label>
                                </td>
                                <td style="padding-left: 20px" align="right" class="auto-style1">
                                    <telerik:RadButton ID="Btn_Save" runat="server" BackColor="Red" Text="Save" Width="100px" Font-Bold="True" ForeColor="Red">
                                    </telerik:RadButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13" style="padding-right: 20px">
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
                                    <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Text="Cancel" Width="100px">
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
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_SER_ID" runat="server" />
            <asp:HiddenField ID="HF_Status" runat="server" />
            <asp:HiddenField ID="HF_Cal_Status" runat="server" />
            <asp:HiddenField ID="HF_Fire_Status" runat="server" />
            <asp:HiddenField ID="HF_Exam_Status" runat="server" />
            <asp:HiddenField ID="HF_Asset_ID" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
        <asp:HiddenField ID="HF_EXCEPTION_8_R" runat="server" Value="0" />
<asp:HiddenField ID="HF_EXCEPTION_8_RW" runat="server" Value="0" />
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
            SelectCommand="EM_SER_RG_SELECT_RW_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="HF_SER_ID" Name="SER_ID" PropertyName="Value" />
            </SelectParameters>
           </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Update" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_RG_UPDATE_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="HF_SER_ID" Name="SER_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="HF_Asset_ID" Name="SER_A_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadNumTxt_Counter" Name="SER_SMU_Counter" Type="Double" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Left" Name="SER_SMU_Left" PropertyName="Text" Type="String" DefaultValue="0" />
                 <asp:ControlParameter ControlID="RadNumTxt_Cycle" Name="SER_Cycle" Type="Double" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Trend" Name="SER_Trend" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadNumTxt_Trend_Override" Name="SER_Trend_Override" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Trigger" Name="SER_Trigger" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Sample" Name="SER_Sample" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_External" Name="SER_External" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_ServiceMode" Name="SER_Mode" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_ServiceType" Name="SER_SERD_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_ServiceType" Name="SER_SERT_ID" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Status" Name="SER_Status_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Cal_Status" Name="SER_Cal_Status_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Fire_Status" Name="SER_Fire_Status_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Exam_Status" Name="SER_Exam_Status_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadTxt_Notes" Name="SER_Notes" PropertyName="Text" Type="String" DefaultValue="abc" />
                <asp:ControlParameter ControlID="RadDP_Due_Date" Name="SER_Cal_Date_Due" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="RadCB_Cal_Event_Type" Name="SER_Cal_Event_Type" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Fire" Name="SER_Fire" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Fire_Cycle" Name="SER_Fire_Cycle" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadDP_Fire_Date" Name="SER_Fire_Date" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="RadCB_Exam" Name="SER_Exam" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Exam_Cycle" Name="SER_Exam_Cycle" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadDP_Exam_Date" Name="SER_Exam_Date" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="SER_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
            </SelectParameters>
           </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Override_Cal" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_RG_MANUAL_OVERRIDE_CAL_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="HF_SER_ID" Name="SER_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="HF_Asset_ID" Name="SER_A_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Trigger" Name="SER_Trigger" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Cal_Status" Name="SER_Cal_Status_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadTxt_Notes" Name="SER_Notes" PropertyName="Text" Type="String" DefaultValue="abc" />
                <asp:ControlParameter ControlID="RadDP_Due_Date" Name="SER_Cal_Date_Due" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="RadCB_Cal_Event_Type" Name="SER_Cal_Event_Type" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Override_Cal" Name="SER_Manual" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="SER_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
            </SelectParameters>
           </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Override_Fire" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_RG_MANUAL_OVERRIDE_FIRE_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="HF_SER_ID" Name="SER_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                 <asp:ControlParameter ControlID="HF_Asset_ID" Name="SER_A_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Trigger" Name="SER_Trigger" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Fire_Status" Name="SER_Fire_Status_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadTxt_Notes" Name="SER_Notes" PropertyName="Text" Type="String" DefaultValue="abc" />
                <asp:ControlParameter ControlID="RadCB_Fire" Name="SER_Fire" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Fire_Cycle" Name="SER_Fire_Cycle" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadDP_Fire_Date" Name="SER_Fire_Date" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="RadCB_Override_Fire" Name="SER_Manual" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="SER_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
            </SelectParameters>
           </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlDS_Override_Exam" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_RG_MANUAL_OVERRIDE_EXAM_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="HF_SER_ID" Name="SER_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                 <asp:ControlParameter ControlID="HF_Asset_ID" Name="SER_A_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Trigger" Name="SER_Trigger" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Exam_Status" Name="SER_Exam_Status_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadTxt_Notes" Name="SER_Notes" PropertyName="Text" Type="String" DefaultValue="abc" />
                <asp:ControlParameter ControlID="RadCB_Exam" Name="SER_Exam" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Exam_Cycle" Name="SER_Exam_Cycle" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadDP_Exam_Date" Name="SER_Exam_Date" Type="DateTime" DefaultValue="1900-01-01" />
                <asp:ControlParameter ControlID="RadCB_Override_Exam" Name="SER_Manual" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="SER_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
            </SelectParameters>
           </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlDS_Override_SMU" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="EM_SERVICING_RG_MANUAL_OVERRIDE_SMU_SP" 
            SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:ControlParameter ControlID="HF_SER_ID" Name="SER_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="HF_Asset_ID" Name="SER_A_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadNumTxt_Counter" Name="SER_SMU_Counter" Type="Double" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Left" Name="SER_SMU_Left" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadNumTxt_Cycle" Name="SER_Cycle" Type="Double" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_Trend" Name="SER_Trend" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Trigger" Name="SER_Trigger" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Sample" Name="SER_Sample" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_ServiceMode" Name="SER_Mode" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_ServiceType" Name="SER_SERD_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="lbl_ServiceType" Name="SER_SERT_ID" PropertyName="Text" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Status" Name="SER_Status_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="RadCB_Override_SMU" Name="SER_Manual" Type="String" DefaultValue="0" />
                <asp:ControlParameter ControlID="lblWhoIsIt" Name="SER_Modified_By" PropertyName="Text" Type="String" DefaultValue="0" />
            </SelectParameters>
           </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_AssetLocation" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT ASSET.A_SITE_ID, SITE.SITE_Name AS SiteName, ATTRIBUTES.ATT_Name AS ServiceType FROM ASSET INNER JOIN SITE ON ASSET.A_SITE_ID = SITE.SITE_ID LEFT OUTER JOIN ATTRIBUTES ON ASSET.A_ST_ID = ATTRIBUTES.ATT_ID WHERE (ASSET.A_ID = @A_ID)">
                <SelectParameters>
                     <asp:ControlParameter ControlID="HF_Asset_ID" Name="A_ID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_CB_ASSET" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT A_ID, A_Asset_ID FROM ASSET WHERE (A_Status NOT IN ('Trash', 'Delete')) AND (A_Activity_Status NOT IN ('Disposed')) AND (A_Service = 1) ORDER BY A_Asset_ID">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_CB_Status" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'Service_Status') AND (ATT_ID &lt;&gt; 1038) ORDER BY ATT_SP_ID">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_SER_Trend_True" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SERVICING_TREND_OVER_168" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="HF_Asset_ID" Name="Asset" PropertyName="Value" Type="Int32" />
             </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_CB_Cal_Status" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'Service_Status') AND (ATT_ID NOT IN (1038, 1043, 1040, 1242, 1033, 1126, 1115, 1240)) ORDER BY ATT_SP_ID">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_ServiceType0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT '- 1' AS ATT_ID, '*Please Select' AS ATT_Name, '-1' AS SERD_ID UNION ALL SELECT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, ATTRIBUTES.ATT_Name, CONVERT (nvarchar(5), SERVICE_TYPE_DETAIL.SERD_ID) AS SERD_ID FROM SERVICE_TYPE_DETAIL INNER JOIN ATTRIBUTES ON SERVICE_TYPE_DETAIL.SERD_SERT_ID = ATTRIBUTES.ATT_ID WHERE (SERVICE_TYPE_DETAIL.SERD_MODE = @SERD_Mode)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="RadCB_ServiceMode" Name="SERD_Mode" PropertyName="SelectedValue" />
             </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_ServiceTypeID" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" 
            SelectCommand="SELECT CONVERT (nvarchar(5), ATTRIBUTES.ATT_ID) AS ATT_ID, CASE CONVERT (nvarchar(5) , SERVICE_TYPE_DETAIL.SERD_ID) WHEN - 1 THEN '-1' ELSE CONVERT (nvarchar(5) , SERVICE_TYPE_DETAIL.SERD_ID) END AS SERD_ID FROM SERVICE_TYPE_DETAIL INNER JOIN ATTRIBUTES ON SERVICE_TYPE_DETAIL.SERD_SERT_ID = ATTRIBUTES.ATT_ID WHERE (SERVICE_TYPE_DETAIL.SERD_ID = @SERD_ID)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="RadCB_ServiceType" Name="SERD_ID" PropertyName="SelectedValue" />
             </SelectParameters>
        </asp:SqlDataSource>
                    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                        <AjaxSettings>
                            <telerik:AjaxSetting AjaxControlID="RadCB_Trigger">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Left_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Left" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Sample_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Sample" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Trend_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Trend_Override_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Trend" />
                                    <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Trend_Override" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cycle_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Counter_Text" />
                                     <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Counter" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Cal_Event_Type" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Mode_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_ServiceMode" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_ServiceType_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_ServiceType" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_ST" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Due_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Fire_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Exam_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_SMU_Override_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Override_SMU" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Override_Cal" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Override_Fire" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Override_Exam" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Cal_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cal_Event_Type_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cal_Cycle_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cal_Due_Date_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cal_Override_Text" />
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cal_Status" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadNumTxt_Cycle">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Left" />
                                    <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Counter" />
                                     <telerik:AjaxUpdatedControl ControlID="RadCB_ServiceMode" />
                                     <telerik:AjaxUpdatedControl ControlID="RadCB_ServiceType" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadNumTxt_Counter">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Left" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadCB_Cal_Event_Type">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="lbl_Cal_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Override_Exam" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadCB_Fire">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Fire_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Override_Fire" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Status" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadCB_Exam">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Cycle" />
                                    <telerik:AjaxUpdatedControl ControlID="RadDP_Exam_Date" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Override_Exam" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Status" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadCB_ServiceType">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="lbl_ServiceType" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadCB_Status">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="HF_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Cal_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Fire_Status" />
                                    <telerik:AjaxUpdatedControl ControlID="RadCB_Exam_Status" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                        </AjaxSettings>
        </telerik:RadAjaxManager>
</div>
    </form>
</body>
</html>


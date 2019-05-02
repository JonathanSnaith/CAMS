<%@ Page Language="VB" AutoEventWireup="false" Title="Customer Management - Customer Satisfaction Survey List - Add/Edit Survey" CodeFile="flt_CUSTOMER_SATISFACTION_SURVEY_LIST_EDIT_RW.aspx.vb" Inherits="CUSTOMER_MANAGEMENT_flt_CUSTOMER_SATISFACTION_SURVEY_LIST_EDIT_RW" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style1 {
            text-align: right;
             color: white;     
        }

        .style3 {
            height: 45px;
            width: 751px;
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
            width: 80px;
        }

        .auto-style3 {
            text-align: right;
            color: white;
            height: 19px;
        }
        .auto-style4 {
            height: 19px;
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
            oWnd.close();
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_CS_ID').value;
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
                            <td align="left" class="auto-style1" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c;">
                                <img id="ImgHome" alt="" onclick="fn_home()" src="../IMAGES/metro_setting_58x58.png" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c; padding-right: 10px;">
                                <asp:Label ID="lblTitle" runat="server" BackColor="#ff661c" Font-Size="16px" ForeColor="White"  Text="ADD/EDIT SURVEY" Visible="true"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="7">
                        <telerik:RadPageView ID="RadPV_ASSET_INFO" runat="server" Selected="True" >                   
                            <table class="style_table_general" style="vertical-align: top;">
                                <tr valign="top">
                                    <td rowspan="13">
                                        &nbsp;</td>
                                    <td style="padding-right: 5px" valign="top">
                                        Customer:</td>
                                    <td class="auto-style4">
                                        <telerik:RadComboBox ID="RadCB_Customer" runat="server" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td class="style1" style="padding-right: 5px;" align="right">Engineer:</td>
                                    <td style="padding-left: 5px">
                                        <telerik:RadComboBox ID="RadCB_Engineer" runat="server" AutoPostBack="True" DataTextField="PER_Fullname" DataValueField="PER_EMP_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 5px">&nbsp;</td>
                                </tr>
                                <tr valign="top">
                                    <td class="auto-style3" style="padding-right: 20px" valign="top">&nbsp;</td>
                                    <td class="auto-style4">
                                        &nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td align="right" class="style1" style="padding-right: 5px;">&nbsp;</td>
                                    <td class="auto-style4" style="padding-left: 20px">&nbsp;</td>
                                    <td class="auto-style4" style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr valign="top">
                                    <td style="padding-right: 5px" valign="top" align="right">1)</td>
                                    <td style="padding-left: 20px">
                                        Interaction with our FSE is a positive one</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q1" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                    <td align="right" class="style1" style="padding-right: 5px;">8)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE communicates with you clearly &amp; concisely</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q8" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                </tr>
                                <tr valign="top">
                                    <td style="padding-right: 5px" valign="top" align="right">2)</td>
                                    <td class="auto-style4" style="padding-left: 20px">
                                        FSE responds to phone calls in a timely manner</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q2" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                    <td align="right" class="style1" style="padding-right: 5px;">9)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE provides sound technical advice &amp; support</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q9" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                </tr>
                                <tr valign="top">
                                    <td align="right" style="padding-right: 5px" valign="top">3)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE is punctual</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q3" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                    <td align="right" class="style1" style="padding-right: 5px;">10)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE is friendly, approachable &amp; helpful</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q10" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                </tr>
                                <tr valign="top">
                                    <td align="right" style="padding-right: 5px" valign="top">4)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE is knowledgeable</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q4" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                    <td align="right" class="style1" style="padding-right: 5px;">11)</td>
                                    <td class="auto-style4" style="padding-left: 20px">In the event of delays, FSE communicates the situation in
                                        <br />
                                        an upfront and courteous manner</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q11" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                </tr>
                                <tr valign="top">
                                    <td align="right" style="padding-right: 5px" valign="top">5)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE arrives to site prepared and ready to work</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q5" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                    <td align="right" class="style1" style="padding-right: 5px;">12)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE responds to queries, complaints &amp; general enquiries in<br /> a friendly &amp; timely manner</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q12" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                </tr>
                                <tr valign="top">
                                    <td align="right" style="padding-right: 5px" valign="top">6)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE adheres to all your site safety &amp; requirements</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q6" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                    <td align="right" class="style1" style="padding-right: 5px;">13)</td>
                                    <td class="auto-style4" style="padding-left: 20px">FSE delivers excellent customer service</td>
                                    <td class="auto-style4" style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q13" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                </tr>
                                <tr>
                                    <td style="padding-right: 5px" align="right">7)</td>
                                    <td style="padding-left: 20px">
                                        FSE conducts themselves in a professional manner</td>
                                    <td style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q7" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                    <td align="right" class="style1" style="padding-right: 5px;">14)</td>
                                    <td style="padding-left: 20px">
                                        Would you recommend our FSE to another organisation?</td>
                                    <td style="padding-left: 5px">
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Q14" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="20px" MaxValue="5" MinValue="0" Skin="Glow" Value="0" Width="50px">
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
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 5px">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td align="right" class="style1" style="padding-right: 5px;">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 5px">&nbsp;</td>
                                    <td align="right" style="padding-right: 5px">
                                        <asp:Label ID="lbl_Total_Text" runat="server" Text="Total" Visible="False"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">
                                        <asp:Label ID="lbl_Total" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td align="right" class="style1" style="padding-right: 5px;">&nbsp;</td>
                                    <td align="right" style="padding-rightt: 5px;">
                                        <asp:Label ID="lbl_Total_PCT_Text" runat="server" Text="Total (%)" Visible="False"></asp:Label>
                                    </td>
                                    <td style="padding-left: 5px">
                                        <asp:Label ID="lbl_Total_PCT" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 5px">Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-left: 20px">Can you suggest areas where we can improve?</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px"></td>
                                    <td align="left" style="padding-left: 20px;">
                                        <telerik:RadTextBox ID="RadTxt_Notes" Runat="server" Rows="4" Skin="Glow" TextMode="MultiLine" Width="450px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td align="right" style="padding-right: 20px;">&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>       
                    </telerik:RadMultiPage>
                    <table width="100%" >
                     <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Font-Bold="True" ForeColor="Red" Skin="Glow" Text="Save" Visible="False" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
             </telerik:RadPane>
           </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_CS_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_19_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_19_RW" runat="server" Value="0" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                 <AjaxSettings>
               <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Btn_Save" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


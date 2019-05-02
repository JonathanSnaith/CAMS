<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Asset Management - Asset List - Edit Asset" CodeFile="flt_AM_ASSET_LIST_EDIT_RW.aspx.vb" Inherits="ASSET_MANAGEMENT_flt_AM_ASSET_LIST_EDIT_RW" %>

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
            width: 747px;
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
            height: 45px;
            width: 79px;
        }

        .auto-style2 {
            height: 45px;
            width: 109px;
        }
     
        .auto-style3 {
            text-align: right;
             color: white;     
            width: 221px;
        }
     
        .auto-style4 {
            width: 327px;
        }
        .auto-style5 {
            text-align: right;
            width: 86px;
        }
     
        .auto-style7 {
            text-align: right;
            color: white;
            height: 30px;
        }
        .auto-style8 {
            height: 30px;
        }
        .auto-style9 {
            text-align: right;
            color: white;
            height: 35px;
        }
        .auto-style10 {
            height: 35px;
            width: 109px;
        }
        .auto-style11 {
            height: 35px;
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
            var ThisVal = document.getElementById('HF_A_ID').value;
            oWnd.close(ThisVal);
        }
        function closeWindow() {
            var oWnd = GetRadWindow();
            var ThisVal = document.getElementById('HF_A_ID').value;
            oWnd.close(ThisVal);
        }
        function fn_doc_1() {
            var WebURL = document.getElementById('RadTxt_Doc_1').value;
            var pos = WebURL.indexOf('http://');
            if (pos == -1) {
                window.open('http://' + WebURL, '_blank');
            }
            else {
                window.open(WebURL, '_blank');
            }
        }
        function fn_doc_2() {
            var WebURL = document.getElementById('RadTxt_Doc_2').value;
            var pos = WebURL.indexOf('http://');
            if (pos == -1) {
                window.open('http://' + WebURL, '_blank');
            }
            else {
                window.open(WebURL, '_blank');
            }
        }
    </script>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
           <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                  
                   <table cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c;" class="auto-style1">
                                <img alt="" src="../IMAGES/Icons/ASSET_LIST.png" id="ImgHome" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 16px; font-weight: bold; padding-left: 15px; background-color: #ff661c; padding-right: 10px;" class="auto-style2">
                                <asp:Label ID="lblTitle" runat="server" Font-Size="16px" ForeColor="White"  Text="EDIT ASSET" Visible="true"></asp:Label>
                            </td>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c; padding-right: 10px;">&nbsp;</td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c; padding-right: 10px;">
                                &nbsp;</td>
                            <td align="right" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c; padding-right: 10px;">&nbsp;</td>
                            <td align="left" style="color: #FFFFFF; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; height: 45px; background-color: #ff661c; padding-right: 10px;">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <table>
                                <tr>
                                    <td style="text-align: left; vertical-align: top;">
                                         <telerik:RadTabStrip ID="RadTabStrip1" runat="server" AutoPostBack="True" MultiPageID="RadMultiPage1" RenderMode="Lightweight" ResolvedRenderMode="Classic" SelectedIndex="9" Width="1287px" Skin="Glow" >
                                    <Tabs>
                                        <telerik:RadTab PageViewID="RadPV_ASSET_INFO" Text="Asset Information" Value="1" Selected="True" />
                                        <telerik:RadTab PageViewID="RadPV_MAN_INFO" Text="Manufacturer Information" Value="2" />
                                        <telerik:RadTab PageViewID="RadPV_SPECS" Text="Specifications" Value="3" />
                                        <telerik:RadTab PageViewID="RadPV_FINANCE" Text="Financial Information" Value="4" />
                                        <telerik:RadTab PageViewID="RadPV_INSURANCE" Text="Insurance Information" Value="5" />
                                        <telerik:RadTab PageViewID="RadPV_SYSTEM" Text="CAMS System Requirements" Value="6" />
                                        <telerik:RadTab PageViewID="RadPV_ENVIRON" Text="Environmental" Value="7" />
                                        <telerik:RadTab PageViewID="RadPV_MEDIA" Text="Media" Value="9" />
                                        <telerik:RadTab PageViewID="RadPV_QR" Text="QR" Value="10" />
                                        <telerik:RadTab PageViewID="RadPV_ALIAS" Text="Alias" Value="11" />
                                    </Tabs>
                                </telerik:RadTabStrip>
                                    </td>
                                    </tr>
                        </table>
                    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="9">
                        <telerik:RadPageView ID="RadPV_ASSET_INFO" runat="server" Selected="True" >                   
                            <table class="style_table_general" style="vertical-align: top;">
                                <tr valign="top">
                                    <td class="auto-style7" style="padding-right: 20px" valign="top">
                                        Customer:</td>
                                    <td class="auto-style8" colspan="2">
                                        <strong>
                                        <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px">
                                        </telerik:RadComboBox>
                                        </strong>
                                    </td>
                                    <td style="padding-left: 20px" class="auto-style8"></td>
                                    <td class="style1" style="padding-left: 20px" rowspan="8">Notes:</td>
                                    <td rowspan="8">
                                        <telerik:RadTextBox ID="RadTxt_Notes" runat="server" Height="250px" Skin="Glow" TextMode="MultiLine" Width="250px">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td class="auto-style9" style="padding-right: 20px" valign="top">Asset ID:</td>
                                    <td class="auto-style10">
                                        <telerik:RadTextBox ID="RadTxt_Asset_ID" runat="server" AutoPostBack="True" Skin="Glow" Width="100px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td class="auto-style11">
                                        <asp:Image ID="Img_AssetID_Yes" runat="server" ImageUrl="~/IMAGES/24x24/approved_tick_24x24.png" Visible="False" />
                                        <asp:Image ID="Img_AssetID_No" runat="server" ImageUrl="~/IMAGES/24x24/stop_24.png" Visible="False" />
                                    </td>
                                    <td class="auto-style11" style="padding-left: 20px"></td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Primary Group:</td>
                                    <td colspan="2">
                                        <strong>
                                            <telerik:RadComboBox ID="RadCB_PrimaryGroup" runat="server"
                                                AllowCustomText="True" AutoPostBack="True"
                                                 DataTextField="ATT_Name"
                                                DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic"
                                                Skin="Glow" Width="300px">
                                            </telerik:RadComboBox>
                                        </strong>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Secondary Group:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_SecondaryGroup" runat="server"
                                            AllowCustomText="True" AutoPostBack="True"
                                             DataTextField="ATT_Name"
                                            DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic"
                                            Skin="Glow" Width="300px" ToolTip="filtered by Primary Group selection">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Category:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Category" runat="server" AllowCustomText="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="150px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Type:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Type" runat="server" AllowCustomText="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="150px" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Activity Status:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Activity_Status" runat="server" ResolvedRenderMode="Classic" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                                <telerik:RadComboBoxItem runat="server" Text="Standing" Value="Standing" />
                                                <telerik:RadComboBoxItem runat="server" Text="Off-Hire" Value="Off-Hire" />
                                               <%-- <telerik:RadComboBoxItem runat="server" Text="Request For Disposal" Value="Request For Disposal" />--%>
                                                <telerik:RadComboBoxItem runat="server" Text="Disposed" Value="Disposed" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Status:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Status" runat="server" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Open" Value="Open" />
                                                <telerik:RadComboBoxItem runat="server" Text="Submitted" Value="Submitted" />
                                                <telerik:RadComboBoxItem runat="server" Text="Trash" Value="Trash" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Site Location:</td>
                                    <td colspan="2">
                                        <telerik:RadComboBox ID="RadCB_Site" runat="server"  DataTextField="SITE_Name" DataValueField="SITE_ID" ResolvedRenderMode="Classic" Skin="Glow" Width="300px" ToolTip="Shows all associated Sites from the Sites screen">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px"></td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                       
                                    </td>
                                    <td style="padding-right: 20px;" align="right">
                                       
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>       
                         <telerik:RadPageView ID="RadPV_MAN_INFO" runat="server" >
                            <table class="style_table_general">
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        Manufacturer:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Company" runat="server" AllowCustomText="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="300px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Model:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True"  DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Width="200px" ToolTip="filtered by Secondary Group selection">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Serial No:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Serial_No" runat="server" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Year:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Year" runat="server" ResolvedRenderMode="Classic" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="*Not Specified" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Text="1973" Value="1973" />
                                                <telerik:RadComboBoxItem runat="server" Text="1974" Value="1974" />
                                                <telerik:RadComboBoxItem runat="server" Text="1975" Value="1975" />
                                                <telerik:RadComboBoxItem runat="server" Text="1976" Value="1976" />
                                                <telerik:RadComboBoxItem runat="server" Text="1977" Value="1977" />
                                                <telerik:RadComboBoxItem runat="server" Text="1978" Value="1978" />
                                                <telerik:RadComboBoxItem runat="server" Text="1979" Value="1979" />
                                                <telerik:RadComboBoxItem runat="server" Text="1980" Value="1980" />
                                                <telerik:RadComboBoxItem runat="server" Text="1981" Value="1981" />
                                                <telerik:RadComboBoxItem runat="server" Text="1982" Value="1982" />
                                                <telerik:RadComboBoxItem runat="server" Text="1983" Value="1983" />
                                                <telerik:RadComboBoxItem runat="server" Text="1984" Value="1984" />
                                                <telerik:RadComboBoxItem runat="server" Text="1985" Value="1985" />
                                                <telerik:RadComboBoxItem runat="server" Text="1986" Value="1986" />
                                                <telerik:RadComboBoxItem runat="server" Text="1987" Value="1987" />
                                                <telerik:RadComboBoxItem runat="server" Text="1988" Value="1988" />
                                                <telerik:RadComboBoxItem runat="server" Text="1989" Value="1989" />
                                                <telerik:RadComboBoxItem runat="server" Text="1990" Value="1990" />
                                                <telerik:RadComboBoxItem runat="server" Text="1991" Value="1991" />
                                                <telerik:RadComboBoxItem runat="server" Text="1992" Value="1992" />
                                                <telerik:RadComboBoxItem runat="server" Text="1993" Value="1993" />
                                                <telerik:RadComboBoxItem runat="server" Text="1994" Value="1994" />
                                                <telerik:RadComboBoxItem runat="server" Text="1995" Value="1995" />
                                                <telerik:RadComboBoxItem runat="server" Text="1996" Value="1996" />
                                                <telerik:RadComboBoxItem runat="server" Text="1997" Value="1997" />
                                                <telerik:RadComboBoxItem runat="server" Text="1998" Value="1998" />
                                                <telerik:RadComboBoxItem runat="server" Text="1999" Value="1999" />
                                                <telerik:RadComboBoxItem runat="server" Text="2000" Value="2000" />
                                                <telerik:RadComboBoxItem runat="server" Text="2001" Value="2001" />
                                                <telerik:RadComboBoxItem runat="server" Text="2002" Value="2002" />
                                                <telerik:RadComboBoxItem runat="server" Text="2003" Value="2003" />
                                                <telerik:RadComboBoxItem runat="server" Text="2004" Value="2004" />
                                                <telerik:RadComboBoxItem runat="server" Text="2005" Value="2005" />
                                                <telerik:RadComboBoxItem runat="server" Text="2006" Value="2006" />
                                                <telerik:RadComboBoxItem runat="server" Text="2007" Value="2007" />
                                                <telerik:RadComboBoxItem runat="server" Text="2008" Value="2008" />
                                                <telerik:RadComboBoxItem runat="server" Text="2009" Value="2009" />
                                                <telerik:RadComboBoxItem runat="server" Text="2010" Value="2010" />
                                                <telerik:RadComboBoxItem runat="server" Text="2011" Value="2011" />
                                                <telerik:RadComboBoxItem runat="server" Text="2012" Value="2012" />
                                                <telerik:RadComboBoxItem runat="server" Text="2013" Value="2013" />
                                                <telerik:RadComboBoxItem runat="server" Text="2014" Value="2014" />
                                                <telerik:RadComboBoxItem runat="server" Text="2015" Value="2015" />
                                                <telerik:RadComboBoxItem runat="server" Text="2016" Value="2016" />
                                                <telerik:RadComboBoxItem runat="server" Text="2017" Value="2017" />
                                                <telerik:RadComboBoxItem runat="server" Text="2018" Value="2018" />
                                                <telerik:RadComboBoxItem runat="server" Text="2019" Value="2019" />
                                                <telerik:RadComboBoxItem runat="server" Text="2020" Value="2020" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Hire ID:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Hire_ID" runat="server" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                         <telerik:RadPageView ID="RadPV_SPECS" runat="server" >
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">
                                        No. of Engines:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Engine" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" Width="50px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="0" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Text="1" Value="1" />
                                                <telerik:RadComboBoxItem runat="server" Text="2" Value="2" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Face Shovel / Backhoe:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Spec_Type" runat="server" ResolvedRenderMode="Classic" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="*N/A" Value="*N/A" />
                                                <telerik:RadComboBoxItem runat="server" Text="Face Shovel" Value="Face Shovel" />
                                                <telerik:RadComboBoxItem runat="server" Text="Backhoe" Value="Backhoe" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Blade / Bucket Size:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Blade_Bucket_Size" runat="server" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Track / Tyre Size:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Track_Tyre_Size" runat="server" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Body Type:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Body_Type" runat="server" ResolvedRenderMode="Classic" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="*N/A" Value="*N/A" />
                                                <telerik:RadComboBoxItem runat="server" Text="Low" Value="Low" />
                                                <telerik:RadComboBoxItem runat="server" Text="Coal" Value="Coal" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Body Capacity:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Body_Capacity" runat="server" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Operating Weight:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Operating_Weight" runat="server" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_FINANCE" runat="server">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Hired:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Hired" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Hired" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Hired" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">External Hire Rate:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Hire_Rate_External" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" ResolvedRenderMode="Classic" Skin="Glow" Type="Currency" Width="160px" AutoPostBack="True">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
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
                                    <td class="style1" style="padding-right: 20px">Internal Hire Rate:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Hire_Rate" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" ResolvedRenderMode="Classic" Skin="Glow" Type="Currency" Width="160px" AutoPostBack="True">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">External Hire Unit:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Hire_Rate_Unit_External" runat="server" ResolvedRenderMode="Classic" Skin="Glow" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="***" Value="***" />
                                                <telerik:RadComboBoxItem runat="server" Text="Hour" Value="Hour" />
                                                <telerik:RadComboBoxItem runat="server" Text="Day" Value="Day" />
                                                <telerik:RadComboBoxItem runat="server" Text="Week" Value="Week" />
                                                <telerik:RadComboBoxItem runat="server" Text="Month" Value="Month" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Internal Hire Unit:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Hire_Rate_Unit" runat="server" ResolvedRenderMode="Classic" Skin="Glow" AutoPostBack="True">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="***" Value="***" />
                                                <telerik:RadComboBoxItem runat="server" Text="Hour" Value="Hour" />
                                                <telerik:RadComboBoxItem runat="server" Text="Day" Value="Day" />
                                                <telerik:RadComboBoxItem runat="server" Text="Week" Value="Week" />
                                                <telerik:RadComboBoxItem runat="server" Text="Month" Value="Month" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Hours Hire Based On:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Hours_Hire" runat="server" Skin="Glow">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Internal/External Variance:</td>
                                    <td>
                                        <asp:Label ID="lblRateVariance" runat="server" ForeColor="White"></asp:Label>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Excess Hour Rate:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Excess_Hour_Rate" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" ResolvedRenderMode="Classic" Skin="Glow" Type="Currency" Width="160px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
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
                                    <td class="style1" style="padding-right: 20px">Date of Purchase / Hire:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_Purchase_Date" runat="server" Skin="Glow">
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
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Weeks_Text" runat="server" Text="Weeks On Hire / Owned"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Weeks" runat="server" ForeColor="White"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">SMU @ Purchase / Hire:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Purchase_SMU" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Cost_To_Date" runat="server" Text="External Hire Cost To Date:"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Cost_To_Date" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="5000000" MinValue="0" ReadOnly="True" Type="Currency" Width="160px" Skin="Glow">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle BorderStyle="None" Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Eng_SMU_1" runat="server" Text="Eng 1 SMU @ Purchase:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Engine_1_SMU" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        External Hire Transport On:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Transport_On" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" ResolvedRenderMode="Classic" Skin="Glow" Type="Currency" Width="100px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
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
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Eng_Serial" runat="server" Text="Eng 1 Serial No:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Engine_1_Serial" runat="server" Skin="Glow" Visible="False" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">External Hire Transport Off:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Transport_Off" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" ResolvedRenderMode="Classic" Skin="Glow" Type="Currency" Width="100px">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
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
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Eng_SMU_2" runat="server" Text="Eng 2 SMU @ Purchase:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Engine_2_SMU" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Warranty Expiry Date:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_Warranty_Expiry_Date" runat="server" Skin="Glow">
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
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Eng_Serial_2" runat="server" Text="Eng 2 Serial No:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Engine_2_Serial" runat="server" Skin="Glow" Visible="False" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Estimated Disposal Hours:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Estimated_Disposal_Hours" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Hire Company:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_HireCompany" runat="server" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Width="300px" Skin="Glow">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Date Sold / Disposed:</td>
                                    <td>
                                        <telerik:RadDatePicker ID="RadDP_Sold_Date" runat="server" Skin="Glow">
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
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Focalpoint Order No:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Order_Number" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">SMU @ Sale / Disposed:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Sold_SMU" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Off Hire No:</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Off_Hire_Number" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <telerik:RadGrid ID="RadGrid_Attachments" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" DataSourceID="SqlDS_Documents" Height="150px" ResolvedRenderMode="Classic" Skin="Glow">
                                            <ClientSettings>
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <MasterTableView AllowPaging="True" AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="DOC_ID" DataSourceID="SqlDS_Documents" NoMasterRecordsText="No attachments.">
                                                <CommandItemSettings AddNewRecordText="Add new attachment" />
                                                <Columns>
                                                    <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="50px" />
                                                    </telerik:GridEditCommandColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_ID column" HeaderText="ID" ReadOnly="True" SortExpression="DOC_ID" UniqueName="DOC_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="DOC_Name" Display="True" FilterControlAltText="Filter DOC_Name column" HeaderText="Name" SortExpression="DOC_Name" UniqueName="DOC_Name">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox3" runat="server" LabelWidth="64px" Resize="None" Skin="Silk" Text='<%# Bind("DOC_Name") %>' Width="400px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="DOC_NameLabel0" runat="server" Text='<%# Eval("DOC_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="400px" />
                                                        <ItemStyle Width="400px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="DOC_P_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter DOC_P_ID column" HeaderText="Part ID" ReadOnly="True" SortExpression="DOC_P_ID" UniqueName="DOC_P_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="DOC_Link" Display="False" FilterControlAltText="Filter DOC_Link column" HeaderText="Link" SortExpression="DOC_Link" UniqueName="DOC_Link">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox4" runat="server" LabelWidth="64px" Resize="None" Skin="Silk" Text='<%# Bind("DOC_Link") %>' Width="400px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="DOC_LinkLabel0" runat="server" Text='<%# Eval("DOC_Link") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="DOC_Link" FilterControlAltText="Filter DOC_Link column" HeaderText="Link" ImageUrl="../IMAGES/24x24/document_tender_24x24.png" Target="_blank" UniqueName="DOC_Link">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="50px" />
                                                    </telerik:GridHyperLinkColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_INSURANCE" runat="server">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Insurance Value:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Insurance_Value" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MinValue="0" Type="Currency" Width="160px" Skin="Glow">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Estimated New For Old Value:</td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Insurance_NFO" Runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MinValue="0" Type="Currency" Width="160px" Skin="Glow">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat ZeroPattern="£n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">Insurance Status:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Insurance_Status" runat="server" ResolvedRenderMode="Classic" Width="120px" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" />
                                                <telerik:RadComboBoxItem runat="server" Text="Market Value" Value="Market Value" />
                                                <telerik:RadComboBoxItem runat="server" Text="New For Old" Value="New For Old" />
                                                <telerik:RadComboBoxItem runat="server" Text="Self Insure" Value="Self Insure" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_SYSTEM" runat="server">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Brake Test Required:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Brake_Test" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Brake_Test" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Brake_Test" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Service_Status_Text" runat="server" Text="Service Planner Status:"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Service_Status" runat="server" ResolvedRenderMode="Classic" Width="120px" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Not In Use" Value="Not In Use" Selected="True" />
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Inspection_Text" runat="server" Text="LOLER Inspection Required:"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Inspection" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Inspection" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Inspection" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Component_Status_Text" runat="server" Text="Component Planner Status:"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Planning_Status" runat="server" ResolvedRenderMode="Classic" Width="120px" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="Not In Use" Value="Not In Use" Selected="True" />
                                                <telerik:RadComboBoxItem runat="server" Text="Active" Value="Active" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Timesheet Required:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Timesheet" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Timesheet" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Timesheet" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Exam_Text" runat="server" Text="Thorough Examinations:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Exam" runat="server" ForeColor="White"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">SMU Required:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_SMU" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_SMU" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_SMU" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Fire_Text" runat="server" Text="Fire Suppression:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_Fire" runat="server" ForeColor="White"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Fuel Required:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Fuel" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fuel" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Fuel" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Plant_Rate_Insitu" runat="server" Text="Plant Target Rate (Insitu):" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Plant_Rate_Insitu" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="10000" MinValue="0" ResolvedRenderMode="Classic" Visible="False" Width="100px" Skin="Glow">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="£n" />
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
                                    <td class="style1" style="padding-right: 20px">Fuel Type:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Fuel_Type" runat="server" ResolvedRenderMode="Classic" Width="120px" Skin="Glow">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="*Not Specified" Value="*Not Specified" Selected="True" />
                                                <telerik:RadComboBoxItem runat="server" Text="Red Diesel" Value="Red Diesel" />
                                                <telerik:RadComboBoxItem runat="server" Text="White Diesel" Value="White Diesel" />
                                                <telerik:RadComboBoxItem runat="server" Text="Petrol" Value="Petrol" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Plant_Rate_Soils" runat="server" Text="Plant Target Rate (Soils):" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Plant_Rate_Soils" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="10000" MinValue="0" ResolvedRenderMode="Classic" Visible="False" Width="100px" Skin="Glow">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="£n" />
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
                                    <td class="style1" style="padding-right: 20px">Telemetry:</td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Telemetry" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Telemetry" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Telemetry" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        <asp:Label ID="lbl_Plant_Rate_Soils0" runat="server" Text="Processing Plant Target Rate:"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="RadNumTxt_Production_Rate" runat="server" Culture="en-GB" DbValueFactor="1" LabelWidth="64px" MaxValue="10000" MinValue="0" ResolvedRenderMode="Classic" Width="100px" Skin="Glow">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" ZeroPattern="£n" />
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
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Prime_Mover_Report" runat="server" Text="Appears in Prime Mover Report:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Prime_Mover_Report" runat="server" ResolvedRenderMode="Classic" Skin="Glow" Visible="False" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Prime_Mover_Report" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Prime_Mover_Report" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Service" runat="server" Text="Eligible for Service:"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Service" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" Width="75px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Service" Value="0" />
                                                <telerik:RadComboBoxItem runat="server" Owner="RadCB_Service" Text="Yes" Value="1" />
                                            </Items>
                                        </telerik:RadComboBox>
                                        <asp:Label ID="lbl_Service_Text" runat="server" ForeColor="#2C3338"></asp:Label>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Trigger_Text" runat="server" Text="Service Trigger:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_Trigger" runat="server" AutoPostBack="True" ResolvedRenderMode="Classic" Skin="Glow" Visible="False" Width="150px">
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="SMU" Value="SMU" />
                                                <telerik:RadComboBoxItem runat="server" Text="Calendar" Value="Calendar" />
                                                <telerik:RadComboBoxItem runat="server" Text="SMU &amp; Calendar" Value="SMU and Calendar" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">
                                        <asp:Label ID="lbl_Cycle_Text" runat="server" Text="Service Cycle:" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="RadCB_ServiceCycle" runat="server" AllowCustomText="True" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" ResolvedRenderMode="Classic" Skin="Glow" Visible="False" Width="150px">
                                        </telerik:RadComboBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_ENVIRON" runat="server">
                            <table class="style_table_general">
                                <tr>
                                    <td class="style1" style="padding-right: 20px">CO Emissions (g/kWh):</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_CO_Emissions" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Particulates (g/kWh):</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Particulates" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">Nox Emissions (g/kWh):</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Nox_Emissions" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">External noise (dB / Power Level):</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_External_Noise_dB" runat="server" Skin="Glow" Width="80px" Wrap="False">
                                        </telerik:RadTextBox>
                                        <telerik:RadTextBox ID="RadTxt_External_Noise_Power" runat="server" Skin="Glow" Width="80px" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">HC Emissions (g/kWh):</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_HC_Emissions" runat="server" Skin="Glow" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">Operator Ear (dB / Power Level):</td>
                                    <td>
                                        <telerik:RadTextBox ID="RadTxt_Operator_Ear_dB" runat="server" Skin="Glow" Width="80px" Wrap="False">
                                        </telerik:RadTextBox>
                                        <telerik:RadTextBox ID="RadTxt_Operator_Ear_Power" runat="server" Skin="Glow" Width="80px" Wrap="False">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_MEDIA" runat="server">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px" valign="top">Photo Link:</td>
                                    <td class="auto-style4" valign="top">
                                        <telerik:RadTextBox ID="RadTxt_Photo_Link" runat="server" Skin="Glow" Width="300px" AutoPostBack="True">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td colspan="2" rowspan="4" style="padding-left: 20px" valign="top">&nbsp;</td>
                                    <td>
                                         <asp:Image ID="Image1" runat="server" Height="380px" Width="480px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPV_QR" runat="server">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px" valign="top">QR Link:</td>
                                    <td class="auto-style4" valign="top">
                                        <telerik:RadTextBox ID="RadTxt_QR_Link" runat="server" Skin="Glow" Width="300px" AutoPostBack="True">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td colspan="2" rowspan="4" style="padding-left: 20px" valign="top">&nbsp;</td>
                                    <td>
                                         <asp:Image ID="Image2" runat="server" Height="200px" Width="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                         <telerik:RadPageView ID="RadPV_ALIAS" runat="server">
                            <table class="style_table_general">
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px" valign="top">Alias List:</td>
                                    <td valign="top" colspan="3" rowspan="4">
                                        <telerik:RadGrid ID="RadGrid_Alias" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" DataSourceID="SqlDS_Alias" Height="150px" ResolvedRenderMode="Classic" Width="300px" Skin="Glow">
                                            <ClientSettings>
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <MasterTableView AllowPaging="True" AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="AA_ID" DataSourceID="SqlDS_Alias" NoMasterRecordsText="No alias.">
                                                <CommandItemSettings AddNewRecordText="Add new alias" />
                                                <Columns>
                                                    <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="50px" />
                                                    </telerik:GridEditCommandColumn>
                                                    <telerik:GridBoundColumn DataField="AA_ID" DataType="System.Int32" Display="False" FilterControlAltText="Filter AA_ID column" HeaderText="ID" ReadOnly="True" SortExpression="AA_ID" UniqueName="AA_ID">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="AA_Asset_ID" Display="True" FilterControlAltText="Filter AA_Asset_ID column" HeaderText="Asset Alias" SortExpression="AA_Asset_ID" UniqueName="AA_Asset_ID">
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox ID="RadTextBox5" runat="server" LabelWidth="64px" Resize="None" Skin="Silk" Text='<%# Bind("AA_Asset_ID") %>' Width="400px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="AA_Asset_IDLabel1" runat="server" Text='<%# Eval("AA_Asset_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="400px" />
                                                        <ItemStyle Width="400px" />
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                    <td>
                                         &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5" style="padding-right: 20px">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                    <table width="100%" >
                     <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">&nbsp;</td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Save" runat="server" Skin="Glow" Text="Save" Width="100px" BackColor="Red" Font-Bold="True">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="padding-right: 20px">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td style="padding-left: 20px">&nbsp;</td>
                                    <td class="style1" style="padding-left: 20px">
                                    </td>
                                    <td style="padding-right: 20px;" align="right">
                                        <telerik:RadButton ID="Btn_Cancel" runat="server" OnClientClicked="closeWindow" Skin="Glow" Text="Cancel" Width="100px">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
             </telerik:RadPane>
           </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
             <telerik:RadNotification ID="RadNotify" runat="server" Position="Center" Title="CAMS - Asset ID Issue" Height="100px" Skin="Glow" TitleMenuToolTip="" Width="600px" EnableRoundedCorners="True" Font-Names="Segoe UI">
            </telerik:RadNotification>
            <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_ServiceCycle" runat="server" />
            <asp:HiddenField ID="HF_Category" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_A_ID" runat="server" />
            <asp:HiddenField ID="HF_ServiceStatus" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:HiddenField ID="HF_EXCEPTION_2_R" runat="server" Value="0" />
            <asp:HiddenField ID="HF_EXCEPTION_2_RW" runat="server" Value="0" />
            <asp:HiddenField ID="HF_Service_Status_Prev" runat="server" />
            <asp:HiddenField ID="HF_Planning_Status_Prev" runat="server" />
             <asp:HiddenField ID="HF_NameCheck" runat="server" />
            <asp:HiddenField ID="HF_CusCheck" runat="server" />
            <asp:SqlDataSource ID="SqlDS_Documents" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                InsertCommand="INSERT INTO DOCUMENTS(DOC_Name, DOC_A_ID, DOC_Link, DOC_Created_By, DOC_Date_Created, DOC_Sub) VALUES (@DOC_Name, @DOC_A_ID, @DOC_Link, @DOC_Created_By, GETDATE(), 5)"
                SelectCommand="SELECT DOC_ID, DOC_Name, DOC_A_ID, DOC_Link, DOC_Sub FROM DOCUMENTS WHERE (DOC_Sub = 5) AND (DOC_A_ID = @DOC_A_ID)"
                UpdateCommand="UPDATE DOCUMENTS SET DOC_Name = @DOC_Name, DOC_A_ID = @DOC_A_ID, DOC_Link = @DOC_Link, DOC_Date_Modified = GETDATE(), DOC_Modified_By = @DOC_Modified_By WHERE (DOC_ID = @DOC_ID)"
                DeleteCommand="DELETE FROM DOCUMENTS WHERE (DOC_ID = @DOC_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="DOC_ID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DOC_Name" />
                     <asp:ControlParameter ControlID="HF_A_ID" Name="DOC_A_ID" PropertyName="Value" />
                    <asp:Parameter Name="DOC_Link" />
                    <asp:ControlParameter ControlID="HF_Username" Name="DOC_Created_By" PropertyName="Value" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_A_ID" Name="DOC_A_ID" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DOC_Name" />
                     <asp:ControlParameter ControlID="HF_A_ID" Name="DOC_A_ID" PropertyName="Value" />
                    <asp:Parameter Name="DOC_Link" />
                    <asp:ControlParameter ControlID="HF_Username" Name="DOC_Modified_By" PropertyName="Value" />
                    <asp:Parameter Name="DOC_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDS_Alias" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                InsertCommand="INSERT INTO ASSET_ALIAS(AA_A_ID, AA_Asset_ID) VALUES (@AA_A_ID, @AA_Asset_ID)"
                SelectCommand="SELECT AA_ID, AA_A_ID, AA_Asset_ID FROM ASSET_ALIAS WHERE (AA_A_ID = @AA_A_ID)"
                UpdateCommand="UPDATE ASSET_ALIAS SET AA_Asset_ID = @AA_Asset_ID WHERE (AA_ID = @AA_ID)"
                DeleteCommand="DELETE FROM ASSET_ALIAS WHERE (AA_ID = @AA_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="AA_ID" />
                </DeleteParameters>
                <InsertParameters>
                     <asp:ControlParameter ControlID="HF_A_ID" Name="AA_A_ID" PropertyName="Value" />
                     <asp:Parameter Name="AA_Asset_ID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HF_A_ID" Name="AA_A_ID" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AA_Asset_ID" />
                    <asp:Parameter Name="AA_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                     <telerik:AjaxSetting AjaxControlID="RadTxt_Asset_ID">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Asset_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadNotify" />
                            <telerik:AjaxUpdatedControl ControlID="Img_AssetID_Yes" />
                            <telerik:AjaxUpdatedControl ControlID="Img_AssetID_No" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Asset_ID" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Site" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_PrimaryGroup">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_SecondaryGroup" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_SecondaryGroup">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Prime_Mover_Report" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Prime_Mover_Report" />
                             <telerik:AjaxUpdatedControl ControlID="lbl_Plant_Rate_Insitu" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Plant_Rate_Insitu" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Plant_Rate_Soils" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Plant_Rate_Soils" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Engine">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lbl_Eng_SMU_1" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Engine_1_SMU" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Eng_SMU_2" />
                            <telerik:AjaxUpdatedControl ControlID="RadTxt_Engine_2_SMU" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Btn_Save">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="HF_A_ID" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadNumTxt_Hire_Rate">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Hire_Rate_External" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Hire_Rate_Unit" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Hire_Rate_Unit_External" />
                            <telerik:AjaxUpdatedControl ControlID="lblRateVariance" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadNumTxt_Hire_Rate_External">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Hire_Rate" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Hire_Rate_Unit" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Hire_Rate_Unit_External" />
                            <telerik:AjaxUpdatedControl ControlID="lblRateVariance" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Hire_Rate_Unit">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Hire_Rate" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Hire_Rate_External" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Hire_Rate_Unit_External" />
                            <telerik:AjaxUpdatedControl ControlID="lblRateVariance" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadCB_Hire_Rate_Unit_External">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Hire_Rate" />
                            <telerik:AjaxUpdatedControl ControlID="RadNumTxt_Hire_Rate_External" />
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Hire_Rate_Unit" />
                            <telerik:AjaxUpdatedControl ControlID="lblRateVariance" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTxt_Photo_Link">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Image1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadTxt_QR_Link">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Image2" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


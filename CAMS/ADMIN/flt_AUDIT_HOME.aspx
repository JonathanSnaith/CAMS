<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - AUDITING" CodeFile="flt_AUDIT_HOME.aspx.vb" Inherits="ADMIN_flt_AUDIT_HOME" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
       .style1 {
            width: 100%;
        }

        .style5 {
            height: 45px;
            width: 886px;
        }

        .style6 {
            height: 45px;
            color: black;
            font-size: medium;
        }

        .style11 {
            height: 45px;
            width: 791px;
        }

        .style14 {
            width: 134px;
        }

        .style15 {
            width: 220px;
        }

        .style18 {
            width: 160px;
        }

        .auto-style2 {
            width: 1020px;
        }
        
        .auto-style3 {
            width: 202px;
        }
        
        .auto-style4 {
            width: 315px;
        }
                .showitem {
            display: block;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
        }

        .hideitem {
            display: none;
        }
        </style>
</head>
<script type="text/javascript">
    function fn_back() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISPP = document.getElementById('lblPreviousPage').innerHTML;
        if (THISPP == 0) {
            window.open('../CLIENT/flt_ADMIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../DASHBOARDS/flt_D_EVENT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=11', '_self');
        }
    }
    function fn_home() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID, '_self');
    }
    ////////////////BUTTONS\\\\\\\\\\\\\\\\\\\\\\\\\
    function fn_1() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        //var THISSITE = document.getElementById('HF_Site').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/AUDIT/view_ASSET_INCOMPLETE_FIELDS.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = no,location=no, scrollbars=yes');
    }
    function fn_2() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
       // var THISSITE = document.getElementById('HF_Site').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/AUDIT/view_EVENT_INCOMPLETE_FIELDS.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = no,location=no, scrollbars=yes');
    }
    function fn_3() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
       // var THISSITE = document.getElementById('HF_Site').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/AUDIT/view_JOB_INCOMPLETE_FIELDS.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = no,location=no, scrollbars=yes');
    }
    function fn_4() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
       // var THISSITE = document.getElementById('HF_Site').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/AUDIT/view_EVENT_EXPIRED_ESTIMATED.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1200, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    }
    function fn_5() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
       // var THISSITE = document.getElementById('HF_Site').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/AUDIT/view_DEFECTS_NO_PLAN_DATE.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = no,location=no, scrollbars=yes');
    }
    function fn_6() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
       // var THISSITE = document.getElementById('HF_Site').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/AUDIT/view_DEFECTS_OVERDUE.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1300, top= ' + S_Top + ', status=no, menubar = yes, resizable = no,location=no, scrollbars=yes');
    }
    function fn_7() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        //var THISSITE = document.getElementById('HF_Site').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/AUDIT/view_EVENT_ORDER_DELIVERY_DATES.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1600, top= ' + S_Top + ', status=no, menubar = yes, resizable = no,location=no, scrollbars=yes');
    }
     function fn_1_b() {
        document.getElementById('<%= btn1.ClientID %>').click();
    }
    function fn_2_b() {
        document.getElementById('<%= btn2.ClientID %>').click();
    }
    function fn_3_b() {
        document.getElementById('<%= btn3.ClientID %>').click();
    }
    function fn_4_b() {
        document.getElementById('<%= btn4.ClientID %>').click();
    }
    function fn_5_b() {
        document.getElementById('<%= btn5.ClientID %>').click();
    }
    function fn_6_b() {
        document.getElementById('<%= btn6.ClientID %>').click();
    }
    function fn_7_b() {
        document.getElementById('<%= btn7.ClientID %>').click();
    }
<%--    function fn_8_b() {
        document.getElementById('<%= btn8.ClientID %>').click();
    }--%>
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
                    <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style2">
                               <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="#ff661c"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="#ff661c"></asp:Label>
                                <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="#ff661c"></asp:Label>
                                <asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#ff661c"></asp:Label>
                                <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#ff661c"></asp:Label>
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style3">
                                 <asp:Label ID="lblTitle" runat="server" Text="AUDITING" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style4">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                 &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;">
                                &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                 &nbsp;</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                            </td>
                        </tr>
                    </table>
                    <table width="100%" cellspacing="0">
                                       <tr>
                    <td valign="top" style="padding-left: 15px; padding-right: 5px">
                        <table width="100%" cellspacing="0" style="padding-top: 20px">
                            <tr>
                                <td height="100%" style="padding-left: 15px">
                                    <asp:Table ID="Table101" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0" >
                                        <asp:TableRow ID="TableRow1" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_1_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_1" runat="server" Text="0" Font-Size="28pt" ForeColor="Black" ToolTip="{Green: <100 | Amber: 100-200 | Red: 200>}"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label1" runat="server" Text="asset - incomplete fields" ForeColor="Black" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </asp:TableCell>
                                            </asp:TableRow>
                                        <asp:TableRow ID="TableRow2" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_1_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_1_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%">
                                    <asp:Table ID="Table102" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow38" runat="server">
                                            <asp:TableCell runat="server" ID="ID_2_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_2" runat="server" Text="0" Font-Size="28pt" ForeColor="Black" ToolTip="{Green: <50 | Amber: 50-100 | Red: 100>}"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_2" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label2" runat="server" Text="event - incomplete fields" ForeColor="Black" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                          </asp:TableRow>
                                        <asp:TableRow ID="TableRow3" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_2_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_2_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%">
                                    <asp:Table ID="Table103" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow39" runat="server">
                                            <asp:TableCell runat="server" ID="ID_3_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_3" runat="server" Text="0" Font-Size="28pt" ForeColor="Black" ToolTip="{Green: <250 | Amber: 250-500 | Red: 500>}"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_3" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label3" runat="server" Text="job - incomplete fields" ForeColor="Black" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                             </asp:TableRow>
                                        <asp:TableRow ID="TableRow4" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_3_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                             <asp:ImageButton ID="img_3_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%">
                                    <asp:Table ID="Table104" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow40" runat="server">
                                            <asp:TableCell runat="server" ID="ID_4_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_4" runat="server" Text="0" Font-Size="28pt" ForeColor="Black" ToolTip="{Green: <50 | Amber: 50-100 | Red: 100>}"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_4" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label4" runat="server" Text="events with expired estimated dates" ForeColor="Black" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow5" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_4_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_4_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%">
                                    <asp:Table ID="Table105" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow41" runat="server">
                                            <asp:TableCell runat="server" ID="ID_5_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_5" runat="server" Text="0" Font-Size="28pt" ForeColor="Black" ToolTip="{Green: <5 | Amber: 5-10 | Red: 10>}"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_5" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label5" runat="server" Text="defect events w/ no plan date" ForeColor="Black" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow6" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_5_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_5_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%">
                                    <asp:Table ID="Table106" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow42" runat="server">
                                            <asp:TableCell runat="server" ID="ID_6_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_6" runat="server" Text="0" Font-Size="28pt" ForeColor="Black" ToolTip="{Green: <5 | Amber: 5-10 | Red: 10>}"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_6" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label38" runat="server" Text="defect events raised over 9 days ago" ForeColor="Black" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow7" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_6_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_6_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%">
                                    <asp:Table ID="Table107" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow43" runat="server">
                                            <asp:TableCell runat="server" ID="ID_7_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_7" runat="server" Text="0" Font-Size="28pt" ForeColor="Black" ToolTip="{Green: <5 | Amber: 5-10 | Red: 10>}"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_7" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr style="text-align: center">
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label39" runat="server" Text="events w/ order delivery dates" ForeColor="Black" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow8" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_7_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_7_B" runat="server"  Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                            </tr>
                            <tr>
                                <td height="100%" style="padding-left: 5px; text-align: center;" colspan="7">
                                     <telerik:RadHtmlChart ID="RadChart1" runat="server" BackColor="White" DataSourceID="SqlDS_ChartData" Skin="Silk" Width="100%" Height="500px" Visible="False">
                                                <ChartTitle Text="TITLE"></ChartTitle>
                                                <Legend>
                                                    <Appearance Position="Top"></Appearance>
                                                </Legend>
                                                <PlotArea>
                                                    <Series>
                                                        <telerik:LineSeries DataFieldY="ARC_1" Name="Total" >
                                                            <LabelsAppearance Visible="False"></LabelsAppearance>
                                                            <Appearance FillStyle-BackgroundColor="#e46c0a" />
                                                            <MarkersAppearance BorderColor="#e46c0a" />
                                                            <TooltipsAppearance Color="#FFFFFF" />
                                                        </telerik:LineSeries>
                                                    </Series>
                                                     <XAxis DataLabelsField="ARC_Created" BaseUnit="Months" EnableBaseUnitStepAuto="False" Type="Date" BaseUnitStep="0"></XAxis>
                                                    <%--<XAxis DataLabelsField="ARC_Created" BaseUnit="Auto" EnableBaseUnitStepAuto="False" Type="Auto" BaseUnitStep="0"></XAxis>--%>
                                                    <YAxis>
                                                    </YAxis>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>
                                </td>
                            </tr>
                            </table>
                    </td>
                </tr>
                    </table>
                    </div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
         <asp:HiddenField ID="HF_WhichChart" runat="server" />
        <asp:HiddenField ID="HF_FY" runat="server" />
        <asp:HiddenField ID="HF_1" runat="server" />
        <asp:HiddenField ID="HF_2" runat="server" />
        <asp:HiddenField ID="HF_3" runat="server" />
        <asp:HiddenField ID="HF_4" runat="server" />
        <asp:HiddenField ID="HF_5" runat="server" />
        <asp:HiddenField ID="HF_6" runat="server" />
        <asp:HiddenField ID="HF_7" runat="server" />
        <asp:HiddenField ID="HF_8" runat="server" />
        <asp:HiddenField ID="HF_9" runat="server" />
        <asp:HiddenField ID="HF_10" runat="server" />
        <asp:HiddenField ID="HF_11" runat="server" />
        <asp:HiddenField ID="HF_12" runat="server" />
        <asp:HiddenField ID="HiddenField7" runat="server" />
        <asp:HiddenField ID="HF_Username" runat="server" />
        <asp:HiddenField ID="HF_Forename" runat="server" />
        <asp:HiddenField ID="HF_Surname" runat="server" />
        <asp:HiddenField ID="HF_SessionIP" runat="server" />
        <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
        <asp:HiddenField ID="HF_Session_ID" runat="server" />
        <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
        <asp:HiddenField ID="HF_EMP_ID" runat="server" />
        <asp:ImageButton ID="btn1" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn2" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn3" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn4" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn5" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn6" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn7" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
<%--        <asp:ImageButton ID="btn8" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />--%>
        <asp:SqlDataSource ID="SqlDS_SYS" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT SYS_Name, SYS_Version FROM SYSTEM"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box1" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_ASSET_INCOMPLETE_FIELDS_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box1_LM" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_ASSET_INCOMPLETE_FIELDS_LM_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box2" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_EVENT_INCOMPLETE_FIELDS_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box2_LM" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_EVENT_INCOMPLETE_FIELDS_LM_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box3" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_JOB_INCOMPLETE_FIELDS_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box3_LM" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_JOB_INCOMPLETE_FIELDS_LM_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box4" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_EVENT_EXPIRED_ESTIMATED_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box4_LM" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_EVENT_EXPIRED_ESTIMATED_LM_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box5" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_DEFECTS_NO_PLAN_DATE_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box5_LM" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_DEFECTS_NO_PLAN_DATE_LM_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box6" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_DEFECTS_OVERDUE_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box6_LM" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_DEFECTS_OVERDUE_LM_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box7" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_EVENT_ORDER_DELIVERY_DATES_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box7_LM" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="REPORT_AUDIT_EVENT_ORDER_DELIVERY_DATES_LM_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_ChartData" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="REPORT_AUDIT_ChartData" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="HF_WhichChart" Name="ChartName" PropertyName="Value" Type="String" />
             </SelectParameters>
            </asp:SqlDataSource>
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
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="btn1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_WhichChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_WhichChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn3">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_WhichChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn4">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_WhichChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn5">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_WhichChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn6">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_WhichChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn7">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_WhichChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn8">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_WhichChart" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
        </telerik:RadAjaxLoadingPanel>
    </form>
</body>
</html>

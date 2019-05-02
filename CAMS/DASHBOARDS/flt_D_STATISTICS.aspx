<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS - STATISTICS" CodeFile="flt_D_STATISTICS.aspx.vb" Inherits="DASHBOARDS_flt_D_STATISTICS" %>

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
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISPP = document.getElementById('HF_PreviousPage').value;
        if (THISPP == 0) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
        if (THISPP == 2) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
        }
    }
    function fn_home() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    ////////////////BUTTONS\\\\\\\\\\\\\\\\\\\\\\\\\
    //function fn_1() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_2() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_EVENTS_WITH_EXPIRED_PLANNED_START_DATES.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_3() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_AVG_TIME_COMPLETE_JOBS.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1200, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_4() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_OPEN_JOBS_IN_CLOSED_EVENTS.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_5() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_DEFECTS_RAISED_OVER_9_DAYS_AGO.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_6() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_EVENTS_CREATED_OVER_30_DAYS_AGO.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_7() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_OVERDUE_SERVICES.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_8() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_COMPONENTS_OVERDUE_CHANGEOUT.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_9() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    window.open('../ASSET_MANAGEMENT/flt_AM_PART_INSPECTIONS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    //}
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
<%--    function fn_6_b() {
        document.getElementById('<%= btn6.ClientID %>').click();
    }
    function fn_7_b() {
        document.getElementById('<%= btn7.ClientID %>').click();
    }
    function fn_8_b() {
        document.getElementById('<%= btn8.ClientID %>').click();
    }
    function fn_9_b() {
        document.getElementById('<%= btn9.ClientID %>').click();
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
                            </td>
                             <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: left;" valign="middle">
                            </td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style3">
                                 <asp:Label ID="lblTitle" runat="server" Text="STATISTICS" Font-Bold="False" ForeColor="White"></asp:Label>
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
                        <table width="99%" cellspacing="0" style="padding-top: 20px">
                            <tr>
                                <td height="100%" width="9%">
                                  <%--  <asp:ImageButton ID="ImgBtn_Left" runat="server" ImageUrl="~/IMAGES/left.png" />--%>
                                </td>
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table101" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0" >
                                        <asp:TableRow ID="TableRow1" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_1_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_1" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                          <%--  <asp:Label ID="lblCount_1Hrs" runat="server" Text="hrs" Font-Size="14pt" ForeColor="Black"></asp:Label>--%>
                                                            <asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label1" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </asp:TableCell>
                                            </asp:TableRow>
                                        <asp:TableRow ID="TableRow2" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_1_B" BackColor="#747474" CssClass="roundcornersbottom">
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
                                    <%--<asp:Table ID="Table109" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0" Visible="False">
                                        <asp:TableRow ID="TableRow48" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_9_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_9" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_9" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label66" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </asp:TableCell>
                                            </asp:TableRow>
                                        <asp:TableRow ID="TableRow49" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_9_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_9_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>--%>
                                </td>
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table102" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow38" runat="server">
                                            <asp:TableCell runat="server" ID="ID_2_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_2" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_2" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label2" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                          </asp:TableRow>
                                        <asp:TableRow ID="TableRow3" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_2_B" BackColor="#747474" CssClass="roundcornersbottom">
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
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table103" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow39" runat="server">
                                            <asp:TableCell runat="server" ID="ID_3_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_3" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                           <%-- <asp:Label ID="Label61" runat="server" Text="days" Font-Size="14pt" ForeColor="Black"></asp:Label>--%>
                                                            <asp:ImageButton ID="img_Arrow_3" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label3" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                             </asp:TableRow>
                                        <asp:TableRow ID="TableRow4" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_3_B" BackColor="#747474" CssClass="roundcornersbottom">
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
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table104" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow40" runat="server">
                                            <asp:TableCell runat="server" ID="ID_4_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_4" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                             <asp:ImageButton ID="img_Arrow_4" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label4" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow5" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_4_B" BackColor="#747474" CssClass="roundcornersbottom">
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
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table105" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow41" runat="server">
                                            <asp:TableCell runat="server" ID="ID_5_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_5" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_5" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label5" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow6" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_5_B" BackColor="#747474" CssClass="roundcornersbottom">
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
                                <td height="100%" width="9%">
                                  <%-- <asp:Table ID="Table106" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow42" runat="server">
                                            <asp:TableCell runat="server" ID="ID_6_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_6" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_6" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label38" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow7" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_6_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_6_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>--%>
                                </td>
                                <td height="100%" width="9%">
                                   <%-- <asp:Table ID="Table107" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow43" runat="server">
                                            <asp:TableCell runat="server" ID="ID_7_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_7" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_7" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr style="text-align: center">
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label39" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow8" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_7_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_7_B" runat="server"  Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>--%>
                                </td>
                                <td height="100%" width="9%">
                                   <%-- <asp:Table ID="Table108" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow44" runat="server">
                                            <asp:TableCell runat="server" ID="ID_8_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_8" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_8" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label40" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow9" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_8_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_8_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>--%>
                                </td>
                                <td height="100%" width="9%">
                                   <%-- <asp:ImageButton ID="ImgBtn_Right" runat="server" ImageUrl="~/IMAGES/right.png" />--%>
                                </td>
                            </tr>
                            <tr>
                                <td height="100%" style="padding-left: 5px; text-align: center;">
                                     &nbsp;</td>
                                <td height="100%" style="padding-left: 5px; text-align: center;" colspan="8">
                                     <telerik:RadHtmlChart ID="RadChart1" runat="server" BackColor="#2c3338" Skin="Glow" Width="100%" Height="500px" Visible="False">
                                                <ChartTitle Text="TITLE"></ChartTitle>
                                                <Legend>
                                                    <Appearance Position="Top"></Appearance>
                                                </Legend>
                                          <Zoom Enabled="true">
                                        <MouseWheel Enabled="true" />
                                        <Selection Enabled="true" ModifierKey="Shift"  />
                                    </Zoom>
                                     <Pan Enabled="true" ModifierKey="Alt" />
                                                <PlotArea>
                                                    <Series>
                                                        <telerik:LineSeries DataFieldY="ARC_1" Name="Total" >
                                                            <LabelsAppearance Visible="False"></LabelsAppearance>
                                                            <Appearance FillStyle-BackgroundColor="#ff661c" />
                                                            <MarkersAppearance BorderColor="#ff661c" />
                                                            <TooltipsAppearance Color="#FFFFFF" />
                                                        </telerik:LineSeries>
                                                         <telerik:LineSeries DataFieldY="ARC_Trend" Name="Trend" >
                                                            <LabelsAppearance Visible="False"></LabelsAppearance>
                                                            <Appearance FillStyle-BackgroundColor="#FFFFFF" />
                                                            <MarkersAppearance BorderColor="#FFFFFF" Visible="False" />
                                                            <TooltipsAppearance BackgroundColor="#FFFFFF" Color="Black">
                                                    <ClientTemplate>
                                                                Trend: #=dataItem.ARC_Trend# 
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                                        </telerik:LineSeries>
                                                    </Series>
                                                    <XAxis DataLabelsField="ARC_Created" BaseUnit="Auto" EnableBaseUnitStepAuto="False" Type="Auto" BaseUnitStep="0" >
                                                         <LabelsAppearance RotationAngle="45" ></LabelsAppearance>
                                                    </XAxis>
                                                    <YAxis>
                                                    </YAxis>
                                                </PlotArea>
                                            </telerik:RadHtmlChart>
                                   <%-- <asp:Timer ID="Timer" OnTick="Timer_Tick" runat="server" Interval="300000"> </asp:Timer>--%>
                                   </td>
                                <td height="100%" style="padding-left: 5px; text-align: center;">
                                     &nbsp;</td>
                            </tr>
                            </table>
                    </td>
                </tr>
                    </table>
                    </div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
          <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
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
        <asp:HiddenField ID="HF_Toggle" runat="server" Value="1" />
        <asp:HiddenField ID="HF_Username" runat="server" />
        <asp:HiddenField ID="HF_Forename" runat="server" />
        <asp:HiddenField ID="HF_Surname" runat="server" />
        <asp:HiddenField ID="HF_SessionIP" runat="server" />
        <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
        <asp:HiddenField ID="HF_Session_ID" runat="server" />
        <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
        <asp:HiddenField ID="HF_EMP_ID" runat="server" />

         <asp:HiddenField ID="WT_Area" runat="server" Value="HOME"/>
        <asp:HiddenField ID="WT_No" runat="server" />
         <asp:HiddenField ID="WT_Name" runat="server" Value="tbc" />
        <asp:HiddenField ID="WT_Desc" runat="server" Value="tbc" />
        <asp:HiddenField ID="WT_Green" runat="server" Value="0" />
         <asp:HiddenField ID="WT_Amber" runat="server" Value="0" />
         <asp:HiddenField ID="WT_Red" runat="server" Value="0" />
         <asp:HiddenField ID="WT_SP_Statistics_Name" runat="server"/>

        <asp:ImageButton ID="btn1" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn2" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn3" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn4" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn5" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
<%--        <asp:ImageButton ID="btn6" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn7" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn8" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />
        <asp:ImageButton ID="btn9" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="#669999" />--%>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="btn1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn3">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn4">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn5">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
<%--                <telerik:AjaxSetting AjaxControlID="btn6">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn7">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn8">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="btn9">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="WT_SP_Statistics_Name" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="Timer">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Table101" />
                        <telerik:AjaxUpdatedControl ControlID="Table102" />
                        <telerik:AjaxUpdatedControl ControlID="Table103" />
                        <telerik:AjaxUpdatedControl ControlID="Table104" />
                        <telerik:AjaxUpdatedControl ControlID="Table105" />
                        <telerik:AjaxUpdatedControl ControlID="Table106" />
                        <telerik:AjaxUpdatedControl ControlID="Table107" />
                        <telerik:AjaxUpdatedControl ControlID="Table108" />
                        <telerik:AjaxUpdatedControl ControlID="Table109" />
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Toggle" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="ImgBtn_Left">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Table101" />
                        <telerik:AjaxUpdatedControl ControlID="Table102" />
                        <telerik:AjaxUpdatedControl ControlID="Table103" />
                        <telerik:AjaxUpdatedControl ControlID="Table104" />
                        <telerik:AjaxUpdatedControl ControlID="Table105" />
                      <telerik:AjaxUpdatedControl ControlID="Table106" />
                        <telerik:AjaxUpdatedControl ControlID="Table107" />
                        <telerik:AjaxUpdatedControl ControlID="Table108" />
                        <telerik:AjaxUpdatedControl ControlID="Table109" />
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Toggle" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="ImgBtn_Right">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Table101" />
                        <telerik:AjaxUpdatedControl ControlID="Table102" />
                        <telerik:AjaxUpdatedControl ControlID="Table103" />
                        <telerik:AjaxUpdatedControl ControlID="Table104" />
                        <telerik:AjaxUpdatedControl ControlID="Table105" />
                        <telerik:AjaxUpdatedControl ControlID="Table106" />
                        <telerik:AjaxUpdatedControl ControlID="Table107" />
                        <telerik:AjaxUpdatedControl ControlID="Table108" />
                        <telerik:AjaxUpdatedControl ControlID="Table109" />
                        <telerik:AjaxUpdatedControl ControlID="RadChart1" />
                        <telerik:AjaxUpdatedControl ControlID="HF_Toggle" />
                    </UpdatedControls>
                </telerik:AjaxSetting>--%>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
        </telerik:RadAjaxLoadingPanel>
    </form>
</body>
</html>

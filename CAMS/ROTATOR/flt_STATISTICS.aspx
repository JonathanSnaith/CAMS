<%@ Page Language="VB" AutoEventWireup="false" Title="FLEET - LIVE STATISTICS" CodeFile="flt_STATISTICS.aspx.vb" Inherits="ROTATOR_flt_STATISTICS" %>

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
        
                .showitem {
            display: block;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
        }

        .hideitem {
            display: none;
        }
        .auto-style4 {
            cursor: pointer;
        }
        </style>
</head>
<script type="text/javascript">
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
                    <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="FLEET"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v2.5"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                -<asp:Label ID="lblRun" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="#E46C0A"></asp:Label>
                                LIVE STATISTICS</td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #E46C0A; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
                    <table width="100%" cellspacing="0">
                                       <tr>
                    <td valign="top" style="padding-left: 30px; padding-right: 10px">
                        <table width="100%" cellspacing="0" style="padding-top: 40px">
                            <tr>
                                <td height="100%" style="padding-left: 30px" colspan="2">
                                    <asp:Table ID="Table101" runat="server" Height="300px" Style="cursor: pointer" Width="240px" CellSpacing="0" >
                                        <asp:TableRow ID="TableRow1" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_1_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 30px; padding-left: 10px;">
                                                            <asp:Label ID="lblCount_1" runat="server" Text="0" Font-Size="56pt" ForeColor="Black" ToolTip="average length of breakdowns"></asp:Label>
                                                            <asp:Label ID="lblCount_1Hrs" runat="server" Text="hrs" Font-Size="28pt" ForeColor="Black"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td class="metro_300x240_cell_content_bottom">
                                                            <asp:Label ID="Label1" runat="server" Text="average length of breakdowns" ForeColor="Black" Font-Size="20"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </asp:TableCell>
                                            </asp:TableRow>
                                        <asp:TableRow ID="TableRow2" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_1_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 105px;" >
                                                            <asp:ImageButton ID="img_1_B" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" colspan="2">
                                    <asp:Table ID="Table102" runat="server" Height="300px" Style="cursor: pointer" Width="240px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow38" runat="server">
                                            <asp:TableCell runat="server" ID="ID_2_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 30px; padding-left: 10px;">
                                                            <asp:Label ID="lblCount_2" runat="server" Text="0" Font-Size="56pt" ForeColor="Black" ToolTip="planned events with expired start dates"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_2" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_300x240_cell_content_bottom">
                                                            <asp:Label ID="Label2" runat="server" Text="planned events with expired start dates" ForeColor="Black" Font-Size="20"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                          </asp:TableRow>
                                        <asp:TableRow ID="TableRow3" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_2_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 105px;" >
                                                            <asp:ImageButton ID="img_2_B" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" colspan="2">
                                    <asp:Table ID="Table103" runat="server" Height="300px" Style="cursor: pointer" Width="240px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow39" runat="server">
                                            <asp:TableCell runat="server" ID="ID_3_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 30px; padding-left: 10px;">
                                                            <asp:Label ID="lblCount_3" runat="server" Text="0" Font-Size="48pt" ForeColor="Black" ToolTip="average time to complete jobs"></asp:Label>
                                                            <asp:Label ID="Label61" runat="server" Text="days" Font-Size="24pt" ForeColor="Black"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_3" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_300x240_cell_content_bottom">
                                                            <asp:Label ID="Label3" runat="server" Text="average time to complete jobs" ForeColor="Black" Font-Size="20"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                             </asp:TableRow>
                                        <asp:TableRow ID="TableRow4" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_3_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 105px;" >
                                                             <asp:ImageButton ID="img_3_B" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" colspan="2">
                                    <asp:Table ID="Table104" runat="server" Height="300px" Style="cursor: pointer" Width="240px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow40" runat="server">
                                            <asp:TableCell runat="server" ID="ID_4_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 30px; padding-left: 10px;">
                                                            <asp:Label ID="lblCount_4" runat="server" Text="0" Font-Size="56pt" ForeColor="Black" ToolTip="open jobs in closed events"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_4" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_300x240_cell_content_bottom">
                                                            <asp:Label ID="Label4" runat="server" Text="open jobs in closed events" ForeColor="Black" Font-Size="20"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow5" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_4_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 105px;" >
                                                            <asp:ImageButton ID="img_4_B" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                            </tr>
                            <tr>
                                <td height="100%" style="padding-left: 30px; padding-top: 50px;" colspan="2">
                                    <asp:Table ID="Table105" runat="server" Height="300px" Style="cursor: pointer" Width="240px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow41" runat="server">
                                            <asp:TableCell runat="server" ID="ID_5_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 30px; padding-left: 10px;">
                                                            <asp:Label ID="lblCount_5" runat="server" Text="0" Font-Size="56pt" ForeColor="Black" ToolTip="defects raised over 9 days ago"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_5" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_300x240_cell_content_bottom">
                                                            <asp:Label ID="Label5" runat="server" Text="defects raised over 9 days ago" ForeColor="Black" Font-Size="20"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow6" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_5_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 105px;" >
                                                            <asp:ImageButton ID="img_5_B" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" colspan="2" style="padding-top: 50px">
                                    <asp:Table ID="Table106" runat="server" Height="300px" Style="cursor: pointer" Width="240px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow42" runat="server">
                                            <asp:TableCell runat="server" ID="ID_6_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 30px; padding-left: 10px;">
                                                            <asp:Label ID="lblCount_6" runat="server" Text="0" Font-Size="56pt" ForeColor="Black" ToolTip="events created over 30 days ago"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_6" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_300x240_cell_content_bottom">
                                                            <asp:Label ID="Label38" runat="server" Text="events created over 30 days ago" ForeColor="Black" Font-Size="20"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow7" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_6_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 105px;" >
                                                            <asp:ImageButton ID="img_6_B" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" colspan="2" style="padding-top: 50px">
                                    <asp:Table ID="Table107" runat="server" Height="300px" Width="240px" CellSpacing="0" CssClass="auto-style4">
                                        <asp:TableRow ID="TableRow43" runat="server">
                                            <asp:TableCell runat="server" ID="ID_7_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 30px; padding-left: 10px;">
                                                            <asp:Label ID="lblCount_7" runat="server" Text="0" Font-Size="56pt" ForeColor="Black" ToolTip="overdue services"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_7" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr style="text-align: center">
                                                        <td class="metro_300x240_cell_content_bottom">
                                                            <asp:Label ID="Label39" runat="server" Text="overdue services" ForeColor="Black" Font-Size="20"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow8" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_7_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 105px;" >
                                                            <asp:ImageButton ID="img_7_B" runat="server"  />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" colspan="2" style="padding-top: 50px">
                                    <asp:Table ID="Table108" runat="server" Height="300px" Style="cursor: pointer" Width="240px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow44" runat="server">
                                            <asp:TableCell runat="server" ID="ID_8_A" BackColor="#e7e7e7" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 30px; padding-left: 10px;">
                                                            <asp:Label ID="lblCount_8" runat="server" Text="0" Font-Size="56pt" ForeColor="Black" ToolTip="component changeout plans overdue"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_8" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_300x240_cell_content_bottom">
                                                            <asp:Label ID="Label40" runat="server" Text="component changeout plans overdue" ForeColor="Black" Font-Size="20"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow9" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_8_B" BackColor="#e7e7e7" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 105px;" >
                                                            <asp:ImageButton ID="img_8_B" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                            </tr>
                            </table>
                    </td>
                </tr>
                    </table>
                    </div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <asp:HiddenField ID="HF_1" runat="server" />
        <asp:HiddenField ID="HF_2" runat="server" />
        <asp:HiddenField ID="HF_3" runat="server" />
        <asp:HiddenField ID="HF_4" runat="server" />
        <asp:HiddenField ID="HF_5" runat="server" />
        <asp:HiddenField ID="HF_6" runat="server" />
        <asp:HiddenField ID="HF_7" runat="server" />
        <asp:HiddenField ID="HF_8" runat="server" />
         <asp:SqlDataSource ID="SqlDS_SYS" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT SYS_Name, SYS_Version FROM SYSTEM"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box1" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box1_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box2" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_EVENTS_WITH_EXPIRED_PLANNED_START_DATES_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box2_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_EVENTS_WITH_EXPIRED_PLANNED_START_DATES_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box3" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVG_TIME_TO_COMPLETE_JOB_CARDS_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box3_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVG_TIME_TO_COMPLETE_JOB_CARDS_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box4" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_OPEN_JOBS_IN_CLOSED_EVENTS_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box4_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_OPEN_JOBS_IN_CLOSED_EVENTS_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box5" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_DEFECTS_RAISED_OVER_9_DAYS_AGO_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box5_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_DEFECTS_RAISED_OVER_9_DAYS_AGO_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box6" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_EVENTS_CREATED_OVER_30_DAYS_AGO_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box6_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_EVENTS_CREATED_OVER_30_DAYS_AGO_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box7" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_OVERDUE_SERVICES_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box7_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_OVERDUE_SERVICES_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box8" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_COMPONENTS_OVERDUE_CHANGEOUT_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
                 <asp:SqlDataSource ID="SqlDS_Box8_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_COMPONENTS_OVERDUE_CHANGEOUT_LW_SP" SelectCommandType="StoredProcedure">
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
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline">
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
        </telerik:RadAjaxLoadingPanel>
    </form>
</body>
</html>

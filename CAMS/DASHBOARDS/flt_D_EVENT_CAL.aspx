<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Dashboards - Events Calendar" CodeFile="flt_D_EVENT_CAL.aspx.vb" Inherits="DASHBOARDS_flt_D_EVENT_CAL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
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

        .auto-style27 {
            width: 290px;
        }

        .auto-style28 {
            width: 235px;
        }

        .RadComboBox_Glow {
            color: #1c262c;
            font-size: 13px;
            font-family: Arial,Helvetica,sans-serif;
        }

        .RadComboBox {
            text-align: left;
            display: inline-block;
            vertical-align: middle;
            white-space: nowrap;
            *display: inline;
            *zoom: 1;
        }

        .RadComboBox_Glow {
            color: #1c262c;
            font-size: 13px;
            font-family: Arial,Helvetica,sans-serif;
        }

        .RadComboBox {
            text-align: left;
            display: inline-block;
            vertical-align: middle;
            white-space: nowrap;
            *display: inline;
            *zoom: 1;
        }

        .RadComboBox_Glow {
            color: #1c262c;
            font-size: 13px;
            font-family: Arial,Helvetica,sans-serif;
        }

        .RadComboBox {
            text-align: left;
            display: inline-block;
            vertical-align: middle;
            white-space: nowrap;
            *display: inline;
            *zoom: 1;
        }

        .RadComboBox_Glow {
            color: #1c262c;
            font-size: 13px;
            font-family: Arial,Helvetica,sans-serif;
        }

        .RadComboBox {
            text-align: left;
            display: inline-block;
            vertical-align: middle;
            white-space: nowrap;
            *display: inline;
            *zoom: 1;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbInputCell {
            border-color: #000;
            background-color: #1c262c;
            color: #e2e8eb;
            background-image: url('mvwres://Telerik.Web.UI.Skins, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Glow.Common.radPrimaryGradientButtonSprite.png');
            background-position: 0 0;
        }

        .RadComboBox .rcbReadOnly .rcbInputCellLeft {
            background-position: 0 -88px;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbInputCell {
            border-color: #000;
            background-color: #1c262c;
            color: #e2e8eb;
            background-image: url('mvwres://Telerik.Web.UI.Skins, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Glow.Common.radPrimaryGradientButtonSprite.png');
            background-position: 0 0;
        }

        .RadComboBox .rcbReadOnly .rcbInputCellLeft {
            background-position: 0 -88px;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbInputCell {
            border-color: #000;
            background-color: #1c262c;
            color: #e2e8eb;
            background-image: url('mvwres://Telerik.Web.UI.Skins, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Glow.Common.radPrimaryGradientButtonSprite.png');
            background-position: 0 0;
        }

        .RadComboBox .rcbReadOnly .rcbInputCellLeft {
            background-position: 0 -88px;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbInputCell {
            border-color: #000;
            background-color: #1c262c;
            color: #e2e8eb;
            background-image: url('mvwres://Telerik.Web.UI.Skins, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Glow.Common.radPrimaryGradientButtonSprite.png');
            background-position: 0 0;
        }

        .RadComboBox .rcbReadOnly .rcbInputCellLeft {
            background-position: 0 -88px;
        }

        .RadComboBox_Glow .rcbInputCell {
            border-color: #000;
            color: #fff;
            background-color: #29343b;
        }

        .RadComboBox_Glow .rcbInputCell {
            height: 26px;
            border-width: 1px;
            border-style: solid;
            background-position: 0 0;
            background-repeat: repeat-x;
        }

        .RadComboBox .rcbInputCellLeft {
            background-position: 0 0;
        }

        .RadComboBox .rcbInputCell {
            padding-right: 4px;
            padding-left: 5px;
            width: 100%;
            height: 20px;
            line-height: 20px;
            text-align: left;
            vertical-align: middle;
        }

        .RadComboBox .rcbInputCell {
            padding: 0;
            border-width: 0;
            border-style: solid;
            background-color: transparent;
            background-repeat: no-repeat;
        }

        .RadComboBox_Glow .rcbInputCell {
            border-color: #000;
            color: #fff;
            background-color: #29343b;
        }

        .RadComboBox_Glow .rcbInputCell {
            height: 26px;
            border-width: 1px;
            border-style: solid;
            background-position: 0 0;
            background-repeat: repeat-x;
        }

        .RadComboBox .rcbInputCellLeft {
            background-position: 0 0;
        }

        .RadComboBox .rcbInputCell {
            padding-right: 4px;
            padding-left: 5px;
            width: 100%;
            height: 20px;
            line-height: 20px;
            text-align: left;
            vertical-align: middle;
        }

        .RadComboBox .rcbInputCell {
            padding: 0;
            border-width: 0;
            border-style: solid;
            background-color: transparent;
            background-repeat: no-repeat;
        }

        .RadComboBox_Glow .rcbInputCell {
            border-color: #000;
            color: #fff;
            background-color: #29343b;
        }

        .RadComboBox_Glow .rcbInputCell {
            height: 26px;
            border-width: 1px;
            border-style: solid;
            background-position: 0 0;
            background-repeat: repeat-x;
        }

        .RadComboBox .rcbInputCellLeft {
            background-position: 0 0;
        }

        .RadComboBox .rcbInputCell {
            padding-right: 4px;
            padding-left: 5px;
            width: 100%;
            height: 20px;
            line-height: 20px;
            text-align: left;
            vertical-align: middle;
        }

        .RadComboBox .rcbInputCell {
            padding: 0;
            border-width: 0;
            border-style: solid;
            background-color: transparent;
            background-repeat: no-repeat;
        }

        .RadComboBox_Glow .rcbInputCell {
            border-color: #000;
            color: #fff;
            background-color: #29343b;
        }

        .RadComboBox_Glow .rcbInputCell {
            height: 26px;
            border-width: 1px;
            border-style: solid;
            background-position: 0 0;
            background-repeat: repeat-x;
        }

        .RadComboBox .rcbInputCellLeft {
            background-position: 0 0;
        }

        .RadComboBox .rcbInputCell {
            padding-right: 4px;
            padding-left: 5px;
            width: 100%;
            height: 20px;
            line-height: 20px;
            text-align: left;
            vertical-align: middle;
        }

        .RadComboBox .rcbInputCell {
            padding: 0;
            border-width: 0;
            border-style: solid;
            background-color: transparent;
            background-repeat: no-repeat;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbInput {
            color: #e2e8eb;
        }

        .RadComboBox .rcbReadOnly .rcbInput {
            cursor: default;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbInput {
            color: #e2e8eb;
        }

        .RadComboBox .rcbReadOnly .rcbInput {
            cursor: default;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbInput {
            color: #e2e8eb;
        }

        .RadComboBox .rcbReadOnly .rcbInput {
            cursor: default;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbInput {
            color: #e2e8eb;
        }

        .RadComboBox .rcbReadOnly .rcbInput {
            cursor: default;
        }

        .RadComboBox_Glow .rcbInput {
            color: #fff;
            font-size: 13px;
            font-family: Arial,Helvetica,sans-serif;
        }

        .RadComboBox .rcbInput {
            margin: 0;
            padding: 2px 0 1px;
            height: auto;
            width: 100%;
            border-width: 0;
            outline: 0;
            color: inherit;
            background-color: transparent;
            vertical-align: top;
            opacity: 1;
        }

        .RadComboBox_Glow .rcbInput {
            color: #fff;
            font-size: 13px;
            font-family: Arial,Helvetica,sans-serif;
        }

        .RadComboBox .rcbInput {
            margin: 0;
            padding: 2px 0 1px;
            height: auto;
            width: 100%;
            border-width: 0;
            outline: 0;
            color: inherit;
            background-color: transparent;
            vertical-align: top;
            opacity: 1;
        }

        .RadComboBox_Glow .rcbInput {
            color: #fff;
            font-size: 13px;
            font-family: Arial,Helvetica,sans-serif;
        }

        .RadComboBox .rcbInput {
            margin: 0;
            padding: 2px 0 1px;
            height: auto;
            width: 100%;
            border-width: 0;
            outline: 0;
            color: inherit;
            background-color: transparent;
            vertical-align: top;
            opacity: 1;
        }

        .RadComboBox_Glow .rcbInput {
            color: #fff;
            font-size: 13px;
            font-family: Arial,Helvetica,sans-serif;
        }

        .RadComboBox .rcbInput {
            margin: 0;
            padding: 2px 0 1px;
            height: auto;
            width: 100%;
            border-width: 0;
            outline: 0;
            color: inherit;
            background-color: transparent;
            vertical-align: top;
            opacity: 1;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbArrowCell {
            background-position: 0 0;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbArrowCellRight {
            border-left-width: 0;
        }

        .RadComboBox .rcbReadOnly .rcbArrowCellRight {
            background-position: -162px -176px;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbArrowCell {
            background-position: 0 0;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbArrowCellRight {
            border-left-width: 0;
        }

        .RadComboBox .rcbReadOnly .rcbArrowCellRight {
            background-position: -162px -176px;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbArrowCell {
            background-position: 0 0;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbArrowCellRight {
            border-left-width: 0;
        }

        .RadComboBox .rcbReadOnly .rcbArrowCellRight {
            background-position: -162px -176px;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbArrowCell {
            background-position: 0 0;
        }

        .RadComboBox_Glow .rcbReadOnly .rcbArrowCellRight {
            border-left-width: 0;
        }

        .RadComboBox .rcbReadOnly .rcbArrowCellRight {
            background-position: -162px -176px;
        }

        .RadComboBox_Glow .rcbArrowCell {
            width: 24px;
            border-color: #000;
            background-color: #1c262c;
            color: #e2e8eb;
            background-image: url('mvwres://Telerik.Web.UI.Skins, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Glow.Common.radPrimaryGradientButtonSprite.png');
        }

        .RadComboBox_Glow .rcbArrowCell {
            height: 26px;
            border-width: 1px;
            border-style: solid;
            background-position: 0 0;
            background-repeat: repeat-x;
        }

        .RadComboBox .rcbArrowCellRight {
            background-position: -18px -176px;
        }

        .RadComboBox .rcbArrowCell {
            width: 18px;
        }

        .RadComboBox .rcbArrowCell {
            padding: 0;
            border-width: 0;
            border-style: solid;
            background-color: transparent;
            background-repeat: no-repeat;
        }

        .RadComboBox_Glow .rcbArrowCell {
            width: 24px;
            border-color: #000;
            background-color: #1c262c;
            color: #e2e8eb;
            background-image: url('mvwres://Telerik.Web.UI.Skins, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Glow.Common.radPrimaryGradientButtonSprite.png');
        }

        .RadComboBox_Glow .rcbArrowCell {
            height: 26px;
            border-width: 1px;
            border-style: solid;
            background-position: 0 0;
            background-repeat: repeat-x;
        }

        .RadComboBox .rcbArrowCellRight {
            background-position: -18px -176px;
        }

        .RadComboBox .rcbArrowCell {
            width: 18px;
        }

        .RadComboBox .rcbArrowCell {
            padding: 0;
            border-width: 0;
            border-style: solid;
            background-color: transparent;
            background-repeat: no-repeat;
        }

        .RadComboBox_Glow .rcbArrowCell {
            width: 24px;
            border-color: #000;
            background-color: #1c262c;
            color: #e2e8eb;
            background-image: url('mvwres://Telerik.Web.UI.Skins, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Glow.Common.radPrimaryGradientButtonSprite.png');
        }

        .RadComboBox_Glow .rcbArrowCell {
            height: 26px;
            border-width: 1px;
            border-style: solid;
            background-position: 0 0;
            background-repeat: repeat-x;
        }

        .RadComboBox .rcbArrowCellRight {
            background-position: -18px -176px;
        }

        .RadComboBox .rcbArrowCell {
            width: 18px;
        }

        .RadComboBox .rcbArrowCell {
            padding: 0;
            border-width: 0;
            border-style: solid;
            background-color: transparent;
            background-repeat: no-repeat;
        }

        .RadComboBox_Glow .rcbArrowCell {
            width: 24px;
            border-color: #000;
            background-color: #1c262c;
            color: #e2e8eb;
            background-image: url('mvwres://Telerik.Web.UI.Skins, Version=2016.3.914.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Glow.Common.radPrimaryGradientButtonSprite.png');
        }

        .RadComboBox_Glow .rcbArrowCell {
            height: 26px;
            border-width: 1px;
            border-style: solid;
            background-position: 0 0;
            background-repeat: repeat-x;
        }

        .RadComboBox .rcbArrowCellRight {
            background-position: -18px -176px;
        }

        .RadComboBox .rcbArrowCell {
            width: 18px;
        }

        .RadComboBox .rcbArrowCell {
            padding: 0;
            border-width: 0;
            border-style: solid;
            background-color: transparent;
            background-repeat: no-repeat;
        }

        .auto-style29 {
            border-left-width: 1px;
            border-right-width: 0;
            border-top-width: 1px;
            border-bottom-width: 1px;
            padding-left: 5px;
            padding-right: 4px;
            padding-top: 0;
            padding-bottom: 0;
        }

        .auto-style30 {
            border-width: 1px;
            padding: 0;
        }
    </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
    function fn_home() {
        var THISGUID = document.getElementById('HF_GUID').value;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    function fn_back() {
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISPP = document.getElementById('HF_PreviousPage').value;
        if (THISPP == 0) {
            window.open('../CLIENT/flt_EVENT_MANAGEMENT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
        }
        if (THISPP == 1) {
            window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=8', '_self');
        }
    }
    function fn_eventdetail() {
        var THISGUID = document.getElementById('HF_GUID').value;
        window.open('../EVENT_MANAGEMENT/flt_EM_ACTIVE_EVENTS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=3', '_self');
    }
    function fn_jobmanagement() {
        var THISGUID = document.getElementById('HF_GUID').value;
        window.open('../EVENT_MANAGEMENT/flt_EM_JOBS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=3', '_self');
    }
    function fn_timesheets() {
        var THISGUID = document.getElementById('HF_GUID').value;
        window.open('../EVENT_MANAGEMENT/flt_EM_FITTERS_TIMESHEETS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=3', '_self');
    }
    function RowSelected(sender, eventArgs) {
        var apt = eventArgs.get_appointment();
        var ATTid = apt.get_id();
        document.getElementById('HF_E_ID').value = ATTid;
        var THISGUID = document.getElementById('HF_GUID').value;
        var THISE = document.getElementById('HF_E_ID').value;
        var oWnd = $find("<%=RadWindow2.ClientID%>");
        oWnd.setUrl('../EVENT_MANAGEMENT/flt_EM_EVENTS_EDIT_RW.aspx?FLT_GUID=' + THISGUID + '&E_ID=' + THISE + '&PreviousPage=0', 'newwindow', 'target=_blank, top=50, left=200, height=350, width=750, status=no, menubar=no, resizable=no, location=no');
        oWnd.show();
    }

    function closeWindow_add_event(sender, args) {
        var x = args.get_argument();
        //alert(x);
        if (x > 0) {
            var oWnd = $find("< %=RadWindow2.ClientID%>");
            oWnd.close();
        }
    }
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False">
                </telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                    <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">&nbsp;&nbsp;
                            <img alt="" src="../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style2">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="28px" Text="CAMS"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle"></td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; background-color: #ff661c; text-align: left;" valign="middle"></td>
                        </tr>
                    </table>
                    <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style27">
                                <asp:Label ID="lblTitle" runat="server" Text="EVENT PLANNING CALENDAR" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right; padding-right: 10px;" class="auto-style28">Customer:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Customer" runat="server" AllowCustomText="True" AutoPostBack="True" DataTextField="CUS_Name" DataValueField="CUS_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                    </table>
                    <table style="padding-top: 20px">
                        <tr>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow1" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_1" runat="server" onClick="fn_eventdetail()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/EVENT_DETAIL.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label1" runat="server" Text="EVENT DETAIL" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow2" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_2" runat="server" onClick="fn_jobmanagement()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/EVENT_JOB_MANAGEMENT.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label2" runat="server" Text="JOB MANAGEMENT" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                                    <asp:TableRow ID="TableRow3" runat="server">
                                        <asp:TableCell ID="ID_CELL_3" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_3" runat="server" onClick="fn_timesheets()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/EVENT_FITTER_TIMESHEET.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label3" runat="server" Text="TIMESHEETS" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T4" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow36" runat="server">
                                        <asp:TableCell ID="ID_CELL_4" runat="server" CssClass="roundcorners">
                                            <asp:Panel ID="Panel_4" runat="server" onClick="fn_panel_4()" CssClass="roundcorners" BackColor="#e7e7e7">
                                                <table border="0">
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_top" colspan="2">
                                                            <img src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label36" runat="server" Text="" ForeColor="Black"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td class="style9" style="text-align: left; vertical-align: top;" colspan="6">
                                <telerik:RadScheduler ID="RadScheduler1" runat="server" AllowDelete="False"
                                    AllowInsert="False" DayEndTime="17:00:00" DayStartTime="07:00:00"
                                    FirstDayOfWeek="Monday" HoursPanelTimeFormat="H:mm"
                                    SelectedView="MonthView" Skin="Glow" DataDescriptionField="E_Description"
                                    DataEndField="E_Date_Estimated" DataKeyField="E_ID"
                                    DataStartField="E_Planned_Start_Date"
                                    DataSubjectField="Subject" Height="100%" TimeLabelRowSpan="4"
                                    Width="100%"
                                    OnClientAppointmentDoubleClick="RowSelected"
                                    ReadOnly="True">
                                    <ExportSettings>
                                        <Pdf PageBottomMargin="1in" PageLeftMargin="1in" PageRightMargin="1in" PageTopMargin="1in" />
                                    </ExportSettings>
                                    <TimelineView NumberOfSlots="50" ReadOnly="True" ShowInsertArea="False" />
                                    <WeekView ReadOnly="True" ShowHiddenAppointmentsIndicator="False" />
                                    <DayView ReadOnly="True" />
                                    <MultiDayView ReadOnly="True" />
                                    <MonthView VisibleAppointmentsPerDay="10" MinimumRowHeight="7" ReadOnly="True" />
                                    <AgendaView ReadOnly="True" />
                                    <YearView ReadOnly="True" />
                                </telerik:RadScheduler>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6" style="text-align: left; vertical-align: top;" colspan="5"></td>
                            <td style="text-align: left;" class="style5">
                            </td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
             <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server" />
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
            <asp:HiddenField ID="HF_PageJob" runat="server" />
            <asp:HiddenField ID="HF_PageFT" runat="server" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_E_ID" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Customer">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadScheduler1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadWindow ID="RadWindow2" runat="server" Height="800px" Width="1400px" OnClientClose="closeWindow_add_event" Behaviors="Close, Move" Modal="True" Title="CAMS - Loading" VisibleStatusbar="False" KeepInScreenBounds="True" ShowContentDuringLoad="False" Skin="Glow">
            </telerik:RadWindow>
        </div>
    </form>
</body>
</html>


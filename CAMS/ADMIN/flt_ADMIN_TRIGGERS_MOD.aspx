<%@ Page Language="VB" AutoEventWireup="false" Title="Admin - TRIGGERS - MODEL CLONE" CodeFile="flt_ADMIN_TRIGGERS_MOD.aspx.vb" Inherits="ADMIN_TRIGGERS_MOD" %>

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
        .auto-style5 {
            width: 251px;
        }
        .auto-style6 {
            width: 185px;
        }
        .auto-style7 {
            width: 149px;
        }
    </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
     function gebi(id) {
        return document.getElementById(id);
    }
    function fn_copymodel() {
        gebi('<%= btn_copymodel.ClientID %>').click();
    }
    function fn_home() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        window.open('../CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=0', '_self');
    }
    function fn_back() {
        var THISGUID = document.getElementById('lblGUID').innerHTML;
        var THISPP = document.getElementById('lblPreviousPage').innerHTML;
        window.open('flt_ADMIN_TRIGGERS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=' + THISPP, '_self');
    }
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%" BorderSize="0" BorderStyle="None" LiveResize="True">
                <telerik:RadSplitBar ID="RadSplitBar1" runat="server" BorderStyle="None" Visible="False"></telerik:RadSplitBar>
                <telerik:RadPane ID="RadPane2" runat="server" BorderStyle="None" Scrolling="Both" Style="text-align: right" Font-Names="Segoe UI" ForeColor="White">
                     <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../../IMAGES/BACK_58.png" id="Img3" onclick="fn_back()" style="cursor: pointer" />
                                &nbsp;&nbsp;
                            <img alt="" src="../../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: center;" class="auto-style2">
                                CAMS
                                <asp:Label ID="lblVersion" runat="server" Font-Size="8pt" Text="v0.0"></asp:Label>

                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" valign="middle">
                                 &nbsp;</td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px;">
                        <tr >
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style5">
                                 <asp:Label ID="lblTitle" runat="server" Text="ADMIN - MODEL CLONE" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style7">
                                Base Model:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Model" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Model" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                            <td align="left" class="auto-style6" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">Copy to New Model:</td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                                <telerik:RadComboBox ID="RadCB_Model_New" runat="server" AllowCustomText="True" AutoPostBack="True" DataSourceID="SqlDS_Model" DataTextField="ATT_Name" DataValueField="ATT_ID" Filter="Contains" Font-Names="Segoe UI" Font-Size="10pt" ResolvedRenderMode="Classic" Skin="Glow">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                    </table>
                     <table style="padding-top: 20px">
                        <tr>
                            <td colspan="3" height="100%" style="padding-left: 1px" valign="top">
                                <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px"  Visible="False">
                                    <asp:TableRow ID="TableRow34" runat="server">
                                        <asp:TableCell ID="ID_CELL_1" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_1" runat="server" onClick="fn_copymodel()" CssClass="roundcorners" BackColor="#d9ffd9">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label34" runat="server" Text="COPY MODEL" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell ID="ID_CELL_2" runat="server" CssClass="roundcorners">
                                     <asp:Panel ID="Panel_2" runat="server" onClick="fn_panel_2()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                               <td class="metro_400x75_cell_content_top" colspan="2" style="padding-bottom: 10px">
                                                     <img src="../../IMAGES/Icons_Black/metro_icon_printer.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label30" runat="server" Text="" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                            <td height="100%" style="padding-left: 15px" valign="top">
                                <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="False">
                                    <asp:TableRow ID="TableRow45" runat="server">
                                        <asp:TableCell ID="ID_CELL_3" runat="server" CssClass="roundcorners">
                                    <asp:Panel ID="Panel_3" runat="server" onClick="fn_panel_3()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                            <td class="metro_400x75_cell_content_top" colspan="2" >
                                                     <img src="../../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label41" runat="server" Text="" ForeColor="Black"></asp:Label>
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
                                                      <img src="../../IMAGES/Icons_Black/metro_setting_58x58.png" />
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
                    <table>
                        <tr>
                            <td style="text-align: left; vertical-align: bottom; font-size: 14px; color: Black;"
                                class="style3" valign="middle" colspan="2">
                                <strong>&nbsp;<asp:Label ID="lbl_Msg" runat="server" Font-Bold="True" ForeColor="Red">To begin, select a &#39;Base Model&#39; to see all items associated with it.</asp:Label>
                                    <asp:Label ID="lbl_Msg2" runat="server" Font-Bold="True" ForeColor="White" Visible="False"></asp:Label>
                                </strong></td>
                        </tr>
                        <tr>
                            <td style="text-align: left; vertical-align: top;">
                                <telerik:RadGrid ID="RadGrid_Triggers" runat="server" AllowAutomaticInserts="True"
                                    AllowAutomaticUpdates="True" DataSourceID="SqlDS_RadGrid_Triggers"
                                    ResolvedRenderMode="Classic" Width="100%"
                                    AllowSorting="True" Skin="Glow">
                                    <ClientSettings EnableAlternatingItems="False">
                                        <Selecting AllowRowSelect="True" />
                                        <Resizing AllowResizeToFit="True" ResizeGridOnColumnResize="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="SJ_ID"
                                        DataKeyNames="SJ_ID" DataSourceID="SqlDS_RadGrid_Triggers">
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>
                                        <CommandItemSettings AddNewRecordText="Add new job trigger" />
                                        <Columns>
                                            <telerik:GridEditCommandColumn ButtonType="ImageButton">
                                            </telerik:GridEditCommandColumn>
                                            <telerik:GridBoundColumn DataField="SJ_ID" DataType="System.Int32"
                                                Display="False" FilterControlAltText="Filter SJ_ID column" HeaderText="ID"
                                                ReadOnly="True" SortExpression="SJ_ID" UniqueName="SJ_ID">
                                                <HeaderStyle Width="50px" Wrap="False" />
                                                <ItemStyle Width="50px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Model"
                                                FilterControlAltText="Filter Model column" HeaderText="Model" ReadOnly="True"
                                                SortExpression="Model" UniqueName="Model">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Code_Level_1"
                                                FilterControlAltText="Filter SJ_Code_Level_1 column" HeaderText="Level 1" ReadOnly="True"
                                                SortExpression="SJ_Code_Level_1" UniqueName="SJ_Code_Level_1">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Code_Level_2"
                                                FilterControlAltText="Filter SJ_Code_Level_2 column" HeaderText="Level 2" ReadOnly="True"
                                                SortExpression="SJ_Code_Level_2" UniqueName="SJ_Code_Level_2">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Code_Level_3"
                                                FilterControlAltText="Filter SJ_Code_Level_3 column" HeaderText="Level 3" ReadOnly="True"
                                                SortExpression="SJ_Code_Level_3" UniqueName="SJ_Code_Level_3">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Frequency"
                                                FilterControlAltText="Filter SJ_Frequency column" HeaderText="Frequency"
                                                SortExpression="SJ_Frequency" UniqueName="SJ_Frequency"
                                                ReadOnly="True">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Leadtime_Weeks"
                                                FilterControlAltText="Filter SJ_Leadtime_Weeks column"
                                                HeaderText="Leadtime (Wks)" SortExpression="SJ_Leadtime_Weeks"
                                                UniqueName="SJ_Leadtime_Weeks" ReadOnly="True">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn DataField="SJ_MOD_Copy_Flag"
                                                FilterControlAltText="Filter SJ_MOD_Copy_Flag column"
                                                HeaderText="Add to New Model" SortExpression="SJ_MOD_Copy_Flag"
                                                UniqueName="SJ_MOD_Copy_Flag" Display="False">
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="RadComboBox1" runat="server"
                                                        ResolvedRenderMode="Classic" SelectedValue='<%# Bind("SJ_MOD_Copy_Flag") %>'
                                                        Skin="Glow" Width="100px">
                                                        <Items>
                                                            <telerik:RadComboBoxItem runat="server" Text="Yes" Value="0" />
                                                            <telerik:RadComboBoxItem runat="server" Text="No" Value="1" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="SJ_MOD_Copy_FlagLabel" runat="server"
                                                        Text='<%# Eval("SJ_MOD_Copy_Flag") %>'></asp:Label>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="CopyFlag"
                                                FilterControlAltText="Filter CopyFlag column" HeaderText="Add to New Model"
                                                SortExpression="CopyFlag" UniqueName="CopyFlag" ReadOnly="True">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Created"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter SJ_Created column" HeaderText="Date Created"
                                                ReadOnly="True" SortExpression="SJ_Created" UniqueName="SJ_Created">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Created_By"
                                                FilterControlAltText="Filter SJ_Created_By column" HeaderText="Created By"
                                                ReadOnly="True" SortExpression="SJ_Created_By" UniqueName="SJ_Created_By">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Modified"
                                                DataFormatString="{0:dd MMM yyyy}"
                                                FilterControlAltText="Filter SJ_Modified column"
                                                HeaderText="Date Modified" ReadOnly="True" SortExpression="SJ_Modified"
                                                UniqueName="SJ_Modified">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SJ_Modified_By"
                                                FilterControlAltText="Filter SJ_Modified_By column" HeaderText="Modified By"
                                                ReadOnly="True" SortExpression="SJ_Modified_By" UniqueName="SJ_Modified_By">
                                                <HeaderStyle Width="200px" Wrap="False" />
                                                <ItemStyle Width="200px" Wrap="True" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                            </EditColumn>
                                        </EditFormSettings>
                                        <ItemStyle Font-Names="Segoe UI" Font-Size="10pt" ForeColor="Black" />
                                        <AlternatingItemStyle BackColor="#DBDBDB" Font-Names="Segoe UI"
                                            Font-Size="10pt" ForeColor="Black" />
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:Label ID="lbl_Model" runat="server" ForeColor="#F8A969" Font-Size="2pt"></asp:Label>
                            </td>
                            <td style="text-align: left">
                                 <asp:Label ID="lblPageName" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                 <asp:Label ID="lbl_Test" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblWhoIsIt" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                                <asp:Label ID="lblGUID" runat="server" Font-Size="1px"  ForeColor="White"></asp:Label>
                                <asp:Label ID="lblRun" runat="server" Font-Size="1px"  ForeColor="White"></asp:Label>
                                <asp:Label ID="lblPreviousPage" runat="server" Font-Size="1px" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
                    <asp:ImageButton ID="btn_copymodel" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
            <asp:HiddenField ID="HF_Username" runat="server" />
            <asp:HiddenField ID="HF_SessionIP" runat="server" />
            <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
            <asp:HiddenField ID="HF_SJ_ID" runat="server" />
            <asp:HiddenField ID="HF_Table" runat="server" Value="Test" />
            <asp:HiddenField ID="HF_Session_ID" runat="server" />
            <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
            <asp:HiddenField ID="HF_EMP_ID" runat="server" />
            <asp:SqlDataSource ID="SqlDS_SYS" runat="server" ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>" SelectCommand="SELECT SYS_Name, SYS_Version FROM SYSTEM"></asp:SqlDataSource>
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
            <asp:SqlDataSource ID="SqlDS_Model_Copy" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="ADMIN_JOB_TRIGGERS_CREATE_MODEL_COPY"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Model" Name="Model" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadCB_Model_New" Name="NewModel" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="lblWhoIsIt" Name="WhoIsIt" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_RadGrid_Triggers" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT SJ.SJ_ID, SJ.SJ_MOD_ID, ATTMOD.ATT_Name AS Model, ATT1.ATT_Name + ' : ' + ATT1.ATT_Description AS SJ_Code_Level_1, ATT2.ATT_Name + ' : ' + ATT2.ATT_Description AS SJ_Code_Level_2, ATT3.ATT_Name + ' : ' + ATT3.ATT_Description AS SJ_Code_Level_3, SJ.SJ_Frequency, SJ.SJ_Duration, SJ.SJ_Leadtime_Weeks, SJ.SJ_MOD_Copy_Flag, CASE SJ_MOD_Copy_Flag WHEN 0 THEN 'Yes' ELSE 'No' END AS CopyFlag, SJ.SJ_Status, SJ.SJ_Created, SJ.SJ_Created_By, SJ.SJ_Modified, SJ.SJ_Modified_By FROM SMU_JOB AS SJ LEFT OUTER JOIN ATTRIBUTES AS ATTMOD ON SJ.SJ_MOD_ID = ATTMOD.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATT1 ON SJ.SJ_Code_Level_1 = ATT1.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATT2 ON SJ.SJ_Code_Level_2 = ATT2.ATT_ID LEFT OUTER JOIN ATTRIBUTES AS ATT3 ON SJ.SJ_Code_Level_3 = ATT3.ATT_ID WHERE (SJ.SJ_MOD_ID LIKE @ATT_ID) AND (SJ.SJ_Status NOT IN ('Trash', 'Delete')) ORDER BY Model, SJ_Code_Level_1, SJ_Code_Level_2, SJ_Code_Level_3"
                UpdateCommand="UPDATE SMU_Job SET SJ_MOD_Copy_Flag = @SJ_MOD_Copy_Flag WHERE (SJ_ID = @SJ_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadCB_Model" Name="ATT_ID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SJ_MOD_Copy_Flag" />
                    <asp:Parameter Name="SJ_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Model" runat="server"
                ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
                SelectCommand="SELECT '%' AS ATT_ID, '*All Models' AS ATT_Name UNION ALL SELECT CONVERT (nvarchar(10), ATT_ID) AS ATT_ID, ATT_Name FROM ATTRIBUTES WHERE (ATT_TABLE = 'ASSET_Model') AND (ATT_Status NOT IN ('Trash', 'Delete')) ORDER BY ATT_Name"></asp:SqlDataSource>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCB_Model_New" />
                            <telerik:AjaxUpdatedControl ControlID="T1" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Triggers" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Model" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Msg" />
                            <telerik:AjaxUpdatedControl ControlID="lbl_Msg2" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCB_Model_New">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="T1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid_Triggers">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="T1" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid_Triggers" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
    </form>
</body>
</html>


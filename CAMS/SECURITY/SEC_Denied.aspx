<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SEC_Denied.aspx.vb" Inherits="SECURITY_SEC_Denied" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 208px;
        }
    </style>
    <script type="text/javascript">
   
        function Redirect_To_Intranet() {
            window.open('http://hosp1/Banks/SitePages/Home.aspx', '_self');

        }

    </script>

</head>
<body >
    <form id="form1" runat="server">
    <div>
    
        <table cellspacing="0" width="40%" style="font-family: 'Microsoft Sans Serif'; font-size: 12pt" align="center">
            <tr>
                <td style="border-bottom-style: Solid; border-bottom-width: 3px; border-bottom-color: #FF0000; font-size: 16PT; padding-top: 50px; padding-bottom: 7px; padding-left: 5px;" 
                     colspan="2">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </td>
                <td style="border-bottom-style: Solid; border-bottom-width: 3px; border-bottom-color: #FF0000; font-size: 14PT; padding-top: 50px; padding-right: 5px;" 
                    class="style1">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGES/24/x.png" />
                </td>
            </tr>
            <tr>
                <td class="style1" width="40%">
                    &nbsp;</td>
                <td width="55%">
                    &nbsp;</td>
                <td width="5%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style1" 
                    style="padding-right: 20px; padding-left: 20px;" valign="middle">
                    Application</td>
                <td valign="middle">
                    <asp:Label ID="lblApplication_Name" runat="server" Font-Bold="False" 
                        Font-Size="12pt"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style1" 
                    style="padding-right: 20px; padding-left: 20px;" valign="middle">
                    &nbsp;</td>
                <td valign="middle">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style1" 
                    style="padding-right: 20px; padding-left: 20px;" valign="middle">
                    Employee name</td>
                <td valign="middle">
                    <asp:Label ID="lblEmployee_Name" runat="server" Font-Bold="False" 
                        Font-Size="12pt"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="padding-left: 20px" valign="middle">
                    Status</td>
                <td valign="middle">
                    <asp:Label ID="lblStatus" runat="server" Font-Bold="False" 
                        Font-Size="12pt"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    </td>
                <td>
                    <telerik:RadButton ID="RadBtn_Continue" runat="server" Text="Continue" 
                        onclientclicked="Redirect_To_Intranet" AutoPostBack="False" Skin="Metro" 
                        style="top: 0px; left: 77px">
                    </telerik:RadButton>
                </td>
                <td>
                    </td>
            </tr>
        </table>
    
    </div>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
    </form>
</body>
</html>

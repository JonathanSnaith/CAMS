<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Title="CAMS"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <link href="STYLES/CAMS.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="App_Code/fleet_16.png"/> 
	<title></title>
	<style type="text/css">
     </style>
</head>
<body bgcolor="#ffffff">
<script type="text/javascript">
    
</script>
<form id="form1" runat="server">
<div style="padding-top: 30px; padding-left: 30px; padding-bottom: 30px; vertical-align: middle; background-color: #FFFFFF; color: #000000;">

	<asp:Image ID="Image1" runat="server" 
        ImageUrl="IMAGES/24x24/padlock_24_silk.png" />

	You do not have permission to enter the CAMS web site!<br />
    <a href="http://hoaspsvr1/FLEET/SECURITY/set_session.aspx?WhoIsIt=Jonathan Snaith">Link</a>

</div>	
</form>
</body>
</html>

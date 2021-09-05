<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Scout.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error</title>
    <link rel="stylesheet" href="styles/Styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <asp:Button id="home" runat="server" Text="HOME       " OnClick="cancel" CssClass="headerButton"/>
            <div class="heading">STATSCOUT</div>
            <asp:Button id="contact" runat="server" Text="CONTACT US" OnClick="contactUs" CssClass="headerButton"/>
        </header>
        
        <div class="main">
            <h1>Bad request</h1>
            <p>Sorry, there are no players on the market matching your requirements.</p>
            <p>Please change request</p>
            <asp:Button id="cancelButton" runat="server" Text="Back" OnClick="cancel" CssClass="button"/>
        </div>
    </form>
</body>
</html>

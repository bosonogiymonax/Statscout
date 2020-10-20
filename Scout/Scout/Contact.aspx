<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Scout.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact us</title>
    <link rel="stylesheet" href="styles/Styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <asp:Button id="home" runat="server" Text="HOME       " OnClick="cancel" CssClass="headerButton"/>
            <div class="heading">STATSCOUT</div>
            <asp:Button id="contact" runat="server" Text="CONTACT US" CssClass="headerButton"/>
        </header>

        <div class="main">
            <h1>Contacts:</h1>
            <p>Email: <a href="mailto:aleksandr1998d@yandex.ru">aleksandr1998d@yandex.ru</a></p>
            <p>Phone: +7 (951) 560-62-59</p>
        </div>
    </form>
</body>
</html>

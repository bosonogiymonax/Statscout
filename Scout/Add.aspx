<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Scout.Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add</title>
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
            <h2>Add player to the transfer market</h2>
            <label>Name:</label> 
            <asp:TextBox id="name" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            <label>Position:</label> 
            <asp:TextBox id="position" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            <label>Age:</label> 
            <asp:TextBox id="age" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            <label>MarketValue:</label> 
            <asp:TextBox id="marketValue" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            <label>Nation:</label> 
            <asp:TextBox id="nation" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            <label>Club:</label> 
            <asp:TextBox id="club" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            
            <asp:Button id="insertButton" runat="server" text="Add to database" OnClick = "addPlayer" CssClass="button"/>
        </div>
    </form>
</body>
</html>

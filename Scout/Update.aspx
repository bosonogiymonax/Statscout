<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Scout.Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update</title>
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
            <h2>Update player info</h2>
            <label>Enter the name of updated player:</label>
            <asp:TextBox id="name" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            <label>Select the field to update:</label>
            <asp:DropDownList id="updateFields" runat="server" CssClass="ddl">
                <asp:ListItem Text="Position" />
                <asp:ListItem Text="Age" />
                <asp:ListItem Text="MarketValue" />
                <asp:ListItem Text="Nation" />
                <asp:ListItem Text="Club" />
            </asp:DropDownList>
            <label>Enter updated value:</label>
            <asp:TextBox id="value" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            <asp:Button id="updateButton" runat="server" text="Update" OnClick="updatePlayer" CssClass="button"/>
        </div>
    </form>
</body>
</html>

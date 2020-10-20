<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Scout.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>StatsScout</title>
    <link rel="stylesheet" href="styles/Styles.css" />
</head>
<body>
    <form id = "form1" runat = "server">
        <header>
            <asp:Button id="home" runat="server" Text="HOME       " CssClass="headerButton"/>
            <div class="heading">STATSCOUT</div>
            <asp:Button id="contact" runat="server" Text="CONTACT US" OnClick = "contactUs" CssClass="headerButton"/>
        </header>

        <div class="main">
            <h2>Web-application for football managers and scouts</h2>
            <div>
                <label>Enter position:</label><br />  
                <asp:TextBox id="position" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            </div>
            <div>
                <label>Enter your budget:</label><br />  
                <asp:TextBox id="budget" runat="server" type="text" CssClass="textBox"></asp:TextBox>
            </div>
            <asp:Button id="submitButton" runat="server" text="Find" OnClick = "sendData" CssClass="button"/> 
            <asp:Button id="insertButton" runat="server" text="Add" OnClick = "addPlayer" CssClass="button"/>
            <asp:Button id="updateButton" runat="server" text="Update" OnClick = "updateInfo" CssClass="button"/>  
        </div>        
    </form>
</body>
</html>

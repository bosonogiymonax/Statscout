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
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="main">
            <ContentTemplate>
                <h2>Web-application for football managers and scouts</h2>
                <div>
                    <label>Enter position:</label><br />  
                    <asp:TextBox id="position" runat="server" type="text" CssClass="textBox" 
                        AutoPostBack="true" OnTextChanged="sendData" ></asp:TextBox>
                </div>
                <div>
                    <label>Enter your budget:</label><br />  
                    <asp:TextBox id="budget" runat="server" type="text" CssClass="textBox" 
                        AutoPostBack="true" OnTextChanged="sendData" Text="0"></asp:TextBox>
                </div>

                <h3>The following players are suitable for you:</h3>
        
                <asp:Repeater id="repeater" runat="server">
                  <HeaderTemplate>
                     <table>
                        <tr>
                           <th><b>Name</b></th>
                           <th><b>Position</b></th>
                           <th><b>Age</b></th>
                           <th><b>MarketValue</b></th>
                           <th><b>Nation</b></th>
                           <th><b>Club</b></th>
                        </tr>
                  </HeaderTemplate>
             
                  <ItemTemplate>
                     <tr>
                        <td> <%# DataBinder.Eval(Container.DataItem, "Name") %> </td>
                        <td> <%# DataBinder.Eval(Container.DataItem, "Position") %> </td>
                        <td> <%# DataBinder.Eval(Container.DataItem, "Age") %> </td>
                        <td> <%# DataBinder.Eval(Container.DataItem, "MarketValue") %> </td>
                        <td> <%# DataBinder.Eval(Container.DataItem, "Nation") %> </td>
                        <td> <%# DataBinder.Eval(Container.DataItem, "Club") %> </td>
                     </tr>
                  </ItemTemplate>
             
                  <FooterTemplate>
                     </table>
                  </FooterTemplate>
                </asp:Repeater>
                </ContentTemplate>
            </asp:UpdatePanel>


            <asp:Button id="submitButton" runat="server" text="Find" OnClick = "sendData" CssClass="button"/> 
            <asp:Button id="insertButton" runat="server" text="Add" OnClick = "addPlayer" CssClass="button"/>
            <asp:Button id="updateButton" runat="server" text="Update" OnClick = "updatePlayer" CssClass="button"/>  
        </div>        
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="Scout.Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Result</title>
    <link rel="stylesheet" href="styles/Styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <asp:Button id="home" runat="server" Text="HOME       " OnClick="cancel" CssClass="headerButton"/>
            <div class="heading">STATSCOUT</div>
            <asp:Button id="contact" runat="server" Text="CONTACT US" OnClick = "contactUs" CssClass="headerButton"/>
        </header>
        <div class="main">
            <h1>Result list</h1>
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
                       <th><b>Salary</b></th>
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
                    <td> <%# DataBinder.Eval(Container.DataItem, "Salary") %> </td>
                 </tr>
              </ItemTemplate>
             
              <FooterTemplate>
                 </table>
              </FooterTemplate>
            </asp:Repeater>

            <asp:Button id="cancelButton" runat="server" Text="Back" OnClick="cancel" CssClass="button"/>
        </div>
        
    </form>
</body>
</html>

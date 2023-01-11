<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FMNY.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please Log In <br /> <br />
            Username <br />
            <asp:TextBox ID="username" runat="server"></asp:TextBox> <br />
            Password<br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="loginButton" OnClick="login" runat="server" Text="Login" />
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeStadMan.aspx.cs" Inherits="FMNY.HomeStadMan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder ID="StadiumInfo" runat="server"></asp:PlaceHolder> <br />

            <br /> Modify Requests <br />
            <asp:TextBox ID="username" runat="server" MaxLength="20">Username</asp:TextBox> <br />
            <asp:TextBox ID="host" runat="server" MaxLength="20">Host Name</asp:TextBox> <br />
            <asp:TextBox ID="guest" runat="server" MaxLength="20">Guest Name</asp:TextBox> <br />
            <asp:TextBox ID="startH" runat="server" MaxLength="2">HH</asp:TextBox>
            <asp:TextBox ID="startT" runat="server" MaxLength="2">MM</asp:TextBox> <br />
            <asp:TextBox ID="MatchDay" runat="server" MaxLength="2">DD</asp:TextBox>
            <asp:TextBox ID="MatchMonth" runat="server" MaxLength="2">MM</asp:TextBox>
            <asp:TextBox ID="MatchYear" runat="server" MaxLength="4">YYYY</asp:TextBox> <br />
            <asp:Button ID="Button1" runat="server" OnClick="acceptRequest" Text="Accept" />
            <asp:Button ID="Button2" runat="server" OnClick="rejectRequest" Text="Reject" />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="viewStadiumInfo" Text="View Tables" /> <br />
            
            <asp:PlaceHolder ID="Requests" runat="server"></asp:PlaceHolder> <br />


        </div>
    </form>
</body>
</html>

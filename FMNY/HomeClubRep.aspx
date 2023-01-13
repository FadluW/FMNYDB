<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeClubRep.aspx.cs" Inherits="FMNY.HomeClubRep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div>
            <asp:PlaceHolder ID="ClubInfo" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="UpcomingMatches" runat="server"></asp:PlaceHolder>
        </div>
        <div>
            <asp:TextBox ID="matchDay" runat="server" MaxLength="2">DD</asp:TextBox>
            <asp:TextBox ID="matchMonth" runat="server" MaxLength="2">MM</asp:TextBox>
            <asp:TextBox ID="matchYear" runat="server" MaxLength="4">YYYY</asp:TextBox>
            <asp:Button ID="viewMatchesButton" OnClick="viewMatches" runat="server" Text="View" /><br />
            <asp:PlaceHolder ID="availableStadiums" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>

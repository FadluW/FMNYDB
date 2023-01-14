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
        </div>
        <div>
            <asp:TextBox ID="matchDay" runat="server" MaxLength="2">DD</asp:TextBox>
            <asp:TextBox ID="matchMonth" runat="server" MaxLength="2">MM</asp:TextBox>
            <asp:TextBox ID="matchYear" runat="server" MaxLength="4">YYYY</asp:TextBox>
            <asp:Button ID="viewMatchesButton" OnClick="viewMatches" runat="server" Text="View" /><br />
            
            Add Request <br />
            <asp:TextBox ID="host" runat="server" MaxLength="20">Home Name</asp:TextBox> 
            <asp:TextBox ID="stadium" runat="server" MaxLength="20">Stadium</asp:TextBox> <br />
            <asp:TextBox ID="matchH" runat="server" MaxLength="2">HH</asp:TextBox>
            <asp:TextBox ID="matchM" runat="server" MaxLength="2">MM</asp:TextBox> <br />
            <asp:TextBox ID="matchDayR" runat="server" MaxLength="2">DD</asp:TextBox>
            <asp:TextBox ID="matchMonthR" runat="server" MaxLength="2">MM</asp:TextBox>
            <asp:TextBox ID="matchYearR" runat="server" MaxLength="4">YYYY</asp:TextBox> 
            <asp:Button ID="Button1" runat="server" OnClick="addRequest" Text="Add" /><br />

            <asp:PlaceHolder ID="availableStadiums" runat="server"></asp:PlaceHolder> <br />
            <asp:PlaceHolder ID="UpcomingMatches" runat="server"></asp:PlaceHolder> <br />
            <asp:PlaceHolder ID="requestTable" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>

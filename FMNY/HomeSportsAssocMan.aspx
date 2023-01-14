<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeSportsAssocMan.aspx.cs" Inherits="FMNY.HomeSportsAssocMan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <table>
                            <tr><td>Modify Matches</td></tr>
                            <tr><td>
                                <asp:TextBox ID="host" runat="server" MaxLength="20">Host Name</asp:TextBox> <br />
                                <asp:TextBox ID="guest" runat="server" MaxLength="20">Guest Name</asp:TextBox> <br />
                                <asp:TextBox ID="MatchDay" runat="server" MaxLength="2">DD</asp:TextBox>
                                <asp:TextBox ID="MatchMonth" runat="server" MaxLength="2">MM</asp:TextBox>
                                <asp:TextBox ID="MatchYear" runat="server" MaxLength="4">YYYY</asp:TextBox> <br />
                                Start Time <br />
                                <asp:TextBox ID="startH" runat="server" MaxLength="2">HH</asp:TextBox> 
                                <asp:TextBox ID="startT" runat="server" MaxLength="2">MM</asp:TextBox> <br />
                                End Time <br />
                                <asp:TextBox ID="endH" runat="server" MaxLength="2">HH</asp:TextBox> 
                                <asp:TextBox ID="endT" runat="server" MaxLength="2">MM</asp:TextBox> <br />
                                <asp:Button ID="addMatchButton" OnClick="addMatch" runat="server" Text="Add" />
                                <asp:Button ID="delMatchButton" OnClick="delMatch" runat="server" Text="Delete" />
                            </td></tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="ViewUpcoming" runat="server" OnClick="viewMatchesUpcoming" Text="Upcoming Matches" />
                        <asp:Button ID="ViewAlreadyNeverPlayed" runat="server" OnClick="viewNeverPlayed" Text="Never Played" />
                        <asp:Button ID="ViewAlreadyPlayed" runat="server" OnClick="viewMatchesPlayed" Text="Already Played Matches" />
                        <br /> <asp:PlaceHolder ID="UpcomingMatches" runat="server"></asp:PlaceHolder> <br />
                        <asp:PlaceHolder ID="NeverPlayed" runat="server"></asp:PlaceHolder> <br />
                        <asp:PlaceHolder ID="AlreadyPlayed" runat="server"></asp:PlaceHolder> <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

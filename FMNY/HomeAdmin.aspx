<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="FMNY.HomeAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Text="Admin Home Page"></asp:Label>
            <table>
                <tr>
                    <td>
                        <table>
                            <tr><td>Add Club</td></tr>
                            <tr><td>
                                <asp:TextBox ID="addClubName" runat="server">Name</asp:TextBox> <br />
                                <asp:TextBox ID="addClubLoc" runat="server">Location</asp:TextBox> <br />
                                <asp:Button ID="addClubButton" OnClick="addClub" runat="server" Text="Add" />
                            </td></tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr><td>Delete Club</td></tr>
                            <tr><td>
                                <asp:TextBox ID="delClubName" runat="server">Name</asp:TextBox> <br /><br />
                                <asp:Button ID="delClubButton" OnClick="delClub" runat="server" Text="Delete" />
                            </td></tr>
                        </table>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <table>
                            <tr><td>Add Stadium</td></tr>
                            <tr><td>
                                <asp:TextBox ID="addStadiumName" runat="server" ToolTip="Name"></asp:TextBox> <br />
                                <asp:TextBox ID="addStadiumLoc" runat="server" ToolTip="Location"></asp:TextBox> <br />
                                <asp:TextBox ID="addStadiumCap" runat="server" ToolTip="Capacity"></asp:TextBox> <br />
                                <asp:Button ID="addStadiumButton" OnClick="addStadium" runat="server" Text="Add" />
                            </td></tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr><td>Delete Stadium</td></tr>
                            <tr><td>
                                <asp:TextBox ID="delStadiumName" runat="server" ToolTip="Name"></asp:TextBox> <br /><br /><br />
                                <asp:Button ID="delStadiumButton" OnClick="delStadium" runat="server" Text="Delete" />
                            </td></tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr><td>Block Fan</td></tr>
                            <tr><td>
                                <asp:TextBox ID="blockFanID" runat="server" ToolTip="National ID"></asp:TextBox> <br />
                                <asp:Button ID="blockFanButton" OnClick="blockFan" runat="server" Text="Block" />
                                <asp:Button ID="unblockFanButton" OnClick="unblockFan" runat="server" Text="Unblock" />
                            </td></tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <asp:Button ID="Reload" OnClick="reloadTables" runat="server" Text="View Tables" />
                </tr>
                <tr>
                    <asp:PlaceHolder ID="Clubs" runat="server"></asp:PlaceHolder>
                    <asp:PlaceHolder ID="Stadiums" runat="server"></asp:PlaceHolder>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

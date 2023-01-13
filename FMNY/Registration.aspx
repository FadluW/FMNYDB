<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FMNY.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Register 
            <asp:DropDownList ID="selectRegView" runat="server" OnSelectedIndexChanged="ChangeView" AutoPostBack="true">
                <asp:ListItem Text="Select Category" Value="0"></asp:ListItem>
                <asp:ListItem Text="Fan" Value="1"></asp:ListItem>
                <asp:ListItem Text="Stadium Manager" Value="2"></asp:ListItem>
                <asp:ListItem Text="Club Representative" Value="3"></asp:ListItem>
                <asp:ListItem Text="Sports Associative Manager" Value="4"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="DefaultView" runat="server">
                    Please Select A Category of User to Register.
                </asp:View>                
                <asp:View ID="FanView" runat="server">
                    <asp:TextBox ID="fanName" runat="server" MaxLength="20">Name</asp:TextBox> <br />
                    <asp:TextBox ID="fanUser" runat="server" MaxLength="20">Username</asp:TextBox> <br />
                    <asp:TextBox ID="fanPass" runat="server" MaxLength="20">Password</asp:TextBox> <br />
                    <asp:TextBox ID="fanID" runat="server" MaxLength="20">National ID</asp:TextBox> <br />
                    <asp:TextBox ID="fanDOBDay" runat="server" MaxLength="2">DD</asp:TextBox>
                    <asp:TextBox ID="fanDOBMonth" runat="server" MaxLength="2">MM</asp:TextBox>
                    <asp:TextBox ID="fanDOBYear" runat="server" MaxLength="4">YYYY</asp:TextBox> <br />
                    <asp:TextBox ID="fanAddress" runat="server"  MaxLength="20">Address</asp:TextBox> <br />
                    <asp:TextBox ID="fanNum" runat="server">Phone Number</asp:TextBox> <br />
                    <asp:Button ID="registerFanButton" OnClick="registerFan" runat="server" Text="Add" />
                </asp:View>
                <asp:View ID="StadiumManView" runat="server">
                    <asp:TextBox ID="SMName" runat="server" MaxLength="20">Name</asp:TextBox> <br />
                    <asp:TextBox ID="SMUser" runat="server" MaxLength="20">Username</asp:TextBox> <br />
                    <asp:TextBox ID="SMPass" runat="server" MaxLength="20">Password</asp:TextBox> <br />
                    <asp:TextBox ID="SMStadName" runat="server" MaxLength="20">Stadium Name</asp:TextBox> <br />
                    <asp:Button ID="registerStadiumManButton" OnClick="registerStadiumMan" runat="server" Text="Add" />
                </asp:View>
                <asp:View ID="ClubRepView" runat="server">
                    <asp:TextBox ID="CRName" runat="server" MaxLength="20">Name</asp:TextBox> <br />
                    <asp:TextBox ID="CRUser" runat="server" MaxLength="20">Username</asp:TextBox> <br />
                    <asp:TextBox ID="CRPass" runat="server" MaxLength="20">Password</asp:TextBox> <br />
                    <asp:TextBox ID="CRClubName" runat="server" MaxLength="20">Club Name</asp:TextBox> <br />
                    <asp:Button ID="registerClubRepButton" OnClick="registerClubRep" runat="server" Text="Add" />
                </asp:View>
                <asp:View ID="AssocManView" runat="server">
                    <asp:TextBox ID="AssocName" runat="server" MaxLength="20">Name</asp:TextBox> <br />
                    <asp:TextBox ID="AssocUser" runat="server" MaxLength="20">Username</asp:TextBox> <br />
                    <asp:TextBox ID="AssocPass" runat="server" MaxLength="20">Password</asp:TextBox> <br />
                    <asp:Button ID="registerAssocManButton" OnClick="registerAssocMan" runat="server" Text="Add" />
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>

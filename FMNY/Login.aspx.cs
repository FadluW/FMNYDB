using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FMNY
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string user = username.Text;
            string pass = password.Text;

            // Admin login
            if (user.Equals("admin") && pass.Equals("admin"))
            {
                Response.Redirect("HomeAdmin.aspx");
            }

            SqlCommand viewAssoc = new SqlCommand("SELECT * FROM allAssocManagers", conn);
            SqlCommand viewFan = new SqlCommand("SELECT * FROM allFans", conn);
            SqlCommand viewClubRep = new SqlCommand("SELECT * FROM  allClubRepresentatives", conn);
            SqlCommand viewStadiumMan = new SqlCommand("SELECT * FROM allStadiumManagers", conn);

            SqlCommand[] views = { viewAssoc, viewFan, viewClubRep, viewStadiumMan };
            string[] viewName = { "AssocMan", "Fan", "ClubRep", "StadiumMan"};

            // Iterate over each view separately
            Boolean found = false;
            for (int i = 0; !found && i < views.Length;i++)
            {
                conn.Open();
                SqlDataReader rdr = views[i].ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read() && !found)
                {
                    string currUser = rdr.GetString(rdr.GetOrdinal("username"));
                    string currPass = rdr.GetString(rdr.GetOrdinal("password"));

                    // If user found
                    if (user.Equals(currUser) && pass.Equals(currPass)) {
                        found = true;
                        Response.Redirect("Home" + viewName[i]);
                    }
                }
                rdr.Close();
            }

            // User not found
            if (!found)
            {
                Response.Write("User not found! <br>");
            }
        }
    }
}
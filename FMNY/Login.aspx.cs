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

            SqlCommand viewAssoc = new SqlCommand("SELECT su.username, su.password, sm.name \r\n\tFROM Sports_assoc_manager AS sm \r\n\tINNER JOIN Sys_user AS su ON sm.username = su.username", conn);
            SqlCommand viewFan = new SqlCommand("allFans", conn);
            SqlCommand viewClubRep = new SqlCommand("SELECT su.username, su.password, cr.name AS club_rep_name, c.name AS club_name\r\n\tFROM Sys_user AS su\r\n\tINNER JOIN Club_rep AS cr ON su.username = cr.username\r\n\tINNER JOIN Club AS c ON cr.club_id = c.club_id", conn);
            SqlCommand viewStadiumMan = new SqlCommand("SELECT su.username, su.password, sm.name AS stadium_manager_name, s.name AS stadium_name\r\n\tFROM Sys_user AS su\r\n\tINNER JOIN Stadium_manager AS sm ON su.username = sm.username\r\n\tINNER JOIN Stadium AS s ON sm.stadium_id = s.id", conn);

            SqlCommand[] views = { viewAssoc, viewFan, viewClubRep, viewStadiumMan };
            string[] viewName = { "assocMan", "fan", "clubRep", "stadiumMan"};

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
                        Response.Redirect("home/" + viewName[i] );
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
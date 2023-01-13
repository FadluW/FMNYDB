using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FMNY
{
    public partial class stadiumMan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            viewStadiumInfo();
        }
        protected void viewStadiumInfo()
        {
            if (Session["username"] == null || !Session["userType"].Equals("StadiumMan")) { Response.Redirect("Login.aspx"); }

            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            //hena hageeb el username bta3 el stadiumManager
            String stad_name = "";

            SqlCommand viewStadiumMan = new SqlCommand("SELECT * FROM allStadiumManagers", conn);
            SqlCommand viewStadium = new SqlCommand("SELECT * FROM allStadiums", conn);
            SqlCommand viewReq = new SqlCommand("SELECT * FROM allRequests", conn);


            SqlDataReader rdr = viewStadiumMan.ExecuteReader(CommandBehavior.CloseConnection);

            Boolean found = false;
            while (rdr.Read() && !found)
            {
                string currUser = rdr.GetString(rdr.GetOrdinal("username"));

                if (Session["username"].Equals(currUser))
                {
                    found = true;
                    stad_name = rdr.GetString(rdr.GetOrdinal("stadium_name"));
                }
            }
            rdr.Close();

            if (!found) Response.Write("Stadium Manager Not Found");

            SqlDataReader rdr2 = viewStadium.ExecuteReader(CommandBehavior.CloseConnection);

            found = false;
            while (rdr2.Read() && !found)
            {
                string currName = rdr2.GetString(rdr2.GetOrdinal("name"));

                if (stad_name.Equals(currName))
                {
                    found = true;
                    //DISPLAY THE RESULTED TABLE
                }
            }
            rdr2.Close();

            if (!found) Response.Write("Stadium Not Found");

            SqlDataReader rdr3 = viewReq.ExecuteReader(CommandBehavior.CloseConnection);

            found = false;
            while (rdr3.Read() && !found)
            {
                string SMUser = rdr3.GetString(rdr3.GetOrdinal("stadium_manager_username"));

                if (Session["username"].Equals(SMUser))
                {
                    found = true;
                    //DISPLAY THE RESULTED TABLE
                }
            }
            rdr3.Close();
        }
    }
}
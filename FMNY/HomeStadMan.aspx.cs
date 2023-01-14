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
using System.Text;
using System.Threading;

namespace FMNY
{
    public partial class HomeStadMan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || !Session["userType"].Equals("StadMan")) Response.Redirect("Login.aspx");
        }
        protected void viewStadiumInfo(object sender, EventArgs e)
        {
            if (Session["username"] == null || !Session["userType"].Equals("StadiumMan")) { Response.Redirect("Login.aspx"); }

            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            //hena hageeb el username bta3 el stadiumManager
            String stad_name = "";

            SqlCommand viewStadiumMan = new SqlCommand("SELECT * FROM allStadiumManagers", conn);
            SqlCommand viewStadium = new SqlCommand("SELECT * FROM allStadiums", conn);


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

            if (!found) Response.Write("Stadium Manager's Stadium Not Found");

            
            BuildTable("SELECT * FROM allStadiums WHERE name = " + stad_name, Requests);

            BuildTable("SELECT * FROM allRequests WHERE stadium_manager_username = " + Session["username"], StadiumInfo);
        }
        private DataTable GetData(string query)
        {
            string constr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = conn;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        private void BuildTable(string query, PlaceHolder p)
        {
            //Populating a DataTable from database.
            DataTable dt = this.GetData(query);

            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table border = '1'>");

            //Building the Header row.
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            p.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}
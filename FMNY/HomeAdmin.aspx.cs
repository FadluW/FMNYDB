using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Text;
using System.Threading;

namespace FMNY
{
    public partial class HomeAdmin : System.Web.UI.Page
    {
        protected void reloadTables(object sender, EventArgs e)
        {
            BuildTable("SELECT * FROM allClubs", Clubs);
            BuildTable("SELECT * FROM allStadiums", Stadiums);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null || !Session["userType"].Equals("Admin")) Response.Redirect("Login.aspx");
        }

        protected void delClub(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string name = delClubName.Text;

            SqlCommand delClubProc = new SqlCommand("deleteClub", conn);
            delClubProc.CommandType = CommandType.StoredProcedure;
            delClubProc.Parameters.Add(new SqlParameter("@name", name));

            conn.Open();
            delClubProc.ExecuteNonQuery();
            conn.Close();

            Response.Write("Deleted Club " + name);
        }

        protected void addClub(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string name = addClubName.Text;
            string location = addClubLoc.Text;

            SqlCommand addClubProc = new SqlCommand("addClub", conn);
            addClubProc.CommandType = CommandType.StoredProcedure;
            addClubProc.Parameters.Add(new SqlParameter("@name", name));
            addClubProc.Parameters.Add(new SqlParameter("@location", location));

            conn.Open();
            addClubProc.ExecuteNonQuery(); Thread.Sleep(500);
            conn.Close();

            Response.Write("Added Club " + name);
        }

        protected void delStadium(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string name = delStadiumName.Text;

            SqlCommand delStadiumProc = new SqlCommand("deleteStadium", conn);
            delStadiumProc.CommandType = CommandType.StoredProcedure;
            delStadiumProc.Parameters.Add(new SqlParameter("@name", name));

            conn.Open();
            delStadiumProc.ExecuteNonQuery();
            conn.Close();

            Response.Write("Deleted Stadium " + name);
        }

        protected void addStadium(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string name = addStadiumName.Text;
            string location = addStadiumLoc.Text;
            string capacity = addStadiumCap.Text;

            SqlCommand addStadiumProc = new SqlCommand("addStadium", conn);
            addStadiumProc.CommandType = CommandType.StoredProcedure;
            addStadiumProc.Parameters.Add(new SqlParameter("@name", name));
            addStadiumProc.Parameters.Add(new SqlParameter("@location", location));
            addStadiumProc.Parameters.Add(new SqlParameter("@capacity", capacity));

            conn.Open();
            addStadiumProc.ExecuteNonQuery();
            conn.Close();

            Response.Write("Added Stadium " + name);
        }

        protected void blockFan(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string ID = blockFanID.Text;

            SqlCommand blockFanProc = new SqlCommand("blockFan", conn);
            blockFanProc.CommandType = CommandType.StoredProcedure;
            blockFanProc.Parameters.Add(new SqlParameter("@national_id", ID));

            conn.Open();
            blockFanProc.ExecuteNonQuery();
            conn.Close();

            Response.Write("Blocked Fan " + ID);
        }

        protected void unblockFan(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string ID = blockFanID.Text;

            SqlCommand unblockFanProc = new SqlCommand("unblockFan", conn);
            unblockFanProc.CommandType = CommandType.StoredProcedure;
            unblockFanProc.Parameters.Add(new SqlParameter("@national_id", ID));

            conn.Open();
            unblockFanProc.ExecuteNonQuery();
            conn.Close();

            Response.Write("Unblocked Fan " + ID);
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
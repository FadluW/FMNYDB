using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace FMNY
{
    public partial class HomeClubRep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || !Session["userType"].Equals("ClubRep")) { Response.Redirect("Login.aspx"); }

            // Club Information
            string clubQuery = "SELECT C.name, C.location FROM Club C, Club_rep CR WHERE C.club_id = CR.club_id AND CR.username =" + Session["username"];
            BuildTable(clubQuery, ClubInfo);

            // Upcoming Matches
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            SqlCommand getName = new SqlCommand(clubQuery, conn);
            SqlDataReader rdr = getName.ExecuteReader(CommandBehavior.CloseConnection);
            string clubName = "";
            rdr.Read();
            clubName = rdr.GetString(rdr.GetOrdinal("name"));

            if (clubName != "")
            {
                BuildTable("dbo.upcomingMatchesOfClub(" + clubName + ")", UpcomingMatches);
            }
        }

        private void viewMatches(object sender, EventArgs e)
        {
            int day = Int32.Parse(matchDay.Text);
            int month = Int32.Parse(matchMonth.Text);
            int year = Int32.Parse(matchYear.Text);

            // Validation
            if (year < 1 || year > 2023)
            {
                Response.Write("Incorrect Year");
                return;
            }
            if (month < 1 || month > 12)
            {
                Response.Write("Incorrect Month");
                return;
            }
            if (day < 1 || day > DateTime.DaysInMonth(year, month))
            {
                Response.Write("Incorrect Day");
                return;
            }
            DateTime date = new DateTime(year, month, day);

            BuildTable("dbo.viewAvailableStadiumsOn(" + date + ")", availableStadiums);
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
            Thread.Sleep(1000);
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
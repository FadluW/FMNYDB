using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FMNY
{
    public partial class HomeSportsAssocMan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void addMatch(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string hostName = host.Text;
            string guestName = guest.Text;
            int day = Int32.Parse(MatchDay.Text);
            int month = Int32.Parse(MatchMonth.Text);
            int year = Int32.Parse(MatchYear.Text);
            int startHour = Int32.Parse(startH.Text);
            int startMin = Int32.Parse(startT.Text);
            int endHour = Int32.Parse(endH.Text);
            int endMin = Int32.Parse(endT.Text);

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
            if(startHour < 0 || startHour > 23 || endHour < 0 || endHour > 23 || startMin < 0 || startMin > 59 || endMin < 0 || endMin > 59)
            {
                Response.Write("Incorrect Time");
                return;
            }

            DateTime startTime = new DateTime(year, month, day, startHour, startMin, 0);
            DateTime endTime = new DateTime(year, month, day, endHour, endMin, 0);


            SqlCommand addMatch = new SqlCommand("addNewMatch", conn);
            addMatch.CommandType = CommandType.StoredProcedure;
            addMatch.Parameters.Add(new SqlParameter("@host_club_name", hostName));
            addMatch.Parameters.Add(new SqlParameter("@guest_club_name", guestName));
            addMatch.Parameters.Add(new SqlParameter("@start_time", startTime));
            addMatch.Parameters.Add(new SqlParameter("@end_time", endTime));

            conn.Open();
            addMatch.ExecuteNonQuery();
            conn.Close();
        }

        protected void delMatch(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string hostName = host.Text;
            string guestName = guest.Text;
            int day = Int32.Parse(MatchDay.Text);
            int month = Int32.Parse(MatchMonth.Text);
            int year = Int32.Parse(MatchYear.Text);
            int startHour = Int32.Parse(startH.Text);
            int startMin = Int32.Parse(startT.Text);
            int endHour = Int32.Parse(endH.Text);
            int endMin = Int32.Parse(endT.Text);

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
            if (startHour < 0 || startHour > 23 || endHour < 0 || endHour > 23 || startMin < 0 || startMin > 59 || endMin < 0 || endMin > 59)
            {
                Response.Write("Incorrect Time");
                return;
            }

            DateTime startTime = new DateTime(year, month, day, startHour, startMin, 0);
            DateTime endTime = new DateTime(year, month, day, endHour, endMin, 0);


            SqlCommand delMatch = new SqlCommand("deleteMatch", conn);
            delMatch.CommandType = CommandType.StoredProcedure;
            delMatch.Parameters.Add(new SqlParameter("@host_club_name", hostName));
            delMatch.Parameters.Add(new SqlParameter("@guest_club_name", guestName));

            conn.Open();
            delMatch.ExecuteNonQuery();
            conn.Close();
        }
    }
}
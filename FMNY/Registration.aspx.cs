using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Policy;
using System.Net;

namespace FMNY
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangeView(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = selectRegView.SelectedIndex;
        }

        protected void registerAssocMan(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string name = AssocName.Text;
            string username = AssocUser.Text;
            string pass = AssocPass.Text;

            SqlCommand addAssocMan = new SqlCommand("addAssociationManager", conn);
            addAssocMan.CommandType = CommandType.StoredProcedure;
            addAssocMan.Parameters.Add(new SqlParameter("@name", name));
            addAssocMan.Parameters.Add(new SqlParameter("@username", username));
            addAssocMan.Parameters.Add(new SqlParameter("@password", pass));

            conn.Open();
            addAssocMan.ExecuteNonQuery();
            conn.Close();

            Response.Write("Added Sports Associative Manager " + name);
        }
        protected void registerClubRep(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string name = CRName.Text;
            string username = CRUser.Text;
            string pass = CRPass.Text;
            string club = CRClubName.Text;

            // Validate club exists

            SqlCommand addClubRep = new SqlCommand("addRepresentative", conn);
            addClubRep.CommandType = CommandType.StoredProcedure;
            addClubRep.Parameters.Add(new SqlParameter("@name", name));
            addClubRep.Parameters.Add(new SqlParameter("@username", username));
            addClubRep.Parameters.Add(new SqlParameter("@password", pass));
            addClubRep.Parameters.Add(new SqlParameter("@club_name", club));

            conn.Open();
            addClubRep.ExecuteNonQuery();
            conn.Close();

            Response.Write("Added Club Representative " + name);
        }

        protected void registerStadiumMan(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string name = SMName.Text;
            string username = SMUser.Text;
            string pass = SMPass.Text;
            string stadiumName = SMStadName.Text;

            // Validate stadium exists

            SqlCommand addStadiumManager = new SqlCommand("addStadiumManager", conn);
            addStadiumManager.CommandType = CommandType.StoredProcedure;
            addStadiumManager.Parameters.Add(new SqlParameter("@name", name));
            addStadiumManager.Parameters.Add(new SqlParameter("@username", username));
            addStadiumManager.Parameters.Add(new SqlParameter("@password", pass));
            addStadiumManager.Parameters.Add(new SqlParameter("@stadium_name", stadiumName));

            conn.Open();
            addStadiumManager.ExecuteNonQuery();
            conn.Close();

            Response.Write("Added Stadium Manager " + name);
        }

        protected void registerFan(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["FMNY"].ToString();
            // Create a connection
            SqlConnection conn = new SqlConnection(connStr);

            string name = fanName.Text;
            string username = fanUser.Text;
            string pass = fanPass.Text;
            string nationalID = fanID.Text;
            int day = Int32.Parse(fanDOBDay.Text);
            int month = Int32.Parse(fanDOBMonth.Text);
            int year = Int32.Parse(fanDOBYear.Text);
            string address = fanAddress.Text;
            int number= Int32.Parse(fanNum.Text);

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
            //string dateOfBirth = day + "-" + month + "-" + year + "00:00:00";

            SqlCommand addFan = new SqlCommand("addFan", conn);
            addFan.CommandType = CommandType.StoredProcedure;
            addFan.Parameters.Add(new SqlParameter("@name", name));
            addFan.Parameters.Add(new SqlParameter("@username", username));
            addFan.Parameters.Add(new SqlParameter("@password", pass));
            addFan.Parameters.Add(new SqlParameter("@national_id", nationalID));
            addFan.Parameters.Add(new SqlParameter("@birth_date", date));
            addFan.Parameters.Add(new SqlParameter("@address", address));
            addFan.Parameters.Add(new SqlParameter("@phone_no", number));

            conn.Open();
            addFan.ExecuteNonQuery();
            conn.Close();

            Response.Write("Added Fan " + name);
        }
    }
}
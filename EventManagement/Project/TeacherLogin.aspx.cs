using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Project_CollegeLogin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox6.Text != "" && TextBox7.Text != "")
        {
            string k = "SELECT * FROM TeacherDetails where id='" + TextBox6.Text + "' and Password='" + TextBox7.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(k, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                Session["Tid"] = TextBox6.Text;
                Session["Tname"] = ds.Tables[0].Rows[0][1].ToString();
                Session["type"] = "Teacher";
                Response.Redirect("AssignedEvents.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Incorrect login credentials')", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Id and Password fields cannot be left blank')", true);
        }
    }
}
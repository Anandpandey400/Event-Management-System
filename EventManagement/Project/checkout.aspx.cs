using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class checkout : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Submit(object sender, EventArgs e)
    {
        string ins = "insert into eventreg values('" + Session["Eid"].ToString() + "','" + Session["EName"].ToString() + "','" + Session["uid"].ToString() + "','" + Session["uname"].ToString() + "')";
        SqlCommand cmd = new SqlCommand(ins, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Session["Pay"] = "Success";
        Response.Redirect("RegisteredEvents.aspx");
    }
}
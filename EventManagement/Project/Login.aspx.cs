using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["Reg"]=="Data")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Registration Successfull. You may login now...')", true);
            Session["Reg"] = "";
        }

        if(Session["ColReg"]=="Data")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('College Registration Successfull.)", true);
            Session["ColReg"] = "";
        }
    }
}
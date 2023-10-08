using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminLogin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=LAPTOP-D5HUHJT1\SQLEXPRESS;Initial Catalog=EventManagement;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBoxID.Text != "" && TextBoxPass.Text != "")
        {
            string k = "SELECT * FROM admin where id='" + TextBoxID.Text + "' and password='" + TextBoxPass.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(k, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                Session["Aid"] = TextBoxPass.Text;
                Session["type"] = "Admin";
                Response.Redirect("CollegeReg.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Invalid Admin ID or Password')", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Enter Id and Password')", true);
        }
    }
}
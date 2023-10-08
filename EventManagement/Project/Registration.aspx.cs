using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string k = "SELECT TOP 1 id from studentdetails ORDER BY id DESC";
            SqlDataAdapter da = new SqlDataAdapter(k,conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int i = 101;
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                i = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString())+1;
            }
            else
            {
                i = 101;
            }
            TextBoxID.Text = i.ToString();
        }
    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {

        string ins = "INSERT INTO studentdetails VALUES('" + TextBoxID.Text + "','" + TextBoxName.Text + "','" + TextBoxMail.Text + "','" + TextBoxPhn.Text + "','" + TextBoxAge.Text + "','" + TextBoxClgName.Text + "','" + TextBoxPass.Text + "')";
        SqlCommand cmd = new SqlCommand(ins, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Session["Reg"] = "Data";
        Response.Redirect("Login.aspx");
    }
}
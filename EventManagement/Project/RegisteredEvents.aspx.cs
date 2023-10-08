using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Project_RegisteredEvents : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Can"] == "Data")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Event Cancelled Sucessfully')", true);
            Session["Can"] = "";
        }
        if(Session["Pay"] == "Success")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Event Registration Sucessfull')", true);
            Session["Pay"] = "";
        }
        if (!IsPostBack)
        {
            Fill();
        }
    }

    public void Fill()
    {
        string sel = "select eid from eventreg";
        SqlDataAdapter da = new SqlDataAdapter(sel, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string s = "SELECT eventdetails.id, eventdetails.name, eventdetails.Date, eventdetails.college, eventdetails.type, eventdetails.Teacher, eventdetails.fees FROM eventdetails INNER JOIN eventreg  ON eventdetails.id = eventreg.eid where EventReg.sid='" + Session["uid"].ToString() + "'";
            da = new SqlDataAdapter(s, conn);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            else
            {
                GridView1.Visible = false;
                LabelErr.Visible = true;
            }
        }
        else
        {
            LabelErr.Visible = true;
        }
    }

    protected void ButtonConfirm_Click(object sender, EventArgs e)
    {
        string ins = "delete from eventreg where eid='" + this.HiddenEventID.Value + "' AND sid='" + Session["uid"].ToString() + "'";
        SqlCommand cmd = new SqlCommand(ins, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Session["Can"] = "Data";
        Response.Redirect("RegisteredEvents.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Project_EventDetails : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fill();
        }
    }

    public void Fill()
    {
        string sel = "select eid from eventreg where sid='" + Session["uid"].ToString() + "'";
        SqlDataAdapter da = new SqlDataAdapter(sel, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string s = "SELECT eventdetails.id, eventdetails.name, eventdetails.Date, eventdetails.college, eventdetails.type, eventdetails.Teacher, eventdetails.Fees FROM eventdetails INNER JOIN eventreg  ON eventdetails.id != eventreg.eid where EventReg.sid='" + Session["uid"].ToString() + "'";
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
            string str = "SELECT id,name,date,college,type,teacher,fees from eventdetails";
            da = new SqlDataAdapter(str, conn);
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
    }

    protected void ButtonConfirm_Click(object sender, EventArgs e)
    {
        string sel = "select eid from eventreg where eid='" + this.HiddenEventID.Value + "' and sid='" + Session["uid"].ToString() + "'";
        SqlDataAdapter da = new SqlDataAdapter(sel,conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Session["Eid"] = this.HiddenEventID.Value;
            Session["EName"] = this.HiddenName.Value;
            Session["Cost"] = this.HiddenFees.Value;
            Response.Redirect("Payment.aspx");
        }
        else
        {
            string message = "alert('You have already registered for selected event')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
    }
}
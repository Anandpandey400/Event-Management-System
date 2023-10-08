using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Project_Participants : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        int flag = 0;
        string ID = Request.QueryString["ID"];
        LabelEid.Text = ID;
        string sel = "select DISTINCT sid from eventreg where eid='" + ID + "'";
        SqlDataAdapter da = new SqlDataAdapter(sel,conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string[] sid = new string[ds.Tables[0].Rows.Count];
        if (ds.Tables[0].Rows.Count>0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                sid[i] = ds.Tables[0].Rows[i][0].ToString();
                flag = 1;
            }
            sel = "select name,winner from eventdetails where id='" + ID + "'";
            da = new SqlDataAdapter(sel, conn);
            ds = new DataSet();
            da.Fill(ds);
            LabelEventName.Text = ds.Tables[0].Rows[0][0].ToString();
            string winner = ds.Tables[0].Rows[0][1].ToString();
            if (winner == "")
            {
                Label1.Text = "Select a Winner : ";
                ButtonSubmit.Visible = true;
                DropDownListStudents.Visible = true;
            }
            else
            {
                Label1.Text = "Winner : ";
                LabelWinner.Text = winner;
                LabelWinner.Visible = true;
                DropDownListStudents.Visible = false;
                ButtonSubmit.Visible = false;
            }
        }

        if (flag == 1)
        {
            int count = 0;
            LabelPrint.Text = "";
            DropDownListStudents.Items.Clear();
            foreach (string s in sid)
            {
                string id = s;
                sel = "select name,email,contact,collegename from StudentDetails where id="  + id ;
                da = new SqlDataAdapter(sel, conn);
                ds = new DataSet();
                da.Fill(ds);
                count = count + 1;

              //  string name = ds.Tables[0].Rows[1][0].ToString();
                string email = ds.Tables[0].Rows[0][1].ToString();
                string contact = ds.Tables[0].Rows[0][2].ToString();
                string college = ds.Tables[0].Rows[0][3].ToString();

                DropDownListStudents.Items.Add(email);
                
                LabelPrint.Text += "<table style='width:80%'><tr><td rowspan='3' style='width: 6%; vertical-align: top; font-weight: bold; font-size: x-large;'>" + count.ToString() + ".</td>";
               // LabelPrint.Text += "<td style='font-size: large; font-weight: bold; text-align: left; background-color: #909090; color: #FFFFFF;' colspan='2'>&nbsp;&nbsp; " + name + "</td></tr>";
                LabelPrint.Text += "<tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; " + email + "</td>";
                LabelPrint.Text += "<td rowspan='2' style='vertical-align: middle; font-size: large; padding-left: 0px; border-left-style: solid; border-left-width: 1px; border-left-color: #333333; text-align: center;'>" + college + "</td></tr>";
                LabelPrint.Text += "<tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; " + contact + "</td></tr></table><hr /><br />";
            }
        }
        else
        {
            LabelPrint.Text = "Currently, None of the student registered for this event";
        }
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        string up = "update eventdetails set winner='" + DropDownListStudents.Text + "' where id='" + LabelEid.Text + "'";
        SqlCommand cmd = new SqlCommand(up, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("Participants.aspx?ID=" + LabelEid.Text + "");
    }
}
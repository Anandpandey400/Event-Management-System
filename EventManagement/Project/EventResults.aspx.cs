using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Project_EventResults : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == "Teacher")
        {
            int count = 0;
            string sel = "select name,date,college,type,winner from eventdetails where tid='" + Session["Tid"].ToString() + "' and winner!=''";
            SqlDataAdapter da = new SqlDataAdapter(sel, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    count = count + 1;

                    string name = ds.Tables[0].Rows[0][0].ToString();
                    string date = ds.Tables[0].Rows[0][1].ToString();
                    string college = ds.Tables[0].Rows[0][2].ToString();
                    string type = ds.Tables[0].Rows[0][3].ToString();
                    string winner = ds.Tables[0].Rows[0][4].ToString();
                    LabelPrint.Text += "<table style='width:80%'><tr><td rowspan='4' style='width: 3%; vertical-align: top; font-weight: bold; font-size: x-large; background-color: #000000; color: #FFFFFF; text-align: center;'>" + count + ".</td>";
                    LabelPrint.Text += "<td style='font-size: large; font-weight: bold; text-align: left; background-color: #000000; color: #FFFFFF;' colspan='2'>&nbsp;&nbsp; " + name + "</td></tr>";
                    LabelPrint.Text += "<tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; Held In : <strong>" + college + "</strong></td>";
                    LabelPrint.Text += "<td rowspan='2' style='vertical-align: middle; font-size: large; padding-left: 0px; border-left-style: solid; border-left-width: 1px; border-left-color: #333333; text-align: center;'>Won by <strong>" + winner + "</strong></td></tr>";
                    LabelPrint.Text += "<tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; Date :&nbsp;<strong>" + date + "</strong></td></tr></table><hr /><br />";
                }
            }
            else
            {
                LabelPrint.Text = "None of the Event winner is announced yet..!!";
            }
        }
        else if(Session["type"]=="Admin")
        {
            int count = 0;
            string sel = "select name,date,college,type,winner from eventdetails where winner!=''";
            SqlDataAdapter da = new SqlDataAdapter(sel, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    count = count + 1;

                    string name = ds.Tables[0].Rows[0][0].ToString();
                    string date = ds.Tables[0].Rows[0][1].ToString();
                    string college = ds.Tables[0].Rows[0][2].ToString();
                    string type = ds.Tables[0].Rows[0][3].ToString();
                    string winner = ds.Tables[0].Rows[0][4].ToString();
                    LabelPrint.Text += "<table style='width:80%'><tr><td rowspan='4' style='width: 3%; vertical-align: top; font-weight: bold; font-size: x-large; background-color: #000000; color: #FFFFFF; text-align: center;'>" + count + ".</td>";
                    LabelPrint.Text += "<td style='font-size: large; font-weight: bold; text-align: left; background-color: #000000; color: #FFFFFF;' colspan='2'>&nbsp;&nbsp; " + name + "</td></tr>";
                    LabelPrint.Text += "<tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; Held In : <strong>" + college + "</strong></td>";
                    LabelPrint.Text += "<td rowspan='2' style='vertical-align: middle; font-size: large; padding-left: 0px; border-left-style: solid; border-left-width: 1px; border-left-color: #333333; text-align: center;'>Won by <strong>" + winner + "</strong></td></tr>";
                    LabelPrint.Text += "<tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; Date :&nbsp;<strong>" + date + "</strong></td></tr></table><hr /><br />";
                }
            }
            else
            {
                LabelPrint.Text = "None of the Event winner is announced yet..!!";
            }
        }
    }
}
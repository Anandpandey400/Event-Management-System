using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Project_AssignedEvents : System.Web.UI.Page
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
        string sel = "select id,name,date,college,type,teacher,fees from eventdetails where tid='" + Session["Tid"].ToString() + "'";
        SqlDataAdapter da = new SqlDataAdapter(sel, conn);
        DataSet ds = new DataSet();
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
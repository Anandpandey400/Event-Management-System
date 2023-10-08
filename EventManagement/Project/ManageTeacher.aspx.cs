using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Project_ManageTeacher : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["Add"]=="Data")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Teacher Details Registered')", true);
            Session["Add"] = "";
        }
        if (!IsPostBack)
        {
            string k = "SELECT CAST(id AS int) AS Expr1 FROM teacherdetails ORDER BY Expr1 desc";
            SqlDataAdapter da = new SqlDataAdapter(k, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int id = 101;
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                id = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + 1;
            }
            else
            {
                id = 101;
            }
            txtTid.Value = id.ToString();

            k = "select name from collegedetails";
            da = new SqlDataAdapter(k, con);
            ds = new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count>0)
            {
                DropDownCollegeList.Items.Clear();
                DropDownCollegeList.Items.Add("--Select--");
                for(int i=0; i<ds.Tables[0].Rows.Count;i++)
                {
                    string val = ds.Tables[0].Rows[i][0].ToString();
                    DropDownCollegeList.Items.Add(val);
                }
            }
            else
            {
                DropDownCollegeList.Enabled = false;
                DropDownCollegeList.Items.Add("--No Records Found--");
            }
            Fill();
        }
        
    }

    public void Fill()
    {
        string s = "SELECT id,name,email,contact,college FROM teacherdetails";
        SqlDataAdapter da = new SqlDataAdapter(s, con);
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

        string k = "SELECT CAST(id AS int) AS Expr1 FROM teacherdetails ORDER BY Expr1 desc";
        da = new SqlDataAdapter(k, con);
        ds = new DataSet();
        da.Fill(ds);
        int id = 101;
        int c = ds.Tables[0].Rows.Count;
        if (c > 0)
        {
            id = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + 1;
        }
        else
        {
            id = 101;
        }
        txtTid.Value = id.ToString();
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        string btnType = this.HiddenBtnType.Value;
        if (btnType == "Add")
        {
            string ins = "INSERT INTO teacherdetails VALUES('" + txtTid.Value + "','" + txtName.Value + "','" + txtEmail.Value + "','" + txtContact.Value + "','" + DropDownCollegeList.Text + "','" + txtContact.Value + "')";
            SqlCommand cmd = new SqlCommand(ins, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Session["Add"] = "Data";
            Response.Redirect("ManageTeacher.aspx");
        }
        else if (btnType == "Update")
        {
            string up = "update teacherdetails set email='" + txtEmail.Value + "', contact='" + txtContact.Value + "', college='" + DropDownCollegeList.Text + "' where id='" + txtTid.Value + "'";
            SqlCommand cmd = new SqlCommand(up, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("ManageTeacher.aspx");
        }
    }

    protected void ButtonDelConfirm_Click(object sender, EventArgs e)
    {
        string del = "delete from teacherdetails where id='" + this.HiddenDelProdID.Value + "'";
        SqlCommand cmd = new SqlCommand(del, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("ManageTeacher.aspx");
    }
}
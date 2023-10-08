using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Project_CollegeReg : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string k = "SELECT CAST(id AS int) AS Expr1 FROM collegedetails ORDER BY Expr1 desc";
            SqlDataAdapter da = new SqlDataAdapter(k, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int i = 101;
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                i = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + 1;
            }
            else
            {
                i = 101;
            }
            txtTid.Value = i.ToString();
            Fill();
        }
    }

    public void Fill()
    {
        string s = "SELECT id,name,email,contact,address FROM collegedetails";
        SqlDataAdapter da = new SqlDataAdapter(s, conn);
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

        string k = "SELECT CAST(id AS int) AS Expr1 FROM collegedetails ORDER BY Expr1 desc";
        da = new SqlDataAdapter(k, conn);
        ds = new DataSet();
        da.Fill(ds);
        int i = 101;
        int c = ds.Tables[0].Rows.Count;
        if (c > 0)
        {
            i = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + 1;
        }
        else
        {
            i = 101;
        }
        txtTid.Value = i.ToString();
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        string btnType = this.HiddenBtnType.Value;
        if (btnType == "Add")
        {
            string ins = "INSERT INTO Collegedetails VALUES('" + txtTid.Value + "','" + txtName.Value + "','" + txtEmail.Value + "','" + txtContact.Value + "','" + txtAddress.Value + "')";
            SqlCommand cmd = new SqlCommand(ins, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Session["ColReg"] = "Data";
            Response.Redirect("CollegeReg.aspx");
        }
        else if (btnType == "Update")
        {
            string up = "update Collegedetails set email='" + txtEmail.Value + "', contact='" + txtContact.Value + "', address='" + txtAddress.Value + "' where id='" + txtTid.Value + "'";
            SqlCommand cmd = new SqlCommand(up, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Fill();
        }
        
    }

    protected void ButtonDelConfirm_Click(object sender, EventArgs e)
    {
        string del = "delete from Collegedetails where id='" + this.HiddenDelProdID.Value + "'";
        SqlCommand cmd = new SqlCommand(del, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Fill();
    }
}
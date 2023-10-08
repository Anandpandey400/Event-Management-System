using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Project_ManageEvent : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string k = "SELECT CAST(id AS int) AS Expr1 FROM eventdetails ORDER BY Expr1 desc";
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
        string s = "SELECT id,name,date,college,type,teacher,fees FROM eventdetails where winner=''";
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

        s = "SELECT id,name,date,college,type,teacher,fees,winner FROM eventdetails where winner!=''";
        da = new SqlDataAdapter(s, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView2.DataSource = ds;
            GridView2.DataBind();
            GridView2.Visible = true;
        }
        else
        {
            GridView2.Visible = false;
            LabelErr.Visible = true;
        }

        string k = "SELECT CAST(id AS int) AS Expr1 FROM eventdetails ORDER BY Expr1 desc";
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

        k = "SELECT name FROM collegedetails";
        da = new SqlDataAdapter(k, conn);
        ds = new DataSet();
        da.Fill(ds);
        c = ds.Tables[0].Rows.Count;
        if (c > 0)
        {
            DropDownCollegeList.Items.Clear();
            DropDownCollegeList.Items.Add("--Select--");
            for (int j = 0; j < c; j++)
            {
                string val = ds.Tables[0].Rows[j][0].ToString();
                DropDownCollegeList.Items.Add(val);
            }
        }
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        string btnType = this.HiddenBtnType.Value;
        if (btnType == "Add")
        {
            string ins = "INSERT INTO eventdetails VALUES('" + txtTid.Value + "','" + txtName.Value + "','" + txtDate.Value + "','" + DropDownCollegeList.Text + "','" + DropDownListType.Text + "','" + DropDownTeacherList.Text + "','" + TextBoxFees.Text + "','','" + LabelTid.Text + "')";
            SqlCommand cmd = new SqlCommand(ins, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Session["Event"] = "Data";
            Response.Redirect("ManageEvent.aspx");
        }
        else if (btnType == "Update")
        {
            string up = "update eventdetails set Date='" + txtDate.Value + "', college='" + DropDownCollegeList.Text + "', type='" + DropDownListType.Text + "', teacher='" + DropDownTeacherList.Text + "', fees='" + TextBoxFees.Text + "', tid='" + LabelTid.Text + "' where id='" + txtTid.Value + "'";
            SqlCommand cmd = new SqlCommand(up, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Fill();
        }
    }

    protected void ButtonDelConfirm_Click(object sender, EventArgs e)
    {
        string del = "delete from eventdetails where id='" + this.HiddenDelProdID.Value + "'";
        SqlCommand cmd = new SqlCommand(del, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        del = "delete from eventreg where eid='" + this.HiddenDelProdID.Value + "'";
        cmd = new SqlCommand(del, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Fill();
    }

    protected void DropDownCollegeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownCollegeList.Text != "--Select--")
        {
            string btnType = this.HiddenBtnType.Value;
            if(btnType=="Add")
            {
                ButtonSubmit.Text = "ADD";
            }
            else
            {
                ButtonSubmit.Text = "UPDATE";
            }
            
            string k = "SELECT name FROM teacherdetails where college='" + DropDownCollegeList.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(k, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                DropDownTeacherList.Enabled = true;
                DropDownTeacherList.Items.Clear();
                DropDownTeacherList.Items.Add("--Select--");
                for (int j = 0; j < c; j++)
                {
                    string val = ds.Tables[0].Rows[j][0].ToString();
                    DropDownTeacherList.Items.Add(val);
                }
            }
            else
            {
                DropDownTeacherList.Enabled = false;
                DropDownTeacherList.Items.Clear();
                DropDownTeacherList.Items.Add("--No Teacher Found--");
            }
        }
        else
        {
            DropDownTeacherList.Items.Clear();
            DropDownTeacherList.Enabled = false;
        }
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        string btnType = this.HiddenBtnType.Value;
        if (btnType == "Add")
        {
            ButtonSubmit.Text = "ADD";
        }
        else
        {
            ButtonSubmit.Text = "UPDATE";
        }
        RadioButton2.Checked = false;
        RadioButton1.Checked = true;
        TextBoxFees.Text = "";
        TextBoxFees.Visible = true;
    }

    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        string btnType = this.HiddenBtnType.Value;
        if (btnType == "Add")
        {
            ButtonSubmit.Text = "ADD";
        }
        else
        {
            ButtonSubmit.Text = "UPDATE";
        }
        RadioButton2.Checked = true;
        RadioButton1.Checked = false;
        TextBoxFees.Text = "";
        TextBoxFees.Visible = false;
    }

    protected void DropDownTeacherList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string btnType = this.HiddenBtnType.Value;
        if (btnType == "Add")
        {
            ButtonSubmit.Text = "ADD";
        }
        else
        {
            ButtonSubmit.Text = "UPDATE";
        }
        string sel = "select id from teacherdetails where name='" + DropDownTeacherList.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(sel,conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if(ds.Tables[0].Rows.Count>0)
        {
            LabelTid.Text = ds.Tables[0].Rows[0][0].ToString();
        }
    }
}
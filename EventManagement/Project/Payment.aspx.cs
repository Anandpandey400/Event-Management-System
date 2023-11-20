using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IdentityModel.Metadata;
using System.Security.Cryptography;
using System.Xml.Linq;

public partial class Payment : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EventManagement"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
       
            order.Text = "pay123";

            Label6.Text = (string)Session["Cost"];
            LabelUid.Text = Session["Uid"].ToString();
        }
    }
    private string CreateToken(string message, string secret)
    {
        secret = secret ?? "";
        var encoding = new System.Text.ASCIIEncoding();
        byte[] keyByte = encoding.GetBytes(secret);
        byte[] messageBytes = encoding.GetBytes(message);
        using (var hmacsha256 = new HMACSHA256(keyByte))
        {
            byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
            return Convert.ToBase64String(hashmessage);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ins = "insert into eventreg values('" + Session["Eid"].ToString() + "','" + Session["EName"].ToString() + "','" + Session["uid"].ToString() + "','" + Session["uname"].ToString() + "')";
        SqlCommand cmd = new SqlCommand(ins, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Session["Pay"] = "Success";
        // string secret = "TEST3974f9330d5285ff669720fc245bb6dc6ad8ee83";
        //string data = "";
        //string Merchantkey = "100343904dd47e501a8fa3f8820e09343001";
        //<string, string> formParams = new SortedDictionary<string, string>();
        //.Add("appId", Merchantkey);
        //formParams.Add("orderId", order.Text);
        //formParams.Add("orderAmount", amount.Text);
        //formParams.Add("customerName", name.Text);
        //formParams.Add("customerPhone", contact.Text);
        //formParams.Add("customerEmail", eaddress.Text);
        //formParams.Add("returnUrl", "http://localhost:51060/Project/checkout.aspx");
        //foreach (var kvp in formParams)
        //{
        //data = data + kvp.Key + kvp.Value;
        //}
        //string signature = CreateToken(data, secret);
        //Console.Write(signature);
        //string outputHTML = "<html>";
        //outputHTML += "<head>";
        //outputHTML += "<title>Merchant Check Out Page</title>";
        //outputHTML += "</head>";
        //outputHTML += "<body>";
        //outputHTML += "<center>Please do not refresh this page...</center>";  // you can put h1 tag here
        //outputHTML += "<form id='redirectForm' method='post' action='https://www.gocashfree.com/checkout/post/submit'>";
        //outputHTML += "<input type='hidden' name='appId' value='" + Merchantkey + "'/>";
        //outputHTML += "<input type='hidden' name='orderId' value='" + order.Text + "'/>";
        //outputHTML += "<input type='hidden' name='orderAmount' value='" + amount.Text + "'/>";
        //outputHTML += "<input type='hidden' name='customerName' value='" + name.Text + "'/>";
        //outputHTML += "<input type='hidden' name='customerEmail' value='" + eaddress.Text + "'/>";
        //outputHTML += "<input type='hidden' name='customerPhone' value='" + eaddress.Text + "'/>";
        //outputHTML += "<input type='hidden' name='returnUrl' value='http://localhost:51060/Project/checkout.aspx'/>";
        //outputHTML += "<input type='hidden' name='signature' value='" + signature + "'/>";
        //outputHTML += "<table border='1'>";
        //outputHTML += "<tbody>";
        //foreach (string keys in formParams.Keys)
        //
        //outputHTML += "<input type='hidden' name='" + keys + "' value='" + formParams[keys] + "'>";
        //
        //outputHTML += "</tbody>";
        // outputHTML += "</table>";
        //outputHTML += "<script type='text/javascript'>";
        //outputHTML += "document.getElementById('redirectForm').submit();";
        //outputHTML += "</script>";
        //outputHTML += "</form>";
        //outputHTML += "</body>";
        //outputHTML += "</html>";
        //Response.Write(outputHTML);

        Response.Redirect("RegisteredEvents.aspx");


    }


    protected void Button2_click(object sender, EventArgs e)
    {
        Response.Redirect("EventDetails.aspx");
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void hh_click(object sender, EventArgs e)
    {
        try
        {
            MailMessage p = new MailMessage("anandpandeydemo@gmail.com", email.Text);
            p.Subject = "New Email";
            p.Subject = message.Text;
            p.Priority = MailPriority.High;
            p.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

            smtp.Credentials = new NetworkCredential()
            {
                UserName = "anandpandeydemo@gmail.com",
                Password = "ANANDPANDEYDEMO123"
            };
            smtp.EnableSsl = true;
            smtp.Send(p);
            lmessage.Text = "Message Sent";
        }
        catch (Exception)
        {
            lmessage.Text = "Message Failed";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Scout
{
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["list"] == null)
            {
                Response.Redirect("Error.aspx");
                return;
            }
            repeater.DataSource = Session["list"];
            repeater.DataBind();
        }
        public void cancel(object sender, EventArgs args)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
        public void contactUs(object sender, EventArgs args)
        {
            Response.Redirect("Contact.aspx");
        }
    }
}
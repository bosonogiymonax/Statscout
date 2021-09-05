using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Text.RegularExpressions;
using Scout.Models;
using System.Diagnostics;

namespace Scout
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["list"] != null)
            //{
            //    Response.Redirect("Result.aspx");
            //    return;
            //}
        }

        private void inputValidation()
        {
            if (position.Text == string.Empty || budget.Text == string.Empty)
                Response.Redirect("Error.aspx");

            string pattern = @"^[0-9]*[.,]?[0-9]+$";
            if (!Regex.IsMatch(budget.Text, pattern))
                Response.Redirect("Error.aspx");
        }

        public void sendData(object sender, EventArgs args)
        {
            MarketEntity find = new MarketEntity();

            inputValidation();
            find.Position = position.Text;
            find.MarketValue = Decimal.Parse(budget.Text.Replace('.', ','));

            List<MarketEntity> all = Database.getDatabase();
            List<MarketEntity> isSuitable = Market.suitablePlayers(all, find);

            Session["list"] = isSuitable;

            if (isSuitable.Any())
            {
                //Response.Redirect("Result.aspx");
                repeater.Visible = true;
                repeater.DataSource = Session["list"];
                repeater.DataBind();
            }

            else
                repeater.Visible = false;
                //Response.Redirect("Error.aspx");
        }
        public void contactUs(object sender, EventArgs args)
        {
            Response.Redirect("Contact.aspx");
        }

        public void addPlayer(object sender, EventArgs args)
        {
            Response.Redirect("Add.aspx");
        }
        public void updatePlayer(object sender, EventArgs args)
        {
            Response.Redirect("Update.aspx");
        }
    }
}
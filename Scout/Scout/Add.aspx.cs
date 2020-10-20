using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Scout
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void inputValidation()
        {
            if (name.Text == string.Empty)
                Response.Redirect("Error.aspx");

            string agePattern = @"\d{2}";
            string moneyPattern = @"^[0-9]+[.,]?[0-9]+$";

            if (!Regex.IsMatch(age.Text, agePattern) || !Regex.IsMatch(marketValue.Text, moneyPattern) || !Regex.IsMatch(salary.Text, moneyPattern))
                Response.Redirect("Error.aspx");
        }
        public void addPlayer(object sender, EventArgs args)
        {
            inputValidation();

            MarketEntity newPlayer = new MarketEntity() {
                Name = name.Text,
                Position = position.Text ?? " ",
                Age = int.Parse(age.Text),
                MarketValue = decimal.Parse(marketValue.Text.Replace('.', ',')),
                Nation = nation.Text ?? " ",
                Club = club.Text ?? " ",
                Salary = decimal.Parse(salary.Text.Replace('.', ','))
            };

            Database.insert(newPlayer);
        }
        public void contactUs(object sender, EventArgs args)
        {
            Response.Redirect("Contact.aspx");
        }
        public void cancel(object sender, EventArgs args)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
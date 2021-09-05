using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Scout
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void inputValidation()
        {
            string namePattern = @"^[A-Z]\D+";
            string positionPattern = @"^[A-Z]{2,3}$";
            string agePattern = @"\d{2}";
            string moneyPattern = @"^[0-9]+[.,]?[0-9]+$";
            bool validInput = false;

            if (!Regex.IsMatch(name.Text, namePattern))
                Response.Redirect("Error.aspx");

            if (updateFields.Text == "Position" && Regex.IsMatch(value.Text, positionPattern))
                validInput = true;

            if (updateFields.Text == "Age" && Regex.IsMatch(value.Text, agePattern))
                validInput = true;

            if ((updateFields.Text == "Salary" || updateFields.Text == "MarketValue") && Regex.IsMatch(value.Text, moneyPattern))
                validInput = true;

            if ((updateFields.Text == "Nation" || updateFields.Text == "Club") && Regex.IsMatch(value.Text, namePattern))
                validInput = true;

            if(!validInput)
                Response.Redirect("Error.aspx");
        }

        public void updatePlayer(object sender, EventArgs args)
        {
            inputValidation();
            string updatePlayer = name.Text;
            string updateField = updateFields.Text;
            string updateValue = value.Text;

            Database.Update(updatePlayer, updateField, updateValue);
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
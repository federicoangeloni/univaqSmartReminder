using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class UserControl_UltimiAvvisi : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["sqlServerLocal"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM [Avvisi] ORDER BY Data_Pubblicazione DESC";
        cmd.Connection = con;
        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {
            while (rd.Read())
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes.Add("class", "news-item cut_avvisi");
                string data_pubblicazione = rd[1].ToString().Replace(" 00:00:00", "");
                string boldData = li.InnerHtml = "<b>" + data_pubblicazione + "</b>";
                li.InnerHtml = boldData + " - " + rd[2].ToString();
                ultimi_avvisi.Controls.Add(li);

            }
        }
    }
}
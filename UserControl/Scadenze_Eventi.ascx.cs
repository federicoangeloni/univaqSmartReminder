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

public partial class UserControl_Scadenze_Eventi : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Ottengo l'ora e il giorno attuale in modo da selezionare solo le scadenze e gli eventi futuri o di oggi
        DateTime actual_datetime = DateTime.Now;
        string actual_date = string.Format("{0:dd/MM/yyyy}", actual_datetime);
        // Vincolo sulla data da implementare...basta passare il vincolo nella query

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["sqlServerLocal"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM [Scadenze_Eventi] ORDER BY Data ASC";
        cmd.Connection = con;
        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {
            while (rd.Read())
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                string datetime = rd[1].ToString();
                string[] datetime_splitted = datetime.Split(' ');
                string date = datetime_splitted[0];
                string[] data_splitted = date.Split('/');
                string textual_month;
                switch (data_splitted[1])
                {
                    case "01": textual_month = "GEN"; break;
                    case "02": textual_month = "FEB"; break;
                    case "03": textual_month = "MAR"; break;
                    case "04": textual_month = "APR"; break;
                    case "05": textual_month = "MAG"; break;
                    case "06": textual_month = "GIU"; break;
                    case "07": textual_month = "LUG"; break;
                    case "08": textual_month = "AGO"; break;
                    case "09": textual_month = "SET"; break;
                    case "10": textual_month = "OTT"; break;
                    case "11": textual_month = "NOV"; break;
                    case "12": textual_month = "DIC"; break;
                    default: textual_month = "Invalid"; break;
                }

                li.InnerHtml = "<time><span class=\"day\">" + data_splitted[0] + "</span><span class=\"month\">" + textual_month + "</span><span class=\"year\">" + data_splitted[2] + "</span></time><div class=\"info\"><h2 class=\"title\">" + rd[2].ToString() + "</h2><p class=\"desc\">" + rd[3].ToString() + "</p></div>";
                lista_eventi.Controls.Add(li);

            }
        }
    }
}

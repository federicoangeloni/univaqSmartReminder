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

public partial class UserControl_AuleLibere : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Ottengo l'ora e il giorno attuale in modo da selezionare solo le aule disponibili da adesso in poi
        // Anche queste vanno prelevate da WebService, ora vengono prelevate dal sistema
        DateTime actual_datetime = DateTime.Now;
        string actual_time = string.Format("{0:HH:mm:ss}", actual_datetime);
        string actual_date = string.Format("{0:ddd}", actual_datetime);
        // Vincolo sulla data da implementare...basta fare un case che converte il giorno in numero (es. Lun = 1)
        // e successivamente aggiungere la restrizione nella query
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["sqlServerLocal"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT a.Cod_Aula, e.Nome, al.Dalle, al.Alle FROM Aule as a, Aule_Libere as al, Edifici as e WHERE al.Aula = a.Id AND a.Edificio = e.Id AND al.Dalle >= '" + actual_time + "' ORDER BY Giorno_Sett ASC, Aula ASC, Dalle ASC";
        cmd.Connection = con;
        SqlDataReader rd = cmd.ExecuteReader();
        // Se ci sono aule libere visualizzale
        if (rd.HasRows)
        {
            while (rd.Read())
            {

                TableRow row = new TableRow();
                for (int i = 0; i < 4; i++)
                {
                    TableCell c = new TableCell();
                    if (i == 2 || i == 3)
                    {
                        c.Text = rd[i].ToString().Truncate(5);
                    }
                    else
                    {
                        c.Text = rd[i].ToString();
                    }
                    row.Controls.Add(c);
                }
                aule_libere.Controls.Add(row);
            }
        }
        // Altrimenti segnala che non ci sono aule disponibili
        else
        {
            TableRow row = new TableRow();
            TableCell c = new TableCell();
            c.Text = "Non risultano disponibili aule libere.";
            row.Controls.Add(c);
            aule_libere.Controls.Add(row);
        }
    }
}

public static class StringExt
{
    public static string Truncate(this string value, int maxLength)
    {
        if (string.IsNullOrEmpty(value)) return value;
        return value.Length <= maxLength ? value : value.Substring(0, maxLength);
    }
}
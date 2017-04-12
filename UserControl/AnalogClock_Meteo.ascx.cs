using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_AnalogClock_Meteo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Ottenimento dei dati da webservice
        TimeService.GetCurrentTimeSoapClient client = new TimeService.GetCurrentTimeSoapClient("GetCurrentTimeSoap");
        string actual_time = client.currentTime();
        // Split della stringa ricevuta. Otteniamo un array con Data e Ora
        string[] date_time = actual_time.Split(' ');
        // Split della Data. Otteniamo un array con Giorni Mesi ed Anni
        string[] date = date_time[0].Split('/');
        // Split dell'Ora. Otteniamo un array con Ore Minuti e Secondi
        string[] time = date_time[1].Split(':');
        // Formattazione data nel formato abituale italiano
        string day = date[1];
        string month = date[0];
        string textual_month;
        switch (month)
        {
            case "01": textual_month = "Gennaio"; break;
            case "02": textual_month = "Febbraio"; break;
            case "03": textual_month = "Marzo"; break;
            case "04": textual_month = "Aprile"; break;
            case "05": textual_month = "Maggio"; break;
            case "06": textual_month = "Giugno"; break;
            case "07": textual_month = "Luglio"; break;
            case "08": textual_month = "Agosto"; break;
            case "09": textual_month = "Settembre"; break;
            case "10": textual_month = "Ottobre"; break;
            case "11": textual_month = "Novembre"; break;
            case "12": textual_month = "Dicembre"; break;
            default: textual_month = "Invalid"; break;
        }
        string year = date[2];
        string ita_date = day + " " + textual_month + " " + year;
        // Formattazione ora nel formato abituale italiano e correzione fuso orario
        string hour = time[0];
        int italy_fuse_time = Int32.Parse(hour) + 7;
        string minutes = time[1];
        // Passaggio dei dati nei campi indicati nell'html
        hours_webservice.Value = italy_fuse_time.ToString();
        mins_webservice.Value = minutes;
        date_webservice.Text = ita_date;
    }
}
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


public partial class UserControl_TabellaRiepilogo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["sqlServerLocal"].ToString();
        con.Open();

        // SEZIONE RELATIVA AL PANEL ORARIO PERSONALE
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT O.Giorno,O.Inizio,O.Fine,c.Nome,d.Nome,d.Cognome,a.Cod_Aula,e.Nome FROM Orari AS O, Aule AS a, Corsi AS c, Docenti AS d, Edifici AS e WHERE O.Aula = a.Id AND O.Corso = c.Id AND c.Docenti = d.Id AND a.Edificio = e.Id ORDER BY O.Giorno ASC, O.Inizio ASC";
        cmd.Connection = con;
        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {
            //Creazione header tabella dinamico (se in alcuni giorni della settimana non ci sono lezioni non verrà inserito neanche l'header)
            string header_creato = "";
            while (rd.Read())
            {
                string textual_day;
                if (header_creato != rd[0].ToString())
                {
                    switch (rd[0].ToString())
                    {
                        case "1": textual_day = "Lunedì"; break;
                        case "2": textual_day = "Martedì"; break;
                        case "3": textual_day = "Mercoledì"; break;
                        case "4": textual_day = "Giovedì"; break;
                        case "5": textual_day = "Venerdì"; break;
                        case "6": textual_day = "Sabato"; break;
                        case "7": textual_day = "Domenica"; break;
                        default: textual_day = "Invalid"; break;
                    }
                    TableHeaderRow head = new TableHeaderRow();
                    TableHeaderCell head_cell = new TableHeaderCell();
                    head_cell.CssClass = "days_text";
                    head_cell.ColumnSpan = 7;
                    head_cell.Text = textual_day;
                    head.Controls.Add(head_cell);
                    header_creato = rd[0].ToString();
                    orario.Controls.Add(head);

                    TableHeaderRow head_intestazione = new TableHeaderRow();
                    TableHeaderCell head_int_cell1 = new TableHeaderCell();
                    head_int_cell1.CssClass = "col-md-1";
                    head_int_cell1.Text = "Inizio";
                    head_intestazione.Controls.Add(head_int_cell1);

                    TableHeaderCell head_int_cell2 = new TableHeaderCell();
                    head_int_cell2.CssClass = "col-md-1";
                    head_int_cell2.Text = "Fine";
                    head_intestazione.Controls.Add(head_int_cell2);

                    TableHeaderCell head_int_cell3 = new TableHeaderCell();
                    head_int_cell3.CssClass = "col-md-4";
                    head_int_cell3.Text = "Corso";
                    head_intestazione.Controls.Add(head_int_cell3);

                    TableHeaderCell head_int_cell4 = new TableHeaderCell();
                    head_int_cell4.CssClass = "col-md-4";
                    head_int_cell4.Text = "Docente";
                    head_intestazione.Controls.Add(head_int_cell4);

                    TableHeaderCell head_int_cell5 = new TableHeaderCell();
                    head_int_cell5.CssClass = "col-md-1";
                    head_int_cell5.Text = "Aula";
                    head_intestazione.Controls.Add(head_int_cell5);

                    TableHeaderCell head_int_cell6 = new TableHeaderCell();
                    head_int_cell6.CssClass = "col-md-1";
                    head_int_cell6.Text = "Edificio";
                    head_intestazione.Controls.Add(head_int_cell6);
                    orario.Controls.Add(head_intestazione);
                }

                //Creazione righe tabella dinamicamente
                TableRow row = new TableRow();
                for (int i = 1; i < 4; i++)
                {
                    TableCell c = new TableCell();
                    c.Text = rd[i].ToString();
                    row.Controls.Add(c);
                }
                TableCell c_docente = new TableCell();
                c_docente.Text = rd[4].ToString() + " " + rd[5].ToString();
                row.Controls.Add(c_docente);
                for (int i = 6; i < 8; i++)
                {
                    TableCell c = new TableCell();
                    c.Text = rd[i].ToString();
                    row.Controls.Add(c);
                }
                orario.Controls.Add(row);
            }
        }
        rd.Close();


        // SEZIONE RELATIVA AL PANEL DOCENTI
        // To do: Va ristretta la ricerca solamente ai docenti del dipartimento dell'utente loggato
        cmd.CommandText = "SELECT d.Id,d.Cognome,d.Nome,d.Telefono,d.Email,d.Link, d.Dipartimento FROM Docenti AS d ORDER BY d.Cognome ASC";
        cmd.Connection = con;
        SqlDataReader rd2 = cmd.ExecuteReader();
        if (rd2.HasRows)
        {
            //Creazione righe tabella dinamicamente
            while (rd2.Read())
            {
                TableRow row = new TableRow();
                for (int i = 1; i < 5; i++)
                {
                    TableCell c = new TableCell();
                    c.Text = rd2[i].ToString();
                    row.Controls.Add(c);
                }

                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = "SELECT c.Cod_Corso,c.Nome,cl.Codice FROM Corsi AS c, Corsi_Laurea AS cl WHERE c.Docenti = '" + rd2[0].ToString() + "' AND c.CdL = cl.Id";
                cmd2.Connection = con;
                SqlDataReader rd3 = cmd2.ExecuteReader();
                if (rd3.HasRows)
                {
                    string titolarita = "";
                    while (rd3.Read())
                    {
                        titolarita = titolarita + "[" + rd3[0].ToString() + "] " + rd3[1].ToString() + " [" + rd3[2].ToString() + "]</br>";
                    }
                    TableCell c = new TableCell();
                    c.Text = titolarita;
                    row.Controls.Add(c);
                }
                else
                {
                    TableCell c = new TableCell();
                    row.Controls.Add(c);
                }
                rd3.Close();

                if (rd2[5].ToString() != "")
                {
                    TableCell link = new TableCell();
                    link.Controls.Add(new LiteralControl(string.Format("<a href={0}>{1}</a>", rd2[5].ToString(), "URL")));
                    row.Controls.Add(link);
                }
                else
                {
                    TableCell link = new TableCell();
                    row.Controls.Add(link);
                }
                docenti.Controls.Add(row);
            }
        }
        rd2.Close();


        // SEZIONE RELATIVA AL PANEL CORSI
        // To do: Va ristretta la ricerca solamente ai corsi appartenenti al corso di laurea dell'utente loggato 
        cmd.CommandText = "SELECT c.Cod_Corso, c.Nome, d.Nome, d.Cognome, c.Lingua, c.Semestre , c.CFU, c.SSD, cl.Codice FROM Corsi as c, Docenti as d, Corsi_Laurea as cl WHERE c.Docenti = d.Id AND c.CdL = cl.Id";
        cmd.Connection = con;
        SqlDataReader rd4 = cmd.ExecuteReader();
        if (rd4.HasRows)
        {
            //Creazione righe tabella dinamicamente
            while (rd4.Read())
            {
                TableRow row = new TableRow();
                for (int i = 0; i < 2; i++)
                {
                    TableCell c = new TableCell();
                    c.Text = rd4[i].ToString();
                    row.Controls.Add(c);
                }

                string docente = rd4[2].ToString() + " " + rd4[3].ToString();
                TableCell c1 = new TableCell();
                c1.Text = docente;
                row.Controls.Add(c1);

                for (int i = 4; i < 9; i++)
                {
                    TableCell c = new TableCell();
                    c.Text = rd4[i].ToString();
                    row.Controls.Add(c);
                }

                corsi.Controls.Add(row);
            }
        }
    }
}
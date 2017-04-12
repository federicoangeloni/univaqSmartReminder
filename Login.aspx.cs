using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    private string encrypted_ticket;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = TextBoxLoginName.Text;
        string password = TextBoxLoginPassword.Text;
        bool persist = chkRememberMe.Checked;

        DatabaseService dbService = new DatabaseService();
        string sqlString = "SELECT * FROM Utenti WHERE email='" + email + "' AND password='" + password + "'";
        SqlDataReader queryResult = dbService.Reader(sqlString);
        if (queryResult.Read())
        {
            string user_data = queryResult[1].ToString() + " " + queryResult[2].ToString() + " " + queryResult[3].ToString() + " " + queryResult[6];
            // Se le credenziali sono corrette ed è stato selezionato il checkbox per restare loggati creo cookie permanente
            if (persist)
            {
                FormsAuthentication.SetAuthCookie(this.TextBoxLoginName.Text.Trim(), true);
                FormsAuthenticationTicket ticket1 = new FormsAuthenticationTicket(
                    1,                                   // Versione
                    this.TextBoxLoginName.Text.Trim(),   // Nome del cookie (Username dalla form)
                    DateTime.Now,                        // Ora Attuale
                    DateTime.Now.AddMinutes(15),         // Scadenza dopo 15 minuti
                    true,                                // Cookie Persistente
                    user_data                            // User data
                    );
                encrypted_ticket = FormsAuthentication.Encrypt(ticket1);
            }
            // Altrimenti creo cookie non permanente
            else
            {
                FormsAuthentication.SetAuthCookie(this.TextBoxLoginName.Text.Trim(), false);
                FormsAuthenticationTicket ticket1 = new FormsAuthenticationTicket(
                    1,                                   // Versione
                    this.TextBoxLoginName.Text.Trim(),   // Nome del cookie (Username dalla form)
                    DateTime.Now,                        // Ora Attuale
                    DateTime.Now.AddMinutes(15),         // Scadenza dopo 15 minuti
                    false,                               // Cookie NON Persistente
                    user_data                            // User data
                    );
                encrypted_ticket = FormsAuthentication.Encrypt(ticket1);
            }

            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, encrypted_ticket);
            Response.Cookies.Add(cookie1);

            // Salvataggio data e ora dell'ultimo login dell'utente nel DB
            DateTime actual_datetime = DateTime.Now;
            string actual_dt = string.Format("{0:dd/MM/yyyy HH:mm:ss}", actual_datetime);
            string sqlString_datasave = "UPDATE Utenti SET LastLoginDate = @data_ora WHERE Id = @id";
            Tuple<string, Object, SqlDbType>[] sqlParams =
            {
                Tuple.Create<string, Object, SqlDbType>("@data_ora", actual_dt, SqlDbType.DateTime),
                Tuple.Create<string, Object, SqlDbType>("@id", queryResult[0].ToString(), SqlDbType.Int),
            };
            dbService.ExecuteNonQuery(sqlString_datasave, sqlParams);

            // Effettuo il redirect a seconda dell'esito del login 
            String returnUrl1;
            // Se il login ha avuto successo
            if (Request.QueryString["ReturnUrl"] == null)
            {
                returnUrl1 = "Pages_OnlyLoggedUser/Home.aspx";
            }
            // Altrimenti se il login non ha avuto successo
            else
            {
                returnUrl1 = Request.QueryString["ReturnUrl"];
            }
            Response.Redirect(returnUrl1);
        }
    }
}
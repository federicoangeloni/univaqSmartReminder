using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Globalization;

/// <summary>
/// Log su file di testo.
/// </summary>
public class ErrHandler
{
    public ErrHandler()
    {

    }


    public static void WriteError(string errorMessage)
    {
        try
        {
            string path = "Log/" + DateTime.Today.ToString("dd-MM-yy") + ".txt";
            if ((!File.Exists(System.Web.HttpContext.Current.Server.MapPath(path))))
            {
                File.Create(System.Web.HttpContext.Current.Server.MapPath(path)).Close();
            }
            using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath(path)))
            {
                w.WriteLine(System.Environment.NewLine + "Log Entry : ");
                w.WriteLine("{0}", DateTime.Now.ToString(CultureInfo.InvariantCulture));
                string err = "Errore in: " + System.Web.HttpContext.Current.Request.Url.ToString() + ". Messaggio:" + errorMessage;
                w.WriteLine(err);
                w.WriteLine("__________________________");
                w.Flush();
                w.Close();
            }
        }
        catch (Exception ex)
        {
            WriteError(ex.Message);
        }

    }



}
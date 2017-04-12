using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descrizione di riepilogo per databaseService
/// </summary>
public class DatabaseService
{
    /// <summary>
    /// Variabili di Connection e Command</summary>
    private SqlConnection sqlConn;
    private SqlCommand sqlCmd;

    /// <summary>
    /// Esito delle query</summary>
    public bool sqlExec;
    public string sqlMessage;

    public DatabaseService()
    {
        // costruttore
        openConnection();
    }
    ~DatabaseService()
    {
        closeConnection();
    }

    /// <summary>
    ///  Questa funzione apre la connnessione al database leggendo la stringa dal file di configurazione.
    /// </summary>
    private void openConnection()
    {
        try
        {
            sqlConn = new SqlConnection();
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["sqlServerLocal"].ConnectionString;
            sqlConn.Open();
            sqlExec = true;
            sqlMessage = "";
        }
        catch (Exception ex)
        {
            sqlExec = false;
            sqlMessage = "Si è verificato un errore di apertura connessione: " + ex.Message;
        }
    }

    /// <summary>
    ///  Questa funzione chiude la connnessione al database.
    /// </summary>
    private void closeConnection()
    {
        try
        {
            if (sqlConn.State == ConnectionState.Open)
                sqlConn.Close();
        }
        catch (Exception ex)
        {
            sqlExec = false;
            sqlMessage = "Si è verificato un errore in chiusura connessione: " + ex.Message;
        }
    }

    /// <summary>
    ///  Questa funzione esegue una query di modifica, inserimento o cancellazione.
    /// </summary>
    /// <param name="strSQL"> testo della query sql da eseguire</param>
    /// <param name="queryParams"> tupla di parametri della query, costituita da nome parametro (string), valore (generico quindi Object), tipo del parametro sul motore del database (SqlDbType).</param>
    public bool ExecuteNonQuery(string strSQL, Tuple<string, Object, SqlDbType>[] queryParams)
    {
        try
        {
            SqlParameter sqlParam;
            sqlCmd = new SqlCommand(strSQL, sqlConn);

            foreach (var param in queryParams)
            {
                sqlParam = new SqlParameter(param.Item1, param.Item3);
                sqlParam.Value = param.Item2;
                sqlCmd.Parameters.Add(sqlParam);
            }
            
            sqlCmd.ExecuteNonQuery();
            sqlExec = true;
            sqlMessage = "";

        }
        catch (Exception ex)
        {
            sqlExec = false;
            sqlMessage = "Si è verificato un errore durante una query: " + ex.Message;
            ErrHandler.WriteError(sqlMessage);
        }
        return sqlExec;
    }

    /// <summary>
    ///  Questa funzione esegue una query di selezione.
    /// </summary>
    /// <param name="strSQL"> testo della query sql da eseuire</param>
    /// <param name="queryParams"> tupla di parametri della query, costituita da nome parametro (string), valore (generico quindi Object), tipo del parametro sul motore del database (SqlDbType).</param>
    public SqlDataReader Reader(string strSQL, Tuple<string, Object, SqlDbType>[] queryParams)
    {

        sqlCmd = null;

        try
        {
            SqlParameter sqlParam;
            sqlCmd = new SqlCommand(strSQL, sqlConn);
            foreach (var param in queryParams)
            {
                sqlParam = new SqlParameter(param.Item1, param.Item3);
                sqlParam.Value = param.Item2;
                sqlCmd.Parameters.Add(sqlParam);
            }

            SqlDataReader myReader = sqlCmd.ExecuteReader();
            sqlExec = true;
            sqlMessage = "";
            return myReader;

        }
        catch (Exception ex)
        {
            sqlExec = false;
            sqlMessage = "Si è verificato un errore durante una query di selezione: " + ex.Message;
            ErrHandler.WriteError(sqlMessage);
            return null;
        }
    }

    /// <summary>
    ///  Questa funzione esegue una query di selezione.
    /// </summary>

    public SqlDataReader Reader(string strSQL)
    {

        sqlCmd = null;

        try
        {
            sqlCmd = new SqlCommand(strSQL, sqlConn);

            SqlDataReader myReader = sqlCmd.ExecuteReader();
            sqlExec = true;
            sqlMessage = "";
            return myReader;
        }
        catch (Exception ex)
        {
            sqlExec = false;
            sqlMessage = "Si è verificato un errore durante una query di selezione: " + ex.Message;
            ErrHandler.WriteError(sqlMessage);
            return null;
        }
    }
}
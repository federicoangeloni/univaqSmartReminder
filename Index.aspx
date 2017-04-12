<%@ Page Title="" Language="C#" MasterPageFile="~/NonLogged.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<%@ Register Src="~/UserControl/TitoloHeader.ascx" TagPrefix="uc1" TagName="TitoloHeader" %>
<%@ Register Src="~/UserControl/AnalogClock_Meteo.ascx" TagPrefix="uc1" TagName="AnalogClock_Meteo" %>
<%@ Register Src="~/UserControl/AuleLibere.ascx" TagPrefix="uc1" TagName="AuleLibere" %>
<%@ Register Src="~/UserControl/UltimiAvvisi.ascx" TagPrefix="uc1" TagName="UltimiAvvisi" %>
<%@ Register Src="~/UserControl/Scadenze_Eventi.ascx" TagPrefix="uc1" TagName="Scadenze_Eventi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="Server">
    <div class="container">

        <!-- Sezione Titolo -->
        <uc1:TitoloHeader runat="server" ID="TitoloHeader" />
        <hr />
        
        <!-- Orologio Analogico + Meteo -->
        <uc1:AnalogClock_Meteo runat="server" ID="AnalogClock_Meteo" />
        <hr />

        <!-- Aule Libere -->
        <uc1:AuleLibere runat="server" ID="AuleLibere" />
        <hr />

        <!-- Ultimi Avvisi -->
        <uc1:UltimiAvvisi runat="server" ID="UltimiAvvisi" />
        <hr />

        <!-- Prossime Scadenze ed Eventi -->
        <uc1:Scadenze_Eventi runat="server" ID="Scadenze_Eventi" />

    </div>
</asp:Content>

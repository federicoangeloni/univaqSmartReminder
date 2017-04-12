<%@ Page Title="" Language="C#" MasterPageFile="Logged.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Src="~/UserControl/TabellaRiepilogo.ascx" TagPrefix="uc1" TagName="TabellaRiepilogo" %>
<%@ Register Src="~/UserControl/AvvisiCorso.ascx" TagPrefix="uc1" TagName="AvvisiCorso" %>
<%@ Register Src="~/UserControl/AuleLibere.ascx" TagPrefix="uc1" TagName="AuleLibere" %>
<%@ Register Src="~/UserControl/Scadenze_Eventi.ascx" TagPrefix="uc1" TagName="Scadenze_Eventi" %>
<%@ Register Src="~/UserControl/AnalogClock_Meteo.ascx" TagPrefix="uc1" TagName="AnalogClock_Meteo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="Server">

    <div class="container">

        <asp:Label ID="Welcome" runat="server" />

        <!-- Sezione Riepilogo Studente -->
        <uc1:TabellaRiepilogo runat="server" ID="TabellaRiepilogo" />
        <hr />

        <!-- Sezione Avvisi Specifici Corso Studente -->
        <uc1:AvvisiCorso runat="server" ID="AvvisiCorso" />
        <hr />

        <!-- Sezione Aule Libere -->
        <uc1:AuleLibere runat="server" ID="AuleLibere" />
        <hr />

        <!-- Sezione Scadenze ed Eventi -->
        <uc1:Scadenze_Eventi runat="server" ID="Scadenze_Eventi" />
        <hr />

        <!-- Sezione Ora e Meteo -->
        <uc1:AnalogClock_Meteo runat="server" ID="AnalogClock_Meteo" />

    </div>

</asp:Content>


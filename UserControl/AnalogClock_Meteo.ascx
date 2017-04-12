<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AnalogClock_Meteo.ascx.cs" Inherits="UserControl_AnalogClock_Meteo" %>


<div class="container" id="sectionMeteo">
    <div class="row">
        <h2 class="text-center title_standard">Ora e Meteo</h2>
    </div>
    <div class="row">

        <!-- Clock Analogico -->
        <div class="col-md-6" id="container_clock">
            <div id="clock">
                <div id="sec"></div>
                <div id="hour"></div>
                <div id="min"></div>
            </div>

            <!-- Hidden Field per il value delle ore e dei minuti provenienti da WebService-->
            <asp:HiddenField ID="hours_webservice" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="mins_webservice" runat="server"></asp:HiddenField>

            <!-- Label data attuale -->
            <h2 class="text-center" id="date_text">
                <asp:Label ID="date_webservice" runat="server"></asp:Label></h2>


        </div>

        <div class="col-md-6 center-block">

            <!-- Pannello Meteo-->
            <div class="retro_meteo">
                <iframe class="meteo" src="https://www.meteo.it/mymeteo/widget/public/it/widget_7gg.shtml?i=66049&mt=1&r=13&f=Arial&ch=ffffff&cbh=901A21&cf=FFFFFF&cbf=901A21&cb=901A21" width="100%" height="327px" frameborder="0" scrolling="no"></iframe>
            </div>

        </div>
    </div>
</div>

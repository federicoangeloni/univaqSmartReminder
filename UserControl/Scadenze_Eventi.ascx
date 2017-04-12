<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Scadenze_Eventi.ascx.cs" Inherits="UserControl_Scadenze_Eventi" %>

<div class="container" id="sectionScadenze">

    <div class="row">
        <h1 class="text-center title_standard">Prossime Scadenze ed Eventi</h1>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-offset-2 col-sm-8 col-md-8">
            <ul class="event-list" id="lista_eventi" runat="server">
                <!-- LISTA DI EVENTI E SCADENZE AGGIUNTA DINAMICAMENTE DA DB -->
            </ul>
        </div>
    </div>
</div>

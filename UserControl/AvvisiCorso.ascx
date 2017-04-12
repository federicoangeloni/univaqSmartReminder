<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AvvisiCorso.ascx.cs" Inherits="UserControl_AvvisiCorso" %>

<div class="container" id="sectionAvvisiPersonali">

    <div class="row">
        <h1 class="text-center title_standard">I tuoi avvisi</h1>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-list-alt"></span><b>Ultimi Avvisi</b></h3>
                </div>

                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <ul class="ultimi_avvisi" id="ultimi_avvisi" runat="server">
                                <!-- AVVISI AGGIUNTI DINAMICAMENTE DA DB -->
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                </div>

            </div>
        </div>
    </div>

</div>



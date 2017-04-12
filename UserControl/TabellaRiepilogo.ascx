<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TabellaRiepilogo.ascx.cs" Inherits="UserControl_TabellaRiepilogo" %>

<div class="container" id="sectionRiepilogo">
    <div class="row">
        <h2 class="text-center title_standard">Il tuo riepilogo</h2>
    </div>

    <div class="row" id="tabellaRiepilogo">
        <!-- PILLS -->
        <ul class="nav nav-pills">
            <li class="active noround"><a data-toggle="pill" href="#menu_orario">Orario</a></li>
            <li class="noround"><a data-toggle="pill" href="#menu_docenti">Docenti</a></li>
            <li class="noround"><a data-toggle="pill" href="#menu_corsi">Corsi</a></li>
        </ul>

        <div class="tab-content">

            <!-- PANNELLO ORARIO PERSONALE -->
            <!-- BREADCRUMB SUPERIORE -->
            <div id="menu_orario" class="tab-pane fade in active">
                <ol class="breadcrumb" id="position_bar">
                    <li>
                        <!-- NB: Breadcrumb e menu a tendina da completare, si presuppone che loggandosi venga visualizzato solamente 
                             il proprio orario del proprio corso! In futuro si potrà rendere tale funzionalità selezionabile
                             oppure sarà possibile selezionare la lista degli orari dei propri corsi che si desidera visualizzare -->
                        <div class="btn-group">
                            <a href="#" class="btn">DISIM</a>
                            <%--<button type="button" class="btn dropdown-toggle btnriepilogo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">DIIIE</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">MESVA</a></li>
                            </ul>--%>
                        </div>
                    </li>
                    <li>
                        <div class="btn-group">
                            <a href="#" class="btn">Magistrale</a>
                            <%--<button type="button" class="btn dropdown-toggle btnriepilogo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Triennale</a></li>
                            </ul>--%>
                        </div>
                    </li>
                    <li>
                        <div class="btn-group">
                            <a href="#" class="btn">Ingegneria Informatica ed Automatica</a>
                            <%--<button type="button" class="btn dropdown-toggle btnriepilogo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Ingegneria delle Telecomunicazioni</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Ingegneria Matematica</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Scienze Informatiche</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Scienze Matematiche</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Add more</a></li>
                            </ul>--%>
                        </div>
                    </li>
                    <li>
                        <div class="btn-group">
                            <a href="#" class="btn">II Anno</a>
                            <%--<button type="button" class="btn dropdown-toggle btnriepilogo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">I Anno</a></li>
                            </ul>--%>
                        </div>
                    </li>
                    <li>
                        <div class="btn-group">
                            <a href="#" class="btn">II Semestre</a>
                            <%--<button type="button" class="btn dropdown-toggle btnriepilogo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">I Semestre</a></li>
                            </ul>--%>
                        </div>
                    </li>
                </ol>
                <!-- Contenuto Orario Creato Dinamicamente prelevando dati da DB-->
                <h3 class="title_panel">Orario</h3>
                <asp:Table CssClass="table table-bordered table-striped table-hover" ID="orario" runat="server">
                </asp:Table>
            </div>

            <!-- PANNELLO DOCENTI -->
            <div id="menu_docenti" class="tab-pane fade">
                <h3 class="title_panel">Docenti</h3>
                <!-- Contenuto Docenti Creato Dinamicamente prelevando dati da DB-->
                <asp:Table CssClass="table table-bordered table-striped table-hover" ID="docenti" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell CssClass="col-md-2 days_text">Cognome</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-2 days_text">Nome</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-1 days_text">Telefono</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-2 days_text">Email</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-4 days_text">Titolarità</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-1 days_text">Link</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </div>

            <!-- PANNELLO CORSI -->
            <div id="menu_corsi" class="tab-pane fade">
                <h3 class="title_panel">Corsi</h3>
                <!-- Contenuto Corsi Creato Dinamicamente prelevando dati da DB-->
                <asp:Table CssClass="table table-bordered table-striped table-hover" ID="corsi" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell CssClass="col-md-1 days_text">Codice</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-5 days_text">Nome</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-2 days_text">Docente</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-1 days_text">Lingua</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-1 days_text">Semestre</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-1 days_text">CFU</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-1 days_text">SSD</asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="col-md-1 days_text">CdL</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </div>

        </div>
    </div>
</div>

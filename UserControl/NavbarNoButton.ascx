<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavbarNoButton.ascx.cs" Inherits="Navbar" %>

<div class="container">

    <div class="head_top">
        <!-- Topper w/ logo -->
        <div class="row hidden-xs hidden-sm topper">
            <div class="col-md-1 hidden-xs hidden-sm">
                <img src="/Media/logo-2012.png">
            </div>
            <div class="col-md-6">
                <h1 class="logo_description">Univaq Smart Reminder</h1>
            </div>

            <div class="col-xs-5 col-xs-offset-1 col-sm-5 col-sm-offset-0 col-md-5 text-right text-social">
                <a href="https://www.facebook.com/univaq.it/?fref=ts" class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
                <a href="https://plus.google.com/+univaq" class="btn btn-social-icon btn-google-plus"><i class="fa fa-google-plus"></i></a>
                <a href="https://www.instagram.com/univaq.it/" class="btn btn-social-icon btn-instagram"><i class="fa fa-instagram"></i></a>
                <a href="https://www.linkedin.com/company/universit-degli-studi-dell%27aquila" class="btn btn-social-icon btn-linkedin"><i class="fa fa-linkedin"></i></a>
                <a href="https://twitter.com/univaq?lang=it" class="btn btn-social-icon btn-twitter"><i class="fa fa-twitter"></i></a>
            </div>
        </div>
        <!-- End Topper -->


        <!-- Navigation -->
        <div class="row">
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand visible-xs-inline-block nav-logo" href="/">
                            <img src="/Media/logo-2012.png" class="img-responsive" alt=""></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav js-nav-add-active-class">
                            <li><a href="index.aspx#" id="buttonNavHome">Home</a></li>
                            <li><a href="index.aspx#sectionMeteo" id="buttonNavMeteo">Ora & Meteo</a></li>
                            <li><a href="index.aspx#sectionAuleLibere" id="buttonNavAule">Aule Libere</a></li>
                            <li><a href="index.aspx#sectionAvvisi" id="buttonNavAvvisi">Ultimi Avvisi</a></li>
                            <li><a href="index.aspx#sectionScadenze" id="buttonNavScadenze">Scadenze & Eventi</a></li>
                            <li><a type="button" href="#" data-toggle="modal" data-target="#contact_modal">Contatti</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" id="droplinkutili" data-toggle="dropdown">Link Utili <b class="caret"></b></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="http://www.univaq.it">Univaq.it</a></li>
                                    <li><a href="http://www.ing.univaq.it/">Ingegneria</a></li>
                                    <li><a href="http://www.disim.univaq.it/">Disim</a></li>
                                    <li><a href="https://segreteriavirtuale.univaq.it">Segreteria Virtuale</a></li>
                                    <li><a href="http://www.didattica.univaq.it/moodle/">eLearning</a></li>
                                </ul>
                            </li>
                            <li class="hidden-lg hidden-md">
                                <a type="button" class="navbar-btn btn btn-gradient-blue" href="#" data-toggle="modal" data-target="#login_modal">Login</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- /.container -->


<!-- MODAL CONTATTI -->
<div class="modal fade" id="contact_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Contattaci</h4>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4168.837045030732!2d13.349606519761847!3d42.36782556875957!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x265e6e41daa9b17f!2sUniversit%C3%A0+degli+Studi+dell&#39;Aquila+-+Dipartimento+di+Ingegneria+e+Scienze+dell&#39;Informazione+e+Matematica!5e0!3m2!1sit!2sit!4v1480214065705" width="100%" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
                    </div>

                    <div class="col-md-4">
                        <h2>Università degli Studi dell'Aquila</h2>
                        <address>
                            <strong>Univaq Smart Reminder</strong><br>
                            Via Vetoio 1<br>
                            67100 L'Aquila<br>
                            Italia<br>
                            <br>
                            <abbr title="Mail">Mail:</abbr>
                            univaqsmartreminder@univaq.it<br>
                            <abbr title="Phone">Tel:</abbr>
                            0862 434701
                        </address>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
            </div>

        </div>
    </div>
</div>
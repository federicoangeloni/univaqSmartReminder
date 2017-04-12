<%@ Page Title="" Language="C#" MasterPageFile="~/LoginPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="Server">

    <div class="container">
        <div class="modal-content center-block" id="pannello_login">
            <!-- Header del pannello del login -->
            <div class="modal-header">
                <h4 class="modal-title" id="titolo_pannello">Login</h4>
            </div>

            <!-- Body del pannello del login -->
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <fieldset>
                            <img src="../Media/logo-univaq.png" class="img_login center-block" alt="logo-univaq">
                            <h5 class="center">Utilizza le credenziali della tua Segreteria Virtuale</h5>
                            <div class="form-group">
                                <asp:textbox id="TextBoxLoginName" cssclass="form-control" runat="server" placeholder="Email"></asp:textbox>
                                <asp:requiredfieldvalidator id="RequiredFieldValidatorEmail" controltovalidate="TextBoxLoginName" display="Dynamic" errormessage="Campo Richiesto." runat="server"></asp:requiredfieldvalidator>
                            </div>
                            <div class="form-group">
                                <asp:textbox id="TextBoxLoginPassword" class="form-control" runat="server" placeholder="Password" text="Password" textmode="Password"></asp:textbox>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator2" controltovalidate="TextBoxLoginPassword" display="Dynamic" errormessage="Campo Richiesto." runat="server"></asp:requiredfieldvalidator>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:checkbox id="chkRememberMe" runat="server" />
                                    Ricordami
                                </label>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>

            <!-- Footer del pannello del login -->
            <div class="modal-footer">
                <asp:button id="btnLogin" cssclass="btn btn-gradient-blue" runat="server" text="Login" onclick="btnLogin_Click" />
            </div>

        </div>
    </div>

</asp:Content>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AuleLibere.ascx.cs" Inherits="UserControl_AuleLibere" %>


<div class="container" id="sectionAuleLibere">

    <div class="row">
        <h2 class="text-center title_standard">Aule libere</h2>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-primary filterable">

                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-home"></span><b>Aule Libere</b></h3>
                </div>

                <asp:Table CssClass="table table-striped" ID="aule_libere" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Aula</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Edificio</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Dalle</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Alle</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>

            </div>
        </div>
    </div>

</div>

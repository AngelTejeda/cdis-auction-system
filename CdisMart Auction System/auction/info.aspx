<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="CdisMart_Auction_System.Screens.Auctions.AuctionInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Styles --%>
    <link href="../../css/forms.css" rel="stylesheet" />
    <link href="../../css/info-display.css" rel="stylesheet" />
    <style>
        .form, .fieldContainer {
            width: 40%;
        }
    </style>


    <%-- Auction Information --%>
    <div class="fieldContainer card">
        <div class="field">
            <label class="inline">No. de Subasta:</label>
            <asp:Label ID="AuctionIdLabel" CssClass="inline" runat="server"></asp:Label>
        </div>

        <div class="field">
            <label class="inline">Nombre del Producto:</label>
            <asp:Label ID="ProductNameLabel" CssClass="inline" runat="server"></asp:Label>
        </div>

        <div class="field">
            <label class="inline">Descripción:</label>
            <asp:Label ID="DescriptionLabel" CssClass="inline" runat="server"></asp:Label>
        </div>

        <div class="field">
            <label class="inline">Fecha de Inicio:</label>
            <asp:Label ID="StartDateLabel" CssClass="inline" runat="server"></asp:Label>
        </div>

        <div class="field">
            <label class="inline">Fecha de Fin:</label>
            <asp:Label ID="EndDateLabel" CssClass="inline" runat="server"></asp:Label>
        </div>

        <div class="field">
            <label class="inline">Oferta Más Alta:</label>
            <asp:Label ID="HighestBidLabel" CssClass="inline" runat="server"></asp:Label>
        </div>

        <div class="field">
            <label class="inline">Postor Más Alto:</label>
            <asp:Label ID="HighestBidderLabel" CssClass="inline" runat="server"></asp:Label>
        </div>
    </div>


    <%-- Bid Ammount Form --%>
    <asp:Panel ID="Panel" DefaultButton="BidButton" runat="server">
        <div class="form card">
            <div class="inputContainer">
                <label class="inputLabel">Oferta</label>
                <asp:TextBox ID="BidAmountTextBox" CssClass="inputField" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredValidatorBidAmmount" CssClass="formValidation"
                    ControlToValidate="BidAmountTextBox" ValidationGroup="BidValidationGroup"
                    Display="Dynamic" ErrorMessage="Ingrese su oferta."
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:CustomValidator ID="CustomValidatorRangeBidAmount" CssClass="formValidation"
                    ControlToValidate="BidAmountTextBox"  ValidationGroup="BidValidationGroup"
                    Display="Dynamic" ErrorMessage="Ingrese un mayor que 0 y menor que 1,000,000."
                    ClientValidationFunction="validateRange" runat="server">
                </asp:CustomValidator>

                <asp:CustomValidator ID="CustomValidatorBidAmmount" CssClass="formValidation"
                    ControlToValidate="BidAmountTextBox"  ValidationGroup="BidValidationGroup"
                    Display="Dynamic" ErrorMessage="La oferta debe ser mayor que la oferta más alta."
                    OnServerValidate="CustomValidatorBidAmmount_ServerValidate" runat="server">
                </asp:CustomValidator>

                <asp:Label ID="StartupValidationMessage" CssClass="formValidation" style="display: none;" runat="server"></asp:Label>
            </div>

            <%-- Button --%>
            <div class="inputContainer">
                <asp:Button ID="BidButton" Text="Ofertar" CssClass="inputField" ValidationGroup="BidValidationGroup" OnClick="BidButton_Click" runat="server"/>
            </div>

        </div>
    </asp:Panel>
    

    <%-- Scripts --%>
    <script src="../../js/basic-styles.js"></script>
    <script type="text/javascript">
        function validateRange(source, args) {
            if (isNaN(Number(args.Value))) {
                args.IsValid = false;
                return;
            }

            if (args.Value == 0 || args.Value > 1000000)
                args.IsValid = false;
        }
    </script>

</asp:Content>
<%@ Page Title="Auction History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="CdisMart_Auction_System.Screens.Auctions.AuctionHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Styles --%>
    <link href="../../css/tables.css" rel="stylesheet" />
    <link href="../../css/forms.css" rel="stylesheet" />
    <link href="../../css/info-display.css" rel="stylesheet" />
    <style>
        .form, .fieldContainer {
            width: 40%;
        }
    </style>


    <%-- Auction Info --%>
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
            <label class="inline">Suma de Ofertas:</label>
            <asp:Label ID="BidsTotalLabel" CssClass="inline" runat="server"></asp:Label>
        </div>

    </div>


    <%-- Bidders List --%>
    <div class="form card">

        <div class="inputContainer">
            <label class="inputLabel">Filtrar por Ofertor</label>
            <asp:DropDownList ID="BiddersDropDownList" CssClass="inputField" onchange="filterBids()" runat="server"></asp:DropDownList>
        </div>

    </div>

    
    <%-- Bids --%>
    <div class="tableContainer card">
        <asp:GridView CssClass="table" ID="AuctionRecordsGrid" AutoGenerateColumns="false" runat="server">
            <Columns>

                <asp:BoundField HeaderText="Ofertor" DataField="BidderName"/>
                <asp:BoundField HeaderText="Monto de Oferta" DataField="BidAmount"/>
                <asp:BoundField HeaderText="Fecha de Oferta" DataField="BidDate"/>

            </Columns>
        </asp:GridView>
    </div>


    <%-- Scripts --%>
    <script src="../../js/basic-styles.js"></script>
    <script language="javascript">
        function filterBids() {
            let selected = $("#<%= BiddersDropDownList.ClientID %> option:selected");

            $("#<%= AuctionRecordsGrid.ClientID %> tr:has(td)").each(function () {
                let bidder = $(this).children()[0].innerHTML;

                if (selected.val() == 0 || bidder == selected.html())
                    $(this).show();
                else
                    $(this).hide();
            });

            sumBidAmmounts();
        }

        function sumBidAmmounts() {
            let total = 0;

            $("#<%= AuctionRecordsGrid.ClientID %> tr:has(td):visible").each(function () {
                let bidAmmount = parseFloat($(this).children()[1].innerHTML);

                total += bidAmmount;
            });

            $("#<%= BidsTotalLabel.ClientID %>").html(total);

            console.log(total);
        }

        sumBidAmmounts();
    </script>

</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="CdisMart_Auction_System.Screens.Auctions.AuctionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Styles --%>
    <link href="../../css/tables.css" rel="stylesheet" />
    <link href="../../css/forms.css" rel="stylesheet" />

    <style>
        .buttonContainer {
            width: 40px;
            text-align: center;
        }

        input[type=image] {
            width: 100%;
            margin: auto;
            display: block;
        }

        .product-link {
            color: var(--product-link);
            filter: brightness(110%);
        }

        .product-link:hover, product-link:active {
            color: var(--product-link);
            filter: brightness(80%);
        }

        .image-button {
            background-size: 35px;
            background-repeat: no-repeat;
        }

        .image-button:hover {
            opacity: 0.6;
        }

        .bid-button {
            background-image: var(--bid-url);
        }

        .history-button {
            background-image: var(--history-url);
        }
    </style>

     <%-- Description Filter --%>
    <div class="form card">
        <div class="inputContainer">
            <label class="inputLabel">Filtrar por Descripción:</label>
            <asp:TextBox ID="DescriptionTextBox" CssClass="inputField" onkeyup="filterAuctions()" onkeydown="return (event.keyCode!=13);" runat="server"></asp:TextBox>
        </div>

        <div class="inputContainer">
            <label class="inlineLabel">Mostrar sólo subastas activas:</label>
            <asp:CheckBox ID="ActiveAuctionsCheckBox" CssClass="inlineInput" onclick="filterAuctions()" runat="server" />
        </div>
    </div>


    <%-- Table --%>
    <div class="tableContainer card">
        <asp:GridView CssClass="table" ID="AuctionsGrid" AutoGenerateColumns="false" OnRowCommand="AuctionsGrid_RowCommand" runat="server">
            <Columns>

                <%-- History Button --%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="buttonContainer">
                            <asp:ImageButton ID="HistoryButton" CssClass="history-button image-button" 
                                ImageUrl="../../Images/blank.png" ToolTip="Historial"
                                CommandName="History" CommandArgument='<%# Eval("AuctionId") %>'
                                runat="server" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

                <%-- Bid Button --%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="buttonContainer">
                            <asp:ImageButton ID="BidButton" CssClass="bid-button image-button"
                                ImageUrl="../../Images/blank.png" ToolTip="Ofertar"
                                CommandName="Bid" CommandArgument='<%# Eval("AuctionId") %>'
                                runat="server"/>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="No." DataField="AuctionId"/>
                <asp:HyperLinkField HeaderText="Producto" DataNavigateUrlFields="AuctionId"
                    DataNavigateUrlFormatString="~/auction/info.aspx?id={0}"
                    DataTextField="ProductName" runat="server">
                <ControlStyle CssClass="product-link" />
                </asp:HyperLinkField>
                <asp:BoundField HeaderText="Descripción" DataField="ProductDescription"/>
                <asp:BoundField HeaderText="Inicio" DataField="StartDate"/>
                <asp:BoundField HeaderText="Fin" DataField="EndDate"/>

            </Columns>
        </asp:GridView>
    </div>


    <%-- Scripts --%>
    <script src="../../js/basic-styles.js"></script>
    <script language="javascript">
        function filterAuctions() {
            let search = $("#<%= DescriptionTextBox.ClientID %>").val().toLowerCase();
            let filterActive = $("#<%= ActiveAuctionsCheckBox.ClientID %>").is(":checked");
            let now = new Date().setSeconds(0, 0);

            $("#<%= AuctionsGrid.ClientID %> tr:has(td)").each(function () {
                let description = $(this).children()[4].innerHTML.toLowerCase();
                let startDate = Date.parse($(this).children()[5].innerHTML);
                let endDate = Date.parse($(this).children()[6].innerHTML);

                // Filter description
                if (description == "" || description.indexOf(search) >= 0)
                    $(this).show();
                else
                    $(this).hide();

                // Filter Active
                if (filterActive && (endDate < now || now < startDate))
                    $(this).hide();
            });
        }
    </script>
    
</asp:Content>
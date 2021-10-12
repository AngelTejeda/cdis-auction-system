<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CdisMart_Auction_System.Screens.Auctions.AuctionRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Styles --%>
    <link href="../../css/forms.css" rel="stylesheet" />
    <style>
        .form {
            width: 60%;
        }
    </style>
    

    <%-- Form --%>
    <asp:Panel ID="Panel" DefaultButton="AuctionButton" runat="server">
        <div class="form card">

            <%-- Product Name --%>
            <div class="inputContainer">
                <label class="inputLabel">Nombre del Producto</label>
                <asp:TextBox ID="ProductNameTextBox" CssClass="inputField" MaxLength="50" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredValidatorProductName" CssClass="formValidation"
                    ControlToValidate="ProductNameTextBox" ValidationGroup="AuctionValidationGroup"
                    ErrorMessage="El nombre del producto es requerido." Display="Dynamic"
                    runat="server">
                </asp:RequiredFieldValidator>
            </div>

            <%-- Description --%>
            <div class="inputContainer">
                <label class="inputLabel">Descripción</label>
                <asp:TextBox ID="DescriptionTextArea" CssClass="inputField" MaxLength="100" TextMode="MultiLine" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredValidatorEmail" CssClass="formValidation"
                    ControlToValidate="DescriptionTextArea" ValidationGroup="AuctionValidationGroup"
                    ErrorMessage="La descripción es requerida." Display="Dynamic"
                    runat="server">
                </asp:RequiredFieldValidator>
            </div>

            <%-- Start Date --%>
            <div class="inputContainer">
                <label class="inputLabel">Fecha de Inicio</label>
                <div class="inlineInputContainer">
                    <asp:TextBox ID="StartDateTextBox" CssClass="inputField" TextMode="Date" runat="server"></asp:TextBox>
                    <asp:TextBox ID="StartHourTextBox" CssClass="inputField" TextMode="Time" runat="server"></asp:TextBox>
                </div>

                <asp:RequiredFieldValidator ID="RequiredValidatorStartDate" CssClass="formValidation"
                    ControlToValidate="StartDateTextBox" ValidationGroup="AuctionValidationGroup"
                    ErrorMessage="La fecha de inicio es requerida." Display="Dynamic"
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:RequiredFieldValidator ID="RequiredValidatorStartHour" CssClass="formValidation"
                    ControlToValidate="StartHourTextBox" ValidationGroup="AuctionValidationGroup"
                    ErrorMessage="La hora de inicio es requerida." Display="Dynamic"
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:CustomValidator ID="CustomValidatorStartDate" CssClass="formValidation"
                    ControlToValidate="StartHourTextBox" ValidationGroup="AuctionValidationGroup" ValidateEmptyText="false"
                    ErrorMessage="La fecha de inicio debe ser posterior a la fecha actual." Display="Dynamic"
                    ClientValidationFunction="validateStartDate" runat="server">
                </asp:CustomValidator>

            </div>

            <%-- End Date --%>
            <div class="inputContainer">
                <label class="inputLabel">Fecha de Inicio</label>
                <div class="inlineInputContainer">
                    <asp:TextBox ID="EndDateTextBox" CssClass="inputField" TextMode="Date" runat="server"></asp:TextBox>
                    <asp:TextBox ID="EndHourTextBox" CssClass="inputField" TextMode="Time" runat="server"></asp:TextBox>
                </div>

                <asp:RequiredFieldValidator ID="RequiredValidatorEndDate" CssClass="formValidation"
                    ControlToValidate="EndDateTextBox" ValidationGroup="AuctionValidationGroup"
                    ErrorMessage="La fecha de inicio es requerida." Display="Dynamic"
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:RequiredFieldValidator ID="RequiredValidatorEndHour" CssClass="formValidation"
                    ControlToValidate="EndHourTextBox" ValidationGroup="AuctionValidationGroup"
                    ErrorMessage="La hora de inicio es requerida." Display="Dynamic"
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:CustomValidator ID="CustomValidatorEndDate" CssClass="formValidation"
                    ControlToValidate="EndHourTextBox" ValidationGroup="AuctionValidationGroup" ValidateEmptyText="false"
                    ErrorMessage="La fecha de fin debe ser posterior a la fecha de inicio." Display="Dynamic"
                    ClientValidationFunction="validateEndDate" runat="server">
                </asp:CustomValidator>

            </div>

            <%-- Button --%>
            <div class="inputContainer">
                <asp:Button ID="AuctionButton" Text="Subastar" CssClass="inputField" ValidationGroup="AuctionValidationGroup" OnClick="AuctionButton_Click" runat="server"/>
            </div>

        </div>
    </asp:Panel>


     <%-- Scripts --%>
    <script src="../../js/basic-styles.js"></script>

    <script type="text/javascript">
        function validateStartDate(source, args) {
            let startDate = getFullDate("<%= StartDateTextBox.ClientID %>", "<%= StartHourTextBox.ClientID %>");
            let now = new Date().setSeconds(0, 0);

            if (startDate == null)
                return;

            if (startDate < now)
                args.IsValid = false;
        }

        function validateEndDate(source, args) {
            let startDate = getFullDate("<%= StartDateTextBox.ClientID %>", "<%= StartHourTextBox.ClientID %>");
            let endDate = getFullDate("<%= EndDateTextBox.ClientID %>", "<%= EndHourTextBox.ClientID %>");

            if (startDate == null || endDate == null)
                return;

            if (startDate >= endDate)
                args.IsValid = false;
        }

        function getFullDate(dateTextBoxId, hourTextBoxId) {
            let date = $("#" + dateTextBoxId).val();
            let hour = $("#" + hourTextBoxId).val();

            if (date == "" || hour == "")
                return null;

            return new Date(date + " " + hour).getTime();
        }
    </script>
    
</asp:Content>
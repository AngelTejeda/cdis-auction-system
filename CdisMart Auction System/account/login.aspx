<%@ Page Title="Login" Language="C#" MasterPageFile="~/NoLogin.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CdisMart_Auction_System.Screens.Login" %>
<asp:Content ID="Content1" ContentPlaceholderID="MainContent" runat="server">
    
    <%-- Styles --%>
    <link href="../../css/forms.css" rel="stylesheet" />
    <style>
        .image {
            width: 150px;
            margin: auto;
        }

        .form {
            width: 40%;
        }
    </style>


    <%-- Form --%>
    <asp:Panel ID="Panel" DefaultButton="LoginButton" runat="server">
        <div class="form card">
            <%-- Image --%>
            <div class="imgContainer">
                <asp:Image ID="LoginImage" CssClass="image" ImageUrl="~/Images/login.png" runat="server" />

                <div id="imgLogin"></div>
            </div>

            <%-- Username --%>
            <div class="inputContainer">
                <label class="inputLabel">Usuario</label>
                <asp:TextBox ID="UsernameTextBox" CssClass="inputField" MaxLength="10" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredValidatorUsername" CssClass="formValidation" runat="server"
                    ControlToValidate="UsernameTextBox" ValidationGroup="LoginValidationGroup"
                    Display="Dynamic" ErrorMessage="El usuario es requerido."></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator CssClass="formValidation" ID="UsernameRegexValidator" runat="server"
                    ControlToValidate="UsernameTextBox" ValidationGroup="LoginValidationGroup" ValidationExpression="[a-zA-Z0-9_-]{1,}" 
                    Display="Dynamic" ErrorMessage="Únicamente letras, números y los caracteres '-' y '_' están permitidos."></asp:RegularExpressionValidator>
            </div>

            <%-- Password --%>
            <div class="inputContainer">
                <label class="inputLabel">Contraseña</label>
                <asp:TextBox ID="PasswordTextBox" CssClass="inputField" TextMode="Password" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="passwordReq" CssClass="formValidation" runat="server"
                    ControlToValidate="PasswordTextBox" ValidationGroup="LoginValidationGroup"
                    Display="Dynamic" ErrorMessage="La contraseña es requerida."></asp:RequiredFieldValidator>
            </div>

            <div class="inputContainer">
                <label class="inlineLabel">Recordar Sesión</label>
                <asp:CheckBox ID="RememberMeCheckBox" CssClass="inlineInput" runat="server" />
            </div>

            <%-- Button --%>
            <div class="inputContainer">
                <asp:Button ID="LoginButton" Text="Ingresar" class="inputField" ValidationGroup="LoginValidationGroup" runat="server" OnClick="LoginButton_Click"/>
            </div>


            <div class="inputContainer">
                ¿No tienes cuenta? Regístrate <a href="SignUp.aspx">Aquí</a>
            </div>

        </div>
    </asp:Panel>

</asp:Content>
<%@ Page Title="SignUp" Language="C#" MasterPageFile="~/NoLogin.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="CdisMart_Auction_System.Screens.SignUp" %>
<asp:Content ID="Content1" ContentPlaceholderID="MainContent" runat="server">

    <%-- Styles --%>
    <link href="../../css/forms.css" rel="stylesheet" />
    <style>
        .form {
            width: 40%;
        }
    </style>


    <%-- Form --%>
    <asp:Panel ID="Panel" DefaultButton="SignUpButton" runat="server">
        <div class="form card">
            <%-- Full Name --%>
            <div class="inputContainer">
                <label class="inputLabel">Nombre Completo</label>
                <asp:TextBox ID="FullNameTextBox" CssClass="inputField" MaxLength="50" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="FullNameRequiredValidator" CssClass="formValidation"
                    ControlToValidate="FullNameTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="El nombre es requerido."
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="FullNameRegexValidator" CssClass="formValidation"
                    ValidationExpression="^[^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$"
                    ControlToValidate="FullNameTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="Únicamente se permiten letras."
                    runat="server">
                </asp:RegularExpressionValidator>
            </div>

            <%-- Email --%>
            <div class="inputContainer">
                <label class="inputLabel">Email</label>
                <asp:TextBox ID="EmailTextBox" CssClass="inputField" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="EmailRequiredValidator" CssClass="formValidation"
                    ControlToValidate="EmailTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="El email es requerido."
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="EmailRegexValidator" CssClass="formValidation"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ControlToValidate="EmailTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="El email ingresado no es válido."
                    runat="server">
                </asp:RegularExpressionValidator>
            </div>

            <%-- Username --%>
            <div class="inputContainer">
                <label class="inputLabel">Usuario</label>
                <asp:TextBox ID="UsernameTextBox" CssClass="inputField" MaxLength="10" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="UsernameRequiredValidator" CssClass="formValidation"
                    ControlToValidate="UsernameTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="El usuario es requerido."
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="UsernameRegexValidator" CssClass="formValidation"
                    ValidationExpression="[a-zA-Z0-9]+" 
                    ControlToValidate="UsernameTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="Únicamente letras y números están permitidos."
                    runat="server">
                </asp:RegularExpressionValidator>
            </div>

            <%-- Password --%>
            <div class="inputContainer">
                <label class="inputLabel">Contraseña</label>
                <asp:TextBox ID="PasswordTextBox" CssClass="inputField" TextMode="Password" MaxLength="10" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="PasswordRequiredValidator" CssClass="formValidation"
                    ControlToValidate="PasswordTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="La contraseña es requerida."
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="formValidation"
                    ValidationExpression="[a-zA-Z0-9]+" 
                    ControlToValidate="PasswordTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="Únicamente letras y números están permitidos."
                    runat="server">
                </asp:RegularExpressionValidator>
            </div>

                <%-- Password Confirmation --%>
            <div class="inputContainer">
                <label class="inputLabel">Confirmación de Contraseña</label>
                <asp:TextBox ID="PasswordConfirmationTextBox" CssClass="inputField" TextMode="Password" MaxLength="10" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator CssClass="formValidation" ID="PasswordConfirmationRequiredValidator"
                    ControlToValidate="PasswordConfirmationTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="El campo es requerido."
                    runat="server">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="PasswordConfirmationRegexValidator" CssClass="formValidation"
                    ValidationExpression="[a-zA-Z0-9]+" 
                    ControlToValidate="PasswordConfirmationTextBox" ValidationGroup="RegisterValidationGroup"
                    Display="Dynamic" ErrorMessage="Únicamente letras y números están permitidos."
                    runat="server">
                </asp:RegularExpressionValidator>
                
                <asp:CompareValidator ID="PasswordConfirmationCompareValidator" CssClass="formValidation"
                    ControlToValidate="PasswordConfirmationTextBox" ValidationGroup="RegisterValidationGroup"
                    ControlToCompare="PasswordTextBox" Operator="Equal"
                    Display="Dynamic" ErrorMessage="La contraseña no coincide."
                    runat="server">
                </asp:CompareValidator>
            </div>

            <%-- Button --%>
            <div class="inputContainer">
                <asp:Button ID="SignUpButton" Text="Registrar" CssClass="inputField" ValidationGroup="RegisterValidationGroup" OnClick="SignUpButton_Click" runat="server"/>
            </div>

            <div class="inputContainer">
                ¿Ya tienes cuenta? Inicia sesión <a href="Login.aspx">Aquí</a>
            </div>
        </div>
    </asp:Panel>


    <%-- Scripts --%>
    <script src="../../js/basic-styles.js"></script>

</asp:Content>
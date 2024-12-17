<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff_details.aspx.cs" Inherits="BookInn.Admin_Master.Staff_details" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Staff Details</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <%--<link rel="stylesheet" href="css/style.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        /* @extend display-flex; */
        display-flex, .signup-content, .form-row, .form-radio, .select-icon, .select-icon i {
            display: flex;
            display: -webkit-flex;
        }

        /* @extend list-type-ulli; */
        list-type-ulli {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        /* Montserrat-300 - latin */
        @font-face {
            font-family: 'Montserrat';
            font-style: normal;
            font-weight: 300;
            src: url("../fonts/montserrat/Montserrat-Light.ttf");
            /* IE9 Compat Modes */
        }

        @font-face {
            font-family: 'Montserrat';
            font-style: normal;
            font-weight: 400;
            src: url("../fonts/montserrat/Montserrat-Regular.ttf");
            /* IE9 Compat Modes */
        }

        @font-face {
            font-family: 'Montserrat';
            font-style: italic;
            font-weight: 400;
            src: url("../fonts/montserrat/Montserrat-Italic.ttf");
            /* IE9 Compat Modes */
        }

        @font-face {
            font-family: 'Montserrat';
            font-style: normal;
            font-weight: 500;
            src: url("../fonts/montserrat/Montserrat-Medium.ttf");
            /* IE9 Compat Modes */
        }

        @font-face {
            font-family: 'Montserrat';
            font-style: normal;
            font-weight: 600;
            src: url("../fonts/montserrat/Montserrat-SemiBold.ttf");
            /* IE9 Compat Modes */
        }

        @font-face {
            font-family: 'Montserrat';
            font-style: normal;
            font-weight: 700;
            src: url("../fonts/montserrat/Montserrat-Bold.ttf");
            /* IE9 Compat Modes */
        }

        @font-face {
            font-family: 'Montserrat';
            font-style: italic;
            font-weight: 700;
            src: url("../fonts/montserrat/Montserrat-BoldItalic.ttf");
            /* IE9 Compat Modes */
        }

        @font-face {
            font-family: 'Montserrat';
            font-style: italic;
            font-weight: 900;
            src: url("../fonts/montserrat/montserrat-v12-latin-900.ttf"), url("../fonts/montserrat/montserrat-v12-latin-900.eot") format("embedded-opentype"), url("../fonts/montserrat/montserrat-v12-latin-900.svg") format("woff2"), url("../fonts/montserrat/montserrat-v12-latin-900.woff") format("woff"), url("../fonts/montserrat/montserrat-v12-latin-900.woff2") format("truetype");
        }
        /* poppins-300 - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 300;
            src: url("../fonts/poppins/poppins-v5-latin-300.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Light"), local("Poppins-Light"), url("../fonts/poppins/poppins-v5-latin-300.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-300.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-300.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-300.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-300.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-300italic - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: italic;
            font-weight: 300;
            src: url("../fonts/poppins/poppins-v5-latin-300italic.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Light Italic"), local("Poppins-LightItalic"), url("../fonts/poppins/poppins-v5-latin-300italic.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-300italic.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-300italic.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-300italic.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-300italic.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-regular - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 400;
            src: url("../fonts/poppins/poppins-v5-latin-regular.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Regular"), local("Poppins-Regular"), url("../fonts/poppins/poppins-v5-latin-regular.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-regular.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-regular.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-regular.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-regular.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-italic - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: italic;
            font-weight: 400;
            src: url("../fonts/poppins/poppins-v5-latin-italic.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Italic"), local("Poppins-Italic"), url("../fonts/poppins/poppins-v5-latin-italic.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-italic.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-italic.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-italic.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-italic.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-500 - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 500;
            src: url("../fonts/poppins/poppins-v5-latin-500.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Medium"), local("Poppins-Medium"), url("../fonts/poppins/poppins-v5-latin-500.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-500.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-500.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-500.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-500.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-500italic - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: italic;
            font-weight: 500;
            src: url("../fonts/poppins/poppins-v5-latin-500italic.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Medium Italic"), local("Poppins-MediumItalic"), url("../fonts/poppins/poppins-v5-latin-500italic.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-500italic.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-500italic.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-500italic.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-500italic.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-600 - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 600;
            src: url("../fonts/poppins/poppins-v5-latin-600.eot");
            /* IE9 Compat Modes */
            src: local("Poppins SemiBold"), local("Poppins-SemiBold"), url("../fonts/poppins/poppins-v5-latin-600.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-600.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-600.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-600.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-600.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-700 - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 700;
            src: url("../fonts/poppins/poppins-v5-latin-700.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Bold"), local("Poppins-Bold"), url("../fonts/poppins/poppins-v5-latin-700.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-700.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-700.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-700.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-700.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-700italic - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: italic;
            font-weight: 700;
            src: url("../fonts/poppins/poppins-v5-latin-700italic.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Bold Italic"), local("Poppins-BoldItalic"), url("../fonts/poppins/poppins-v5-latin-700italic.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-700italic.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-700italic.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-700italic.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-700italic.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-800 - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 800;
            src: url("../fonts/poppins/poppins-v5-latin-800.eot");
            /* IE9 Compat Modes */
            src: local("Poppins ExtraBold"), local("Poppins-ExtraBold"), url("../fonts/poppins/poppins-v5-latin-800.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-800.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-800.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-800.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-800.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-800italic - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: italic;
            font-weight: 800;
            src: url("../fonts/poppins/poppins-v5-latin-800italic.eot");
            /* IE9 Compat Modes */
            src: local("Poppins ExtraBold Italic"), local("Poppins-ExtraBoldItalic"), url("../fonts/poppins/poppins-v5-latin-800italic.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-800italic.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-800italic.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-800italic.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-800italic.svg#Poppins") format("svg");
            /* Legacy iOS */
        }
        /* poppins-900 - latin */
        @font-face {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 900;
            src: url("../fonts/poppins/poppins-v5-latin-900.eot");
            /* IE9 Compat Modes */
            src: local("Poppins Black"), local("Poppins-Black"), url("../fonts/poppins/poppins-v5-latin-900.eot?#iefix") format("embedded-opentype"), url("../fonts/poppins/poppins-v5-latin-900.woff2") format("woff2"), url("../fonts/poppins/poppins-v5-latin-900.woff") format("woff"), url("../fonts/poppins/poppins-v5-latin-900.ttf") format("truetype"), url("../fonts/poppins/poppins-v5-latin-900.svg#Poppins") format("svg");
            /* Legacy iOS */
        }

        a:focus, a:active {
            text-decoration: none;
            outline: none;
            transition: all 300ms ease 0s;
            -moz-transition: all 300ms ease 0s;
            -webkit-transition: all 300ms ease 0s;
            -o-transition: all 300ms ease 0s;
            -ms-transition: all 300ms ease 0s;
        }

        input, select, textarea {
            outline: none;
            appearance: unset !important;
            -moz-appearance: unset !important;
            -webkit-appearance: unset !important;
            -o-appearance: unset !important;
            -ms-appearance: unset !important;
        }

            input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
                appearance: none !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none !important;
                -ms-appearance: none !important;
                margin: 0;
            }

            input:focus, select:focus, textarea:focus {
                outline: none;
                box-shadow: none !important;
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                -o-box-shadow: none !important;
                -ms-box-shadow: none !important;
            }
 

            input[type=checkbox] {
                appearance: checkbox !important;
                -moz-appearance: checkbox !important;
                -webkit-appearance: checkbox !important;
                -o-appearance: checkbox !important;
                -ms-appearance: checkbox !important;
            }

            input[type=radio] {
                appearance: radio !important;
                -moz-appearance: radio !important;
                -webkit-appearance: radio !important;
                -o-appearance: radio !important;
                -ms-appearance: radio !important;
            }

        img {
            max-width: 100%;
            height: auto;
        }

        figure {
            margin: 0;
        }

        input[type=number] {
            -moz-appearance: textfield !important;
            appearance: none !important;
            -webkit-appearance: none !important;
        }

        input:-webkit-autofill {
            box-shadow: 0 0 0 30px transparent inset;
            -moz-box-shadow: 0 0 0 30px transparent inset;
            -webkit-box-shadow: 0 0 0 30px transparent inset;
            -o-box-shadow: 0 0 0 30px transparent inset;
            -ms-box-shadow: 0 0 0 30px transparent inset;
        }

        h2 {
            line-height: 1.66;
            margin: 0;
            padding: 0;
            font-weight: 700;
            color: #dfa974;
            font-family: "Roboto", sans-serif;
            font-size: 20px;
            text-transform: uppercase;
            margin-bottom: 32px;
        }

        .clear {
            clear: both;
        }

        body {
            font-size: 13px;
            line-height: 1.8;
            color: #222;
            font-weight: 400;
            background: #f8f8f8;
            padding: 90px 0;
        }

        .container {
            width: 1400px;
            position: relative;
            margin: 0 auto;
            background: #fff;
        }

        .signup-img, .signup-form {
            width: 50%;
        }

        .signup-img {
            margin-bottom: -7px;
        }

        .register-form {
            padding: 50px 100px 50px 70px;
        }

        .form-row {
            margin: 0 -15px;
        }

            .form-row .form-group {
                width: 50%;
                padding: 0 15px;
            }

        .form-group {
            margin-bottom: 23px;
            position: relative;
        }

        input, select {
            display: block;
            width: 100%;
            border: 1px solid #ebebeb;
            padding: 11px 20px;
            box-sizing: border-box;
            font-family: "Roboto", sans-serif;
            font-weight: 500;
            font-size: 13px;
        }

            input:focus, select:focus {
                border: 1px solid #E0E0E0;
            }

        label {
            font-size: 14px;
            font-weight: bold;
            font-family: 'Cabin', sans-serif;
            margin-bottom: 2px;
            display: block;
        }

        .form-radio {
            margin-bottom: 18px;
        }

            .form-radio input {
                width: auto;
                display: inline-block;
            }

        .radio-label {
            padding-right: 72px;

        }

        .form-radio-item {
            position: relative;
            margin-right: 45px;
        }

            .form-radio-item label {
                font-weight: 500;
                font-size: 13px;
                padding-left: 25px;
                position: relative;
                z-index: 9;
                display: block;
                cursor: pointer;
            }

        .check {
            display: inline-block;
            position: absolute;
            border: 1px solid #ebebeb;
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            -o-border-radius: 50%;
            -ms-border-radius: 50%;
            height: 13px;
            width: 13px;
            top: 4px;
            left: 0px;
            z-index: 5;
            transition: border .25s linear;
            -webkit-transition: border .25s linear;
        }

            .check:before {
                position: absolute;
                display: block;
                content: '';
                width: 9px;
                height: 9px;
                border-radius: 50%;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                -o-border-radius: 50%;
                -ms-border-radius: 50%;
                top: 2px;
                left: 2px;
                margin: auto;
                transition: background 0.25s linear;
                -webkit-transition: background 0.25s linear;
            }

        input[type=radio] {
            position: absolute;
            visibility: hidden;
        }

            input[type=radio]:checked ~ .check {
                border: 1px solid #ff6801;
            }

                input[type=radio]:checked ~ .check::before {
                    background: #ff6801;
                }

        .form-select {
            position: relative;
        }

        select {
            appearance: none !important;
            -moz-appearance: none !important;
            -webkit-appearance: none !important;
            -o-appearance: none !important;
            -ms-appearance: none !important;
            position: relative;
            background: 0 0;
            z-index: 10;
            cursor: pointer;
        }

        .select-icon {
            z-index: 0;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            justify-content: center;
            -moz-justify-content: center;
            -webkit-justify-content: center;
            -o-justify-content: center;
            -ms-justify-content: center;
            align-items: center;
            -moz-align-items: center;
            -webkit-align-items: center;
            -o-align-items: center;
            -ms-align-items: center;
        }

            .select-icon i {
                justify-content: center;
                -moz-justify-content: center;
                -webkit-justify-content: center;
                -o-justify-content: center;
                -ms-justify-content: center;
                align-items: center;
                -moz-align-items: center;
                -webkit-align-items: center;
                -o-align-items: center;
                -ms-align-items: center;
                width: 40px;
                height: 20px;
                font-size: 18px;
                color: #999;
            }

        .form-submit {
            text-align: right;
            padding-top: 27px;
        }

        .submit {
            width: 140px;
            height: 40px;
            display: inline-block;
            font-family: 'Poppins';
            font-weight: 400;
            font-size: 13px;
            padding: 10px;
            border: none;
            cursor: pointer;
        }

        #reset {
            background: #f8f8f8;
            color: #999;
            margin-right: 8px;
            font-family: "Roboto", sans-serif;
            border-radius: 5px
        }

            #reset:hover {
                background: #f9a24d;
                color: #fff;
            }

        #submit {
            background: #f9a24d;
            color: #fff;
            font-family: "Roboto", sans-serif;
            border-radius: 5px
        }

            #submit:hover {
                background-color: #f9a24d;
            }

        @media screen and (max-width: 992px) {
            .container {
                width: calc(100% - 40px);
                max-width: 100%;
            }

            .signup-content {
                flex-direction: column;
                -moz-flex-direction: column;
                -webkit-flex-direction: column;
                -o-flex-direction: column;
                -ms-flex-direction: column;
            }

            .signup-img, .signup-form {
                width: 100%;
            }
        }

        @media screen and (max-width: 768px) {
            .register-form {
                padding: 50px 40px 50px 40px;
            }
        }

        @media screen and (max-width: 575px) {
            .form-row {
                flex-direction: column;
                -moz-flex-direction: column;
                -webkit-flex-direction: column;
                -o-flex-direction: column;
                -ms-flex-direction: column;
                margin: 0px;
            }

                .form-row .form-group {
                    width: 100%;
                    padding: 0px;
                }

            .radio-label {
                padding-right: 22px;
            }

            .form-radio-item {
                margin-right: 25px;
            }
        }

        @media screen and (max-width: 480px) {
            .form-radio {
                flex-direction: column;
                -moz-flex-direction: column;
                -webkit-flex-direction: column;
                -o-flex-direction: column;
                -ms-flex-direction: column;
            }

            .submit {
                width: 100%;
            }

            #reset {
                margin-right: 0px;
                margin-bottom: 10px;
            }
        }
        span{
            font-family:"Roboto", sans-serif;
        }
        /*# sourceMappingURL=style.css.map */

        
        .img2{
            width:30%
        }
        /* .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }*/
        .error-text {
            color: red;
        }


    </style>
</head>
<body>

    <nav class="navbar bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand" href="Staff_page.aspx">
                <img src="../Images/logo-transparent-png2.png" alt="Bootstrap" class="img2" />
            </a>
        </div>
    </nav>
    
    


    <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                   <img src="../Images/receptionists-work-elegant-suits.jpg" alt="image"/>
                    <img src="../Images/staff2.jpg"  alt="image"/>
                </div>
                <div class="signup-form" >
                    <form method="post" id="register_form" class="register-form" runat="server">
                        
                        <h2>Staff Details</h2>
                        <div class="form-row">
                            <div class="form-group">
                                <asp:Label ID="lbl_staff_fname" runat="server" AssociatedControlID="staff_fname">First Name</asp:Label>
                                <asp:TextBox ID="staff_fname" runat="server" CssClass="form-control" required></asp:TextBox>
                                <span id="fnameError" class="error" runat="server"></span>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_staff_lname" runat="server" AssociatedControlID="staff_lname">Last Name</asp:Label>
                                <asp:TextBox ID="staff_lname" runat="server" CssClass="form-control" required></asp:TextBox>
                                <span id="lnameError" class="error" runat="server"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbl_position" runat="server" AssociatedControlID="position">Position</asp:Label>
                            <asp:TextBox ID="position" runat="server" CssClass="form-control" required></asp:TextBox>
                            <span id="positionError" class="error" runat="server"></span>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbl_staff_email" runat="server" AssociatedControlID="staff_email">Email</asp:Label>
                            <asp:TextBox ID="staff_email" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
                            <span id="emailError" class="error" runat="server"></span>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbl_staff_location" runat="server" AssociatedControlID="staff_location">Location</asp:Label>
                            <asp:TextBox ID="staff_location" runat="server" CssClass="form-control" required></asp:TextBox>
                            <span id="locationError" class="error" runat="server"></span>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbl_staff_phone" runat="server" AssociatedControlID="staff_phone">Phone</asp:Label>
                            <asp:TextBox ID="staff_phone" runat="server" CssClass="form-control" required></asp:TextBox>
                            <span id="phoneError" class="error" runat="server"></span>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbl_gender" runat="server" AssociatedControlID="gender">Gender</asp:Label>
                            <asp:DropDownList ID="gender" runat="server" CssClass="form-control" required>
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                            <span id="genderError" class="error" runat="server"></span>
                        </div>
                        
                        
                        <div class="form-submit">
                            <asp:Button ID="reset" runat="server" Text="Reset All" CssClass="submit" OnClientClick="resetForm();" />
                            <asp:Button ID="submit" runat="server" Text="Submit Form" CssClass="submit" OnClick="submit_Click" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <!-- JS -->
    <%--<script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>--%>
    <script>

        function resetForm() {
            // Reset form fields
            document.getElementById('<%= staff_fname.ClientID %>').value = '';
            document.getElementById('<%= staff_lname.ClientID %>').value = '';
            document.getElementById('<%= position.ClientID %>').value = '';
            document.getElementById('<%= staff_email.ClientID %>').value = '';
            document.getElementById('<%= staff_location.ClientID %>').value = '';
            document.getElementById('<%= staff_phone.ClientID %>').value = '';
            document.getElementById('<%= gender.ClientID %>').selectedIndex = 0;

            // Clear error messages
            document.getElementById('<%= fnameError.ClientID %>').textContent = '';
            document.getElementById('<%= lnameError.ClientID %>').textContent = '';
            document.getElementById('<%= positionError.ClientID %>').textContent = '';
            document.getElementById('<%= emailError.ClientID %>').textContent = '';
            document.getElementById('<%= locationError.ClientID %>').textContent = '';
            document.getElementById('<%= phoneError.ClientID %>').textContent = '';
            document.getElementById('<%= genderError.ClientID %>').textContent = '';

            // Clear error styling
            var errorElements = document.querySelectorAll('.error');
            errorElements.forEach(function (element) {
                element.classList.remove('error');
            });

            // Prevent postback
            return false;
        }


        document.getElementById('register_form').addEventListener('submit', function (event) {
            var isValid = true;
            var nameRegex = /^[a-zA-Z\s]+$/;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var phoneRegex = /^\d{10}$/;

            // Validate first name
            var fnameInput = document.getElementById('<%= staff_fname.ClientID %>');
           var fnameError = document.getElementById('<%= fnameError.ClientID %>');
           if (!nameRegex.test(fnameInput.value.trim())) {
               isValid = false;
               fnameInput.classList.add('error');
               fnameError.textContent = "Please enter a valid first name.";
               fnameError.classList.add('error-text');
           } else {
               fnameInput.classList.remove('error');
               fnameError.textContent = "";
               fnameError.classList.remove('error-text');
           }

           // Validate last name
           var lnameInput = document.getElementById('<%= staff_lname.ClientID %>');
           var lnameError = document.getElementById('<%= lnameError.ClientID %>');
           if (!nameRegex.test(lnameInput.value.trim())) {
               isValid = false;
               lnameInput.classList.add('error');
               lnameError.textContent = "Please enter a valid last name.";
               lnameError.classList.add('error-text');
           } else {
               lnameInput.classList.remove('error');
               lnameError.textContent = "";
               lnameError.classList.remove('error-text');
           }

           // Validate position
           var positionInput = document.getElementById('<%= position.ClientID %>');
           var positionError = document.getElementById('<%= positionError.ClientID %>');
           if (!positionInput.value.trim()) {
               isValid = false;
               positionInput.classList.add('error');
               positionError.textContent = "Position is required.";
               positionError.classList.add('error-text');
           } else {
               positionInput.classList.remove('error');
               positionError.textContent = "";
               positionError.classList.remove('error-text');
           }

            // Validate email
            var emailInput = document.getElementById('<%= staff_email.ClientID %>');
            var emailError = document.getElementById('<%= emailError.ClientID %>');
            if (!emailRegex.test(emailInput.value.trim())) {
                isValid = false;
                emailInput.classList.add('error');
                emailError.textContent = "Please enter a valid email address.";
                emailError.classList.add('error-text');
            } else {
                emailInput.classList.remove('error');
                emailError.textContent = "";
                emailError.classList.remove('error-text');
            }

            // Validate location
            var locationInput = document.getElementById('<%= staff_location.ClientID %>');
            var locationError = document.getElementById('<%= locationError.ClientID %>');
            if (!locationInput.value.trim()) {
                isValid = false;
                locationInput.classList.add('error');
                locationError.textContent = "Location is required.";
                locationError.classList.add('error-text');
            } else {
                locationInput.classList.remove('error');
                locationError.textContent = "";
                locationError.classList.remove('error-text');
            }

            // Validate phone
            var phoneInput = document.getElementById('<%= staff_phone.ClientID %>');
            var phoneError = document.getElementById('<%= phoneError.ClientID %>');
            if (!phoneRegex.test(phoneInput.value.trim())) {
                isValid = false;
                phoneInput.classList.add('error');
                phoneError.textContent = "Please enter a valid 10-digit phone number.";
                phoneError.classList.add('error-text');
            } else {
                phoneInput.classList.remove('error');
                phoneError.textContent = "";
                phoneError.classList.remove('error-text');
            }

            // Validate gender
            var genderInput = document.getElementById('<%= gender.ClientID %>');
            var genderError = document.getElementById('<%= genderError.ClientID %>');
            if (!genderInput.value) {
                isValid = false;
                genderInput.classList.add('error');
                genderError.textContent = "Please select a gender.";
                genderError.classList.add('error-text');
            } else {
                genderInput.classList.remove('error');
                genderError.textContent = "";
                genderError.classList.remove('error-text');
            }

            if (!isValid) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });

    </script>

</body>
</html>

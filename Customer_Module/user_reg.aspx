<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_reg.aspx.cs" Inherits="BookInn.user_reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
   
    	<style>

    		* {
    			-webkit-box-sizing: border-box;
    			-moz-box-sizing: border-box;
    			box-sizing: border-box;
    		}

    		body {
    			font-family: "Cabin", sans-serif;
    			color: #666;
    			font-size: 13px;
    			margin: 0;
    		}

    		input, textarea, select, button {
    			font-family: "Cabin", sans-serif;
    			color: #333;
    			font-size: 13px;
    		}

    		p, h1, h2, h3, h4, h5, h6, ul {
    			margin: 0;
    		}

    		img {
    			max-width: 100%;
    		}

    		ul {
    			padding-left: 0;
    			margin-bottom: 0;
    		}

    		a:hover {
    			text-decoration: none;
    		}

    		:focus {
    			outline: none;
    		}

    		.wrapper {
    			min-height: 100vh;
    			background-size: cover;
    			background-repeat: no-repeat;
    			display: flex;
    			align-items: center;
    		}

    		.inner {
    			max-width: 850px;
    			margin: auto;
    			background: #fff;
    			padding: 15px;
                border-radius: 10px;
    		}

    		form {
    			border: 1px solid #d3cccc;
    			padding: 62px 30px 87px;
                border-radius: 5px;
    		}
 

    		h3 {
    			text-transform: uppercase;
    			font-size: 35px;
    			font-family: "Cabin", sans-serif;
    			text-align: center;
    			margin-bottom: 48px;
    			color: #6d5555;
    			letter-spacing: 3px;
    		}

    		.form-group {
    			display: flex;
    			.form-wrapper

    		{
    			width: 50%;
    			&:first-child

    		{
    			margin-right: 40px;
    		}

    		}
    		}

    		.form-wrapper {
    			margin-bottom: 27px;
    			label

    		{
    			margin-bottom: 10px;
    			display: block;
    			text-transform: uppercase;
    			font-family: "Cabin", sans-serif;
    		}

    		}

    		.form-holder {
    			position: relative;
    			i

    		{
    			position: absolute;
    			top: 50%;
    			transform: translateY(-50%);
    			left: 14px;
    			font-size: 17px;
    			color: #999;
    		}

    		}

    		.form-control {
    			border: 1px solid #e6e6e6;
    			display: block;
    			width: 90%;
    			height: 44px;
    			padding: 0 20px 0 46px;
    			color: #999;
    			font-size: 15px;
    			&::-webkit-input-placeholder

    		{
    			font-size: 17px;
    			transform: translateY(5px);
    			color: #999;
    		}

    		&::-moz-placeholder {
    			font-size: 17px;
    			transform: translateY(5px);
    			color: #999;
    		}

    		&:-ms-input-placeholder {
    			font-size: 17px;
    			transform: translateY(5px);
    			color: #999;
    		}

    		&:-moz-placeholder {
    			font-size: 17px;
    			transform: translateY(5px);
    			color: #999;
    		}

    		}

    		.select {
    		}

    		select {
    			-moz-appearance: none;
    			-webkit-appearance: none;
    			cursor: pointer;
    			padding-left: 20px;
    			option [value=""][disabled]

    		{
    			display: none;
    		}

    		}

    		.button {
    			border: none;
    			float: right;
    			width: 152px;
    			height: 42px;
    			cursor: pointer;
    			border-radius: 5px;
    			display: flex;
    			align-items: center;
    			justify-content: center;
    			padding: 0;
    			background: #ea9f48;
    			font-size: 13px;
    			color: #fff;
    			text-transform: uppercase;
    			font-family: "Cabin", sans-serif;
    			-webkit-transform: perspective(1px) translateZ(0);
    			transform: perspective(1px) translateZ(0);
    			position: relative;
    			-webkit-transition-property: color;
    			transition-property: color;
    			-webkit-transition-duration: 0.3s;
    			transition-duration: 0.3s;
    			&::before

    		{
    			content: "";
    			position: absolute;
    			z-index: -1;
    			top: 0;
    			bottom: 0;
    			left: 0;
    			right: 0;
    			background: #f98805;
    			-webkit-transform: scaleX(0);
    			transform: scaleX(0);
    			-webkit-transform-origin: 50%;
    			transform-origin: 50%;
    			-webkit-transition-property: transform;
    			transition-property: transform;
    			-webkit-transition-duration: 0.3s;
    			transition-duration: 0.3s;
    			-webkit-transition-timing-function: ease-out;
    			transition-timing-function: ease-out;
    		}

    		&:hover, &:active, &:focus {
    			&::before

    		{
    			-webkit-transform: scaleX(1);
    			transform: scaleX(1);
    		}

    		}
    		}

    		.form-end {
    			display: flex;
    			align-items: center;
    			margin-top: 13px;
    		}

    		.button-holder {
    			width: 50%;
    		}

    		.checkbox {
    			position: relative;
    			width: 50%;
    			padding-left: 22px;
    			label

    		{
    			cursor: pointer;
    			color: #999;
    			font-family: "Cabin", sans-serif;
    		}

    		input {
    			position: absolute;
    			opacity: 0;
    			cursor: pointer;
    		}

    			input:checked ~ .checkmark:after {
    				display: block;
    			}

    		}

    		.checkmark {
    			position: absolute;
    			top: 1px;
    			left: 0;
    			height: 12px;
    			width: 13px;
    			border-radius: 2px;
    			background-color: #ebebeb;
    			border: 1px solid #ccc;
    			font-family: Material-Design-Iconic-Font;
    			color: #000;
    			font-size: 10px;
    			font-weight: bolder;
    			&:after

    		{
    			position: absolute;
    			top: 50%;
    			left: 50%;
    			transform: translate(-50%,-50%);
    			display: none;
    			content: '✓';
    		}

    		}


    		@media (max-width: 1199px) {
    		}

    		@media (max-width: 991px) {
    		}

    		@media (max-width: 767px) {
    			.wrapper {
    				display: block;
    			}

    			form {
    				padding: 0;
    				border: none;
    			}

    			.form-group {
    				display: block;
    				.form-wrapper

    		{
    			width: 100%;
    			&:first-child

    		{
    			margin-right: 0px;
    		}

    		}
    		}

    		.form-end {
    			display: block;
    		}

    		.checkbox, .button-holder {
    			width: 100%;
    		}

    		.inner {
    			padding: 30px 15px;
    		}

    		.button {
    			float: none;
    			margin-top: 30px;
    		}

    		h3 {
    			font-size: 30px;
    			margin-bottom: 40px;
    		}

    		}






	</style>

</head>
<body>
    <div class="wrapper" style="background-image: url('../Images/group-business-people-having-meeting.jpg');">
	<div class="inner">

		<form id="form1" runat="server">
			<asp:Label ID="lblerror" Text="" runat="server"></asp:Label>
			<h3>Sign In</h3>
			<div class="form-group">
				<div class="form-wrapper">
					<label for="">Username</label>
					<div class="form-holder">
						<i class="bi bi-person"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
						</svg></i>
						<%--<input type="text" class="form-control"/>--%>
						<asp:TextBox ID="username_txt" class="form-control" runat="server"></asp:TextBox>

					</div>
					<asp:Label ID="lbl_username" runat="server" CssClass="error-message" ForeColor="Red" Text=""></asp:Label>
				</div>

				<div class="form-wrapper">
					<label for="">First Name</label>
					<div class="form-holder">
						<i class="bi bi-person"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
						</svg></i>
						<%--<input type="text" class="form-control"/>--%>
						<asp:TextBox ID="fname_txt" class="form-control" runat="server"></asp:TextBox>

					</div>
					<asp:Label ID="lbl_fname" runat="server" CssClass="error-message" ForeColor="Red" Text=""></asp:Label>
			</div>

			<div class="form-wrapper">
				<label for="">Last Name</label>
					<div class="form-holder">
						<i class="bi bi-person"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
						</svg></i>
						<%--<input type="text" class="form-control"/>--%>
						<asp:TextBox ID="lname_txt" class="form-control" runat="server"></asp:TextBox>

					</div>
						<asp:Label ID="lbl_lname" runat="server" CssClass="error-message" ForeColor="Red" Text=""></asp:Label>
				</div>
			</div>

			<div class="form-group">
				
				<div class="form-wrapper">
					<label for="">Email</label>
					<div class="form-holder">
						<i class="bi bi-envelope-at"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-at" viewBox="0 0 16 16">
							  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2zm3.708 6.208L1 11.105V5.383zM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2z"/>
							  <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648m-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z"/>
							</svg></i>
						<%--<input type="text" class="form-control"/>--%>
						<asp:TextBox ID="email_txt" TextMode="Email" class="form-control" runat="server"></asp:TextBox>
					</div>
					<asp:Label ID="lbl_email" runat="server" CssClass="error-message" ForeColor="Red" Text="" ></asp:Label>
				</div>

				<div class="form-wrapper">
					<label for="">Birth Date</label>
					<div class="form-holder">
						<i class="bi bi-calendar3"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
							  <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2M1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857z"/>
							  <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
							</svg>

						</i>
						<!-- Birthdate field -->
						<asp:TextBox ID="birthdate_txt" TextMode="Date" runat="server" class="form-control"></asp:TextBox>
					</div>
					<asp:Label ID="lbl_birthdate" runat="server" Visible="false" ForeColor="Red"></asp:Label>

				</div>

			</div>

			<div class="form-group">
				<div class="form-wrapper">
					<label for="">Password</label>
					<div class="form-holder">
						<i class="bi bi-lock"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
						  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
						</svg></i>
						<%--<input  type="password" class="form-control" placeholder="********"/>--%>
						<asp:TextBox ID="pass_txt" TextMode="Password" class="form-control" placeholder="********" runat="server"></asp:TextBox>
						</div>
					<asp:Label ID="lbpass" runat="server" CssClass="error-message" ForeColor="Red" Text=""></asp:Label>
				</div>
				<div class="form-wrapper">
					<label for="">Confirm Password</label>
					<div class="form-holder">
						<i class="bi bi-lock"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
						  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
						</svg></i>
						<%--<input type="password" class="form-control" placeholder="********"/>--%>
						<asp:TextBox ID="confirmpass_txt" TextMode="Password" class="form-control" placeholder="********" runat="server"></asp:TextBox>
						
					</div>
					<asp:Label ID="lblconfirpass" runat="server" CssClass="error-message" ForeColor="Red" Text="" ></asp:Label>
					
				</div>
			</div>
			<div class="form-group">
				<div class="form-wrapper">
					<label for="">Contact</label>
					<div class="form-holder">
						<i class="bi bi-telephone"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
							  <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
							</svg></i>
						<asp:TextBox ID="contect_txt" class="form-control" runat="server"></asp:TextBox>
					</div>
					<asp:Label ID="lbcontact" runat="server" CssClass="error-message" ForeColor="Red" Text=""></asp:Label>
				</div>

				<div class="form-wrapper">
					<label for="">Address</label>
						<div class="form-holder">
								<i class="bi bi-geo-alt"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
								  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
								  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
								</svg></i>
							<asp:TextBox ID="address_txt" runat="server" Class="form-control"></asp:TextBox>
						</div>
						<asp:Label ID="lbladdress" runat="server" CssClass="error-message" ForeColor="Red" Text=""></asp:Label>
				</div>

				<div class="form-wrapper">
					<label for="">Gender</label>
					<div class="form-holder select">
						<select name="" id="gender" runat="server" class="form-control">
							<option value="male">Male</option>
							<option value="femal">Female</option>
							<option value="other">Other</option>

						</select>
						<%--<asp:DropDownList ID="gender" runat="server"  class="form-control">
							<asp:ListItem Value="Male" Text="Male" />
							<asp:ListItem Value="Female" Text="Female" />
						</asp:DropDownList>--%>

						<i class="bi bi-people"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
						  <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1zm-7.978-1L7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002-.014.002zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0M6.936 9.28a6 6 0 0 0-1.23-.247A7 7 0 0 0 5 9c-4 0-5 3-5 4q0 1 1 1h4.216A2.24 2.24 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816M4.92 10A5.5 5.5 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0m3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4"/>
						</svg></i>

						
					</div>
				</div>
			</div>
			<div class="form-end">
				<div class="checkbox">
					<%--<label>
						<input type="checkbox"/> I Accept the terms and conditions.
						<span class="checkmark"></span>
					</label>--%>
					<label for="chkAcceptTerms">
						<asp:CheckBox ID="chkAcceptTerms" runat="server" Text="I accept the terms and conditions" />
						<span class="checkmark"></span>
					</label>
				</div>
				<div class="button-holder">
					<asp:button id="Backbt" runat="server" class="button"  type="submit" Text="Back" OnClick="backbt_Click"  AutoPostBack="true" ></asp:button>
				</div>

				<div class="button-holder">
					<%--<button id="registerbt" onclick="registerbt_Click" runat="server" >Register Now</button>--%>
					<asp:button id="registerbt" runat="server" class="button"  type="submit" Text="Register Now" OnClick="registerbt_Click"  AutoPostBack="true" ></asp:button>
				</div>
				
			</div>
		  </form>
	</div>
</div>


</body>
	<script src="Scripts/bootstrap.js"></script>
	<script src="Scripts/bootstrap.min.js"></script>
	<script src="Scripts/bootstrap.esm.min.js"></script>
	
</html>

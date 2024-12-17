<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_hotels.aspx.cs" Inherits="BookInn.Admin_Master.Admin_hotels" EnableEventValidation="false" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>Hotel Details Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
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
			padding: 69px 99px 80px;
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
			width: 100%;
			height: 42px;
			padding: 0 50px 0px 51px;
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
			&::after

		{
			content: "\f2f9";
			font-family: Material-Design-Iconic-Font;
			position: absolute;
			top: 50%;
			transform: translateY(-50%);
			right: 12px;
			font-size: 15px;
			color: #999;
		}

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

		form {
			border: 1px solid #d3cccc;
			padding: 83px 40px 75px;
		}

		.form-control {
			border: 1px solid #e6e6e6;
			display: block;
			width: 97%;
			height: 42px;
			padding: 0px 18px 0px 49px;
			color: #999;
			font-size: 15px;
		}








    </style>




   
</head>
<body>
    
        <%--<div>
            
            <div class="form-group">
                <div class="form-wrapper">
                    <label for="txtHotelName">Hotel Name</label>
                    <div class="form-holder">
                        <i class="bi bi-person">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z" />
                            </svg></i>
                        
                       <asp:TextBox ID="txtHotelName" CssClass="form-control"  runat="server"></asp:TextBox>
                        
                    </div>
                </div>
                
            </div>


            <br />
            <label for="txtAddress">Address:</label>
            <asp:TextBox ID="txtAddress" Font-Names="txtAddress" runat="server"></asp:TextBox>
            <br />
            <label for="txtContact">Contact Number:</label>
            <asp:TextBox ID="txtContact" Font-Names="txtContact" runat="server"></asp:TextBox>
            <br />
            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" Font-Names="txtEmail" runat="server"></asp:TextBox>
            <br />
            <label for="txtCountry">Country:</label>
            <asp:DropDownList ID="txtCountry" Font-Names="txtCountry" runat="server" onchange="updateCityOptions()">
                <asp:ListItem Text="-- Select Country --" Value=""></asp:ListItem>
                <asp:ListItem Text="India" Value="India"></asp:ListItem>
                <asp:ListItem Text="USA" Value="USA"></asp:ListItem>
                <%-- Add more countries as needed --%>
          <%--  </asp:DropDownList>
            <br />
            <label for="txtCity">City:</label>
            <asp:DropDownList ID="txtCity" Font-Names="txtCity" runat="server"></asp:DropDownList>  
            <br />
            <asp:Button ID="btnSubmit" class="button" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>--%>



    <div class="wrapper" style="background-image: url('../Images/3039.jpg');">
        <div class="inner">

            <form id="form1" runat="server" onsubmit="return validateForm()">
				<h3>Hotel Details </h3>
                <div class="form-group">
                    <div class="form-wrapper">
                        <label for="txtHotelName">Hotel Name</label>
                        <div class="form-holder">
                            <i class="bi bi-building">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                    <path d="M4 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z" />
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1zm11 0H3v14h3v-2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V15h3z" />
                                </svg>
                            </i>

                            <asp:TextBox ID="txtHotelName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>


                    <div class="form-wrapper">
                         <label for="txtAddress">Location</label>
                        <div class="form-holder">
                            <i class="bi bi-geo-alt">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                                    <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10" />
                                    <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                </svg>

                            </i>

                            <asp:TextBox ID="txtAddress" CssClass="form-control"  runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
				<div class="form-group">
					<div class="form-wrapper">
						<label for="txtstartingrate">Starting Rates</label>
                        <div class="form-holder">
                            <i class="bi bi-currency-rupee">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                    <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                                </svg>
                            </i>

                            <asp:TextBox ID="txtprices" CssClass="form-control" onkeyup="validatePrice(this)" runat="server"></asp:TextBox>
                        </div>
						<span id="priceValidationMessage" style="color: red;"></span>
                    </div>
					
				</div>
                <div class="form-group">
                    <div class="form-wrapper">
                        <label for="txtContact">Contact</label>
                        <div class="form-holder">
                            <i class="bi bi-telephone">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                                    <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z" />
                                </svg>
                            </i>

                            
                            <asp:TextBox ID="txtContact" CssClass="form-control"  runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-wrapper">
                        <label for="txtEmail">Email	</label>
                        <div class="form-holder">
                            <i class="bi bi-envelope">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z" />
                                </svg>
                            </i>

                            
                            <asp:TextBox ID="txtEmail" CssClass="form-control"  runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>



                <div class="form-group">
                    <div class="form-wrapper">
                         <label for="txtCountry">Country</label>
                        <div class="form-holder">
                           <i class="bi bi-geo">
                               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo" viewBox="0 0 16 16">
                                   <path fill-rule="evenodd" d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6M4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.3 1.3 0 0 0-.37.265.3.3 0 0 0-.057.09V14l.002.008.016.033a.6.6 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.6.6 0 0 0 .146-.15l.015-.033L12 14v-.004a.3.3 0 0 0-.057-.09 1.3 1.3 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465s-2.462-.172-3.34-.465c-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411" />
                               </svg>
                           </i>

                            <asp:DropDownList ID="txtCountry" CssClass="form-control"  runat="server" onchange="updateCityOptions()">
                                <asp:ListItem Text="-- Select Country --" Value=""></asp:ListItem>
                                <asp:ListItem Text="India" Value="India"></asp:ListItem>
                                <asp:ListItem Text="USA" Value="USA"></asp:ListItem>
                                <%-- Add more countries as needed --%>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-wrapper">
                        <label for="txtCity">City</label>
                        <div class="form-holder">
                            <i class="bi bi-geo">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6M4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.3 1.3 0 0 0-.37.265.3.3 0 0 0-.057.09V14l.002.008.016.033a.6.6 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.6.6 0 0 0 .146-.15l.015-.033L12 14v-.004a.3.3 0 0 0-.057-.09 1.3 1.3 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465s-2.462-.172-3.34-.465c-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411" />
                                </svg>
                            </i>

							<asp:DropDownList ID="txtCity" CssClass="form-control"  runat="server"></asp:DropDownList>  
                        </div>
                    </div>
						
                </div>

				<div class="form-group">
					<div class="form-wrapper">
						<asp:FileUpload ID="FileUpload1" runat="server" />
                        <!-- FileUpload control for image -->
                        <br />
                        <asp:Label ID="imagelb" runat="server"></asp:Label>
                        <!-- ImageButton for submit -->
					</div>
                    
				</div>

                <div class="form-end">
                    <div class="checkbox">
                        <label for="chkAcceptTerms">
                            <asp:CheckBox ID="chkAcceptTerms" runat="server" Text="I accept the terms and conditions" />
                            <span class="checkmark"></span>
                        </label>
                    </div>

                    <div class="button-holder">
                        <asp:Button ID="btnSubmit" class="button" runat="server" Text="Next" OnClick="btnSubmit_Click"  AutoPostBack="true" />
                    </div>
                    

                </div>


            </form>
        </div>
    </div>



    
     <script type="text/javascript">
         function validateForm() {
             var hotelName = document.getElementById('<%= txtHotelName.ClientID %>').value.trim();
             var address = document.getElementById('<%= txtAddress.ClientID %>').value.trim();
             var contact = document.getElementById('<%= txtContact.ClientID %>').value.trim();
             var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
             var country = document.getElementById('<%= txtCountry.ClientID %>').value;
             var city = document.getElementById('<%= txtCity.ClientID %>').value;

             // Regular expression patterns
             var contactPattern = /^\d{10}$/;
             var emailPattern = /^\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b$/;

             if (hotelName === "") {
                 alert("Please enter the Hotel Name.");
                 return false;
             }

             if (address === "") {
                 alert("Please enter the Address.");
                 return false;
             }

             if (contact === "") {
                 alert("Please enter the Contact Number.");
                 return false;
             }

             // Check if contact number is numeric and has exactly 10 digits
             if (!contactPattern.test(contact)) {
                 alert("Invalid Contact Number. It should be numeric and have exactly 10 digits.");
                 return false;
             }

             if (email === "") {
                 alert("Please enter the Email.");
                 return false;
             }

             // Check if email format is valid
             if (!emailPattern.test(email)) {
                 alert("Invalid Email Address.");
                 return false;
             }

             if (country === "") {
                 alert("Please select a Country.");
                 return false;
             }

             if (city === "") {
                 alert("Please select a City.");
                 return false;
             }

             // If all validations pass, return true to submit the form
             return true;
         }

			 function updateCityOptions() {
				 var countryDropdown = document.getElementById('<%= txtCountry.ClientID %>');
			 var cityDropdown = document.getElementById('<%= txtCity.ClientID %>');

			 // Clear existing city options
			 cityDropdown.innerHTML = '';

			 // Get the selected country
			 var selectedCountry = countryDropdown.value;

			 // Define city options based on the selected country
			 var cityOptions = [];
			 switch (selectedCountry) {
				 case 'India':
					 cityOptions = ['Mumbai', 'Delhi', 'Bangalore', 'Chennai', 'Kolkata'];
					 break;
				 case 'USA':
					 cityOptions = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'];
					 break;
				 // Add more cases for other countries as needed
				 default:
					 cityOptions = ['-- Select Country First --'];
					 break;
			 }

			 // Populate the city dropdown with the new options
			 cityOptions.forEach(function (city) {
				 var option = document.createElement('option');
				 option.text = city;
				 option.value = city;
				 cityDropdown.add(option);
			 });
		 }
         function validatePrice(input) {
             // Regular expression to match the price pattern (1000.00)
             var pricePattern = /^\d+(\.\d{0,2})?$/;

             // Get the value of the input
             var inputValue = input.value.trim();

             // Check if the input matches the price pattern
             if (pricePattern.test(inputValue)) {
                 // Clear any previous validation message
                 document.getElementById("priceValidationMessage").innerText = "";
             } else {
                 // Display validation message
                 document.getElementById("priceValidationMessage").innerText = "Please enter a valid price (e.g., 1000.00)";
             }
         }
     </script>
</body>
</html>

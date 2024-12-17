<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_login.aspx.cs" Inherits="BookInn.user_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
   
        <style>



body {
  font-family: "Roboto", sans-serif;
  background-color: #fff; }

strong{
    color:#dfa974;
}
.logo {
	padding: 25px 0;
}
.logo a {
	display: inline-block;
}
.img3{
	max-width:240px;
}
p {
  color: #b3b3b3;
  font-weight: 300; }

h1, h2, h3, h4, h5, h6,
.h1, .h2, .h3, .h4, .h5, .h6 {
  font-family: "Roboto", sans-serif; }

a {
  -webkit-transition: .3s all ease;
  -o-transition: .3s all ease;
  transition: .3s all ease; }
  a:hover {
    text-decoration: none !important; }

.content {
  padding: 7rem 0; }

h2 {
  font-size: 20px; }

.half, .half .container > .row {
  height: 100vh;
  min-height: 700px; }

@media (max-width: 991.98px) {
  .half .bg {
    height: 200px; } }

.half .contents {
  background: #f6f7fc; }

.half .contents, .half .bg {
  width: 50%; }
  @media (max-width: 1199.98px) {
    .half .contents, .half .bg {
      width: 100%; } }
  .half .contents .form-control, .half .bg .form-control {
    border: none;
    -webkit-box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
    border-radius: 4px;
    height: 54px;
    background: #fff; }
    .half .contents .form-control:active, .half .contents .form-control:focus, .half .bg .form-control:active, .half .bg .form-control:focus {
      outline: none;
      -webkit-box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
      box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1); }

.half .bg {
  background-size: cover;
  background-position: center; }

.half a {
  color: #888;
  text-decoration: underline; }

.half .btn {
  height: 54px;
  padding-left: 30px;
  padding-right: 30px; }

.half .forgot-pass {
  position: relative;
  top: 2px;
  font-size: 14px; }

.control {
  display: block;
  position: relative;
  padding-left: 30px;
  margin-bottom: 15px;
  cursor: pointer;
  font-size: 14px;

}
  .control .caption {
    position: relative;
    top: .2rem;
    color: #888; }

.control input {
  position: absolute;
  z-index: -1;
  opacity: 0; }

.control__indicator {
  position: absolute;
  top: 2px;
  left: 0;
  height: 20px;
  width: 20px;
  background: #e6e6e6;
  border-radius: 4px; }

.control--radio .control__indicator {
  border-radius: 50%; }

.control:hover input ~ .control__indicator,
.control input:focus ~ .control__indicator {
  background: #ccc; }

.control input:checked ~ .control__indicator {
  background: #ea9f48; }

.control:hover input:not([disabled]):checked ~ .control__indicator,
.control input:checked:focus ~ .control__indicator {
  background: #fb8633; }

.control input:disabled ~ .control__indicator {
  background: #e6e6e6;
  opacity: 0.9;
  pointer-events: none; }

.control__indicator:after {
  font-family: 'icomoon';
  content: '\2713';
  position: absolute;
  display: none;
  font-size: 16px;
  top: 50%;
  left: 50%;
  -webkit-transition: .3s all ease;
  -o-transition: .3s all ease;
  transition: .3s all ease; }

.control input:checked ~ .control__indicator:after {
  display: block;
  color: #fff; }

.control--checkbox .control__indicator:after {
  top: 50%;
  left: 50%;
  margin-top: -1px;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%); }

.control--checkbox input:disabled ~ .control__indicator:after {
  border-color: #7b7b7b; }

.control--checkbox input:disabled:checked ~ .control__indicator {
  background-color: #7e0cf5;
  opacity: .2; }

      

.control {
  display: block;
  position: relative;
  padding-left: 30px;
  margin-bottom: 15px;
  cursor: pointer;
  font-size: 14px;
 
}
 .caption {
 	position: relative;
 	top: .2rem;
 	color: #888;
 }
.control input {
  position: absolute;
  z-index: -1;
  opacity: 0;
}
.control__indicator {
  position: absolute;
  top: 2px;
  left: 0;
  height: 20px;
  width: 20px;
  background: #e6e6e6;
  border-radius: 4px;
}
.control--radio .control__indicator {
  border-radius: 50%;
}
.control:hover input ~ .control__indicator,
.control input:focus ~ .control__indicator {
  background: #ccc;
}
.control input:checked ~ .control__indicator {
  background: $primary;
}
.control:hover input:not([disabled]):checked ~ .control__indicator,
.control input:checked:focus ~ .control__indicator {
  background: lighten($primary, 5%);
}
.control input:disabled ~ .control__indicator {
  background: #e6e6e6;
  opacity: 0.9;
  pointer-events: none;
}
.control__indicator:after {
	font-family: 'icomoon';
  content: '\e5ca';
  position: absolute;
  display: none;
  font-size: 16px;
  transition: .3s all ease;
}
.control input:checked ~ .control__indicator:after {
  display: block;
    color: #fff;
    content: '✓';
}
.control--checkbox .control__indicator:after {
	top: 50%;
	left: 50%;
	margin-top: -1px;
	transform: translate(-50%, -50%);
}
.control--checkbox input:disabled ~ .control__indicator:after {
  border-color: #7b7b7b;
}
.control--checkbox input:disabled:checked ~ .control__indicator {
  background-color: #7e0cf5;
  opacity: .2;
}






body {
	font-family: $font-family-sans-serif;
	background-color: #fff;
}
p {
	color: darken(#ccc, 10%);
	font-weight: 300;
}
h1, h2, h3, h4, h5, h6,
.h1, .h2, .h3, .h4, .h5, .h6 {
	font-family: $font-family-sans-serif;
}
a {
	transition: .3s all ease;
	&:hover {
		text-decoration: none!important;
	}
}
.content {
	padding: 7rem 0;
}
h2 {
	font-size: 20px;
}

.half {
	&, & .container > .row {
		height: 100vh;
		min-height: 700px;
	}
	
	.bg {
		@include media-breakpoint-down(md) {
			height: 200px;
		}
	}
	.contents {
		background: #f6f7fc;
	}
	.contents, .bg {
		width: 50%;
		@include media-breakpoint-down(lg) {
			width: 100%;
		}
		.form-control {
			border: none;
			box-shadow: 0 1px 2px 0 rgba($black, .1);
			border-radius: 4px;
			height: 54px;
			background: $white;
			&:active, &:focus {
				outline: none;
				box-shadow: 0 1px 2px 0 rgba($black, .1);
			}
		}
	}
	.bg {
		background-size: cover;
		background-position: center;
	}
	a {
		color: #888;
		text-decoration: underline;
	}
	.btn {
		height: 54px;
        width: 400px;
		padding-left: 30px;
		padding-right: 30px;
	}
    .btn-primary {

    color: #fff;
    font-size: 13px;
    font-weight: 700;
    padding: 16px 28px 15px;
    background: #ea9f48;
    letter-spacing: 2px;
    text-transform: uppercase;
    background-color: #ea9f48; /* New shade of orange */
    border: none; /* Optional: remove border */
    border-radius: 5px;
    cursor: pointer;
    border-color: #ea9f48; /* Matching border color */

    /*--bs-btn-color: #fff;
    --bs-btn-bg: #e57300;*/ /* New shade of orange for hover state */
    /*--bs-btn-border-color: #e57300;*/ /* Matching border color for hover state */
    /*--bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #e57300;*/ /* New shade of orange for hover state */
    /*--bs-btn-hover-border-color: #e49236;

    --bs-btn-focus-shadow-rgb: 49, 132, 253;

    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #f59a34;
    --bs-btn-active-border-color: #da8c2f;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);

    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #fc7f00;*/ /* New shade of orange for disabled state */
    /*--bs-btn-disabled-border-color: #fb8633;*/ /* Matching border color for disabled state */
}
    .btn-primary:hover{
        background-color: #d18b3e;
    }

	.forgot-pass {
		position: relative;
		top: 2px;
		font-size: 14px;
	}
    .half .forgot-pass {
    position: relative;
    top: 2px;
    font-size: 14px;
    }
    .d-flex {
    display: flex !important;
    justify-content: space-between;
    }

</style>

</head>
<body>

    <div class="d-lg-flex half">
        <div class="bg order-1 order-md-2" style="background-image: url(../Images/10811.jpg);"></div>

        <div class="contents order-2 order-md-1">

            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-7">
                        <div class="logo">
                            <a href="#">
                                <img src="../Images/logo-transparent-png2.png" class="img3" />
                                <%--<img src="/img/logo.png" alt="these is bootstrap img"/>--%>
                            </a>
                        </div>
                        <h3>Login to <strong>User</strong></h3>
                        <p class="mb-4">Secure access to the admin portal where you can manage and control essential functionalities. Please enter your credentials below to proceed.</p>
                        <form id="form1" runat="server">
                            <div class="form-group first">

                                <label for="username">Username or Email</label>
                                <asp:TextBox ID="txtemail" class="form-control" placeholder="username or your-email@gmail.com" runat="server"></asp:TextBox>
                                <%--<input type="text" class="form-control" placeholder="your-email@gmail.com" id="txtemail" runat="server"/>--%>
                                <asp:Label ID="emaillb" ForeColor="Red" runat="server"></asp:Label>

                            </div>
                            <br />
                            <div class="form-group last mb-3">
                                <label for="password">Password</label>
                                <asp:TextBox ID="txtpassword" class="form-control" placeholder="Your Password" runat="server" TextMode="Password"></asp:TextBox>
                                <%--<input type="password" class="form-control" placeholder="Your Password" id="txtpassword" runat="server"/>--%>
                                <%--<label id="emaillb" runat="server" text="" ></label>--%>

                                <asp:Label ID="passlb" ForeColor="Red" runat="server"></asp:Label>
                            </div>



                            <div class="d-flex mb-5 align-items-center">
                                <label class="control control--checkbox mb-0">
                                    <span class="caption">Remember me</span>
                                    <input type="checkbox" checked="checked" />
                                    <div class="control__indicator"></div>
                                </label>
                                <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span>

                            </div>

                            <%--<input id="loginbt"  type="submit" value="Log In" class="btn btn-block btn-primary"/>--%>
                            <asp:Button ID="loginbt" runat="server" type="submit" Text="Log In" class="btn btn-block btn-primary" OnClick="loginbt_Click" AutoPostBack="true" />
                            <br />
                            <br />


                            <%-- <input id="createacc" type="submit" value="Create Account" class="btn btn-block btn-primary"/>--%>
                            <asp:Button ID="createbt" runat="server" type="submit" Text="Create Account" class="btn btn-block btn-primary" OnClick="createbt_Click" AutoPostBack="true" />

                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>

</body>

    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap.esm.min.js"></script>

</html>

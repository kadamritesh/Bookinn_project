<%@ Page Language="C#" MasterPageFile="~/Admin_Master/Adminmaster.Master" AutoEventWireup="true" CodeBehind="AdminHotel_details.aspx.cs" Inherits="BookInn.Admin_Master.AdminHotel_details" %>

<asp:Content ID="content1" ContentPlaceHolderID="AdminHeaderContent" runat="server">

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
    body {
        margin-top: 20px;
        background-color: #f2f6fc;
        color: #69707a;
    }

    .img-account-profile {
        height: 10rem;
    }

    .form-check-input:checked {
        background-color: #dfa974;
        border-color: #dfa974;
    }

    .btn-primary {
        color: #fff;
        background-color: #dfa974;
        border-color: #dfa974;
    }

        .btn-primary:hover {
            color: #fff;
            background-color: #dfa974;
            border-color: #dfa974;
        }

    .rounded-circle {
        border-radius: 50% !important;
    }

    .nav-borders .nav-link.active {
        color: #dfa974;
        border-bottom-color: #dfa974;
    }

    .card {
        box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
    }

        .card .card-header {
            font-weight: 500;
        }

    .card-header:first-child {
        border-radius: 0.35rem 0.35rem 0 0;
    }

    .card-header {
        padding: 1rem 1.35rem;
        margin-bottom: 0;
        background-color: rgba(33, 40, 50, 0.03);
        border-bottom: 1px solid rgba(33, 40, 50, 0.125);
    }

    .form-control,
    .dataTable-input {
        display: block;
        width: 100%;
        padding: 0.875rem 1.125rem;
        font-size: 0.875rem;
        font-weight: 400;
        line-height: 1;
        color: #69707a;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #c5ccd6;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: 0.35rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .nav-borders .nav-link.active {
        color: #dfa974;
        border-bottom-color: #dfa974;
    }

    .nav-borders .nav-link {
        color: #69707a;
        border-bottom-width: 0.125rem;
        border-bottom-style: solid;
        border-bottom-color: transparent;
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
        padding-left: 0;
        padding-right: 0;
        margin-left: 1rem;
        margin-right: 1rem;
    }
    .btn-check:checked + .btn, .btn.active, .btn.show, .btn:first-child:active, :not(.btn-check) + .btn:active {
        color: var(--bs-btn-active-color);
        background-color: #dfa974;
        border-color: #dfa974;
    }
    .btn-primary {
        --bs-btn-color: #fff;
        --bs-btn-bg: #dfa974;
        --bs-btn-border-color: #dfa974;
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: #dfa974;
        --bs-btn-hover-border-color: #dfa974;
        --bs-btn-focus-shadow-rgb: 49, 132, 253;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: #dfa974;
        --bs-btn-active-border-color: #dfa974;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: #dfa974;
        --bs-btn-disabled-border-color: #dfa974;
    }
        .btn-check:focus + .btn-primary, .btn-primary:focus {
            color: #fff;
            background-color: #dfa974;
            border-color: #dfa974;
            box-shadow: 0 0 0 0.25rem rgba(49,132,253,.5);
        }
    .error {
        border-color: red;
        color: red;
    }
</style>

    <nav class="navbar bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="../Images/logo-transparent-png2.png" alt="Bootstrap" class="img3" />
            </a>
        </div>
    </nav>

    <div class="container-xl px-4 mt-4">
        <nav class="nav nav-borders">
            <a class="nav-link" href="Admin_home.aspx">Home</a>
            <a class="nav-link active ms-0" id="hotel_1" href="#profile" data-toggle="list">Hotels</a>
            
        </nav>
        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-xl-4" id="profile">

                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Profile Picture</div>
                    <div class="card-body text-center">

                        <%--<img class="img-account-profile rounded-circle mb-2"
                            src="https://mdbcdn.b-cdn.net/img/new/avatars/8.webp" alt="there is image">--%>
                        <asp:Image ID="imgHotelImage" class="img-account-profile rounded-circle mb-2" runat="server" alt="there is image" />
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <div class="card mb-4" >
                    <div class="card-header">Hotels Details</div>
                    <div  class="card-body">

                        <div class="mb-3">
                            <label class="small mb-1" >Hotel Name</label>
                            <asp:TextBox ID="txtHotelName" class="form-control"  runat="server"></asp:TextBox>
                            <label id="hotelname_error" class="err_msgs"></label>
                        </div>

                        <div class="row gx-3 mb-3">

                            <div class="col-md-6">
                                <label class="small mb-1" >Address</label>
                                <asp:TextBox ID="txtHotelAddress" class="form-control" runat="server"></asp:TextBox>
                                <label id="hoteladdress_error" class="err_msgs"></label>
                            </div>

                            <div class="col-md-6">
                                <label class="small mb-1" >Contact</label>
                                <asp:TextBox ID="txtHotelContact" class="form-control" runat="server"></asp:TextBox>
                                <label id="contact_error" class="err_msgs"></label>
                            </div>
                        </div>

                        <div class="row gx-3 mb-3">
                            <div class="col-md-6">
                                <label class="small mb-1">Email</label>
                                <asp:TextBox ID="txtHotelEmail" class="form-control" runat="server"></asp:TextBox>
                                <label id="email_error" class="err_msgs"></label>
                            </div>

                            <div class="col-md-6">
                                <label class="small mb-1">Starting Rates</label>
                                <asp:TextBox ID="txtStartingRates" class="form-control" runat="server"></asp:TextBox>
                                <label id="rates_error" class="err_msgs"></label>
                            </div>


                            <button class="btn btn-primary" id="editProfileButton" type="button">Edit</button>
                            <button class="btn btn-primary d-none" id="saveProfileButton" type="button">Save changes</button>
                            <div style="display: none;">
                                <asp:Button ID="saveProfileButtonHidden" OnClick="saveProfileButtonHidden_Click" runat="server" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
            

            $(document).ready(function () { 
                // Function to enable editing of input fields
                function enableEditing() {
                    $('#txtHotelName, #txtHotelAddress ,#txtHotelContact, #txtHotelEmail, #txtStartingRates').prop('readonly', false);
                    $('#saveProfileButton').removeClass('d-none');
                    $('#editProfileButton').addClass('d-none');
                }
                // Function to disable editing of input fields
                function disableEditing() {
                    $('#txtHotelName, #txtHotelAddress ,#txtHotelContact, #txtHotelEmail, #txtStartingRates').prop('readonly', true);
                    $('#saveProfileButton').addClass('d-none');
                    $('#editProfileButton').removeClass('d-none');
                }

                // Function to perform field validation
                function validateFields() {
                    var isValid = true;

                    // Clear previous error messages
                    $('.err_msgs').text('').removeClass('error');

                    // Validate Hotel Name
                    var hotelName = $('#txtHotelName').val();
                    if (!hotelName.match(/^[a-zA-Z\s]{2,50}$/)) {
                        $('#txtHotelName').addClass('error');
                        $('#hotelname_error').text('Please enter a valid hotel name.').addClass('error');
                        isValid = false;
                    }

                    // Validate Email
                    var hotelEmail = $('#txtHotelEmail').val();
                    if (!hotelEmail.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
                        $('#txtHotelEmail').addClass('error');
                        $('#email_error').text('Please enter a valid email.').addClass('error');
                        isValid = false;
                    }

                    // Validate Contact
                    var hotelContact = $('#txtHotelContact').val();
                    if (!hotelContact.match(/^[\d()-\s]{7,15}$/)) {
                        $('#txtHotelContact').addClass('error');
                        $('#contact_error').text('Please enter a valid contact number.').addClass('error');
                        isValid = false;
                    }

                    // Validate Starting Rates
                    var startingRates = $('#txtStartingRates').val();
                    if (!startingRates.match(/^\d{1,8}(\.\d{1,2})?$/)) {
                        $('#txtStartingRates').addClass('error');
                        $('#rates_error').text('Please enter a valid starting rate.').addClass('error');
                        isValid = false;
                    }

                    return isValid;
                }


                // Initially, disable editing
                disableEditing();

                // When the "Edit" button is clicked, enable editing
                $('#editProfileButton').click(function () {
                    enableEditing();
                });

                // When the "Save changes" button is clicked, disable editing if all fields are valid
                $('#saveProfileButton').click(function () {
                    if (validateFields()) {

                        get("AdminHeaderContent_saveProfileButtonHidden").click();
                        disableEditing();
                        // Add code here to handle saving changes with database validation
                    }
                });
            });
    </script>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Admin_Master/Adminmaster.Master" AutoEventWireup="true" CodeBehind="Admin_profile.aspx.cs" Inherits="BookInn.Admin_Master.Admin_profile" %>

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
            <a class="nav-link"  href="Admin_home.aspx" >Home</a>
            <a class="nav-link active ms-0" id="profile_1"  href=#profile data-toggle="list" >Profile</a>
            <%--<a class="nav-link" id="billing_1" href=#billing data-toggle="list">Billing</a>--%>
            <a class="nav-link" id="security_1" href=#security data-toggle="list">Security</a>
            <%--<a class="nav-link" id="notification_1" href=#notification data-toggle="list">Notifications</a>--%>
        </nav>
        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-xl-4" id="profile">

                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Profile Picture</div>
                    <div class="card-body text-center">

                        <img class="img-account-profile rounded-circle mb-2"
                            src="https://mdbcdn.b-cdn.net/img/new/avatars/8.webp" alt="there is image">

                       
                    </div>
                </div>
            </div>
            <div class="col-xl-8">

                <div class="card mb-4" >
                    <div class="card-header">Account Details</div>
                    <div class="card-body">
                        

                            <div class="mb-3">
                                <label class="small mb-1" for="inputUsername">Username (how your name will appear to
                                    other users on the site)</label>
                                <input class="form-control" id="inputUsername" name="admin_username" type="text"
                                    placeholder="Enter your username" value="<%=profile["admin_username"].ToString()%>"/>
                                <label id="adminusername_lb" class="err_msgs"></label>
                            </div>

                            <div class="row gx-3 mb-3">

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">First name</label>
                                    <input class="form-control" id="inputFirstName" name="admin_fname" type="text"
                                        placeholder="Enter your first name" value="<%=profile["admin_fname"].ToString()%>"/>
                                    <label id="adminfname_lb" class="err_msgs"></label>
                                </div>

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLastName">Last name</label>
                                    <input class="form-control" id="inputLastName"  name="admin_lname" type="text"
                                        placeholder="Enter your last name" value="<%=profile["admin_lname"].ToString()%>"/>
                                    <label id="adminlname_lb" class="err_msgs"></label>
                                </div>
                            </div>

                            <div class="row gx-3 mb-3">

                               <%-- <div class="col-md-6">
                                    <label class="small mb-1" for="inputOrgName">Organization name</label>
                                    <input class="form-control" id="inputOrgName" type="text"
                                        placeholder="Enter your organization name" value="Start Bootstrap">
                                </div>--%>

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLocation">Location</label>
                                    <input class="form-control" id="inputLocation" name="admin_location" type="text"
                                        placeholder="Enter your location" value="<%=profile["admin_location"].ToString()%>"/>
                                    <label id="adminlocation_lb" class="err_msgs"></label>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                <input class="form-control" id="inputEmailAddress" name="admin_email" type="email"
                                    placeholder="Enter your email address" value="<%=profile["admin_email"].ToString()%>"/>
                                <label id="adminemail_lb" class="err_msgs"></label>
                            </div>

                            <div class="row gx-3 mb-3">

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputPhone">Phone number</label>
                                    <input class="form-control" id="inputPhone" type="tel" name="admin_contact"
                                        placeholder="Enter your phone number" value="<%=profile["admin_contact"].ToString()%>"/>
                                    <label id="adminphone_lb" class="err_msgs"></label>
                                </div>

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputBirthday">Birthdate</label>
                                    <input class="form-control" id="inputBirthday" type="date" name="admin_birthdate"
                                        placeholder="Enter your birthday" value="<%=Convert.ToDateTime(profile["admin_birthdate"]).ToString("yyyy-MM-dd")%>"/>
                                    <label id="adminbirth_lb" class="err_msgs"></label>
                                </div>
                            </div>
                            <button class="btn btn-primary" id="editProfileButton" type="button">Edit</button>
                            <button class="btn btn-primary d-none" id="saveProfileButton" type="button" >Save changes</button>
                            <div style="display: none;">
                                <asp:Button ID="saveProfileButtonHidden" OnClick="saveProfileButtonHidden_Click" runat="server"/>
                            </div>
                    </div>
                </div>
            </div><hr /> 
           
            <div class="row" id="security">
                <h1>Security</h1>
                <div class="col-lg-8" >
                    <!-- Change password card-->
                    <div class="card mb-4">
                        <div class="card-header">Change Password</div>
                        <div class="card-body">
                            <div>
                                <!-- Form Group (current password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="currentPassword">Current Password</label>
                                    <input class="form-control" id="currentPassword" name="currentPassword" type="password" placeholder="Enter current password">
                                    <label id="currentpass_lb" class="err_msgs"></label>
                                </div>
                                <!-- Form Group (new password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="newPassword">New Password</label>
                                    <input class="form-control" id="newPassword" name="newPassword" type="password" placeholder="Enter new password">
                                    <label id="newpass_lb" class="err_msgs"></label>
                                </div>
                                <!-- Form Group (confirm password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="confirmPassword">Confirm Password</label>
                                    <input class="form-control" id="confirmPassword" name="confirmPassword" type="password" placeholder="Confirm new password">
                                    <label id="confirmpass_lb" class="err_msgs"></label>
                                </div>
                                <button class="btn btn-primary" id="editSecurityButton" type="button">Edit Security</button>
                                <button class="btn btn-primary d-none" id="saveSecurityButton" type="button">Save Security</button>
                                <div style="display: none;">
                                    <asp:Button ID="saveSecurityButtonHidden" OnClick="saveSecurityButtonHidden_Click"  runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
                <div class="col-lg-4">
                 
                    <!-- Delete account card-->
                    <div class="card mb-4">
                        <div class="card-header">Delete Account</div>
                        <div class="card-body">
                            <p>Deleting your account is a permanent action and cannot be undone. If you are sure you want to delete your account, select the button below.</p>
                            <button class="btn btn-danger-soft text-danger" type="button">I understand, delete my account</button>
                        </div>
                    </div>
                </div>
            </div>

            
                
            
        </div>
        
    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function get(id) { return document.getElementById(id); }

        //get("profile_1").onclick = function () {
        //    get("AdminHeaderContent_ProNavClickedbtn").value = "profile_1";
        //}
        
        //get("security_1").onclick = function () {
        //    get("AdminHeaderContent_ProNavClickedbtn").value = "security_1";
       

        $(document).ready(function () {
            // Function to enable editing of input fields
            function enableEditing() {
                $('#inputUsername, #inputFirstName ,#inputLastName, #inputLocation, #inputEmailAddress, #inputPhone ,#inputBirthday').prop('readonly', false);
                $('#saveProfileButton').removeClass('d-none');
                $('#editProfileButton').addClass('d-none');
            }

            // Function to disable editing of input fields
            function disableEditing() {
                $('#inputUsername, #inputFirstName ,#inputLastName, #inputLocation, #inputEmailAddress, #inputPhone ,#inputBirthday').prop('readonly', true);
                $('#saveProfileButton').addClass('d-none');
                $('#editProfileButton').removeClass('d-none');
            }
            // Validate all fields
            function validateFields() {
                var isValid = true;

                // Regular expressions for validation
                var usernameRegex = /^[a-zA-Z0-9_-]{3,16}$/;
                var nameRegex = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                var phoneRegex = /^\d{10}$/;
                var dateRegex = /^\d{4}-\d{2}-\d{2}$/;

                // Check if each input field is valid
                $('input').each(function () {
                    var input = $(this);
                    var value = input.val();

                    switch (input.attr('id')) {
                        case 'inputUsername':
                            if (!value.match(usernameRegex)) {
                                isValid = false;
                                input.addClass('error');
                                input.next('.err_msgs').text('Username must be 3-16 characters long and can contain letters, numbers, underscores, and hyphens.').addClass('error');//.css('color', 'red')
                            } else {
                                input.removeClass('error');
                                input.next('.err_msgs').text('').removeClass('error');
                            }
                            break;
                        case 'inputFirstName':
                        case 'inputLastName':
                        case 'inputLocation':
                            if (!value.match(nameRegex)) {
                                isValid = false;
                                input.addClass('error');
                                input.next('.err_msgs').text('Please enter a valid name.').addClass('error');
                            } else {
                                input.removeClass('error');
                                input.next('.err_msgs').text('').removeClass('error');
                            }
                            break;
                        case 'inputEmailAddress':
                            if (!value.match(emailRegex)) {
                                isValid = false;
                                input.addClass('error');
                                input.next('.err_msgs').text('Please enter a valid email address.').addClass('error');
                            } else {
                                input.removeClass('error');
                                input.next('.err_msgs').text('').removeClass('error');
                            }
                            break;
                        case 'inputPhone':
                            if (!value.match(phoneRegex)) {
                                isValid = false;
                                input.addClass('error');
                                input.next('.err_msgs').text('Please enter a valid phone number.').addClass('error') ;
                            } else {
                                input.removeClass('error');
                                input.next('.err_msgs').text('').removeClass('error');
                            }
                            break;
                        case 'inputBirthday':
                            if (!value.match(dateRegex)) {
                                isValid = false;
                                input.addClass('error');
                                input.next('.err_msgs').text('Please enter a valid date (YYYY-MM-DD).').addClass('error');
                            } else {
                                input.removeClass('error');
                                input.next('.err_msgs').text('').removeClass('error');
                            }
                            break;
                    }
                });

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
        $(document).ready(function () {
            // Function to enable editing of security input fields
            function enableSecurityEditing() {
                $('#currentPassword, #newPassword ,#confirmPassword').prop('readonly', false);
                $('#editSecurityButton').addClass('d-none');
                $('#saveSecurityButton').removeClass('d-none');
            }

            // Function to disable editing of security input fields
            function disableSecurityEditing() {
                $('#currentPassword, #newPassword ,#confirmPassword').prop('readonly', true);
                $('#editSecurityButton').removeClass('d-none');
                $('#saveSecurityButton').addClass('d-none');
            }
            // Regular expression for password validation
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

            // Function to validate password fields
            function validatePasswords() {
                var isValid = true;

                // Validate Current Password
                var currentPassword = $('#currentPassword').val();
                var realpassword = '<%=profile["admin_password"].ToString()%>';
                if (currentPassword !== realpassword) {
                    $('#currentPassword').addClass('error');
                    $('#currentpass_lb').text('Please enter your current password.').addClass('error');
                    isValid = false;
                } else {
                    $('#currentPassword').removeClass('error');
                    $('#currentpass_lb').text('').removeClass('error');
                }

                // Validate New Password
                var newPassword = $('#newPassword').val();
                if (!newPassword.match(passwordRegex)) {
                    $('#newPassword').addClass('error');
                    $('#newpass_lb').text('Your password must contain at least one lowercase letter, one uppercase letter, one digit, and be at least 8 characters long.').addClass('error');
                    isValid = false;
                } else {
                    $('#newPassword').removeClass('error');
                    $('#newpass_lb').text('').removeClass('error');
                }

                // Validate Confirm Password
                var confirmPassword = $('#confirmPassword').val();
                if (confirmPassword !== newPassword) {
                    $('#confirmPassword').addClass('error');
                    $('#confirmpass_lb').text('Passwords do not match.').addClass('error');
                    isValid = false;
                } else {
                    $('#confirmPassword').removeClass('error');
                    $('#confirmpass_lb').text('').removeClass('error');
                }

                return isValid;
            }
        
            

            // Initially, disable editing for security fields
            disableSecurityEditing();

            // When the "Edit Security" button is clicked, enable editing for security fields
            $('#editSecurityButton').click(function () {
                enableSecurityEditing();
            });

            // When the "Save Security" button is clicked, disable editing for security fields
            $('#saveSecurityButton').click(function () {

                /*disableSecurityEditing();*/
                if (validatePasswords()) {
                    
                    // You can add code here to handle saving security changes
                    get("AdminHeaderContent_saveSecurityButtonHidden").click();
                    disableSecurityEditing();
                }
                // You can add code here to handle saving security changes
            });
        });
       


    </script>
  
</asp:Content>

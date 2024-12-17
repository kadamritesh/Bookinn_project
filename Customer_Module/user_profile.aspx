<%@ Page Language="C#" MasterPageFile="~/Customer_Module/Site1.Master" AutoEventWireup="true" CodeBehind="user_profile.aspx.cs" Inherits="BookInn.Customer_Module.user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserHeaderContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
        <style type="text/css">
    	 body{
            background: #f5f5f5;
            margin-top:20px;
        }

        .ui-w-80 {
            width: 80px !important;
            height: auto;
        }

        .btn-default {
            border-color: rgba(24,28,33,0.1);
            background: rgba(0,0,0,0);
            color: #4E5155;
        }

        label.btn {
            margin-bottom: 0;
        }

        .btn-outline-primary {
            border-color: #dfa974;
            background: transparent;
            color: #dfa974;
        }

        .btn {
            cursor: pointer;
        }

        .text-light {
            color: #babbbc !important;
        }

        .btn-facebook {
            border-color: rgba(0,0,0,0);
            background: #3B5998;
            color: #fff;
        }

        .btn-instagram {
            border-color: rgba(0,0,0,0);
            background: #000;
            color: #fff;
        }

        .card {
            background-clip: padding-box;
            box-shadow: 0 1px 4px rgba(24,28,33,0.012);
        }

        .row-bordered {
            overflow: hidden;
        }

        .account-settings-fileinput {
            position: absolute;
            visibility: hidden;
            width: 1px;
            height: 1px;
            opacity: 0;
        }
            .btn-outline-primary:hover {
                color: #fff;
                background-color: #dfa974;
                border-color: #dfa974;
            }
        .account-settings-links .list-group-item.active {
            font-weight: bold !important;
        }
        html:not(.dark-style) .account-settings-links .list-group-item.active {
            background: transparent !important;
        }
        .account-settings-multiselect ~ .select2-container {
            width: 100% !important;
        }
        .light-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }
        .light-style .account-settings-links .list-group-item.active {
            color: #4e5155 !important;
        }
        .material-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }
        .material-style .account-settings-links .list-group-item.active {
            color: #4e5155 !important;
        }
        .dark-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(255, 255, 255, 0.03) !important;
        }
        .dark-style .account-settings-links .list-group-item.active {
            color: #fff !important;
        }
        .light-style .account-settings-links .list-group-item.active {
            color: #4E5155 !important;
        }
        .light-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24,28,33,0.03) !important;
        }
            .button {
                border: none;
                float: right;
                width: 152px;
                height: 42px;
                margin-left: 30px;
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
            /*.button {
 			float: none;
 			margin-top: 30px;
}*/

            .err_msgs {
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
    <div class="container light-style flex-grow-1 container-p-y">
        <h4 class="font-weight-bold py-3 mb-4">Account settings
        </h4>
        <input type="hidden" id="ProNavClickedbtn" runat="server" value="genral" />
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">

                        <a class="list-group-item list-group-item-action " id="home" href="Index.aspx">Home</a>
                        <a class="list-group-item list-group-item-action active" id="genral" data-toggle="list" href="#account-general">Profile</a>
                        <a class="list-group-item list-group-item-action" id="change_password" data-toggle="list" href="#account-change-password">Security</a>
                        <a class="list-group-item list-group-item-action" id="acc_info" data-toggle="list" href="#account-info">Personal Infomation</a>
                        <a class="list-group-item list-group-item-action" id="view_booking" href="Viewbooking_page.aspx">View Hotels Booking</a>
                        <%--<a class="list-group-item list-group-item-action" id="connections" data-toggle="list" href="#account-connections">Connections</a>--%>
                        <%--<a class="list-group-item list-group-item-action" id="notification" data-toggle="list" href="#account-notifications">Notifications</a>--%>
                    </div>

                </div>

                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="account-general">

                            <div class="card-body media align-items-center">
                                <img src="https://mdbcdn.b-cdn.net/img/new/avatars/8.webp" alt="there is images" class="d-block ui-w-80" />

                                <div class="media-body ml-4">
                                    <label class="btn btn-outline-primary">
                                        Upload new photo
                                                 <input type="file" class="account-settings-fileinput" />
                                    </label>
                                    &nbsp;
                                            <button type="button" class="btn btn-default md-btn-flat">Reset</button>
                                    <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                </div>

                            </div>
                            <hr class="border-light m-0" />
                            <div class="card-body">
                                <div class="form-group">
                                    <label class="form-label">Username</label>
                                    <input type="text" id="username" name="username" class="form-control mb-1" value="<%=profile["username"].ToString()%>" />
                                    <%--                                <asp:TextBox ID="username"  CssClass="form-control mb-1" Text="<%=Session["UserName"].ToString() %>>" runat="server"></asp:TextBox>--%>
                                    <%--<asp:TextBox ID="user_txt" runat="server" CssClass="form-control mb-1" ></asp:TextBox>--%>
                                    <label id="username_lb" class="err_msgs"></label>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">First Name</label>
                                    <input type="text" id="fname" name="fname" class="form-control" value="<%=profile["first_name"].ToString()%>" />
                                    <label id="fname_lb" class="err_msgs"></label>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Last Name</label>
                                    <input type="text" id="lname" name="lname" class="form-control" value="<%=profile["last_name"].ToString()%>" />
                                    <label id="lname_lb" class="err_msgs"></label>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">E-mail</label>
                                    <input type="text" id="email" name="email" class="form-control mb-1" value="<%=profile["customer_email"].ToString()%>" />
                                    <label id="email_lb" class="err_msgs"></label>
                                    <div class="alert alert-warning mt-3">
                                        Your email is not confirmed. Please check your inbox.<br />
                                        <a href="javascript:void(0)">Resend confirmation</a>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-change-password">

                            <div class="card-body pb-2">
                                <div class="form-group">
                                    <label class="form-label">Current password</label>
                                    <input type="password" id="current_pass" name="current_pass" class="form-control" />
                                    <label id="current_pass_lb" class="err_msgs"></label>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">New password</label>
                                    <input type="password" id="new_pass" name="new_pass" class="form-control" />
                                    <label id="new_pass_lb" class="err_msgs"></label>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Confirm new password</label>
                                    <input type="password" id="confirm_pass" name="confirm_pass" class="form-control" />
                                    <label id="confirm_pass_lb" class="err_msgs"></label>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-info">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                    <label class="form-label">Bio</label>
                                    <textarea class="form-control" rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
                                </div>
                                <div clsss="form-group">
                                    <label class="form-label">Birth Date</label>
                                    <input type="date" id="birthdate" name="birthdate" class="form-control mb-1" value="<%=Convert.ToDateTime(profile["birthdate"]).ToString("yyyy-MM-dd") %>" />
                                    <label id="birthdate_lb" class="err_msgs"></label>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Location</label>
                                    <input type="text" id="location" name="location" class="form-control" value="<%=profile["customer_address"].ToString()%>" />
                                    <label id="location_lb" class="err_msgs"></label>
                                </div>

                            </div>
                            <hr class="border-light m-0" />
                            <div class="card-body pb-2">
                                <h6 class="mb-4">Contacts</h6>
                                <div class="form-group">
                                    <label class="form-label">Phone</label>
                                    <input type="text" id="phone" name="phone" class="form-control" value="<%=profile["customer_phone"].ToString()%>" />
                                    <label id="phone_lb" class="err_msgs"></label>
                                </div>
                            </div>
                        </div>
                        <%-- <div class="tab-pane fade" id="account-view-booking">
                        <div class="card-body pb-2">
                            <div class="form-group">
                                <label class="form-label">Hotel Name</label>
                                <input type="text" class="form-control" id="hotelName" value="Sample Hotel" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Hotel Address</label>
                                <input type="text" class="form-control" id="hotelAddress" value="123 Main Street" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Room Category</label>
                                <input type="text" class="form-control" id="roomCategory" value="Standard" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Check-In Date</label>
                                <input type="date" class="form-control" id="checkInDate" value="2024-05-15" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Check-Out Date</label>
                                <input type="date" class="form-control" id="checkOutDate" value="2024-05-20" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Adults</label>
                                <input type="number" class="form-control" id="adults" value="2" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Children</label>
                                <input type="number" class="form-control" id="children" value="1" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Number Of Rooms</label>
                                <input type="number" class="form-control" id="numRooms" value="1" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Total Bill</label>
                                <input type="number" class="form-control" id="totalBill" value="500" />
                            </div>

                        </div>
                        
                    </div>
                    <asp:Button ID="cancelreservation_bt" runat="server" Text="Cancellation" />--%>
                    </div>
                    <%--    <div class="tab-pane fade" id="account-connections">
                        <div class="card-body">
                            <button type="button" class="btn btn-twitter">Connect to <strong>Twitter</strong></button>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body">
                            <h5 class="mb-2">
                                <a href="javascript:void(0)" class="float-right text-muted text-tiny"><i class="ion ion-md-close"></i>Remove</a>
                                <i class="ion ion-logo-google text-google"></i>
                                You are connected to Google:
                            </h5>
                            <a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="cca2a1adb4bba9a0a08ca1ada5a0e2afa3a1">[email&#160;protected]</a>
                        </div>
                        <hr class="border-light m-0"/>
                        <div class="card-body">
                            <button type="button" class="btn btn-facebook">Connect to <strong>Facebook</strong></button>
                        </div>
                        <hr class="border-light m-0"/>
                        <div class="card-body">
                            <button type="button" class="btn btn-instagram">Connect to <strong>Instagram</strong></button>
                        </div>
                    </div>--%>
                    <%--<div class="tab-pane fade" id="account-notifications">
                        <div class="card-body pb-2">
                            <h6 class="mb-4">Activity</h6>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked/>
                                    <span class="switcher-indicator">
                                        <span class="switcher-yes"></span>
                                        <span class="switcher-no"></span>
                                    </span>
                                    <span class="switcher-label">Email me when someone comments on my article</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked/>
                                    <span class="switcher-indicator">
                                        <span class="switcher-yes"></span>
                                        <span class="switcher-no"></span>
                                    </span>
                                    <span class="switcher-label">Email me when someone answers on my forum thread</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input"/>
                                    <span class="switcher-indicator">
                                        <span class="switcher-yes"></span>
                                        <span class="switcher-no"></span>
                                    </span>
                                    <span class="switcher-label">Email me when someone follows me</span>
                                </label>
                            </div>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body pb-2">
                            <h6 class="mb-4">Application</h6>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked/>
                                    <span class="switcher-indicator">
                                        <span class="switcher-yes"></span>
                                        <span class="switcher-no"></span>
                                    </span>
                                    <span class="switcher-label">News and announcements</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input"/>
                                    <span class="switcher-indicator">
                                        <span class="switcher-yes"></span>
                                        <span class="switcher-no"></span>
                                    </span>
                                    <span class="switcher-label">Weekly product updates</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked/>
                                    <span class="switcher-indicator">
                                        <span class="switcher-yes"></span>
                                        <span class="switcher-no"></span>
                                    </span>
                                    <span class="switcher-label">Weekly blog digest</span>
                                </label>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
            <div class="text-right mt-3">

                <%--asp:Button ID="update_bt" class="button" Text="Update Profile" runat="server" />--%>
                <button type="button" class="button" id="updatePro">Update Profile</button>
                &nbsp;
                    <div style="display: none;">
                        <asp:Button ID="updatePro_hidden" runat="server" OnClick="updatePro_hidden_Click" />
                    </div>
                <button type="button" class="btn btn-default">Cancel</button>
            </div>

            <br />
            <br />
        </div>
    </div>
    
 



    <%--<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>--%>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript"></script>

     <script>
         //// Function to disable all input fields within the specified div
         //function disableInputFields() {
         //    // Get the div element by its ID
         //    var bookingDiv = document.getElementById('account-view-booking');

         //    // Get all input elements within the div
         //    var inputFields = bookingDiv.getElementsByTagName('input');

         //    // Loop through each input element and disable it
         //    for (var i = 0; i < inputFields.length; i++) {
         //        inputFields[i].setAttribute('readonly', 'readonly'); // Set readonly attribute
         //        inputFields[i].setAttribute('disabled', 'disabled'); // Set disabled attribute for styling purposes
         //    }
         //}

         //// Call the function to disable input fields when the page loads
         //window.onload = function () {
         //    disableInputFields();
         //};

         function get(ID) { return document.getElementById(ID); }

         get("genral").onclick = function () {
             get("UserHeaderContent_ProNavClickedbtn").value = "genral";
         }
         get("change_password").onclick = function () {
             get("UserHeaderContent_ProNavClickedbtn").value = "change_password";
         }
         get("acc_info").onclick = function () {
             get("UserHeaderContent_ProNavClickedbtn").value = "acc_info";
         }
         // Wait for the document to be ready
         $(document).ready(function () {
             // Find the element with id "view_booking" and attach a click event handler
             $("#view_booking").click(function (event) {
                 // Prevent the default action of the link (i.e., following the href)
                 event.preventDefault();
                 // Get the value of the "href" attribute
                 var url = $(this).attr("href");
                 // Redirect the user to the specified URL
                 window.location.href = url;
             });
         });
          
         get("updatePro").onclick = function () {
             if (get("UserHeaderContent_ProNavClickedbtn").value == "genral") {
                 let isUserNameValid = validate("username", /^.{0,}$/, "Invalid!", true);
                 let isfnameValid = validate("fname", /^[A-Za-z]{0,}$/, "Invalid!", true);
                 let islnameValid = validate("lname", /^[A-Za-z]{0,}$/, "Ivnalid!", true);
                 let isemailValid = validate("email", /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/, "Invalid!", true);
                 
                 if (isUserNameValid && isfnameValid && islnameValid && isemailValid) {
                     
                     get("UserHeaderContent_updatePro_hidden").click();
                 }
             }
             else if (get("UserHeaderContent_ProNavClickedbtn").value == "change_password") {
                 
                 let iscurrentpasswordvaild = false;
                 if (get("current_pass").value == "<%=Session["Password"]%>") {

                     get("current_pass").style.border = "1px solid #ced4da";
                     iscurrentpasswordvaild = true;
                 } else {
                     get("current_pass").style.border = "1px solid red" ;
                     iscurrentpasswordvaild = false;
                 }

                 let ispasswordvaild = validate("new_pass", /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/, "Your password must contain at least one lowercase letter, one uppercase letter, one digit, and be at least 8 characters long.", true);
                 let iscomfirmpasswordvaild = false;

                 if (get("new_pass").value == get("confirm_pass").value) {
                     get("confirm_pass").style.border = "1px solid #ced4da";
                     iscomfirmpasswordvaild = true;
                 }
                 else {
                     get("confirm_pass").style.border = "1px solid red";
                     iscomfirmpasswordvaild = false;
                 }



                 if (iscurrentpasswordvaild && ispasswordvaild && iscomfirmpasswordvaild) {

                     get("UserHeaderContent_updatePro_hidden").click();
                 }

             }
             else if (get("UserHeaderContent_ProNavClickedbtn").value = "acc_info") {

                 let isbirthdateValid = validate("birthdate", /^\d{4}-\d{2}-\d{2}$/, "Invalid syntax", true)
                 let islocationValid = validate("location", /^[a-zA-Z0-9\s,.'-]{3,}$/, "Invalid!", true);
                 let isphone = validate("phone", /^[0-9]{10}$/, "Invalid", true);

                 if (isbirthdateValid && islocationValid && isphone) {
                     get("UserHeaderContent_updatePro_hidden").click();
                 }
             }


         }

         //Your password must contain at least one lowercase letter, one uppercase letter, one digit, and be at least 8 characters long.

         function validate(fieldid, regx, message, isRequired = false) {

             field = get(fieldid);
             console.log(field.value);
             if (field.value == "" && isRequired) {
                 get(fieldid + "_lb").innerHTML = "Required!";
                 field.style = "border: 1px solid red;";
                 return false;
             } else if (regx.test(field.value)) {
                 get(fieldid + "_lb").innerHTML = "";
                 field.style = "border: 1px solid gray;";
                 return true;
             } else {
                 get(fieldid + "_lb").innerHTML = message;
                 field.style = "border:1px solid  red;";
                 return false;
             }
         }


         
     </script>

</asp:Content>
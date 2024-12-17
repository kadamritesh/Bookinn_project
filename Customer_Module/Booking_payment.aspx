<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking_payment.aspx.cs" Inherits="BookInn.Customer_Module.Booking_payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif
    }

    .container {
        margin: 30px auto;
    }

        .container .card {
            width: 100%;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background: #fff;
            border-radius: 0px;
        }

    body {
        background: #eee
    }



    .btn.btn-primary {
        background-color: #ddd;
        color: black;
        box-shadow: none;
        border: none;
        font-size: 20px;
        width: 100%;
        height: 100%;
    }

        .btn.btn-primary:focus {
            box-shadow: none;
        }

    .container .card .img-box {
        width: 80px;
        height: 50px;
    }

    .container .card img {
        width: 100%;
        object-fit: fill;
    }

    .container .card .number {
        font-size: 24px;
    }

    .container .card-body .btn.btn-primary .fab.fa-cc-paypal {
        font-size: 32px;
        color: #3333f7;
    }

    .fab.fa-cc-amex {
        color: #1c6acf;
        font-size: 32px;
    }

    .fab.fa-cc-mastercard {
        font-size: 32px;
        color: red;
    }

    .fab.fa-cc-discover {
        font-size: 32px;
        color: orange;
    }

    .c-green {
        color: green;
    }

    .box {
        height: 40px;
        width: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #ddd;
    }

    .btn.btn-primary.payment {
        background-color: #FF9800;
        color: white;
        border-radius: 10px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 24px;
    }


    .form__div {
        height: 50px;
        position: relative;
        margin-bottom: 24px;
    }

    .form-control {
        width: 100%;
        height: 45px;
        font-size: 14px;
        border: 1px solid #DADCE0;
        border-radius: 0;
        outline: none;
        padding: 2px;
        background: none;
        z-index: 1;
        box-shadow: none;
    }

    .form__label {
        position: absolute;
        left: 16px;
        top: 10px;
        background-color: #fff;
        color: #80868B;
        font-size: 16px;
        transition: .3s;
        text-transform: uppercase;
    }

    .form-control:focus + .form__label {
        top: -8px;
        left: 12px;
        color:  #333333;
        font-size: 12px;
        font-weight: 500;
        z-index: 10;
    }

    .form-control:not(:placeholder-shown).form-control:not(:focus) + .form__label {
        top: -8px;
        left: 12px;
        font-size: 12px;
        font-weight: 500;
        z-index: 10;
    }

    .form-control:focus {
        border: 1.5px solid #9b99a1;
        box-shadow: none;
    }
    .btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show > .btn-primary.dropdown-toggle {
        color: #fff;
        background-color: #FF9800;
        border-color: #FFA726;
    }
    .error{
        color: #f43434;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-lg-0 mb-3">
                <div class="card p-3">
                    <div class="img-box">
                        <img src="https://www.freepnglogos.com/uploads/visa-logo-download-png-21.png" alt="" />
                    </div>
                    <div class="number">
                        <label class="fw-bold" for="">**** **** **** 1060</label>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                       <%-- <small><span class="fw-bold">Expiry date:</span><span>10/16</span></small>
                        <small><span class="fw-bold">Name:</span><span>Kumar</span></small>--%>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-lg-0 mb-3">
                <div class="card p-3">
                    <div class="img-box">
                        <img src="https://www.freepnglogos.com/uploads/mastercard-png/file-mastercard-logo-svg-wikimedia-commons-4.png" alt="" />

                    </div>
                    <div class="number">
                        <label class="fw-bold">**** **** **** 1060</label>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                       <%-- <small><span class="fw-bold">Expiry date:</span><span>10/16</span></small>
                        <small><span class="fw-bold">Name:</span><span>Kumar</span></small>--%>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-lg-0 mb-3">
                <div class="card p-3">
                    <div class="img-box">
                        <img src="https://www.freepnglogos.com/uploads/discover-png-logo/credit-cards-discover-png-logo-4.png" alt="" />

                    </div>
                    <div class="number">
                        <label class="fw-bold">**** **** **** 1060</label>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                        <%--<small><span class="fw-bold">Expiry date:</span><span>10/16</span></small>
                        <small><span class="fw-bold">Name:</span><span>Kumar</span></small>--%>
                    </div>
                </div>
            </div>
            <div class="col-12 mt-4">
                <div class="card p-3">
                    <p class="mb-0 fw-bold h4">BOOKINN</p>
                </div>
            </div>
            <div class="col-12">
                <div class="card p-3">
                    <div class="card-body border p-0">
                        <p>
                            <a id="paypalBtn" class="btn btn-primary w-100 h-100 d-flex align-items-center justify-content-between"
                                data-bs-toggle="collapse" href="#paypalCollapse" role="button" aria-expanded="false"
                                aria-controls="paypalCollapse">
                                <span class="fw-bold">PayPal</span>
                                <span class="fab fa-cc-paypal"></span>
                            </a>
                        </p>
                        <div class="collapse p-3 pt-0" id="paypalCollapse">
                            <div class="row">
                                <div class="col-8">
                                    <p class="h4 mb-0">Payment Gateway</p>
                                    <p class="mb-0">
                                        <% 
                                            // Retrieve hotel name from session
                                            string hotelName = Session["HotelName"] != null ? Session["HotelName"].ToString() : "";

                                            // Render HTML with hotel name
                                        %>
                                        <span class="fw-bold">Pay:</span><span class="c-green"><%= hotelName %></span>
                                    </p>
                                    <p class="mb-0">
                                        <% 
                                            // Retrieve payment bill amount from session
                                            decimal paymentBill = Session["PaymentBill"] != null ? Convert.ToDecimal(Session["PaymentBill"]) : 0.0m;

                                            // Render HTML with payment bill amount
                                        %>
                                        <span class="fw-bold">Total Bill:</span><span
                                            class="c-green"><%= paymentBill.ToString("C") %></span>
                                    </p>
                                    <div style="font-family: 'Arial Black', sans-serif; font-size: 14px; color: #333;">
                                        <p class="mb-0">

                                            <strong>Unlock Your Dream Stay:</strong> Where Booking Bliss Meets Secure Payments!".                                            
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="card-body border p-0">
                        <p>
                            <a id="creditCardBtn" class="btn btn-primary p-2 w-100 h-100 d-flex align-items-center justify-content-between"
                                data-bs-toggle="collapse" href="#creditCardCollapse" role="button" aria-expanded="false"
                                aria-controls="creditCardCollapse">
                                <span class="fw-bold">Debit Card</span>
                                <span class="">
                                    <span class="fab fa-cc-amex"></span>
                                    <span class="fab fa-cc-mastercard"></span>
                                    <span class="fab fa-cc-discover"></span>
                                </span>
                            </a>
                        </p>
                        <div class="collapse show p-3 pt-0" id="creditCardCollapse">
                            <div class="row">
                                <div class="col-lg-5 mb-lg-0 mb-3">
                                    <p class="h4 mb-0">Payment Gateway</p>
                                    <p class="mb-0">
                                        <span class="fw-bold">Pay:</span><span class="c-green">:<%= hotelName %></span>
                                    </p>
                                    <p class="mb-0">
                                        <span class="fw-bold">Total Bill:</span>
                                        <span class="c-green">:<%= paymentBill.ToString("C") %></span>
                                    </p>
                                    <div style="font-family: 'Arial Black', sans-serif; font-size: 14px; color: #333;">
                                        <p class="mb-0">

                                            <strong>Secure, Swift, Seamless:</strong> Elevate Your Booking Experience with Our Trusted Payment Gateway!"                                             
                                        </p>
                                    </div>

                                </div>
                                <div class="col-lg-7">
                                    <form id="form1" class="form" runat="server">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form__div">
                                                    <%--<input type="text" class="form-control" placeholder=" "/>
                                                <label for="" class="form__label">Card Number</label>--%>
                                                    <asp:TextBox ID="cardNumber" runat="server" CssClass="form-control" placeholder="" />
                                                    <label for="" class="form__label">Card Number</label>
                                                    <small class="error" id="cardNumberError"></small>

                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__div">
                                                    <%--<input type="text" class="form-control" placeholder=" "/>
                                                <label for="" class="form__label">MM / yy</label>--%>
                                                    <asp:TextBox ID="expiry" runat="server" CssClass="form-control" placeholder=" " />
                                                    <label for="" class="form__label">MM / YY</label>
                                                    <small class="error" id="expiryError"></small>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__div">
                                                    <%--<input type="password" class="form-control" placeholder=" "/>
                                                <label for="" class="form__label">cvv code</label>--%>
                                                    <asp:TextBox ID="cvv" runat="server" TextMode="Password" CssClass="form-control" placeholder=" " />
                                                    <label for="" class="form__label">CVV code</label>
                                                    <small class="error" id="cvvError"></small>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form__div">
                                                    <%--<input type="text" class="form-control" placeholder=" "/>
                                                <label for="" class="form__label">name on the card</label>--%>
                                                    <asp:TextBox ID="cardName" runat="server" CssClass="form-control" placeholder=" " />
                                                    <label for="" class="form__label">Name on the card</label>
                                                    <small class="error" id="nameError"></small>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <%--<div class="btn btn-primary w-100">Sumbit</div>--%>
                                                <asp:Button ID="submitButton" runat="server" CssClass="btn btn-primary w-100" Text="Submit" OnClick="submitButton_Click" OnClientClick="return validateForm();" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="btn btn-primary payment">
                    Make Payment
                </div>
            </div>
        </div>
    </div>
      
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>





    <script>
// JavaScript code for handling button clicks and toggling payment details
    document.addEventListener('DOMContentLoaded', function () {
        const paypalBtn = document.getElementById('paypalBtn');
        const creditCardBtn = document.getElementById('creditCardBtn');
        const paypalCollapse = document.getElementById('paypalCollapse');
        const creditCardCollapse = document.getElementById('creditCardCollapse');

        // Show PayPal details, hide Credit Card details
        paypalBtn.addEventListener('click', function () {
            paypalCollapse.classList.add('show');
            creditCardCollapse.classList.remove('show');
        });

        // Show Credit Card details, hide PayPal details
        creditCardBtn.addEventListener('click', function () {
            creditCardCollapse.classList.add('show');
            paypalCollapse.classList.remove('show');
        });
    });

    // Function to validate card number
    function validateCardNumber() {
        var cardNumber = document.getElementById('<%= cardNumber.ClientID %>').value;
        var cardNumberRegex = /^[0-9]{16}$/; // Regex for 16-digit card number
        return cardNumberRegex.test(cardNumber);
    }

    // Function to validate expiry date
    function validateExpiry() {
        var expiry = document.getElementById('<%= expiry.ClientID %>').value;
        var expiryRegex = /^(0[1-9]|1[0-2])\/[2-9][0-9]$/; // Regex for MM/YY format (MM: 01-12, YY: 20-99)
        return expiryRegex.test(expiry);
    }

    // Function to validate CVV
    function validateCVV() {
        var cvv = document.getElementById('<%= cvv.ClientID %>').value;
        var cvvRegex = /^[0-9]{3,4}$/; // Regex for 3 or 4-digit CVV
        return cvvRegex.test(cvv);
    }

    // Function to validate card holder's name
    function validateCardName() {
        var cardName = document.getElementById('<%= cardName.ClientID %>').value;
    var cardNameRegex = /^[a-zA-Z\s]+$/; // Regex for only alphabets and spaces
    return cardNameRegex.test(cardName);
}

    // Function to check all fields validity
    function validateForm() {
        var isCardNumberValid = validateCardNumber();
        var isExpiryValid = validateExpiry();
        var isCVVValid = validateCVV();
        var isCardNameValid = validateCardName();

        if (!isCardNumberValid) {
            document.getElementById('cardNumberError').innerText = "enter a valid 16-digit card number.";
        } else {
            document.getElementById('cardNumberError').innerText = "";
        }

        if (!isExpiryValid) {
            document.getElementById('expiryError').innerText = "enter a valid expiry date in MM/YY format.";
        } else {
            document.getElementById('expiryError').innerText = "";
        }

        if (!isCVVValid) {
            document.getElementById('cvvError').innerText = "enter a valid 3 or 4-digit CVV code.";
        } else {
            document.getElementById('cvvError').innerText = "";
        }

        if (!isCardNameValid) {
            document.getElementById('nameError').innerText = "enter a valid name on the card (only alphabets and spaces).";
        } else {
            document.getElementById('nameError').innerText = "";
        }

        // Check if all fields are valid
        if (isCardNumberValid && isExpiryValid && isCVVValid && isCardNameValid) {
            return true; // Form submission allowed
        } else {
            var errorMessage = "Please Field your correct card data";
            alert(errorMessage); // Display error message
            return false; // Prevent form submission
        }
    }

    </script>
</body>
</html>

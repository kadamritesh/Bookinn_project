<%@ Page Language="C#" MasterPageFile="~/Customer_Module/Site1.Master" AutoEventWireup="true" CodeBehind="Hotel_details.aspx.cs" Inherits="BookInn.Customer_Module.Hotel_details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="UserMainContent" runat="server">
    <!-- Include Flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
    
   
   

    <!-- Include Flatpickr JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <style>
        /*---------------------
                  Breadcrumb Section
                -----------------------*/

        .breadcrumb-section {
            padding-top: 70px;
            padding-bottom: 80px;
        }

        .breadcrumb-text {
            text-align: center;
        }

            .breadcrumb-text h2 {
                font-size: 44px;
                color: #19191a;
                margin-bottom: 12px;
            }

            .breadcrumb-text .bt-option a {
                display: inline-block;
                font-size: 18px;
                color: #19191a;
                margin-right: 20px;
                position: relative;
                font-weight: 500;
            }

                .breadcrumb-text .bt-option a:after {
                    position: absolute;
                    right: -13px;
                    top: 1px;
                    content: ">";
                    font-size: 18px;
                    font-family: "FontAwesome";
                    color: #aaaab3;
                }

            .breadcrumb-text .bt-option span {
                display: inline-block;
                font-size: 18px;
                color: #aaaab3;
            }

        .btn-outline-success {
            --bs-btn-color: #dfa974;
            --bs-btn-border-color: #dfa974;
            --bs-btn-hover-color: #fff;
            --bs-btn-hover-bg: #dfa974;
            --bs-btn-hover-border-color: #dfa974;
            --bs-btn-focus-shadow-rgb: 25, 135, 84;
            --bs-btn-active-color: #fff;
            --bs-btn-active-bg: #dfa974;
            --bs-btn-active-border-color: #dfa974;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #dfa974;
            --bs-btn-disabled-bg: transparent;
            --bs-btn-disabled-border-color: #dfa974;
            --bs-gradient: none;
        }

        /*-----------------------
  Room Details Section
-------------------------*/

        .room-details-section {
            padding-top: 0;
            padding-bottom: 80px;
        }

        .room-details-item {
            margin-bottom: 50px;
        }

            .room-details-item img {
                margin-bottom: 40px;
            }

            .room-details-item .rd-text .rd-title {
                overflow: hidden;
                margin-bottom: 8px;
            }

                .room-details-item .rd-text .rd-title h3 {
                    color: #19191a;
                    float: left;
                }

                .room-details-item .rd-text .rd-title .rdt-right {
                    float: right;
                    text-align: right;
                }

                    .room-details-item .rd-text .rd-title .rdt-right .rating {
                        display: inline-block;
                        margin-right: 25px;
                        margin-bottom: 10px;
                    }

                        .room-details-item .rd-text .rd-title .rdt-right .rating i {
                            color: #f5b917;
                        }

                    .room-details-item .rd-text .rd-title .rdt-right a {
                        display: inline-block;
                        color: #ffffff;
                        font-size: 13px;
                        text-transform: uppercase;
                        font-weight: 700;
                        background: #dfa974;
                        padding: 14px 28px 13px;
                    }

            .room-details-item .rd-text h2 {
                color: #dfa974;
                font-weight: 700;
                margin-bottom: 25px;
            }

                .room-details-item .rd-text h2 span {
                    font-family: "Cabin", sans-serif;
                    font-size: 16px;
                    font-weight: 400;
                    color: #19191a;
                }

            .room-details-item .rd-text table {
                margin-bottom: 32px;
            }

                .room-details-item .rd-text table tbody tr td {
                    font-size: 16px;
                    color: #19191a;
                    line-height: 36px;
                }

                    .room-details-item .rd-text table tbody tr td.r-o {
                        width: 120px;
                        color: #707079;
                    }

            .room-details-item .rd-text p {
                color: #707079;
            }

                .room-details-item .rd-text p.f-para {
                    margin-bottom: 22px;
                }

        .rd-reviews {
            padding-top: 55px;
            border-top: 1px solid #e5e5e5;
            margin-bottom: 50px;
        }

            .rd-reviews h4 {
                color: #19191a;
                letter-spacing: 1px;
                margin-bottom: 45px;
            }

            .rd-reviews .review-item {
                margin-bottom: 32px;
            }

                .rd-reviews .review-item .ri-pic {
                    float: left;
                    margin-right: 30px;
                }

                    .rd-reviews .review-item .ri-pic img {
                        height: 70px;
                        width: 70px;
                        border-radius: 50%;
                    }

                .rd-reviews .review-item .ri-text {
                    overflow: hidden;
                    position: relative;
                    padding-left: 30px;
                }

                    .rd-reviews .review-item .ri-text:before {
                        position: absolute;
                        left: 0;
                        top: 0;
                        width: 1px;
                        height: 100%;
                        background: #e9e9e9;
                        content: "";
                    }

                    .rd-reviews .review-item .ri-text span {
                        font-size: 12px;
                        color: #dfa974;
                        text-transform: uppercase;
                        letter-spacing: 3px;
                    }

                    .rd-reviews .review-item .ri-text .rating {
                        position: absolute;
                        right: 0;
                        top: 0;
                    }

                        .rd-reviews .review-item .ri-text .rating i {
                            color: #f5b917;
                        }

                    .rd-reviews .review-item .ri-text h5 {
                        color: #19191a;
                        margin-top: 4px;
                        margin-bottom: 8px;
                    }

                    .rd-reviews .review-item .ri-text p {
                        color: #707079;
                        margin-bottom: 0;
                    }

        .review-add h4 {
            color: #19191a;
            letter-spacing: 1px;
            margin-bottom: 45px;
        }

        .review-add .ra-form input {
            width: 100%;
            height: 50px;
            border: 1px solid #e5e5e5;
            font-size: 16px;
            color: #282828;
            padding-left: 20px;
            margin-bottom: 25px;
        }

            .review-add .ra-form input::-webkit-input-placeholder {
                color: #aaaab3;
            }

            .review-add .ra-form input::-moz-placeholder {
                color: #aaaab3;
            }

            .review-add .ra-form input:-ms-input-placeholder {
                color: #aaaab3;
            }

            .review-add .ra-form input::-ms-input-placeholder {
                color: #aaaab3;
            }

            .review-add .ra-form input::placeholder {
                color: #aaaab3;
            }

        .review-add .ra-form h5 {
            font-size: 20px;
            color: #19191a;
            margin-bottom: 24px;
            float: left;
            margin-right: 10px;
        }

        .review-add .ra-form .rating {
            padding-top: 3px;
            display: inline-block;
        }

            .review-add .ra-form .rating i {
                color: #f5b917;
                font-size: 16px;
            }

        .review-add .ra-form textarea {
            width: 100%;
            height: 132px;
            border: 1px solid #e5e5e5;
            font-size: 16px;
            color: #282828;
            padding-left: 20px;
            padding-top: 12px;
            margin-bottom: 24px;
            resize: none;
        }

            .review-add .ra-form textarea::-webkit-input-placeholder {
                color: #aaaab3;
            }

            .review-add .ra-form textarea::-moz-placeholder {
                color: #aaaab3;
            }

            .review-add .ra-form textarea:-ms-input-placeholder {
                color: #aaaab3;
            }

            .review-add .ra-form textarea::-ms-input-placeholder {
                color: #aaaab3;
            }

            .review-add .ra-form textarea::placeholder {
                color: #aaaab3;
            }

        .review-add .ra-form button {
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            color: #ffffff;
            letter-spacing: 2px;
            background: #dfa974;
            border: none;
            padding: 14px 34px 13px;
            display: inline-block;
        }

        .room-booking {
            padding: 0 30px 0 40px;
        }

            .room-booking h3 {
                color: #19191a;
                margin-bottom: 30px;
            }

            .room-booking div .check-date {
                position: relative;
                margin-bottom: 15px;
            }

                .room-booking div .check-date label {
                    font-size: 14px;
                    color: #707079;
                    display: block;
                    margin-bottom: 10px;
                }

                .room-booking div .check-date input {
                    width: 100%;
                    height: 50px;
                    border: 1px solid #ebebeb;
                    border-radius: 2px;
                    font-size: 16px;
                    color: #19191a;
                    text-transform: uppercase;
                    font-weight: 500;
                    padding-left: 20px;
                }

                .room-booking div .check-date i {
                    color: #dfa974;
                    position: absolute;
                    right: 18px;
                    bottom: 17px;
                }

            .room-booking div .select-option {
                margin-bottom: 15px;
            }

                .room-booking div .select-option label {
                    font-size: 14px;
                    color: #707079;
                    display: block;
                    margin-bottom: 10px;
                }

                .room-booking div .select-option .nice-select {
                    border-radius: 2px;
                    border: 1px solid #ebebeb;
                    height: 50px;
                    line-height: 50px;
                    outline: none;
                    padding-left: 20px;
                    width: 100%;
                    float: none;
                }

                    .room-booking div .select-option .nice-select:after {
                        border-bottom: 2px solid #dfa974;
                        border-right: 2px solid #dfa974;
                        height: 10px;
                        margin-top: 0;
                        right: 20px;
                        width: 10px;
                        top: 36%;
                    }

                    .room-booking div .select-option .nice-select span {
                        font-size: 16px;
                        color: #19191a;
                        text-transform: uppercase;
                        font-weight: 500;
                    }

                    .room-booking div .select-option .nice-select .list {
                        margin-top: 0;
                        width: 100%;
                    }

            .room-booking div button {
                display: block;
                font-size: 14px;
                text-transform: uppercase;
                border: 1px solid #dfa974;
                border-radius: 2px;
                color: #dfa974;
                font-weight: 500;
                background: transparent;
                width: 100%;
                height: 46px;
                margin-top: 30px;
            }

        .hotel-facilities {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .facility {
            background-color: #f2f2f2;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
            width: fit-content;
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
            .btn-primary:hover {
                background-color: #d18b3e;
            }
        .btn-check:checked + .btn, .btn.active, .btn.show, .btn:first-child:active, :not(.btn-check) + .btn:active {
            color: var(--bs-btn-active-color);
            background-color: #dfa974;
            border-color: #dfa974;
        }
    </style>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Our Hotels</h2>
                        <div class="bt-option">
                            <a href="Index.aspx" style="text-decoration:none">Home</a>
                            <span>Hotels</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
    <%--<div>
     <h2>Hotel Details</h2>
     <div>
         <asp:Label ID="lblHotelName" runat="server" Text="Hotel Name:"></asp:Label>
         <asp:Label ID="lblHotelNameValue" runat="server"></asp:Label>
     </div>
 </div>--%>
    <!-- Room Details Section Begin -->
    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="room-details-item">
                        <%--<img src="../img/room/room-details.jpg" alt=""/>--%>
                        <asp:Image ID="hotelImage" runat="server" />
                        <div class="rd-text">
                            <div class="rd-title">
                                <h3 id="hotelname_lb" runat="server"></h3>
                                <div class="rdt-right">
                                    <div class="rating">
                                        <i class="bi bi-star-fill">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg></i>
                                        <i class="bi bi-star-fill">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg></i>
                                        <i class="bi bi-star-fill">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg></i>
                                        <i class="bi bi-star-fill">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg></i>

                                        <i class="bi bi-star-fill">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg></i>
                                    </div>
                                    <a href="#" id="booking-link" style="text-decoration:none">Booking Now</a>
                                </div>
                            </div>
                            <h2  id="startingprice_lbl" runat="server"></h2>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Location:</td>
                                        <td><asp:Label ID="location_lbl" runat="server"></asp:Label></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            <h3>Amenities</h3>
                            <div class="hotel-facilities">
                                <!-- Add a placeholder for facilities -->
                                <asp:PlaceHolder ID="facilityPlaceholder" runat="server"></asp:PlaceHolder>
                            </div><br />
                            <%--<p class="f-para">
                                Motorhome or Trailer that is the question for you. Here are some of the
                                advantages and disadvantages of both, so you will be confident when purchasing an RV.
                                When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth
                                wheeler? The advantages and disadvantages of both are studied so that you can make your
                                choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an
                                achievement of a lifetime. It can be similar to sojourning with your residence as you
                                search the various sites of our great land, America.
                            </p>
                            <p>
                                The two commonly known recreational vehicle classes are the motorized and towable.
                                Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth
                                wheel has the attraction of getting towed by a pickup or a car, thus giving the
                                adaptability of possessing transportation for you when you are parked at your campsite.
                            </p>--%>
                        </div>
                    </div>
                   
                    <div class="rd-reviews">
                        <h4>Reviews</h4>
                        <div class="review-item">
                            <div class="ri-pic">
                                <img src="../img/room/avatar/avatar-1.jpg" alt=""/>
                            </div>
                            <div class="ri-text">
                                <span>27 Aug 2019</span>
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star-half_alt"></i>
                                </div>
                                <h5>Brandon Kelley</h5>
                                <p>
                                    Neque porro qui squam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora. incidunt ut labore et dolore
                                    magnam.
                                </p>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="ri-pic">
                                <img src="../img/room/avatar/avatar-2.jpg" alt=""/>
                            </div>
                            <div class="ri-text">
                                <span>27 Aug 2019</span>
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star-half_alt"></i>
                                </div>
                                <h5>Brandon Kelley</h5>
                                <p>
                                    Neque porro qui squam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora. incidunt ut labore et dolore
                                    magnam.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="review-add">
                        <h4>Add Review</h4>
                        <div class="ra-form">
                            <div class="row">
                                <div class="col-lg-6">
                                     <asp:TextBox ID="customername_txt" runat="server" CssClass="form-control" placeholder="Name*"></asp:TextBox>
                                    <asp:Label ID="name_error" runat="server" CssClass="text-danger"></asp:Label>
                                </div>
                                <div class="col-lg-6">
                                      <asp:TextBox ID="customeremail_txt" runat="server" CssClass="form-control" placeholder="Email*"></asp:TextBox>
                                    <asp:Label ID="email_error" runat="server" CssClass="text-danger"></asp:Label>
                                </div>
                                <div class="col-lg-12">
                                    <div>
                                        <h5>You Rating:</h5>
                                        <div class="rating">
                                            <i class="bi bi-star-fill">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg></i>
                                            <i class="bi bi-star-fill">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg></i>
                                            <i class="bi bi-star-fill">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg></i>
                                            <i class="bi bi-star-fill">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg></i>

                                            <i class="bi bi-star-half">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-half" viewBox="0 0 16 16">
                                                    <path d="M5.354 5.119 7.538.792A.52.52 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.54.54 0 0 1 16 6.32a.55.55 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.5.5 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.6.6 0 0 1 .085-.302.51.51 0 0 1 .37-.245zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.56.56 0 0 1 .162-.505l2.907-2.77-4.052-.576a.53.53 0 0 1-.393-.288L8.001 2.223 8 2.226z" />
                                                </svg></i>
                                        </div>
                                    </div>
                                      <asp:TextBox ID="review_txt" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Your Review"></asp:TextBox>
                                    <asp:Label ID="review_error" runat="server" CssClass="text-danger"></asp:Label>
                                    
                                    <div class="d-grid gap-2">
                                       
                                        <button id="reviewbutton" class="btn btn-primary" type="button">Button</button>
                                        
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="room-booking">
                        <h3>Your Reservation</h3>
                        <div>
                            <div class="check-date">
                                <label for="date-in">Check In:</label>
                                <input type="text" class="date-input" id="date-in"/>
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="date-out">Check Out:</label>
                                <input type="text" class="date-input" id="date-out"/>
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="select-option">
                                <label for="guest">Guests:</label>
                                <asp:DropDownList ID="adults_dropdownlist" runat="server" CssClass="form-control">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="1">1 Adults</asp:ListItem>
                                    <asp:ListItem Value="2">2 Adults</asp:ListItem>
                                    <asp:ListItem Value="3">3 Adults</asp:ListItem>
                                    <asp:ListItem Value="4">4 Adults</asp:ListItem>
                                    <asp:ListItem Value="5">5 Adults</asp:ListItem>
                                    <asp:ListItem Value="6">6 Adults</asp:ListItem>
                                    <asp:ListItem Value="7">7 Adults</asp:ListItem>
                                </asp:DropDownList>
                                <span id="guest_error" class="error" runat="server"></span>
                               
                            </div>
                            <div class="select-option">
                                <label for="room">Room:</label>
                                <asp:DropDownList ID="rooms_dropdownlist" runat="server" CssClass="form-control">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="1">1 Room</asp:ListItem>
                                    <asp:ListItem Value="2">2 Room</asp:ListItem>
                                    <asp:ListItem Value="3">3 Room</asp:ListItem>
                                    <asp:ListItem Value="4">4 Room</asp:ListItem>
                                    <asp:ListItem Value="5">5 Room</asp:ListItem>
                                    <asp:ListItem Value="6">6 Room</asp:ListItem>
                                </asp:DropDownList>
                                <span id="room_error" class="error" runat="server"></span>
                            </div>
                            <div class="d-grid gap-2">
                                <!-- Check Availability Button -->
                                <button type="button" id="checkavailability" class="btn btn-primary">Check Availability</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Room Details Section End -->



    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Initialize Flatpickr for "Check In" input field
            flatpickr("#date-in", {
                defaultDate: "today", // Set default date to today
                minDate: "today", // Minimum date allowed is today
                dateFormat: "m-d-Y", // Date format
                onChange: function (selectedDates) {
                    // When a date is selected for "Check In", set minimum date for "Check Out"
                    if (selectedDates.length > 0) {
                        flatpickr("#date-out", {
                            defaultDate: selectedDates[0],
                            minDate: selectedDates[0], // Minimum date allowed is the selected "Check In" date
                            dateFormat: "m-d-Y" // Date format
                        });
                    }
                }
            });

            // Initialize Flatpickr for "Check Out" input field
            flatpickr("#date-out", {
                defaultDate: "today", // Set default date to today
                minDate: "today", // Minimum date allowed is today
                dateFormat: "m-d-Y", // Date format
            });


            var hotelName = '<%= hotelname_lb.InnerText %>'; // Get the hotel name using server-side code
            var bookingLink = document.getElementById('booking-link');
            bookingLink.href = "RoomSelect_page.aspx?hotelName=" + encodeURIComponent(hotelName);


            // Add event listener to the review button
            document.getElementById("reviewbutton").addEventListener("click", function () {
                // Get input values
                var name = document.getElementById("<%= customername_txt.ClientID %>").value;
                var email = document.getElementById("<%= customeremail_txt.ClientID %>").value;
                var review = document.getElementById("<%= review_txt.ClientID %>").value;

                // Clear previous error messages
                document.getElementById("<%= name_error.ClientID %>").textContent = "";
                document.getElementById("<%= email_error.ClientID %>").textContent = "";
                document.getElementById("<%= review_error.ClientID %>").textContent = "";

                var isValid = true;

                // Validate Name
                if (name.trim() === "") {
                    document.getElementById("<%= name_error.ClientID %>").textContent = "Name is required.";
                    isValid = false;
                } else if (!/^[a-zA-Z\s]+$/.test(name.trim())) {
                    document.getElementById("<%= name_error.ClientID %>").textContent = "Enter a valid name (only letters and spaces).";
                    isValid = false;
                }

                // Validate Email
                if (email.trim() === "") {
                    document.getElementById("<%= email_error.ClientID %>").textContent = "Email is required.";
                    isValid = false;
                } else if (!/\S+@\S+\.\S+/.test(email.trim())) {
                    document.getElementById("<%= email_error.ClientID %>").textContent = "Enter a valid email address.";
                    isValid = false;
                }

                // Validate Review
                if (review.trim() === "") {
                    document.getElementById("<%= review_error.ClientID %>").textContent = "Review is required.";
                    isValid = false;
                }

                if (isValid)
                {
                    // Make AJAX request to server-side method
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "Hotel_details.aspx/SaveFeedback", true);
                    xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status === 200)
                        {
                            var response = JSON.parse(xhr.responseText);
                            if (response.d === "success")
                            {
                                // Data inserted successfully
                                window.location.href = "feedbackmessage.aspx";
                            } else if (response.d === "Session expired or invalid.") {
                                // Session expired or invalid
                                alert(response.d);
                            } else {
                                // Data insertion failed
                                alert("Failed to submit feedback.");
                            }
                        }
                    };
                    var data = JSON.stringify({ customerName: name, customerEmail: email, review: review, hotelName: hotelName });
                    xhr.send(data);
                }
            });

            // Function to check availability
            function checkAvailability() {

                var rooms = document.getElementById("<%=rooms_dropdownlist.ClientID%>").value;

                // AJAX request
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'Hotel_details.aspx/CheckRoomsAvailability', true);
                xhr.setRequestHeader('Content-Type', 'application/json');

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        // Handle response
                        if (response.available) {
                            alert("Rooms are available for the selected date and quantity.");
                        } else {
                            alert("Sorry, the requested number of rooms is not available for the selected date.");
                        }
                    }
                };

                // Prepare data
                var data = JSON.stringify({ hotelName: hotelName ,rooms: rooms });
                xhr.send(data);
            }

            // Add event listener to the "Check Availability" button
            document.getElementById("checkavailability").addEventListener("click", checkAvailability);
        });
        
    </script>









</asp:Content>

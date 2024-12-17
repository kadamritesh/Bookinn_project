<%@ Page Language="C#" MasterPageFile="~/Customer_Module/Site1.Master" AutoEventWireup="true" CodeBehind="Browser.aspx.cs" Inherits="BookInn.Browser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="UserMainContent" runat="server">
    
    <style>
        
                    /*---------------------
                      Video Section
                    -----------------------*/

                    .video-section {
	                    height: 500px;
	                    padding-top: 140px;
                    }
                    .video-section .video-text {
	                    text-align: center;
                    }
                    .video-section .video-text h2 {
	                    font-size: 48px;
	                    color: #ffffff;
	                    margin-bottom: 16px;
                    }
                    .video-section .video-text p {
	                    font-size: 20px;
	                    color: #ffffff;
	                    margin-bottom: 40px;
                    }
                    .video-section .video-text .play-btn {
	                    display: inline-block;
                    }
                    /*---------------------
                      Gallery Section
                    -----------------------*/

                    .gallery-section {
	                    padding-bottom: 80px;
                    }
                    .gallery-section .section-title {
	                    margin-bottom: 38px;
                    }
                    .gallery-item {
	                    position: relative;
	                    height: 279px;
	                    margin-bottom: 20px;
	                    border-radius: 5px;
	                    position: relative;
	                    z-index: 1;
                    }
                    .gallery-item:hover:after {
	                    opacity: 1;
                    }
                    .gallery-item:hover .gi-text {
	                    opacity: 1;
                    }
                    .gallery-item:after {
	                    position: absolute;
	                    left: 0;
	                    top: 0;
	                    width: 100%;
	                    height: 100%;
	                    background: rgba(25, 25, 26, 0.3);
	                    content: "";
	                    z-index: -1;
	                    border-radius: 5px;
	                    -webkit-transition: all 0.3s;
	                    -o-transition: all 0.3s;
	                    transition: all 0.3s;
	                    opacity: 0;
                    }
                    .gallery-item.large-item {
	                    height: 576px;
                    }
                    .gallery-item .gi-text {
	                    display: -webkit-box;
	                    display: -ms-flexbox;
	                    display: flex;
	                    -webkit-box-align: center;
	                    -ms-flex-align: center;
	                    align-items: center;
	                    -webkit-box-pack: center;
	                    -ms-flex-pack: center;
	                    justify-content: center;
	                    width: 100%;
	                    height: 100%;
	                    -webkit-transition: all 0.3s;
	                    -o-transition: all 0.3s;
	                    transition: all 0.3s;
	                    opacity: 0;
                    }
                    .gallery-item .gi-text h3 {
	                    color: #ffffff;
                    }
                    /*---------------------
                      Room Section
                    -----------------------*/

                    .rooms-section {
	                    padding-top: 0;
	                    padding-bottom: 80px;
                    }
                    .room-item {
	                    margin-bottom: 30px;
                    }
                    .room-item img {
	                    min-width: 100%;
                    }
                    .room-item .ri-text {
	                    border: 1px solid #ebebeb;
	                    border-top: none;
	                    padding: 24px 24px 30px 28px;
                    }
                    .room-item .ri-text h4 {
	                    color: #19191a;
	                    margin-bottom: 17px;
                    }
                    .room-item .ri-text h3 {
	                    color: #dfa974;
	                    font-weight: 700;
	                    margin-bottom: 14px;
                    }
                    .room-item .ri-text h3 span {
	                    font-family: "Cabin", sans-serif;
	                    font-size: 14px;
	                    font-weight: 400;
	                    color: #19191a;
                    }
                    .room-item .ri-text table {
	                    margin-bottom: 18px;
                    }
                    .room-item .ri-text table tbody tr td {
	                    font-size: 16px;
	                    color: #707079;
	                    line-height: 36px;
                    }
                    .room-item .ri-text table tbody tr td.r-o {
	                    width: 125px;
                    }
                    .room-item .ri-text .primary-btn {
	                    color: #19191a;
                    }
                    .room-pagination {
	                    text-align: center;
	                    padding-top: 20px;
                    }
                    .room-pagination a {
	                    font-size: 16px;
	                    color: #707079;
	                    border: 1px solid #EFD4B9;
	                    border-radius: 2px;
	                    padding: 7px 13px 5px;
	                    margin-right: 7px;
	                    display: inline-block;
	                    -webkit-transition: all 0.3s;
	                    -o-transition: all 0.3s;
	                    transition: all 0.3s;
                    }
                    .room-pagination a:last-child {
	                    margin-right: 0;
                    }
                    .room-pagination a:hover {
	                    background: #dfa974;
	                    color: #ffffff;
                    }












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
        .form-inline {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -ms-flex-flow: row wrap;
            flex-flow: row wrap;
            -webkit-box-align: center;
            -ms-flex-align: center;
        }
        @media (min-width: 576px) {
            .form-inline .form-control {
                display: inline-block;
                width: auto;
                vertical-align: middle;
            }
        }
        @media (min-width: 576px) {
            .mr-sm-2, .mx-sm-2 {
                margin-right: .5rem !important;
            }
        }

        .form-control {
            display: block;
            width: 100%;
            padding: .375rem .75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }
        [type=search] {
            outline-offset: -2px;
            -webkit-appearance: none;
        }

        button, input {
            overflow: visible;
        }

        button, input, optgroup, select, textarea {
            margin: 0px;
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }
    </style>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#search_hotels").click(function () {
                var searchText = $("#going").val();
                $.ajax({
                    type: "POST",
                    url: "Browser.aspx/GetHotelData",
                    data: JSON.stringify({ searchText: searchText }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var hotels = response.d;
                        $("#hotelList").empty();
                        $.each(hotels, function (index, hotel) {
                            $("#hotelList").append(
                                "<div class='col-lg-4 col-md-6'>" +
                                "<div class='room-item'>" +
                                "<img src='/Images/Hotels_browser/" + hotel.ImageUrl + "' alt='Hotel Image'/>" +
                                "<div class='ri-text'>" +
                                "<h4>" + hotel.Name + "</h4>" +
                                "<h3>₹ " + hotel.Price + "<span>/Per night</span></h3>" +
                                "<table>" +
                                "<tbody>" +
                                "<tr>" +
                                "<td class='r-o'>Location:</td>" +
                                "<td>" + hotel.Location + "</td>" +
                                "</tr>" +
                                "</tbody>" +
                                "</table>" +
                                "<a href='#' class='primary-btn' style='text-decoration:none' onclick='redirectToDetailsPage(\"" + hotel.Name + "\")'>Book now</a>" +
                                "</div>" +
                                "</div>" +
                                "</div>"
                            );
                        });
                    },
                    error: function (response) {
                        alert("Error: " + response.responseText);
                    }
                });
            });
        });

        function redirectToDetailsPage(hotelName) {
            // Check if the user is logged in
            if (!isLoggedIn()) {
                // Redirect to the login page if not logged in
                window.location.href = 'user_login.aspx';
            } else {
                // If user is logged in, proceed to the hotel details page
                window.location.href = 'Hotel_details.aspx?hotelName=' + encodeURIComponent(hotelName);
            }
        }

        // Function to check if the user is logged in
        function isLoggedIn() {
            // Check if the customer_id is not null
            var customerId = '<%= Session["CustomerID"] %>';
            if (customerId !== null && customerId !== '') {
                return true; // If customer_id is not null, return true
            } else {
                // If customer_id is null, display a message and redirect to the login page
                alert('Please login or sign up to view hotel details');
                return false;
            }
        }
    </script>
                <!-- Breadcrumb Section Begin -->
                <div class="breadcrumb-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="breadcrumb-text">
                                    <h2>Search Hotels</h2>
                                    <div class="bt-option">
                                        <a href="./index.aspx" style="text-decoration:none">Home </a>
                                        <span>Browser</span>
                                    </div>
                                </div>
                            </div>
                              
                            <div class="form-inline">
                                
                                <input type="text" id="going" name="going" class="form-control mr-sm-2" placeholder="Destination, hotel name" />
                                <input type="button" class="btn btn-outline-success my-2 my-sm-0" id="search_hotels" value="Search" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb Section End -->

                <!-- Rooms Section Begin -->
                <section class="rooms-section spad">
                    <div class="container">
                        <div class="row" id="hotelList">
                            <asp:Repeater ID="HotelRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="room-item">
                                            <img src="../images/Hotels_browser/<%# ((Dictionary<string, object>)Container.DataItem)["image_data"] %>" alt="there is hotel img"/>
                                            <div class="ri-text">
                                                <h4><%# ((Dictionary<string, object>)Container.DataItem)["hotel_name"] %></h4>
                                                <h3>₹<%# ((Dictionary<string, object>)Container.DataItem)["starting_rates"] %><span>/Pernight</span></h3>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="r-o">Location:</td>
                                                            <td><%# ((Dictionary<string, object>)Container.DataItem)["hotel_address"] %></td>
                                                        </tr>
                                                        
                                                    </tbody>
                                                </table>
                                                <a href="#" class="primary-btn" style="text-decoration:none" onclick="redirectToDetailsPage('<%# ((Dictionary<string, object>)Container.DataItem)["hotel_name"] %>')">Book now</a>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                            <div class="col-lg-12">
                                <div class="room-pagination">
                                    <a href="#" style="text-decoration:none">1</a>
                                    <a href="#" style="text-decoration:none">2</a>
                                    <a href="#" style="text-decoration:none">Next <i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Rooms Section End -->
 </asp:Content>

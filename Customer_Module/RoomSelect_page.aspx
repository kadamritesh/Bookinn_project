<%@ Page Language="C#" MasterPageFile="~/Customer_Module/Site1.Master" AutoEventWireup="true" CodeBehind="RoomSelect_page.aspx.cs" Inherits="BookInn.Customer_Module.RoomSelect_page" %>


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
    </style>















    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Rooms</h2>
                        <div class="bt-option">
                            <a href="Index.aspx" style="text-decoration: none">Home</a>
                            <span>Rooms</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:Label ID="hotelname_txt" runat="server"></asp:Label>
    <!-- Breadcrumb Section End -->
    <!-- Rooms Section Begin -->
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="roomRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="room-item">
                                <img src="../img/room/<%# Eval("room_photo") %>" alt="room images" />
                                <div class="ri-text">
                                    <h4><%# Eval("roomcategoies") %></h4>
                                    <h3>₹<%# Eval("per_night_range") %><span>/Pernight</span></h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">Availability:</td>
                                                <td><%# Eval("room_availability") %></td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Services:</td>
                                                <td><%# Eval("room_services") %></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <a href="<%# "Booking_page.aspx?roomID=" + Eval("roomID") %>" class="primary-btn" style="text-decoration:none">Select Room</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="col-lg-12">
                    <div class="room-pagination">
                        <a href="#" style="text-decoration: none">1</a>
                        <a href="#" style="text-decoration: none">2</a>
                        <a href="#" style="text-decoration: none">Next <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

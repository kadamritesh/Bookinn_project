<%@ Page Language="C#" MasterPageFile="~/Customer_Module/Site1.Master" AutoEventWireup="true" CodeBehind="Newoffer_page.aspx.cs" Inherits="BookInn.Customer_Module.Newoffer_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserMainContent" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
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
  Blog Section
-----------------------*/

        .blog-section.blog-page {
            padding-top: 0;
            padding-bottom: 88px;
        }

        .blog-item {
            height: 450px;
            position: relative;
            margin-bottom: 30px;
            border-radius: 5px;
        }

            .blog-item.small-size {
                height: 400px;
            }

            .blog-item .bi-text {
                position: absolute;
                left: 0;
                bottom: 25px;
                width: 100%;
                padding-left: 30px;
                padding-right: 30px;
            }

                .blog-item .bi-text .b-tag {
                    display: inline-block;
                    color: #ffffff;
                    font-size: 12px;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    background: #dfa974;
                    padding: 3px 10px;
                    border-radius: 2px;
                }

                .blog-item .bi-text h4 {
                    margin-top: 18px;
                    margin-bottom: 18px;
                }

                    .blog-item .bi-text h4 a {
                        color: #ffffff;
                    }

                .blog-item .bi-text .b-time {
                    font-size: 12px;
                    color: #ffffff;
                    text-transform: uppercase;
                    letter-spacing: 3px;
                }

        .load-more {
            text-align: center;
            padding-top: 30px;
        }

            .load-more .primary-btn {
                color: #19191a;
            }
        .set-bg {
            background-repeat: no-repeat;
            background-size: cover;
            position: relative; /* Necessary for absolute positioning of pseudo-element */
        }

            /* Adjust the background image based on the data-setbg attribute */
            .set-bg[data-setbg]::before {
                content: ""; /* Empty content */
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-repeat: no-repeat;
                background-size: cover;
                border-radius: 5px;
                /* Set the background image using CSS */
                background-image: var(--bg-image); /* This will be dynamically set by JavaScript */
            }

        @media (min-width: 992px) {
            .mb-lg-0 {
                margin-bottom: 0 !important;
                border-radius: 5px;
            }
        }
    </style>
        <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>New Offers</h2>
                        <div class="bt-option">
                            <a href="./Index.html" style="text-decoration:none">Home</a>
                            <span>New Offers</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog-section blog-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../Images/pexels-zachary-debottis-1838640.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.html" style="text-decoration:none">Tremblant In Canada</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i> 15th June, 2024</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../img/blog/blog-2.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.html" style="text-decoration:none">Choosing A Static Caravan</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i>  15th June, 2024</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../img/blog/blog-3.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Event</span>
                            <h4><a href="./blog-details.html" style="text-decoration:none">Copper Canyon</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i>  21th June, 2024
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../img/blog/blog-4.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Trivago</span>
                            <h4><a href="./blog-details.html" style="text-decoration:none">A Time Travel Postcard</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i> 22th June, 2024</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../img/blog/blog-5.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.html" style="text-decoration:none">A Time Travel Postcard</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i> 25th June, 2024</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../img/blog/blog-6.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.html" style="text-decoration:none">Virginia Travel For Kids</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i> 28th June, 2024</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../img/blog/blog-7.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.html" style="text-decoration: none">Bryce Canyon A Stunning</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i> 29th June, 2024</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../img/blog/blog-8.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Event & Travel</span>
                            <h4><a href="./blog-details.html" style="text-decoration:none">Motorhome Or Trailer</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i> 30th June, 2024</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="../img/blog/blog-9.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.html" style="text-decoration:none">Lost In Lagos Portugal</a></h4>
                            <div class="b-time">
                                <i class="bi bi-clock">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg></i> 30th June, 2024</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="load-more">
                        <a href="#" class="primary-btn" style="text-decoration:none">Load More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
    <script>
    $(document).ready(function () {
        /*------------------
        Background Set
        --------------------*/
        $('.set-bg').each(function () {
            var bg = $(this).data('setbg');
            $(this).css('--bg-image', 'url(' + bg + ')');
        });
    });

    </script>
</asp:Content>

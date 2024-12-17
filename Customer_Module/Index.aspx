<%@ Page Language="C#" MasterPageFile="~/Customer_Module/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BookInn.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserMainContent" runat="server">
		<style>
				/*---------------------
				  About US
				-----------------------*/

				.about-text {
					text-align: center;
					padding: 0 35px;
	
				}
		    .spad {
		        padding-top: 100px;
		        padding-bottom: 100px;
		    }
				.about-text p {
					color: #595960;
					font-weight: 500;
				}
				.about-text p.f-para {
					margin-bottom: 10px;
				}
				.about-text p.s-para {
					margin-bottom: 35px;
				}
				.about-text .about-btn {
					color: #19191a;
				}
				.about-pic img {
					min-width: 100%;
				}


				/* icons css */
				.icons{
					overflow: hidden;
					width: 37px;
					margin-bottom : 29px;
	
				}
				

		    /*---------------------
		    Service Section
		    -----------------------*/

		    .services-section {
		        padding-bottom: 60px;
		        border-top: 1px solid #e5e5e5;
		    }

		    .services-section .section-title {
		        margin-bottom: 36px;
		    }

		    .service-item {
		        text-align: center;
		        padding: 30px 35px 18px;
		        -webkit-transition: all 0.3s;
		        -o-transition: all 0.3s;
		        transition: all 0.3s;
		    }

		        .service-item:hover {
		            background: #dfa974;
		        }

		            .service-item:hover i {
		                color: #ffffff;
		            }

		            .service-item:hover h4 {
		                color: #ffffff;
		            }

		            .service-item:hover p {
		                color: #ffffff;
		            }

		        .service-item i {
		            display: inline-block;
		            color: #dfa974;
		            -webkit-transition: all 0.3s;
		            -o-transition: all 0.3s;
		            transition: all 0.3s;
		        }

		        .service-item h4 {
		            color: #19191a;
		            font-size: 22px;
		            margin-bottom: 15px;
		            margin-top: 10px;
		            -webkit-transition: all 0.3s;
		            -o-transition: all 0.3s;
		            transition: all 0.3s;
		        }

		        .service-item p {
		            color: #707079;
		            -webkit-transition: all 0.3s;
		            -o-transition: all 0.3s;
		            transition: all 0.3s;
		        }

		   

		    /*---------------------
  Hero
-----------------------*/

			.hero-section {
				position: relative;
				padding-top: 60px;
				padding-bottom: 330px;


			}

				.hero-section .container {
					position: relative;
					z-index: 5;
				}
		    .set-bg {
		        background-repeat: no-repeat;
		        background-size: cover;
		        background-position: top center;
		    }
			.hero-text {
				padding-top: 145px;
			}

				.hero-text h1 {
					font-size: 80px;
					line-height: 90px;
					color: #3f170e;
					margin-bottom: 16px;
				}

				.hero-text p {
					font-size: 18px;
					color: #030303;
					line-height: 28px;
					margin-bottom: 35px;
				}

			

			.hero-slider {
				position: absolute;
				width: 100%;
				height: 100%;
				left: 0;
				top: 0;
			}

				.hero-slider.owl-carousel .owl-dots {
					position: absolute;
					left: 0;
					bottom: 23px;
					width: 100%;
					text-align: center;
				}

					.hero-slider.owl-carousel .owl-dots button {
						height: 6px;
						width: 6px;
						background: #ffffff;
						opacity: 0.5;
						border-radius: 50%;
						margin-right: 10px;
						-webkit-transition: all 0.3s;
						-o-transition: all 0.3s;
						transition: all 0.3s;
					}

						.hero-slider.owl-carousel .owl-dots button.active {
							width: 30px;
							border-radius: 50px;
							opacity: 1;
						}

						.hero-slider.owl-carousel .owl-dots button:last-child {
							margin-right: 0;
						}

				.hero-slider .owl-stage-outer, .hero-slider .owl-stage, .hero-slider .owl-item, .hero-slider .hs-item {
					height: 100%;
                    width: 100%;
				}
		</style>

    
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="hero-text">
                        <h1>BookInn</h1>
                        <p>
                            Here are the best hotels booking sites, including recommendations for international
										travel and for finding low-priced hotel rooms.
                        </p>
                        <a href="Browser.aspx" class="primary-btn" style="text-decoration: none;">Discover Now</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="hero-slider owl-carousel">
            <img class="hs-item set-bg"  src="/Images/pexels-boonkong-boonpeng-1134176.jpg" />  
        </div>
        
    </section>
    <!-- Hero Section End -->
    <%--<div class="hero-slider owl-carousel">
    <div id="carouselExampleCaptions" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/Images/pexels-asman-chema-594077.jpg" class="d-block w-100" alt="Your Bootstrap Image" />
                <div class="carousel-caption d-none d-md-block">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/Images/pexels-boonkong-boonpeng-1134176.jpg" class="d-block w-100" alt="Your Bootstrap Image" />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Second slide label</h5>
                    <p>Some representative placeholder content for the second slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/Images/pexels-donald-tong-189296.jpg" class="d-block w-100" alt="Your Bootstrap Image" />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Third slide label</h5>
                    <p>Some representative placeholder content for the third slide.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>--%>










    <!-- About Us Section Begin -->
    <section class="aboutus-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-text">
                        <div class="section-title">
                            <span style="color: #dfa974;">ABOUT US</span>
                            <h2>Intercontinental LA
                                <br />
                                Westlake Hotels</h2>
                        </div>
                        <p class="f-para">
                           Discover the perfect stay tailored to your preferences, whether you're seeking a romantic getaway, a family-friendly retreat, or a business trip.
                            Our curated collection of properties ensures that you'll find the ideal setting for your next adventure, wherever it may take you.
                        </p>
                        <p class="s-para">
                            And with exclusive perks such as discounted rates, complimentary upgrades, and loyalty rewards, 
                            booking with BookInn means more than just a place to stay – it's an opportunity to elevate your travel experience and create memories that last a lifetime.
                        </p>
                        <a href="AboutUs_page.aspx" class="primary-btn about-btn" style="text-decoration: none;">READ MORE</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-pic">
                        <div class="row">
                            <div class="col-sm-6">
                                <img src="../Images/hotel15.jpg" alt="there is bootstrap" />
                            </div>
                            <div class="col-sm-6">
                                <img src="../Images/hotel13.jpg" alt="there is bootstrap" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Us Section End -->



    <!-- Services Section End -->
    <section class="services-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>What We Do</span>
                        <h2>Discover Our Services</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="bi bi-building">
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                <path d="M4 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z" />
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1zm11 0H3v14h3v-2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V15h3z" />
                            </svg></i>
                        <h4>Luxurious Hotels</h4>
                        <p>
                           These are premium properties offering top-tier comfort, exquisite dining, and exceptional service, often located in prime destinations. 
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="bi bi-globe2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-globe2" viewBox="0 0 16 16">
                                <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m7.5-6.923c-.67.204-1.335.82-1.887 1.855q-.215.403-.395.872c.705.157 1.472.257 2.282.287zM4.249 3.539q.214-.577.481-1.078a7 7 0 0 1 .597-.933A7 7 0 0 0 3.051 3.05q.544.277 1.198.49zM3.509 7.5c.036-1.07.188-2.087.436-3.008a9 9 0 0 1-1.565-.667A6.96 6.96 0 0 0 1.018 7.5zm1.4-2.741a12.3 12.3 0 0 0-.4 2.741H7.5V5.091c-.91-.03-1.783-.145-2.591-.332M8.5 5.09V7.5h2.99a12.3 12.3 0 0 0-.399-2.741c-.808.187-1.681.301-2.591.332zM4.51 8.5c.035.987.176 1.914.399 2.741A13.6 13.6 0 0 1 7.5 10.91V8.5zm3.99 0v2.409c.91.03 1.783.145 2.591.332.223-.827.364-1.754.4-2.741zm-3.282 3.696q.18.469.395.872c.552 1.035 1.218 1.65 1.887 1.855V11.91c-.81.03-1.577.13-2.282.287zm.11 2.276a7 7 0 0 1-.598-.933 9 9 0 0 1-.481-1.079 8.4 8.4 0 0 0-1.198.49 7 7 0 0 0 2.276 1.522zm-1.383-2.964A13.4 13.4 0 0 1 3.508 8.5h-2.49a6.96 6.96 0 0 0 1.362 3.675c.47-.258.995-.482 1.565-.667m6.728 2.964a7 7 0 0 0 2.275-1.521 8.4 8.4 0 0 0-1.197-.49 9 9 0 0 1-.481 1.078 7 7 0 0 1-.597.933M8.5 11.909v3.014c.67-.204 1.335-.82 1.887-1.855q.216-.403.395-.872A12.6 12.6 0 0 0 8.5 11.91zm3.555-.401c.57.185 1.095.409 1.565.667A6.96 6.96 0 0 0 14.982 8.5h-2.49a13.4 13.4 0 0 1-.437 3.008M14.982 7.5a6.96 6.96 0 0 0-1.362-3.675c-.47.258-.995.482-1.565.667.248.92.4 1.938.437 3.008zM11.27 2.461q.266.502.482 1.078a8.4 8.4 0 0 0 1.196-.49 7 7 0 0 0-2.275-1.52c.218.283.418.597.597.932m-.488 1.343a8 8 0 0 0-.395-.872C9.835 1.897 9.17 1.282 8.5 1.077V4.09c.81-.03 1.577-.13 2.282-.287z" />
                            </svg></i>
                        <h4>Global Search</h4>
                        <p>
                            Adding a global search functionality in our Bookinn will enhance user experience and make it easier for guests to find their desired accommodations.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="bi bi-buildings">
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-buildings" viewBox="0 0 16 16">
                                <path d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022M6 8.694 1 10.36V15h5zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5z" />
                                <path d="M2 11h1v1H2zm2 0h1v1H4zm-2 2h1v1H2zm2 0h1v1H4zm4-4h1v1H8zm2 0h1v1h-1zm-2 2h1v1H8zm2 0h1v1h-1zm2-2h1v1h-1zm0 2h1v1h-1zM8 7h1v1H8zm2 0h1v1h-1zm2 0h1v1h-1zM8 5h1v1H8zm2 0h1v1h-1zm2 0h1v1h-1zm0-2h1v1h-1z" />
                            </svg></i>
                        <h4>List Owner Property</h4>
                        <p>
                            A “List Owner Property” service can attract property owners to your platform, expanding the options available to guests.
                            
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="bi bi-wallet2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-wallet2" viewBox="0 0 16 16">
                                <path d="M12.136.326A1.5 1.5 0 0 1 14 1.78V3h.5A1.5 1.5 0 0 1 16 4.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 13.5v-9a1.5 1.5 0 0 1 1.432-1.499zM5.562 3H13V1.78a.5.5 0 0 0-.621-.484zM1.5 4a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5z" />
                            </svg></i>
                        <h4>Exclusive Deals</h4>
                        <p>
                            Offer special rates and discounts available only through your online booking system. Encourage direct bookings.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="bi bi-clock">
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                            </svg></i>
                        <h4>24/7 Support</h4>
                        <p>
                             Provide round-the-clock customer service to assist with bookings and inquiries.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="bi bi-clipboard2-check">
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-clipboard2-check" viewBox="0 0 16 16">
                                <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5z" />
                                <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z" />
                                <path d="M10.854 7.854a.5.5 0 0 0-.708-.708L7.5 9.793 6.354 8.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0z" />
                            </svg></i>
                        <h4>Effortless Booking</h4>
                        <p>
                            Allow guests to find and book rooms with just a few clicks. 
                            A user-friendly interface ensures a seamless booking experience.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->


    
   
	</asp:Content>

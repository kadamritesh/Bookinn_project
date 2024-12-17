<%@ Page Language="C#"  MasterPageFile="~/Admin_Master/Adminmaster.Master" AutoEventWireup="true" CodeBehind="Admin_home.aspx.cs" Inherits="BookInn.Admin_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" runat="server">
    <style>
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
    <!-- Admin-specific content -->
		
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="hero-text">
                        <h1 id="hotelName" runat="server"></h1>
                        <p>
                            Here are the best hotels booking sites, including recommendations for international
									travel and for finding low-priced hotel rooms.
                        </p>
                        <a href="#" class="primary-btn" style="text-decoration: none;">Discover Now</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="hero-slider owl-carousel">
            
            <img class="hs-item set-bg" src='<%= ResolveUrl("../images/Hotels_browser/") + GetImageName() %>' alt="Hotel Image"/>
        </div>

    </section>
</asp:Content>
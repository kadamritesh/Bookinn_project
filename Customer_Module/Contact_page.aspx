<%@ Page Language="C#" MasterPageFile="~/Customer_Module/Site1.Master" AutoEventWireup="true" CodeBehind="Contact_page.aspx.cs" Inherits="BookInn.Customer_Module.Contact_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserMainContent" runat="server">

    <style>
        /*---------------------
  Contact Section
-----------------------*/

        .contact-section {
            padding-top: 80px;
            padding-bottom: 80px;
        }

        .contact-text h2 {
            font-size: 44px;
            color: #19191a;
            margin-bottom: 24px;
        }

        .contact-text p {
            color: #707079;
        }

        .contact-text table tbody tr td {
            font-size: 16px;
            color: #19191a;
            line-height: 36px;
            font-weight: 500;
        }

            .contact-text table tbody tr td.c-o {
                color: #707079;
                width: 75px;
            }

        .contact-form input {
            width: 100%;
            height: 50px;
            border: 1px solid #e1e1e1;
            font-size: 16px;
            color: #aaaab3;
            padding-left: 25px;
            margin-bottom: 28px;
        }

            .contact-form input::-webkit-input-placeholder {
                color: #aaaab3;
            }

            .contact-form input::-moz-placeholder {
                color: #aaaab3;
            }

            .contact-form input:-ms-input-placeholder {
                color: #aaaab3;
            }

            .contact-form input::-ms-input-placeholder {
                color: #aaaab3;
            }

            .contact-form input::placeholder {
                color: #aaaab3;
            }

        .contact-form textarea {
            width: 100%;
            height: 150px;
            border: 1px solid #e1e1e1;
            font-size: 16px;
            color: #aaaab3;
            padding-left: 25px;
            padding-top: 12px;
            margin-bottom: 33px;
            resize: none;
        }

            .contact-form textarea::-webkit-input-placeholder {
                color: #aaaab3;
            }

            .contact-form textarea::-moz-placeholder {
                color: #aaaab3;
            }

            .contact-form textarea:-ms-input-placeholder {
                color: #aaaab3;
            }

            .contact-form textarea::-ms-input-placeholder {
                color: #aaaab3;
            }

            .contact-form textarea::placeholder {
                color: #aaaab3;
            }

        .contact-form button {
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            color: #ffffff;
            letter-spacing: 2px;
            background: #dfa974;
            border: none;
            padding: 14px 34px 13px;
            display: inline-block;
            border-radius: 5px
        }

        .map {
            height: 470px;
            -webkit-box-shadow: 0px 14px 35px rgba(0, 0, 0, 0.15);
            box-shadow: 0px 14px 35px rgba(0, 0, 0, 0.15);
            margin-top: 75px;
        }

            .map iframe {
                width: 100%;
            }
    </style>


    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-text">
                        <h2>Contact Info</h2>
                        <p>
                            Whether you have questions about booking a reservation,paymant gateway, need assistance with an existing reservation, or simply want to share your thoughts with us, our dedicated team is ready to help.
                            You can reach us via email, or by filling out the contact form below.
                            Our team strives to respond promptly to all inquiries and ensure that your experience with our platform is seamless and enjoyable.
                            Thank you for choosing our BookInn , and we look forward to assisting you soon!
                        </p>
                        <table>
                            <tbody>
                                
                                <tr>
                                    <td class="c-o">Email:</td>
                                    <td>info.BookInn@gmail.com</td>
                                </tr>
                                <tr>
                                    <td class="c-o">Fax:</td>
                                    <td>+(12) 345 67890</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-7 offset-lg-1">
                    <div action="#" class="contact-form">
                        <div class="row">
                            <div class="col-lg-6">
                                <input type="text" placeholder="Your Name"/>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" placeholder="Your Email"/>
                            </div>
                            <div class="col-lg-12">
                                <textarea placeholder="Your Message"></textarea>
                                <button type="submit">Submit Now</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="map">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.0606825994123!2d-72.8735845851828!3d40.760690042573295!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e85b24c9274c91%3A0xf310d41b791bcb71!2sWilliam%20Floyd%20Pkwy%2C%20Mastic%20Beach%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1578582744646!5m2!1sen!2sbd"
                    height="470" style="border:0;" allowfullscreen=""></iframe>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

</asp:Content>

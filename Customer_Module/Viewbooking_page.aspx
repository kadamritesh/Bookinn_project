<%@ Page Language="C#" MasterPageFile="~/Customer_Module/Site1.Master" AutoEventWireup="true" CodeBehind="Viewbooking_page.aspx.cs" Inherits="BookInn.Customer_Module.Viewbooking_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserMainContent" runat="server">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <br />
    <br />
    <style>
        .btn-outline-success {
            color: #dfa974;
            border-color: #dfa974;
        }

            .btn-outline-success:not(:disabled):not(.disabled).active, .btn-outline-success:not(:disabled):not(.disabled):active, .show > .btn-outline-success.dropdown-toggle {
                color: #fff;
                background-color: #dfa974;
                border-color: #dfa974;
            }

            .btn-outline-success:hover {
                color: #fff;
                background-color: #dfa974;
                border-color: #dfa974;
            }

        .btn:focus-visible {
            color: var(--bs-btn-hover-color);
            background-color: #dfa974;
            border-color: #dfa974;
            outline: 0;
            box-shadow: var(--bs-btn-focus-box-shadow);
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
    </style>

    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <div class="d-flex" role="search">

                <h3>View Your Hotel Booking</h3>


            </div>
        </div>
    </nav>

    <asp:GridView ID="viewbooking_data" runat="server" class="table table-hover align-middle mb-0 bg-white" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" >
            <Columns>
                <asp:BoundField DataField="hotel_name" HeaderText="Hotel Name" />
                <asp:BoundField DataField="hotel_address" HeaderText="Hotel Address" />
                <asp:BoundField DataField="roomcategoies" HeaderText="Rooms Categoies" />
                <asp:BoundField DataField="checkin_date" HeaderText="Check-IN" />
                <asp:BoundField DataField="checkout_date" HeaderText="Check-Out" />
                <asp:BoundField DataField="adults" HeaderText="Adults" />
                <asp:BoundField DataField="childrens" HeaderText="Childrens" />
                <asp:BoundField DataField="rooms" HeaderText="Total room" />
                <asp:BoundField DataField="paymentbill" HeaderText="Bil" />
                
                <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Cancellation" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure you want to Cancel Reservation?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>


</asp:Content>

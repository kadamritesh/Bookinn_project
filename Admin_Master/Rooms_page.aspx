 <%@ Page Language="C#" MasterPageFile="~/Admin_Master/Adminmaster.Master" AutoEventWireup="true" CodeBehind="Rooms_page.aspx.cs" Inherits="BookInn.Admin_Master.Rooms_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" runat="server">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        .container {
            padding: 2rem 0rem;
        }

        

        .table-image {
            td, th

        {
            vertical-align: middle;
        }

        }

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

                <asp:Button ID="addroom_bts" CssClass="btn btn-outline-success" Text="Add Rooms" runat="server" OnClick="addroom_bts_Click"/>


            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <table class="table table-image">
                    <thead>
                        <tr>
                            
                            <th scope="col">Images</th>
                            <th scope="col">Rooms Services</th>
                            <th scope="col">Room Categoies</th>
                            <th scope="col">Rooms Available</th>
                            <th scope="col">Rates</th>
                            <th scope="col">Edit</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="RoomRepeater" runat="server">
                            <ItemTemplate>
                                <tr data-room-id='<%# ((Dictionary<string, object>)Container.DataItem)["roomID"] %>'>
                                    
                                    
                                    <td class="w-25">
                                
                                        <img src="../img/room/<%# ((Dictionary<string, object>)Container.DataItem)["room_photo"] %>" alt="Sheep">
                                    </td>
                                    <td><p class="fw-normal mb-1" data-field-name="facilities"><%# ((Dictionary<string, object>)Container.DataItem)["room_services"] %></p></td>
                                    <td><p class="fw-normal mb-1" data-field-name="Rooms_categoies"><%# ((Dictionary<string, object>)Container.DataItem)["roomcategoies"] %></p></td>
                                    <td><p class="fw-normal mb-1" data-field-name="Rooms_available"><%# ((Dictionary<string, object>)Container.DataItem)["room_availability"] %></p></td>
                                    <td><p class="fw-normal mb-1" data-field-name="Rooms_range"><%# ((Dictionary<string, object>)Container.DataItem)["per_night_range"] %></p></td>
                                    

                                    <td>
                                        <button type="button" class="btn btn-link btn-sm btn-rounded edit-btn">
                                            Edit
                                        </button>
                                        <button type="button" class="btn btn-link btn-sm btn-rounded save-btn" style="display: none;">
                                            Save
                                        </button>
                                    </td>
                                    
                                </tr>
                                
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $(".edit-btn").click(function () {
                var $row = $(this).closest("tr");
                var $fields = $row.find("td p");
                var $editBtn = $(this);
                var $saveBtn = $row.find(".save-btn");

                $fields.each(function () {
                    var $field = $(this);
                    var content = $field.text().trim();
                    var fieldName = $field.data('field-name'); // Assuming you've added data-field-name attributes to your <p> tags
                    $field.html('<input type="text" class="form-control" name="' + fieldName + '" value="' + content + '">');
                });

                $editBtn.hide();
                $saveBtn.show();
            });

            $(".save-btn").click(function () {
                var $row = $(this).closest("tr");
                var roomId = $row.data('room-id'); // Assuming you've added a data-staff-id attribute to your <tr> tags
                var updatedData = {
                    roomId: roomId,
                    roomfacilities: $row.find("input[name='facilities']").val(),
                    roomcategoies: $row.find("input[name='Rooms_categoies']").val(),
                    roomrange: $row.find("input[name='Rooms_range']").val(),
                    roomavailable: $row.find("input[name='Rooms_available']").val(),
                    
                };

                $.ajax({
                    type: "POST",
                    url: "Rooms_page.aspx/UpdateRoomsDetails",
                    data: JSON.stringify(updatedData),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            // Update the UI to reflect the saved changes
                            $row.find("td p input").each(function () {
                                var $input = $(this);
                                var value = $input.val();
                                $input.replaceWith($('<p>').text(value));
                            });

                            alert("Data updated successfully.");
                            // Update the UI to reflect the saved changes
                            $row.find(".edit-btn").show();
                            $row.find(".save-btn").hide();

                        } else {
                            alert("Failed to update data.");
                        }
                    },
                    error: function (error) {
                        alert("Error: " + error.responseText);
                    }
                });
            });
        });
    </script>





























<%--    <tr>
        <th scope="row">2</th>
        <td class="w-25">
            <img src="../img/room/room-2.jpg" class="img-fluid img-thumbnail" alt="Sheep">
        </td>
        <td>Bootstrap Grid 4 Tutorial and Examples</td>
        <td>Cristina</td>
        <td>1.434</td>

    </tr>--%>


</asp:Content>

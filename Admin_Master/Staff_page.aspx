<%@ Page Language="C#" MasterPageFile="~/Admin_Master/Adminmaster.Master" AutoEventWireup="true" CodeBehind="Staff_page.aspx.cs" Inherits="BookInn.Admin_Master.Staff_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" runat="server">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <br /><br />
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
                
                <asp:Button ID="addstaff_bt"  CssClass="btn btn-outline-success"  Text="Add Staffs" runat="server" OnClick="addstaff_bt_Click"/>
                

            </div>
        </div>
    </nav>

    <table class="table table-hover align-middle mb-0 bg-white">
        <thead class="bg-light">
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Location</th>
                <th>Phone</th>
                <th>Gender</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="StaffRepeater" runat="server">
            <ItemTemplate>
                <tr data-staff-id='<%# ((Dictionary<string, object>)Container.DataItem)["staffID"] %>'>
                    <td>
                        <div class="d-flex align-items-center">
                            <img
                                src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                                alt=""
                                style="width: 45px; height: 45px"
                                class="rounded-circle" />
                            <div class="ms-3">
                                <p class="fw-bold mb-1" data-field-name="staff_fname"><%# ((Dictionary<string, object>)Container.DataItem)["staff_fname"] %>  </p>
                                <p class="text-muted mb-0" data-field-name="staff_email"><%# ((Dictionary<string, object>)Container.DataItem)["staff_email"] %></p>
                            </div>
                        </div>
                    </td>
                    
                    <td>
                        <p class="fw-normal mb-1" data-field-name="staff_position"><%# ((Dictionary<string, object>)Container.DataItem)["staff_position"] %></p>
                        <%--<p class="text-muted mb-0">IT department</p>--%>
                    
                    
                    </td>
                    <td>
                        <p class="fw-normal mb-1" data-field-name="staff_location"><%# ((Dictionary<string, object>)Container.DataItem)["staff_location"] %></p>
                    </td>
                    <td>
                        <p class="fw-normal mb-1" data-field-name="staff_phone"><%# ((Dictionary<string, object>)Container.DataItem)["staff_phone"] %></p>
                    </td>
                    <td>
                        <p class="fw-normal mb-1" data-field-name="staff_gender"><%# ((Dictionary<string, object>)Container.DataItem)["staff_gender"] %></p>
                    </td>
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

    <%--<img src="../Images/pexels-boonkong-boonpeng-1134176.jpg" alt="image" /> --%>
    
    <!-- JavaScript to toggle editable fields -->
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
                var staffId = $row.data('staff-id'); // Assuming you've added a data-staff-id attribute to your <tr> tags
                var updatedData = {
                    staffId: staffId,
                    staffFname: $row.find("input[name='staff_fname']").val(),
                    staffPosition: $row.find("input[name='staff_position']").val(),
                    staffEmail: $row.find("input[name='staff_email']").val(),
                    staffLocation: $row.find("input[name='staff_location']").val(),
                    staffPhone: $row.find("input[name='staff_phone']").val(),
                    staffGender: $row.find("input[name='staff_gender']").val()
                };

                $.ajax({
                    type: "POST",
                    url: "Staff_page.aspx/UpdateStaffDetails",
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
</asp:Content>

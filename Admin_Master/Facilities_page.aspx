<%@ Page Language="C#" MasterPageFile="~/Admin_Master/Adminmaster.Master" AutoEventWireup="true" CodeBehind="Facilities_page.aspx.cs" Inherits="BookInn.Admin_Master.Facilities_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" runat="server">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

                <asp:Button ID="addfacilities_bt" CssClass="btn btn-outline-success" Text="Add Facilities" runat="server" OnClick="addfacilities_bt_Click" />


            </div>
        </div>
    </nav>

    <table class="table table-hover align-middle mb-0 bg-white">
        <thead class="bg-light">
            <tr>
                <th>Hotels Faciliites</th>
                
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="FacilitiesRepeater" runat="server">
                <ItemTemplate>
                    <tr data-facility-id="<%# ((Dictionary<string, object>)Container.DataItem)["facilityID"] %>">
                        <td>
                            <div class="d-flex align-items-center">
                                <div class="ms-3">
                                    <p class="fw-bold mb-1" data-field-name="facility_name"> <%# ((Dictionary<string, object>)Container.DataItem)["FacilityName"] %></p>
                                    
                                </div>
                            </div>
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
                 var facilityid = $row.data('facility-id'); // Assuming you've added a data-staff-id attribute to your <tr> tags
                 var updatedData = {
                     facilityid: facilityid,
                     hotelfacilities: $row.find("input[name='facility_name']").val()
                     
                 };

                 $.ajax({
                     type: "POST",
                     url: "Facilities_page.aspx/UpdatefacilityDetails",
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

</asp:content>

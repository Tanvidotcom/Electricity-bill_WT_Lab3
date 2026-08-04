<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Bill Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        body {
            background: linear-gradient(135deg, #eef6ff, #dbeafe);
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }
        .card-shadow {
            box-shadow: 0 12px 40px rgba(15, 23, 42, 0.12);
            border: none;
            border-radius: 1rem;
        }
        .hero-title {
            color: #0f4c81;
            font-weight: 700;
        }
        .rate-card {
            background: #f8fbff;
            border-left: 4px solid #2563eb;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card card-shadow p-4 p-md-5">
                <div class="row g-4 align-items-start">
                    <div class="col-lg-7">
                        <h1 class="hero-title mb-3">Electricity Bill Calculator</h1>
                        <p class="text-muted mb-4">Calculate your electricity bill instantly using the latest slab rates with a clean, responsive interface.</p>

                        <form id="billForm" action="calculate" method="post" class="row g-3">
                            <div class="col-md-6">
                                <label for="customerName" class="form-label">Customer Name</label>
                                <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Enter customer name" value="<%= request.getAttribute("customerName") != null ? request.getAttribute("customerName") : "" %>">
                            </div>
                            <div class="col-md-6">
                                <label for="units" class="form-label">Units Consumed</label>
                                <input type="number" min="0" step="0.01" class="form-control" id="units" name="units" placeholder="e.g. 320" value="<%= request.getAttribute("units") != null ? request.getAttribute("units") : "" %>">
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary px-4">Calculate Bill</button>
                                <div id="errorMessage" class="text-danger mt-2" style="display:none;"></div>
                            </div>
                        </form>

                        <div class="mt-4">
                            <h5 class="mb-3">Tariff Slabs</h5>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="p-3 rounded rate-card">
                                        <strong>First 50 units</strong><br>
                                        Rs. 3.50 per unit
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="p-3 rounded rate-card">
                                        <strong>Next 100 units</strong><br>
                                        Rs. 4.00 per unit
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="p-3 rounded rate-card">
                                        <strong>Next 100 units</strong><br>
                                        Rs. 5.20 per unit
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="p-3 rounded rate-card">
                                        <strong>Above 250 units</strong><br>
                                        Rs. 6.50 per unit
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-5">
                        <div class="bg-dark text-white rounded p-4">
                            <h4 class="mb-3">Bill Summary</h4>
                            <% Boolean computed = (Boolean) request.getAttribute("computed"); %>
                            <% if (computed != null && computed) { %>
                                <p class="mb-1">Customer: <strong><%= request.getAttribute("customerName") %></strong></p>
                                <p class="mb-1">Units consumed: <strong><%= request.getAttribute("unitsConsumed") %></strong></p>
                                <p class="mb-3">Total amount: <strong>Rs. <%= request.getAttribute("billAmount") %></strong></p>
                                <ul class="list-group">
                                    <%= request.getAttribute("breakdown") %>
                                </ul>
                            <% } else { %>
                                <p class="mb-0 text-light-emphasis">Your calculated bill will appear here after you submit the form.</p>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#billForm').on('submit', function (e) {
            const units = $('#units').val().trim();
            if (!units || Number(units) < 0) {
                e.preventDefault();
                $('#errorMessage').text('Please enter a valid number of units.').show();
            } else {
                $('#errorMessage').hide();
            }
        });
    });
</script>
</body>
</html>

package com.example;

import java.io.IOException;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ElectricityBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String unitsParam = request.getParameter("units");

        request.setAttribute("computed", false);
        request.setAttribute("customerName", customerName);
        request.setAttribute("units", unitsParam);

        if (customerName == null || customerName.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please enter the customer name.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (unitsParam == null || unitsParam.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please enter the number of units consumed.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        double units;
        try {
            units = Double.parseDouble(unitsParam.trim());
        } catch (NumberFormatException ex) {
            request.setAttribute("errorMessage", "Units must be a valid number.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (units < 0) {
            request.setAttribute("errorMessage", "Units cannot be negative.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        double totalBill = calculateBill(units);
        String breakdownHtml = buildBreakdown(units, totalBill);
        DecimalFormat decimalFormat = new DecimalFormat("0.00");

        request.setAttribute("computed", true);
        request.setAttribute("billAmount", Double.parseDouble(decimalFormat.format(totalBill)));
        request.setAttribute("breakdown", breakdownHtml);
        request.setAttribute("unitsConsumed", decimalFormat.format(units));
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private double calculateBill(double units) {
        double total = 0.0;
        double remaining = units;

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 50);
            total += slabUnits * 3.50;
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 100);
            total += slabUnits * 4.00;
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 100);
            total += slabUnits * 5.20;
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            total += remaining * 6.50;
        }

        return total;
    }

    private String buildBreakdown(double units, double totalBill) {
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        StringBuilder html = new StringBuilder();
        double remaining = units;

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 50);
            double amount = slabUnits * 3.50;
            html.append("<li class='list-group-item'>First 50 units at Rs. 3.50/unit: <strong>Rs. ")
                .append(decimalFormat.format(amount)).append("</strong></li>");
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 100);
            double amount = slabUnits * 4.00;
            html.append("<li class='list-group-item'>Next 100 units at Rs. 4.00/unit: <strong>Rs. ")
                .append(decimalFormat.format(amount)).append("</strong></li>");
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 100);
            double amount = slabUnits * 5.20;
            html.append("<li class='list-group-item'>Next 100 units at Rs. 5.20/unit: <strong>Rs. ")
                .append(decimalFormat.format(amount)).append("</strong></li>");
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double amount = remaining * 6.50;
            html.append("<li class='list-group-item'>Above 250 units at Rs. 6.50/unit: <strong>Rs. ")
                .append(decimalFormat.format(amount)).append("</strong></li>");
        }

        html.append("<li class='list-group-item list-group-item-success'>Total payable: <strong>Rs. ")
            .append(decimalFormat.format(totalBill)).append("</strong></li>");
        return html.toString();
    }
}

# Electricity Bill Calculator

A responsive JSP/Servlet web application that calculates an electricity bill using the tariff slabs you requested.

## Features
- Responsive Bootstrap UI
- jQuery-based client-side validation
- Server-side calculation in a Java Servlet
- Result breakdown shown on the same page

## Run locally
1. Install Apache Tomcat 9+.
2. Copy the project folder to Tomcat's webapps directory as `electricity-bill-app`.
3. Compile the servlet:
   ```bash
   javac -cp "C:/path/to/tomcat/lib/servlet-api.jar" -d web/WEB-INF/classes src/com/example/ElectricityBillServlet.java
   ```
4. Start Tomcat and open:
   ```text
   http://localhost:8080/electricity-bill-app/
   ```

## Example
If a customer uses 320 units, the calculated bill is:
- First 50 units: Rs. 175.00
- Next 100 units: Rs. 400.00
- Next 100 units: Rs. 520.00
- Remaining 70 units: Rs. 455.00
- Total: Rs. 1,550.00

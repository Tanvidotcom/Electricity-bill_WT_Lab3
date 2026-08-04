# Electricity Bill Calculator

A responsive JSP/Servlet web application that calculates an electricity bill using the tariff slabs you requested.

## Aim
 To design and develop a responsive website to calculate Electricity bill with Servlet and JSP. Condition for first 50 units – Rs. 3.50/unit, for next 100 units – Rs. 4.00/unit, for next 100 units – Rs. 5.20/unit and for units above 250 – Rs. 6.50/unit. You can make the use of bootstrap as well as jQuery

## Tools Used
Java(JDK) - 26
Servlet API - version 4.0
Apache Tomcat - version 9.0
JSP - version 2.3
jQuery - version 3.7.1

## Features
- Responsive Bootstrap UI
- jQuery-based client-side validation
- Server-side calculation in a Java Servlet
- Result breakdown shown on the same page

## Folder Structure
Electricity-bill_WT_Lab3-main/
├── build.bat                          # compiles the servlet
├── README.md
├── src/
│   └── com/
│       └── example/
│           └── ElectricityBillServlet.java   # bill calculation logic
└── web/
    ├── index.jsp                      # form + result page
    └── WEB-INF/
        └── web.xml                    # servlet mapping

## Workflow


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


## Screenshot
<img width="1598" height="1032" alt="image" src="https://github.com/user-attachments/assets/c465f257-c6cf-48c8-9a91-6c37b199dfc4" />

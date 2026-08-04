# Electricity Bill Calculator

A responsive JSP/Servlet web application that calculates an electricity bill using the tariff slabs you requested.

## Aim
 To design and develop a responsive website to calculate Electricity bill with Servlet and JSP. Condition for first 50 units – Rs. 3.50/unit, for next 100 units – Rs. 4.00/unit, for next 100 units – Rs. 5.20/unit and for units above 250 – Rs. 6.50/unit. You can make the use of bootstrap as well as jQuery

## Tools Used
- Java(JDK) - 26
- Servlet API - version 4.0
- Apache Tomcat - version 9.0
- JSP - version 2.3
- Boostrap - version 5.3.3
- jQuery - version 3.7.1

## Features
- Responsive Bootstrap UI
- jQuery-based client-side validation
- Server-side calculation in a Java Servlet
- Result breakdown shown on the same page

## Folder Structure
```
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
```

## Environment Setup
1. Install latest JDK and set JAVA_HOME to SDK install folder in environment variables.
2. Install Apache Tomcat 9 and set CATALINA_HOME in environment variable. Change Tomcat's port to 8081 (needed if xampp or anything else is already using 8080).
3. Set environment variables.

## Run locally
1. Install Apache Tomcat 9+.
2. Copy the project folder to Tomcat's webapps directory as `electricity-bill-app`.
3. Open terminal and run:
   ```
   build.bat
   ```
   - Compile the servlet
     
4. Copy the contents of the web/ folder into Tomcat's webapps directory, inside a new folder:
   ```
   %CATALINA_HOME%\webapps\electricity-bill-app\
   ```
   Start Tomcat:
   ```
   %CATALINA_HOME%\bin\startup.bat
   ```
   
5. Open a browser and go to:
   ```text
   http://localhost:8081/electricity-bill-app/
   ```
6. Enter customer name and units consumed, click Calculate Bill.


## Workflow
1. Tomcat loads index.jsp as welcome page (set in web.xml). It shows the form and slab rate cards.
2. Before submitting, jQuery checks that the units field is filled and not negative. If it's invalid, it shows an error under the button and stops the form from submitting.
3. On submit, the form sends a POST request to /calculate. web.xml maps this URL to ElectricityBillServlet.
4. All the calculations are computed such as bill amount, checking if units are valid, caculating bill.
5. index.jsp checks the computed attribute. If true, it prints customer name, units consumed, total amount. If false , it just shows a placeholder message.
   
## Example
If a customer uses 320 units, the calculated bill is:
- First 50 units: Rs. 175.00
- Next 100 units: Rs. 400.00
- Next 100 units: Rs. 520.00
- Remaining 70 units: Rs. 455.00
- Total: Rs. 1,550.00


## Screenshot
<img width="1598" height="1032" alt="image" src="https://github.com/user-attachments/assets/c465f257-c6cf-48c8-9a91-6c37b199dfc4" />

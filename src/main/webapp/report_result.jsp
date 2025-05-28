<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 900px;
        }
        .message {
            margin-bottom: 1.5rem;
            padding: 1rem;
            border-radius: 0.5rem;
            font-weight: 500;
            text-align: center;
        }
        .message.success {
            background-color: #d1fae5;
            color: #065f46;
            border: 1px solid #34d399;
        }
        .message.error {
            background-color: #fee2e2;
            color: #991b1b;
            border: 1px solid #ef4444;
        }
        .table-container {
            overflow-x: auto;
            margin-top: 1.5rem;
        }
        .employee-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px; /* Ensure table doesn't get too small on mobile */
        }
        .employee-table th, .employee-table td {
            padding: 0.75rem 1rem;
            border: 1px solid #e5e7eb;
            text-align: left;
        }
        .employee-table th {
            background-color: #f9fafb;
            font-weight: 600;
            color: #374151;
            text-transform: uppercase;
            font-size: 0.875rem;
        }
        .employee-table tbody tr:nth-child(even) {
            background-color: #f3f4f6;
        }
        .employee-table tbody tr:hover {
            background-color: #e5e7eb;
        }
        .back-link {
            display: inline-block;
            margin-top: 2rem;
            color: #4f46e5;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        .back-link:hover {
            color: #4338ca;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Report Results</h1>

        <% String message = (String) request.getAttribute("message");
           List<Employee> employees = (List<Employee>) request.getAttribute("employees");
           String reportType = (String) request.getAttribute("reportType");

           String reportTitle = "Employee Report";
           if (reportType != null) {
               switch (reportType) {
                   case "nameStart": reportTitle = "Employees by Name Starting Letter"; break;
                   case "serviceYears": reportTitle = "Employees by Years of Service"; break;
                   case "salaryGreaterThan": reportTitle = "Employees by Salary (Greater Than)"; break;
               }
           }
        %>

        <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center"><%= reportTitle %></h2>

        <% if (message != null && !message.isEmpty()) {
               String messageClass = (employees == null || employees.isEmpty()) ? "error" : "success"; // Adjust based on content
        %>
               <div class="message <%= messageClass %>">
                   <%= message %>
               </div>
        <% } %>

        <% if (employees != null && !employees.isEmpty()) { %>
            <div class="table-container">
                <table class="employee-table">
                    <thead>
                        <tr>
                            <th>Empno</th>
                            <th>EmpName</th>
                            <th>DoJ</th>
                            <th>Gender</th>
                            <th>Bsalary</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Employee emp : employees) { %>
                            <tr>
                                <td><%= emp.getEmpno() %></td>
                                <td><%= emp.getEmpName() %></td>
                                <td><%= emp.getDoJ() %></td>
                                <td><%= emp.getGender() %></td>
                                <td><%= String.format("%.2f", emp.getBsalary()) %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else if (message == null || message.isEmpty()) { %>
            <p class="text-center text-gray-600 mt-8">No results to display. Please generate a report.</p>
        <% } %>

        <div class="text-center">
            <a href="ReportServlet" class="back-link">Back to Report Selection</a>
            <br>
            <a href="index.jsp" class="back-link">Back to Main Menu</a>
        </div>
    </div>
</body>
</html>

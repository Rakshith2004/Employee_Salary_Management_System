<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee</title>
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
            max-width: 500px;
        }
        .form-group {
            margin-bottom: 1.25rem;
        }
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #374151;
        }
        .form-input, .form-select {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #374151;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.05);
        }
        .form-input:focus, .form-select:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.25);
        }
        .btn-primary {
            display: block;
            width: 100%;
            padding: 0.75rem 1.25rem;
            border-radius: 0.5rem;
            background-color: #4f46e5;
            color: white;
            font-weight: 600;
            text-decoration: none;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #4338ca;
        }
        .message {
            margin-top: 1.5rem;
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
        .back-link {
            display: inline-block;
            margin-top: 1.5rem;
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
        <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Update Employee Details</h1>

        <% String message = (String) request.getAttribute("message");
           if (message != null) {
               String messageClass = message.contains("successfully") ? "success" : "error"; %>
               <div class="message <%= messageClass %>">
                   <%= message %>
               </div>
        <% } %>

        <form action="UpdateEmployeeServlet" method="post" class="mt-6">
            <div class="form-group">
                <label for="empno_fetch" class="form-label">Enter Employee Number to Update:</label>
                <input type="number" id="empno_fetch" name="empno" class="form-input" required>
            </div>
            <button type="submit" name="action" value="fetch" class="btn-primary mb-4">Fetch Employee</button>
        </form>

        <% Employee employee = (Employee) request.getAttribute("employee");
           if (employee != null) { %>
            <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center mt-8">Edit Employee Information</h2>
            <form action="UpdateEmployeeServlet" method="post">
                <input type="hidden" name="action" value="update">
                <div class="form-group">
                    <label for="empno_update" class="form-label">Employee Number:</label>
                    <input type="number" id="empno_update" name="empno" class="form-input" value="<%= employee.getEmpno() %>" readonly>
                </div>
                <div class="form-group">
                    <label for="empName" class="form-label">Employee Name:</label>
                    <input type="text" id="empName" name="empName" class="form-input" value="<%= employee.getEmpName() %>" required>
                </div>
                <div class="form-group">
                    <label for="doj" class="form-label">Date of Joining:</label>
                    <input type="date" id="doj" name="doj" class="form-input" value="<%= employee.getDoJ() %>" required>
                </div>
                <div class="form-group">
                    <label for="gender" class="form-label">Gender:</label>
                    <select id="gender" name="gender" class="form-select" required>
                        <option value="Male" <%= "Male".equals(employee.getGender()) ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= "Female".equals(employee.getGender()) ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= "Other".equals(employee.getGender()) ? "selected" : "" %>>Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="bsalary" class="form-label">Basic Salary:</label>
                    <input type="number" step="0.01" id="bsalary" name="bsalary" class="form-input" value="<%= employee.getBsalary() %>" required>
                </div>
                <button type="submit" class="btn-primary">Update Employee</button>
            </form>
        <% } %>
        <div class="text-center">
            <a href="index.jsp" class="back-link">Back to Main Menu</a>
        </div>
    </div>
</body>
</html>

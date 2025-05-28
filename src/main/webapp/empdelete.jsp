<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Employee</title>
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
        .form-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #374151;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.05);
        }
        .form-input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.25);
        }
        .btn-primary {
            display: block;
            width: 100%;
            padding: 0.75rem 1.25rem;
            border-radius: 0.5rem;
            background-color: #ef4444; /* Red for delete */
            color: white;
            font-weight: 600;
            text-decoration: none;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #dc2626;
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
        <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Delete Employee</h1>

        <% String message = (String) request.getAttribute("message");
           if (message != null) {
               String messageClass = message.contains("successfully") ? "success" : "error"; %>
               <div class="message <%= messageClass %>">
                   <%= message %>
               </div>
        <% } %>

        <form action="DeleteEmployeeServlet" method="post" class="mt-6">
            <div class="form-group">
                <label for="empno" class="form-label">Employee Number to Delete:</label>
                <input type="number" id="empno" name="empno" class="form-input" required>
            </div>
            <button type="submit" class="btn-primary">Delete Employee</button>
        </form>
        <div class="text-center">
            <a href="index.jsp" class="back-link">Back to Main Menu</a>
        </div>
    </div>
</body>
</html>

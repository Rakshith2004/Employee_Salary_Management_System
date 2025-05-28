<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Employee Reports</title>
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
    <script>
        function updateCriteriaField() {
            const reportType = document.getElementById('reportType').value;
            const criteriaField = document.getElementById('criteria');
            const criteriaLabel = document.getElementById('criteriaLabel');

            criteriaField.value = ''; // Clear previous value
            criteriaField.type = 'text'; // Default to text

            switch (reportType) {
                case 'nameStart':
                    criteriaLabel.textContent = 'Starting Letter:';
                    criteriaField.placeholder = 'e.g., A';
                    break;
                case 'serviceYears':
                    criteriaLabel.textContent = 'Minimum Years of Service:';
                    criteriaField.type = 'number';
                    criteriaField.placeholder = 'e.g., 5';
                    break;
                case 'salaryGreaterThan':
                    criteriaLabel.textContent = 'Minimum Salary:';
                    criteriaField.type = 'number';
                    criteriaField.step = '0.01';
                    criteriaField.placeholder = 'e.g., 50000';
                    break;
                default:
                    criteriaLabel.textContent = 'Criteria:';
                    criteriaField.placeholder = 'Select a report type first';
                    criteriaField.disabled = true;
                    return;
            }
            criteriaField.disabled = false;
        }

        // Initialize on page load
        document.addEventListener('DOMContentLoaded', updateCriteriaField);
    </script>
</head>
<body>
    <div class="container">
        <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Generate Employee Reports</h1>

        <form action="ReportCriteriaServlet" method="post" class="mt-6">
            <div class="form-group">
                <label for="reportType" class="form-label">Select Report Type:</label>
                <select id="reportType" name="reportType" class="form-select" onchange="updateCriteriaField()" required>
                    <option value="">-- Select a Report --</option>
                    <option value="nameStart">Employees whose names start with a specific letter</option>
                    <option value="serviceYears">Employees with N or more years of service</option>
                    <option value="salaryGreaterThan">Employees earning more than a specified salary</option>
                </select>
            </div>
            <div class="form-group">
                <label for="criteria" id="criteriaLabel" class="form-label">Criteria:</label>
                <input type="text" id="criteria" name="criteria" class="form-input" required>
            </div>
            <button type="submit" class="btn-primary">Generate Report</button>
        </form>
        <div class="text-center">
            <a href="index.jsp" class="back-link">Back to Main Menu</a>
        </div>
    </div>
</body>
</html>

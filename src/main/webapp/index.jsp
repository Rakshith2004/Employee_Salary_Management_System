<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Salary Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, #a7bfe8 0%, #6190e8 100%); /* Blue gradient background */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 1.5rem;
            box-sizing: border-box;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.95); /* Slightly transparent white */
            padding: 4rem;
            border-radius: 2rem; /* Even more rounded */
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2); /* Deeper shadow */
            width: 100%;
            max-width: 600px;
            text-align: center;
            backdrop-filter: blur(8px); /* Frosted glass effect */
            border: 1px solid rgba(255, 255, 255, 0.3); /* Subtle white border */
        }
        .title {
            color: #334e68; /* Dark blue-gray for title */
            margin-bottom: 3.5rem;
            font-size: 3rem; /* Larger and more impactful title */
            font-weight: 700;
            letter-spacing: -0.05em; /* Tighter letter spacing for title */
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1); /* More visible text shadow */
        }
        .btn {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 90%; /* Wider buttons */
            max-width: 380px;
            padding: 1.25rem 2rem; /* Even larger buttons */
            margin: 1rem auto; /* More vertical space */
            border-radius: 1rem; /* Very rounded */
            background: linear-gradient(45deg, #6a82fb 0%, #fc5c7d 100%); /* Lively blue-pink gradient */
            color: #ffffff;
            font-weight: 600;
            font-size: 1.2rem; /* Larger text */
            text-decoration: none;
            transition: all 0.4s ease; /* Slower, smoother transition */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            letter-spacing: 0.05em;
            position: relative;
            overflow: hidden; /* Hide overflow for shine effect */
        }
        .btn:hover {
            transform: translateY(-5px) scale(1.02); /* More lift and slight scale */
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25); /* Deeper shadow */
            background: linear-gradient(45deg, #fc5c7d 0%, #6a82fb 100%); /* Reverse gradient on hover */
        }
        .btn:active {
            transform: translateY(0) scale(1);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        /* Shine effect on hover */
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transform: skewX(-30deg);
            transition: all 0.7s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .btn:hover::before {
            left: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Employee Salary Management System</h1>
        <nav>
            <a href="empadd.jsp" class="btn">Add Employee</a>
            <a href="empupdate.jsp" class="btn">Update Employee</a>
            <a href="empdelete.jsp" class="btn">Delete Employee</a>
            <a href="empdisplay.jsp" class="btn">Display Employee</a>
            <a href="ReportServlet" class="btn">Generate Reports</a>
        </nav>
    </div>
</body>
</html>
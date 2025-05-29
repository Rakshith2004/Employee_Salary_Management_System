# Employee Salary Management System

**Subject Name**: Advanced Java

**Subject Code**: BCS613D

**Name**: Rakshith V Rao

**USN**: 4AL22CS115

**Sem/Section**: VI/B

---
A comprehensive web application for managing employee salary records, built with JSP, Servlets, and MySQL following MVC architecture principles.

## 🚀 Features

- **Complete CRUD Operations**: Add, Update, Delete, and Display employee records.
- **Advanced Search**: Display employee records based on Empno (primary key).
- **Comprehensive Reports**: Generate various reports including:
  - Employees whose names start with a specific letter.
  - Employees with N or more years of service.
  - Employees earning more than a specified salary.
- **Input Validation**: Client-side and server-side validation.
- **Professional UI**: Tailwind CSS-based responsive design.
- **MVC Architecture**: Clean separation of concerns.
- **Database Integration**: MySQL with JDBC connectivity.

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

- **Java Development Kit (JDK) 8 or higher**
- **Apache Tomcat 9.0 or higher**
- **MySQL Server 5.7 or XAMPP Server**
- **MySQL JDBC Driver (e.g., mysql-connector-java-8.0.28.jar)**
- **IDE**: Eclipse (J2EE), IntelliJ IDEA, or any Java IDE
- **Web Browser**: Chrome, Firefox, or Edge

## 🛠️ Project Structure

```

EmployeeWebApp/
├── WebContent/
│ ├── index.jsp
│ ├── empadd.jsp
│ ├── empupdate.jsp
│ ├── empdelete.jsp
│ ├── empdisplay.jsp
│ ├── reports.jsp
│ ├── report_form.jsp
│ ├── report_result.jsp
│ └── style.css  <-- Your custom CSS file
├── src/
│ ├── com/
│ ├── dao/
│ │ └── EmployeeDAO.java
│ ├── model/
│ │ └── Employee.java
│ └── servlet/
│ ├── AddEmployeeServlet.java
│ ├── UpdateEmployeeServlet.java
│ ├── DeleteEmployeeServlet.java
│ ├── DisplayEmployeeServlet.java
│ ├── ReportServlet.java
│ └── ReportCriteriaServlet.java
└── WEB-INF/
└── web.xml

```

## 🗄️ Database Setup

### 1. Create Database
```sql
CREATE DATABASE IF NOT EXISTS employeedb;
USE employeedb;
```

### 2. Create Table
```sql
CREATE TABLE IF NOT EXISTS Employee (
    Empno INT PRIMARY KEY,
    EmpName VARCHAR(100),
    DoJ DATE,
    Gender VARCHAR(10),
    Bsalary DECIMAL(10,2)
);
```

### 3. Insert Sample Data (Optional)
```sql
INSERT INTO Employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES
(101, 'Alice Smith', '2020-01-15', 'Female', 60000.00),
(102, 'Bob Johnson', '2018-06-20', 'Male', 75000.50),
(103, 'Charlie Brown', '2022-03-01', 'Male', 50000.00),
(104, 'Diana Prince', '2015-11-10', 'Female', 90000.75),
(105, 'Eve Adams', '2023-09-05', 'Female', 45000.00);
```

## ⚙️ Installation & Setup

### Step 1: Clone/Download the Project
Download all the project files and organize them according to the project structure above into your EmployeeWebApp directory.

### Step 2: Database Configuration
1.Start your MySQL server.
2.Run the database setup scripts provided above in your MySQL client.
3.Update database credentials in `EmployeeDAO.java`:
```java
connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/employeedb,
    "your_username", 
    "your_password"); 
```

### Step 3: Add MySQL JDBC Driver
1.Download MySQL Connector/J from the official MySQL website.
2.Add the JAR file to your project's WebContent/WEB-INF/lib directory.
3.If using an IDE, add it to your project's build path.

### Step 4: Deploy to Tomcat
1.Create a new Dynamic Web Project in your IDE.
2.Copy all source files (.java) to the src folder (ensuring package structure is maintained).
3.Copy all JSP files (.jsp) and style.css to the WebContent folder.
4.Copy web.xml to the WebContent/WEB-INF folder.
5.Deploy the project to your Apache Tomcat server.
6.Start the Tomcat server.

### Step 5: Access the Application
Open your web browser and navigate to:
```
http://localhost:8080/EmployeeWebApp/
```

## 🖼️ Screenshots

### 🏠 Home Page
<img src="Screenshot/Home_page.png"alt="home page"width="700"/>

### ➕ Add Employee Page


### 🆕 Update Employee


### 📋 Display Employee


### 🔍 Generate Reports


### ❌ Delete Employee


## 🎯 Usage Application

### Adding Employee Records
1.Navigate to "Add Employee" from the main menu.
2.Fill in all required fields: 
  - Employee Number (unique)
  - Employee Name
  - Date of Joining (YYYY-MM-DD)
  - Gender
  - Basic Salary
3.Click "Add Employee".

### Updating Employee Records
1.Go to "Update Employee".
2.Enter the Empno of the employee you wish to update and click "Fetch Employee".
3.Modify the displayed information.
4.Click "Update Employee".

### Deleting Employee Records
1.Go to "Delete Employee".
2.Enter the Empno of the employee you wish to delete.
3.Click "Delete Employee".

### Displaying Employee Records
1.Go to "Display Employee".
2.Enter the Empno of the employee you want to view.
3.Click "Display Employee".

### Generating Reports
1.Go to "Generate Reports".
2.Select the desired report type from the dropdown:
  - Employees whose names start with a specific letter: Enter the starting letter (e.g., 'A').
  - Employees with N or more years of service: Enter the minimum number of years (e.g., '5').
  - Employees earning more than a specified salary: Enter the minimum salary amount (e.g., '50000').
3.Click "Generate Report".
4.View the results displayed in a table.

## 🔧 Technical Features

### Input Validation
- **Client-side**: Basic HTML5 validation (e.g., required, type="date", type="number").
- **Server-side**: Comprehensive validation in Servlets to ensure data integrity before database operations.
- **Database constraints**: Primary key for Empno and NOT NULL constraints.

### Error Handling
- try-catch blocks for robust database operations.
- User-friendly error messages displayed on JSP pages.
- Graceful handling of invalid inputs (e.g., NumberFormatException, IllegalArgumentException for dates).

### Security Features
- Prepared statements are used in EmployeeDAO to prevent SQL injection vulnerabilities.
- Input validation helps mitigate common web vulnerabilities.

### Responsive Design
- Utilizes Tailwind CSS classes for a modern, responsive user interface that adapts to various screen sizes.
- Custom CSS (style.css) enhances the visual appeal and layout.

## 🧪 Testing the Application

### Test Cases to Verify:

1.**Add Operations**:
- Add valid employee records.
- Try adding duplicate Empno (should fail with an appropriate message).
- Test input validation (empty fields, invalid date formats, non-numeric salary/empno).

2.**Update Operations**:
- Fetch and update existing records successfully.
- Try updating a non-existent Empno.
- Test field validation during update.

3.**Delete Operations**:
- Delete existing records successfully.
- Try deleting a non-existent Empno.

4.**Display Operations**:
- Display details for a valid Empno.
- Display a message for an invalid/non-existent Empno.

5.**Report Generation**:
- Generate all three types of reports with different criteria values.
- Verify that the correct employees are listed for each report.
- Test edge cases for criteria (e.g., a starting letter with no matching names, very high salary threshold).

## 🎓 Outcomes

This project demonstrates:
- **MVC Architecture**: Clear separation between Model (Employee), View (JSP pages), and Controller (Servlets).
- **Database Integration**: Performing full CRUD operations with MySQL using JDBC.
- **Web Development**: Practical application of JSP, Servlets, HTML, CSS (Tailwind and custom), and JavaScript for dynamic web content.
- **Input Validation**: Implementing both client-side and server-side validation for data integrity.
- **Report Generation**: Dynamic data analysis and presentation based on user-defined criteria.
- **Professional UI**: Creation of a responsive and user-friendly interface using modern CSS frameworks.

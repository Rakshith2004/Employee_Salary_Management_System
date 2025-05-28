package com.dao;

import com.model.Employee;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/employeedb";
    private String jdbcUsername = "root"; // Replace with your MySQL username
    private String jdbcPassword = ""; // Replace with your MySQL password

    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO Employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT Empno, EmpName, DoJ, Gender, Bsalary FROM Employee WHERE Empno = ?";
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM Employee";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM Employee WHERE Empno = ?";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE Employee SET EmpName = ?, DoJ = ?, Gender = ?, Bsalary = ? WHERE Empno = ?";
    private static final String SELECT_EMPLOYEES_BY_NAME_START = "SELECT * FROM Employee WHERE EmpName LIKE ? ORDER BY EmpName";
    private static final String SELECT_EMPLOYEES_BY_SALARY_GT = "SELECT * FROM Employee WHERE Bsalary > ? ORDER BY Bsalary DESC";

    public EmployeeDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load JDBC driver.");
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Method to add a new employee
    public boolean addEmployee(Employee employee) {
        boolean rowInserted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            preparedStatement.setInt(1, employee.getEmpno());
            preparedStatement.setString(2, employee.getEmpName());
            preparedStatement.setDate(3, employee.getDoJ());
            preparedStatement.setString(4, employee.getGender());
            preparedStatement.setDouble(5, employee.getBsalary());
            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowInserted;
    }

    // Method to retrieve an employee by Empno
    public Employee getEmployeeByEmpno(int empno) {
        Employee employee = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            preparedStatement.setInt(1, empno);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String empName = rs.getString("EmpName");
                Date doj = rs.getDate("DoJ");
                String gender = rs.getString("Gender");
                double bsalary = rs.getDouble("Bsalary");
                employee = new Employee(empno, empName, doj, gender, bsalary);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employee;
    }

    // Method to get all employees
    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int empno = rs.getInt("Empno");
                String empName = rs.getString("EmpName");
                Date doj = rs.getDate("DoJ");
                String gender = rs.getString("Gender");
                double bsalary = rs.getDouble("Bsalary");
                employees.add(new Employee(empno, empName, doj, gender, bsalary));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employees;
    }

    // Method to update an existing employee
    public boolean updateEmployee(Employee employee) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL)) {
            preparedStatement.setString(1, employee.getEmpName());
            preparedStatement.setDate(2, employee.getDoJ());
            preparedStatement.setString(3, employee.getGender());
            preparedStatement.setDouble(4, employee.getBsalary());
            preparedStatement.setInt(5, employee.getEmpno());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdated;
    }

    // Method to delete an employee
    public boolean deleteEmployee(int empno) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            preparedStatement.setInt(1, empno);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }

    // Report: Employees whose names start with a specific letter
    public List<Employee> getEmployeesByNameStart(String letter) {
        List<Employee> employees = new ArrayList<>();
        String searchPattern = letter + "%";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEES_BY_NAME_START)) {
            preparedStatement.setString(1, searchPattern);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int empno = rs.getInt("Empno");
                String empName = rs.getString("EmpName");
                Date doj = rs.getDate("DoJ");
                String gender = rs.getString("Gender");
                double bsalary = rs.getDouble("Bsalary");
                employees.add(new Employee(empno, empName, doj, gender, bsalary));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employees;
    }

    // Report: Employees with N or more years of service
    public List<Employee> getEmployeesByServiceYears(int years) {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES); // Fetch all and filter in Java
             ResultSet rs = preparedStatement.executeQuery()) {

            LocalDate currentDate = LocalDate.now();
            while (rs.next()) {
                int empno = rs.getInt("Empno");
                String empName = rs.getString("EmpName");
                Date dojSql = rs.getDate("DoJ");
                String gender = rs.getString("Gender");
                double bsalary = rs.getDouble("Bsalary");

                LocalDate dojLocal = dojSql.toLocalDate();
                Period period = Period.between(dojLocal, currentDate);
                if (period.getYears() >= years) {
                    employees.add(new Employee(empno, empName, dojSql, gender, bsalary));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employees;
    }

    // Report: Employees earning more than a specified salary
    public List<Employee> getEmployeesBySalaryGreaterThan(double salary) {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEES_BY_SALARY_GT)) {
            preparedStatement.setDouble(1, salary);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int empno = rs.getInt("Empno");
                String empName = rs.getString("EmpName");
                Date doj = rs.getDate("DoJ");
                String gender = rs.getString("Gender");
                double bsalary = rs.getDouble("Bsalary");
                employees.add(new Employee(empno, empName, doj, gender, bsalary));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employees;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQL State: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empName = request.getParameter("empName");
            Date doj = Date.valueOf(request.getParameter("doj")); // Convert String to java.sql.Date
            String gender = request.getParameter("gender");
            double bsalary = Double.parseDouble(request.getParameter("bsalary"));

            Employee newEmployee = new Employee(empno, empName, doj, gender, bsalary);
            if (employeeDAO.addEmployee(newEmployee)) {
                message = "Employee added successfully!";
            } else {
                message = "Failed to add employee. Employee number might already exist.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid input for Empno or Basic Salary. Please enter numeric values.";
            e.printStackTrace();
        } catch (IllegalArgumentException e) { // For Date.valueOf()
            message = "Invalid date format. Please use YYYY-MM-DD.";
            e.printStackTrace();
        } catch (Exception e) {
            message = "An error occurred: " + e.getMessage();
            e.printStackTrace();
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("empadd.jsp").forward(request, response);
    }
}

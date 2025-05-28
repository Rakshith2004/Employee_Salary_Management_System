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

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String message = "";
        Employee employee = null;

        if ("fetch".equals(action)) {
            try {
                int empno = Integer.parseInt(request.getParameter("empno"));
                employee = employeeDAO.getEmployeeByEmpno(empno);
                if (employee == null) {
                    message = "Employee with Empno " + empno + " not found.";
                }
            } catch (NumberFormatException e) {
                message = "Invalid Employee Number.";
                e.printStackTrace();
            } catch (Exception e) {
                message = "An error occurred while fetching employee: " + e.getMessage();
                e.printStackTrace();
            }
            request.setAttribute("employee", employee); // Pass fetched employee to JSP
            request.setAttribute("message", message);
            request.getRequestDispatcher("empupdate.jsp").forward(request, response);

        } else if ("update".equals(action)) {
            try {
                int empno = Integer.parseInt(request.getParameter("empno"));
                String empName = request.getParameter("empName");
                Date doj = Date.valueOf(request.getParameter("doj"));
                String gender = request.getParameter("gender");
                double bsalary = Double.parseDouble(request.getParameter("bsalary"));

                Employee updatedEmployee = new Employee(empno, empName, doj, gender, bsalary);
                if (employeeDAO.updateEmployee(updatedEmployee)) {
                    message = "Employee updated successfully!";
                } else {
                    message = "Failed to update employee. Employee not found or no changes made.";
                }
            } catch (NumberFormatException e) {
                message = "Invalid input for Empno or Basic Salary. Please enter numeric values.";
                e.printStackTrace();
            } catch (IllegalArgumentException e) {
                message = "Invalid date format. Please use YYYY-MM-DD.";
                e.printStackTrace();
            } catch (Exception e) {
                message = "An error occurred: " + e.getMessage();
                e.printStackTrace();
            }
            request.setAttribute("message", message);
            // After update, clear the employee object so the form resets
            request.setAttribute("employee", null);
            request.getRequestDispatcher("empupdate.jsp").forward(request, response);
        }
    }
}

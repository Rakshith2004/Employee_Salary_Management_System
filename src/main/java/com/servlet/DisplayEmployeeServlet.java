package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayEmployeeServlet")
public class DisplayEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";
        Employee employee = null;
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            employee = employeeDAO.getEmployeeByEmpno(empno);
            if (employee == null) {
                message = "Employee with Empno " + empno + " not found.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid Employee Number. Please enter a numeric value.";
            e.printStackTrace();
        } catch (Exception e) {
            message = "An error occurred: " + e.getMessage();
            e.printStackTrace();
        }
        request.setAttribute("employee", employee); // Pass the found employee object to JSP
        request.setAttribute("message", message);
        request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
    }
}

package com.servlet;

import com.dao.EmployeeDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
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
            if (employeeDAO.deleteEmployee(empno)) {
                message = "Employee with Empno " + empno + " deleted successfully!";
            } else {
                message = "Failed to delete employee. Employee with Empno " + empno + " not found.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid Employee Number. Please enter a numeric value.";
            e.printStackTrace();
        } catch (Exception e) {
            message = "An error occurred: " + e.getMessage();
            e.printStackTrace();
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("empdelete.jsp").forward(request, response);
    }
}

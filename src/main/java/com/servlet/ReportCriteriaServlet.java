package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        String criteria = request.getParameter("criteria");
        List<Employee> employees = null;
        String message = "";

        try {
            switch (reportType) {
                case "nameStart":
                    if (criteria != null && !criteria.trim().isEmpty()) {
                        employees = employeeDAO.getEmployeesByNameStart(criteria.trim());
                    } else {
                        message = "Please provide a starting letter for the name report.";
                    }
                    break;
                case "serviceYears":
                    try {
                        int years = Integer.parseInt(criteria);
                        employees = employeeDAO.getEmployeesByServiceYears(years);
                    } catch (NumberFormatException e) {
                        message = "Please enter a valid number for years of service.";
                    }
                    break;
                case "salaryGreaterThan":
                    try {
                        double salary = Double.parseDouble(criteria);
                        employees = employeeDAO.getEmployeesBySalaryGreaterThan(salary);
                    } catch (NumberFormatException e) {
                        message = "Please enter a valid number for salary.";
                    }
                    break;
                default:
                    message = "Invalid report type selected.";
                    break;
            }

            if (employees != null && employees.isEmpty()) {
                message = "No employees found for the specified criteria.";
            }

        } catch (Exception e) {
            message = "An error occurred while generating the report: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("employees", employees);
        request.setAttribute("message", message);
        request.setAttribute("reportType", reportType); // To display report type on result page
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}

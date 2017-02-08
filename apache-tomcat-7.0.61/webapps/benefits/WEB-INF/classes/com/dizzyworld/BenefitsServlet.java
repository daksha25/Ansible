package com.dizzyworld;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.Enumeration;

public class BenefitsServlet extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) 
    throws IOException, ServletException {
        response.setContentType("text/html");
        ServletOutputStream out = response.getOutputStream();

        String[] benefitNames = request.getParameterValues("benefit");

        for (String benefit : benefitNames) {
            if (benefit.equals("vacation")) {
                RequestDispatcher rd = request.getRequestDispatcher("company.jsp");
                rd.include(request, response);
                continue;
            }
            if (benefit.equals("health")) {
                RequestDispatcher rd = request.getRequestDispatcher("health.jsp");
                rd.include(request, response);
                continue;
            }
            if (benefit.equals("vision")) {
                RequestDispatcher rd = request.getRequestDispatcher("vision.jsp");
                rd.include(request, response);
                continue;
            }
            if (benefit.equals("dental")) {
                RequestDispatcher rd = request.getRequestDispatcher("dental.jsp");
                rd.include(request, response);
                continue;
            }
        }

        out.print("<BR><A HREF='./welcome.html'>Back To Home Page</A><BR>");

    }
}
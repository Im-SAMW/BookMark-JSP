package com.sam.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sam
 */
public class InvalidateSessionServlet extends HttpServlet {

    public void Invalidate(HttpServletRequest request, HttpServletResponse response) throws IOException{
        // 销毁session
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpSession session = servletRequest.getSession();
        session.removeAttribute("user");
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Invalidate(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Invalidate(request,response);
    }
}

package com.sam.servlet;

import com.sam.dao.UserDao;
import com.sam.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sam
 */

public class UserServlet extends HttpServlet {
    private UserDao dao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //request.setCharacterEncoding("utf-8");
            String uname = request.getParameter("uname");
            String upass = request.getParameter("upass");
            User user = new User();
            user.setUname(uname);
            user.setUpass(upass);
            
            if(dao.login(user) == 2){
                //user.setUadmin(2);
                HttpSession session = request.getSession(true);
                //session.setAttribute("user", user);
                session.setAttribute("user", uname);
                //request.getRequestDispatcher("/operation/loginSuccess.jsp").forward(request, response);
                response.sendRedirect("operation/loginSuccess.jsp");
            } else if(dao.login(user) == 1) {
                //user.setUadmin(1);
                HttpSession session = request.getSession(true);
                //session.setAttribute("user", user);
                session.setAttribute("user", uname);
                response.sendRedirect("Admin.do");
                //request.getRequestDispatcher("Admin.do").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

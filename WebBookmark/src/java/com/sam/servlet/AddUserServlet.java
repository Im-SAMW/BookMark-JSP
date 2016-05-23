package com.sam.servlet;

import com.sam.dao.RegisterDao;
import com.sam.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sam
 */
public class AddUserServlet extends HttpServlet {
    private RegisterDao dao = new RegisterDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");
        String uemail = request.getParameter("uemail");
        User user = new User();
        user.setUname(uname);
        user.setUpass(upass);
        user.setUemail(uemail);
        
        if(dao.register(user)){
            response.sendRedirect("Admin.do");
        } else {
            
        }
    }

}

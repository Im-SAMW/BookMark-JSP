package com.sam.servlet;

import com.sam.dao.UserDao;
import com.sam.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sam
 */
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");
        String uemail = request.getParameter("uemail");

        User user = new User();
        user.setUid(Integer.parseInt(uid));
        user.setUname(uname);
        user.setUpass(upass);
        user.setUemail(uemail);
        
        
        if(UserDao.editUser(user)){
            response.sendRedirect("Admin.do");
        } else {
            
        }
    }
}

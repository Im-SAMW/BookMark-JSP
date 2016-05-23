package com.sam.servlet;

import com.sam.dao.RegisterDao;
import com.sam.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sam
 */
public class RegisterServlet extends HttpServlet {
    private RegisterDao dao = new RegisterDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            //request.setCharacterEncoding("utf-8");
            String uname = request.getParameter("uname");
            String upass = request.getParameter("upass1");
            String uemail = request.getParameter("uemail");
            User user = new User();
            user.setUname(uname);
            user.setUpass(upass);
            user.setUemail(uemail);
            
            if(dao.register(user)){
                HttpSession session = request.getSession(true);
                session.setAttribute("user", uname);
                response.sendRedirect("operation/registerSuccess.jsp");
                //request.getRequestDispatcher("/operation/registerSuccess.jsp").forward(request, response);
            } else {
                response.sendRedirect("register.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

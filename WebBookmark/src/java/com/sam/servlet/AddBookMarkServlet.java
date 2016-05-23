package com.sam.servlet;

import com.sam.dao.ListDao;
import com.sam.model.BookMark;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sam
 */
public class AddBookMarkServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getSession().getAttribute("user").toString();
        String bname = request.getParameter("bname");
        String burl = request.getParameter("burl");
        String bclass = request.getParameter("bclass");
        String newbclass = request.getParameter("newbclass");
        BookMark bm = new BookMark();
        bm.setBname(bname);
        bm.setBurl(burl);
        if(bclass == "null" || bclass.equals("null")){
            bm.setBclass(newbclass);
        }else{
            bm.setBclass(bclass);
        }
        
        if(ListDao.addBookMark(bm,user)){
            response.sendRedirect("List.do");
        } else {
            
        }
    }
}

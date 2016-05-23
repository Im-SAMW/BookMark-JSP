package com.sam.servlet;

import com.sam.dao.ListDao;
import com.sam.model.BookMark;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sam
 */
public class ShowEditBookMarkServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bid = request.getParameter("bid");
        String user = request.getSession().getAttribute("user").toString();
        List<BookMark> list = ListDao.getSearchEdit(bid,user);
        request.setAttribute("list", list);
        request.getRequestDispatcher("operation/editBookMark.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

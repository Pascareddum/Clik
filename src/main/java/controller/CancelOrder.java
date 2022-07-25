package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.dao.ConPool;
import model.dao.OrderDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/cancel-order")
public class CancelOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out=response.getWriter()){
            String id=request.getParameter("id");
            if(id!=null){
                OrderDAO orderDao=new OrderDAO(ConPool.getConnection());
                orderDao.cancelOrder(Integer.parseInt(id));
            }
            response.sendRedirect("order.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

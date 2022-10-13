package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;
import model.dao.ConPool;
import model.dao.OrderDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/check-out")
public class CheckOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out=response.getWriter()) {

            SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();

            ArrayList<Cart> cart_list=(ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            User auth=(User) request.getSession().getAttribute("auth");

            if(cart_list!=null && auth!=null){

                for (Cart c:cart_list){
                    Order order=new Order();
                    order.setId(c.getId());
                    order.setUid(auth.getId());
                    order.setQuantity(c.getQuantity());
                    order.setDate(formatter.format(date));

                    OrderDAO oDao=new OrderDAO(ConPool.getConnection());
                    boolean result= oDao.insertOrder(order);
                    if(!result) break;
                }

                cart_list.clear();
                response.sendRedirect("orders.jsp");
            }else{
                if(auth==null) response.sendRedirect("login.jsp");
                response.sendRedirect("cart.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

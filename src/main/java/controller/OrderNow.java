package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;
import model.dao.ConPool;
import model.dao.OrderDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/order-now")
public class OrderNow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out=response.getWriter()){

            SimpleDateFormat formatter=new SimpleDateFormat(("yyyy-MM-dd"));

            Date date=new Date();
            User auth=(User)request.getSession().getAttribute("auth");
            if(auth!=null){
                String productId=request.getParameter("id");
                int productQuantity=Integer.parseInt(request.getParameter("quantity"));
                if(productQuantity<=0){
                    productQuantity=1;
                }

                Order orderModel=new Order();
                orderModel.setId(Integer.parseInt(productId));
                orderModel.setUid(auth.getId());
                orderModel.setQuantity(productQuantity);
                orderModel.setDate(formatter.format(date));

                OrderDAO orderDao=new OrderDAO(ConPool.getConnection());
                boolean result= orderDao.insertOrder(orderModel);

                if(result){
                    ArrayList<Cart> cart_list=(ArrayList< Cart >) request.getSession().getAttribute("cart-list");
                    if(cart_list !=null){
                        for(Cart c:cart_list){
                            if(c.getId()==Integer.parseInt(productId)){
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
                    response.sendRedirect("orders.jsp");
                }else{
                    out.print("Ordine fallito");
                }

            }else{
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

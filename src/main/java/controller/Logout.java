package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/log-out")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if(request.getSession().getAttribute("auth")!=null){
            /*request.getSession().removeAttribute("cart-list");
            request.getSession().removeAttribute("cart_list");
            request.getSession().removeAttribute("auth");*/
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("index.jsp");
        }
    }
}

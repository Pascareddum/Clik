package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/log-out")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out=response.getWriter()){
            if(request.getSession().getAttribute("auth")!=null){
                request.getSession().removeAttribute("auth");
                response.sendRedirect("login.jsp");
            }else{
                response.sendRedirect("index.jsp");
            }
        }
    }
}

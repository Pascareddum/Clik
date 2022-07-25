package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

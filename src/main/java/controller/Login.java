package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.dao.ConPool;
import model.User;
import model.dao.UserDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            String email=request.getParameter("Login-email");
            String password=request.getParameter("Login-password");


                UserDAO udao=new UserDAO();
                User user=udao.userLogin(email,password);
                if(user !=null){
                    request.getSession().setAttribute("auth", user);
                    response.sendRedirect("index.jsp");
                }else{
                    response.sendRedirect("login.jsp");
                }
    }
}


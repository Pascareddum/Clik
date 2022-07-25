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
        try(PrintWriter out=response.getWriter()){
            String email=request.getParameter("Login-email");
            String password=request.getParameter("Login-password");

            try {
                UserDAO udao=new UserDAO(ConPool.getConnection());
                User user=udao.userLogin(email,password);
                if(user !=null){
                    request.getSession().setAttribute("auth", user);
                    response.sendRedirect("index.jsp");
                }else{
                    out.print("there is no user");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

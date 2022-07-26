package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/registration")
public class Registration extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*User u=new User();
        String firstName=request.getParameter("firstName");
        String lastName=request.getParameter("lastName");
        double balance=Double.parseDouble(request.getParameter("balance"));

        u.setName();
        u.setEmail();
        u.setPassword();
        u.setDate();

        UserDAO user=new UserDAO();
        user.doSave(u);

        request.setAttribute("customer",customer);*/
    }

}

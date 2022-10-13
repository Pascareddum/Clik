package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.dao.UserDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String surname=request.getParameter("surname");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        int id=Integer.parseInt(request.getParameter("id"));
        boolean admin= Boolean.parseBoolean(request.getParameter("admin"));

        User user=new User();
        user.setName(name);
        user.setSurname(surname);
        user.setEmail(email);
        user.setPassword(password);
        user.setId(id);
        user.setAdmin(admin);

        UserDAO u=new UserDAO();
        u.updateUser(user);

        request.setAttribute("user",user);
        String address="/WEB-INF/admin.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
}

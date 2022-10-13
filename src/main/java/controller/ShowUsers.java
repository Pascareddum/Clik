package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.dao.UserDAO;

import java.io.IOException;
import java.util.List;

@WebServlet("/showUsers")
public class ShowUsers extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO service=new UserDAO();
        List<User> users;
        users=service.doRetriveAll();
        request.setAttribute("users",users);

        String address="/WEB-INF/results/showUsers.jsp";
        RequestDispatcher dispatcher=request.getRequestDispatcher(address);
        dispatcher.forward(request,response);
    }
}

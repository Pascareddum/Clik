package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/UserList")
public class UserList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String andress="/WEB-INF/results/updateUser.jsp";
        int userId=Integer.parseInt(request.getParameter("id"));
        UserDAO userdao=new UserDAO();
        User user=userdao.doRetrieveById(userId);
        request.setAttribute("user",user);
        RequestDispatcher dispatcher=request.getRequestDispatcher(andress);
        dispatcher.forward(request,response);
    }
}

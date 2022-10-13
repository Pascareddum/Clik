package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adress="/WEB-INF/admin.jsp";
        int userId=Integer.parseInt(request.getParameter("id"));
        UserDAO userdao=new UserDAO();
        userdao.delete(userId);
        RequestDispatcher dispatcher=request.getRequestDispatcher(adress);
        dispatcher.forward(request,response);
    }
}

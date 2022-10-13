package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.dao.ProductDAO;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/deleteProduct")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adress="/WEB-INF/admin.jsp";
        int userId=Integer.parseInt(request.getParameter("id"));
        ProductDAO productdao=new ProductDAO();
        productdao.delete(userId);
        RequestDispatcher dispatcher=request.getRequestDispatcher(adress);
        dispatcher.forward(request,response);
    }
}

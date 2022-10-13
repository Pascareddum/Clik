package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.User;
import model.dao.ProductDAO;
import model.dao.UserDAO;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/showProducts")
public class ShowProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO service=new ProductDAO();
        List<Product> products;
        products=service.doRetriveAll();
        request.setAttribute("products",products);

        String address="/WEB-INF/results/showProducts.jsp";
        RequestDispatcher dispatcher=request.getRequestDispatcher(address);
        dispatcher.forward(request,response);
    }
}

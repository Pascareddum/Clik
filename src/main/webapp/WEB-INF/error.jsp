<%@ page import="model.User" %>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="model.dao.ConPool" %>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
    }

    ProductDAO pd=new ProductDAO();
    List<Product> products= pd.getAllProducts();
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
%>
<!DOCTYPE html>
<html lang="it-IT">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title><%= (String) request.getAttribute("type") %></title>
    <%@ include file="/template-parts/header.jsp"%>
</head>
<body onload="updateCount()">
<%@include file="/template-parts/navbar.jsp"%>

<script>
    let count = 11;
    function updateCount() {
        count = count - 1;
        document.getElementById("timer").innerHTML = count;
        setTimeout(updateCount, 1000);
    }
    setTimeout("window.location.href='<%= (String) request.getAttribute("redirect") %>'", 10000)
</script>

<div class="<%= (String) request.getAttribute("type") %> text-center">
    <h1><%= (String) request.getAttribute("msg") %></h1>
    <h2><a class="btn rounded-left" style="background-color:#eed9c4" href="<%= (String) request.getAttribute("redirect") %>" class="error">Procedi</a></h2>
    <span id="timer" class="error"></span>
</div>

<%@include file="/template-parts/footer.jsp"%>
</body>
</html>
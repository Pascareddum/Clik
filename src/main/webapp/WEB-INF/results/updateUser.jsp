<%@ page import="model.User" %>
<%@ page import="model.*"%>
<%@ page import="java.util.*" %>
<%
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
    }

    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clik</title>
    <%@include file="/template-parts/header.jsp"%>
</head>
<body>
<%@include file="/template-parts/navbar.jsp"%>
<form action="updateUser">
    <input type="hidden" id="id" name="id" value="${user.id}">
    <label for="name">Nome:</label>
    <input type="text" id="name" name="name" value="${user.name}"><br>
    <label for="surname">Cognome:</label>
    <input type="text" id="surname" name="surname" value="${user.surname}"><br>
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" value="${user.email}">
    <label for="password">Password</label>
    <input type="text" id="password" name="password" value="${user.password}">
    <input type="hidden" id="admin" name="admin" value="${user.admin}">
    <input type="submit" value="Modifica">
</form>
<a class="btn rounded-left" style="background-color:#eed9c4" href="index.jsp">Home-page</a>
<a class="btn rounded-left" style="background-color:#eed9c4" href="admin" >Admin</a>

<%@include file="/template-parts/footer.jsp"%>
</body>
</html>

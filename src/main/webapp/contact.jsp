<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<html>
<head>
    <title>Clik</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<div class="text-center">
    <br> <br> <h1> I nostri contatti: </h1>
    <br>
    <p><img src="images/mailIcon.png" style="width: 40px;height: 40px;">a.pascarella9@studenti.unisa.it</p>
    <p><img src="images/phoneIcon.png" style="width: 25px;height: 25px"> 0512109149</p>
</div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>

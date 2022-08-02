<%@ page import="model.User" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
        response.sendRedirect("index.jsp");
    }

    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Click</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<div class="container padding-bottom-3x mb-2 mt-5">
    <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10">
        <div class="forgot">
        <h1> Password dimenticata?</h1>
        <p> Cambia la tua password in 3 semplici step!</p>
    <ol>
        <li>Inserisci il tuo indirizzo email qui sotto</li>
        <li>Il nostro sistema ti invierà un pin temporaneo </li>
        <li>Inserisci il pin temporaneo alla prossima pagine</li>
    </ol>
    </div>
<form class="card mt-4" action="forgotPassword" method="post">
    <div class="card-body">
        <div class="form-group">
            <label for="email"> Inserisci il tuo indirizzio email</label>
            <input class="form-control" type="text" name="email" id="email">
        </div>
    </div>
        <div class="card-footer">
            <button type="submit"> Nuova password</button>
            <a href="login.jsp" style="text-align: right">Torna al login</a>
        </div>
</form>
    </div>
    </div>
</div>


<%@include file="template-parts/footer.jsp"%>
</body>
</html>

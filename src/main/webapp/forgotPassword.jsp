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
    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center" style="background-color:#eed9c4"><h4> Password dimenticata?</h4></div>
        <div class="forgot">
        <p> Cambia la tua password in 3 semplici step!</p>
    <ol>
        <li>Inserisci il tuo indirizzo email qui sotto</li>
        <li>Il nostro sistema ti invierà un OTP </li>
        <li>Inserisci l'OTP nella prossima pagina</li>
    </ol>
    </div>
<form action="forgotPassword" method="post">
        <div class="form-group">
            <label for="email"> Inserisci il tuo indirizzio email</label>
            <input class="form-control" type="text" name="email" id="email">
        </div>
        <div class="box text-center">
            <button type="submit" class="btn" style="background-color: #eed9c4"> Nuova password</button>
            <a href="login.jsp" style="text-align: right">Torna al login</a>
        </div>
</form>
    </div>
    </div>
<%@include file="template-parts/footer.jsp"%>
</body>
</html>

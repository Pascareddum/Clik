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
<html>
<head>
    <title>Clik-login</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<div style="justify-content: center; display: flex;"  class="container">
    <div class="card">
        <div class="card-header">Login utente</div>
        <div class="card-body">
            <form action="login" method="post">
                <div class="form-group">
                    <label>Indirizzo email</label>
                    <input type="email" class="form-control" name="Login-email" placeholder="inserisci l'email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="Login-password" placeholder="********" required>
                </div>

             <!--   <div class="forget-box">
                    <a href="#" class="link">forget password</a>
                </div> -->

                <div class="form-group">
                    <button type="submit" class="btn"> Login</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="template-parts/footer.jsp"%>
</body>
</html>

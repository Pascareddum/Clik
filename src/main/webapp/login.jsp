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
    <title>Clik</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center" style="background-color:#eed9c4">Login utente</div>
        <div class="card-body">
            <form action="login" method="post">
                <div class="form-group">
                    <label>Indirizzo email</label>
                    <input type="email" name="Login-email" class="form-control" placeholder="Inserisci email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="Login-password" class="form-control" placeholder="******" required>
                </div>
                <div class="box text-center">
                    <button type="submit" class="btn" style="background-color:#eed9c4">Login</button> <br> <br>
                    <a href="forgotPassword.jsp">Password dimenticata?</a> <br> <br>
                    Non hai un account? <a href="register.jsp">Registrati</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="template-parts/footer.jsp"%>
</body>
</html>

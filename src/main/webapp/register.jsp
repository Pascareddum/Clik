<%@ page import="model.User" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %><%
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
<title>Clik-register</title>
<%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center" style="background-color:#eed9c4">Registrazione utente</div>
                <div class="card-body">
                    <form action="registration" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <div class="form-outline">
                                    <label class="form-label">Nome:</label>
                                    <input type="text" name="name" class="form-control" placeholder="Mickey">
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="form-outline">
                                    <label class="form-label">Cognome:</label>
                                    <input type="text" name="surname" class="form-control" placeholder="Mouse">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-4 pb-2">
                                <div class="form-outline">
                                    <label class="form-label">Email:</label>
                                    <input type="email" name="email" class="form-control" placeholder="mickeymouse@mail.com">
                                </div>
                            </div>
                            <div class="col-md-6 mb-4 pb-2">
                                <div class="form-outline">
                                    <label class="form-label">Password:</label>
                                    <input type="password" name="password" class="form-control" placeholder="******">
                                </div>
                            </div>
                        </div>
                    <div class="box text-center">
                        <button type="submit" class="btn" style="background-color: #eed9c4">Registrati</button>
                    </div>
                    </form>
                </div>
            <p style="text-align: center">Hai gi&agrave; un account? <a href="login.jsp">Accedi</a></p>
        </div>
    </div>
<%@include file="template-parts/footer.jsp"%>
</body>
</html>

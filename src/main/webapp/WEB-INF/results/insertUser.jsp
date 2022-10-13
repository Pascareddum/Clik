<%@ page import="model.User" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %><%
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
    }

    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
%>
<html>
<head>
    <title>Clik-register</title>
    <%@include file="/template-parts/header.jsp"%>
</head>
<body>
<script>
    var password=document.getElementsByName("password");
    var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])");
    if(strongRegex.test(password))
        alert("Errore password! La password deve contenere almeno un carattere minuscolo e un carattere maiuscolo");
</script>
<%@include file="/template-parts/navbar.jsp"%>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center" style="background-color:#eed9c4">Nuovo utente</div>
        <div class="card-body">
            <form action="insertUser" method="post">
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <label class="form-label">Nome:</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <label class="form-label">Cognome:</label>
                            <input type="text" name="surname" class="form-control"required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-4 pb-2">
                        <div class="form-outline">
                            <label class="form-label">Email:</label>
                            <input type="email" name="email" class="form-control"required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4 pb-2">
                        <div class="form-outline">
                            <label class="form-label">Password:</label>
                            <input type="password" name="password" class="form-control"required>
                        </div>
                    </div>
                </div>
                <div class="box text-center">
                    <button type="submit" class="btn" style="background-color: #eed9c4">Inserisci</button>
                </div>
            </form>
        </div>
    </div>
    <a class="btn rounded-left" style="background-color:#eed9c4" href="index.jsp">Home-page</a>
    <a class="btn rounded-left" style="background-color:#eed9c4" href="admin" >Admin</a>
</div>

<%@include file="/template-parts/footer.jsp"%>
</body>
</html>

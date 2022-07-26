<nav class="navbar">
    <div class="container-fluid">
        <a href="index.jsp"> <img style="max-width: 40px" src="./images/Camera%20icon.png"></a>
        <a  class="nav-link" href="#">Chi siamo</a>
        <a  class="nav-link" href="#">Servizi</a>
        <a  class="nav-link" href="#">Contatti</a>
        <a  class="nav-link" href="products.jsp">Prodotti</a>
            <div class="navbar ml-auto">
                <%
                    if(auth!=null && auth.isAdmin()==true){%>
                <a class="nav-link" href="#">Area amministratore</a>
                <%}%>
                    <%
                            if(auth!=null){ %>
                <a class="nav-link" href="orders.jsp">I miei ordini</a>
                    <%}%>
                <a class="nav-link" href="cart.jsp"><img style="max-width: 30px;" src="./images/cart.png"><span class="badge"> ${cart_list.size()}</span></a>
                        <%
                            if(auth!=null){ %>
                        <a class="nav-link" href="log-out"><img style="max-width: 30px" src="./images/User%20icon.png">Logout</a>
                        <%}
                        else{
                        %>
                        <a class="nav-link" href="login.jsp"><img style="max-width: 30px" src="./images/User%20icon.png">Accedi</a>

                        <%
                            }
                        %>
                    </div>

        </div>
    </div>
</nav>

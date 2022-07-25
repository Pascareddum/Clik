<nav class="navbar">
    <div class="container">
        <a  class="navbar-brand" href="index.jsp"> <img style="max-width: 50px" src="./images/Camera%20icon.png"></a>
        <a href="#">Chi siamo</a>
        <a href="#">Servizi</a>
        <a href="#">Contatti</a>


        <div class="dropdown">
            <button class="dropbtn"> <img style="max-width: 30px" src="./images/User%20icon.png"></button>
            <div class="dropdown-content">
                <%
                    if(auth!=null){ %>
                <a href="orders.jsp">I miei ordini</a></a>
                <a href="log-out">Logout</a></a>
                <%}
                    else{
                %>
                        <a href="login.jsp">Login</a>
                <%
                    }
                %>
                <a href="register.jsp">Registrati</a>
              <!--  <a href="#">Link 3</a> -->
            </div>
        </div>
        <a style="float: right"  href="cart.jsp"><img style="max-width: 30px;" src="./images/cart.png"><span class="badge"> ${cart_list.size()}</span></a>
    </div>
    </div>
</nav>

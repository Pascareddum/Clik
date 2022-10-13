<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>
<%
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<head>
    <title>About us</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>


<br><br> <div class="text-center">
    <div class="name"><h4>Alessandro</h4></div>
    <div class="imageStudent">
        <img src="images/imgStudent.jpg" alt="Immagine studente" style="height: 400px;width: 300px">
    </div>


    <br><br> <div class="doveSiamo"><h3>Ci troviamo qui :</h3></div>

    <div class="google-maps">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3021.5281416761145!2d14.788886415017927!3d40.772401841855775!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc5af135b7ab1%3A0x1ee87d918d403827!2sVia%20Giovanni%20Paolo%20II%2C%20132%2C%2084084%20Fisciano%20SA!5e0!3m2!1sit!2sit!4v1658702983814!5m2!1sit!2sit" width="400" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</div>
<%@include file="template-parts/footer.jsp"%>
</body>
</html>
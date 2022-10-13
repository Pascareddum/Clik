<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>
<%
    ProductDAO pd=new ProductDAO();
    List<Product> products= pd.getAllProducts();
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<!DOCTYPE html>
<html>
<head>
    <title>Clik</title>
    <%@include file="template-parts/header.jsp"%>
    <link rel="stylesheet" href="css/index.css" type="text/css">
<style>
</style>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<br> <br>
<img src="images/welcome.jpg" alt="welcome image" style="width: 60%;height: 60%">
<div class="card-header d-inline-block">

    <h1 style="text-align: center"> I nostri prodotti:</h1>

        <div style="overflow-x:scroll;overflow-y: hidden; display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                String name;
                int j=0;
                if(!products.isEmpty()){
                    for(Product p:products){
                        if(j==5)
                            break;
                    if(p.getName().length()>29)
                        name=p.getName().substring(0,30)+"...";
                    else
                        name=p.getName();
            %>
            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" style="text-decoration: none;">
            <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2">
                    <div class="card p-2 my-1">
                        <div class="card-img">
                             <img class="text-center" src="images/<%=p.getImage()%>" alt="Card image cap">
                        </div>
                            <div class="card-body text-left">
                                <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" class="card-title" title="<%=p.getName()%>" style="color: black "><%=name%></a>
                                <div class="text-muted mt-auto"><%=p.getCategory()%></div>
                                <div class="text-muted mt-auto"><%=p.getBrand()%></div>
                            </div>
                    </div>
                </div>
            </div>
            </a>
            <%
                        j++;
                    }
                }
             %>
        </div>
    </div>

<br>
<br>
    <div class="card-header d-inline-block" style="width: 100%; background-color:#faf0e6">
        <h1 style="text-align: center"> Le nostre lenti:</h1>
        <div style="overflow-x:scroll;overflow-y: hidden;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                j=0;
                {
                    for(Product p:products){
                        if(j==5)
                            break;
                        if(p.getCategory().equals("Lenti")){
                            if(p.getName().length()>29)
                                name=p.getName().substring(0,30)+"...";
                            else
                                name=p.getName();
            %>
            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" style="text-decoration: none;"> <div style="width: 100%;;text-align:center">
                    <div class="card-body p-2 m-2">
                        <div class="card p-2 my-1">
                            <div class="card-img">
                                <img class="text-center" src="images/<%=p.getImage()%>" alt="Card image cap">
                            </div>
                            <div class="card-body text-left">
                                <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" class="card-title" title="<%=p.getName()%>" style="color: black "><%=name%></a>
                                <div class="text-muted mt-auto"><%=p.getCategory()%></div>
                                <div class="text-muted mt-auto"><%=p.getBrand()%></div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>

            <%
                            j++; }
                    }
            }
            %>
        </div>
    </div>
<br>
<br>
    <div class="card-header d-inline-block" style="width: 100%; background-color:#e4d5b7">
        <h1 style="text-align: center"> Le nostre fotocamere:</h1>
        <div style="overflow-x:scroll;overflow-y: hidden;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                j=0;
                {
                    for(Product p:products){
                        if(j==5)
                            break;
                        if(p.getCategory().equals("Fotocamere")){
                            if(p.getName().length()>29)
                                name=p.getName().substring(0,30)+"...";
                            else
                                name=p.getName();
            %>
            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" style="text-decoration: none;">
                <div style="width: 100%;;text-align:center">
                    <div class="card-body p-2 m-2">
                        <div class="card p-2 my-1">
                            <div class="card-img">
                                <img class="text-center" src="images/<%=p.getImage()%>" alt="Card image cap">
                            </div>
                            <div class="card-body text-left">
                                <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" class="card-title" title="<%=p.getName()%>" style="color: black "><%=name%></a>
                                <div class="text-muted mt-auto"><%=p.getCategory()%></div>
                                <div class="text-muted mt-auto"><%=p.getBrand()%></div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>

            <%
                            j++;}
                    }
                }
            %>
        </div>
    </div>

<br>
<br>
    <div class="card-header d-inline-block" style="width: 100%;background-color:#d9b99b">
        <h1 style="text-align: center"> I nostri accessori:</h1>
        <div style="overflow-x:scroll;overflow-y: hidden;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                j=0;
                {
                    for(Product p:products){
                        if(j==5)
                            break;
                        if(p.getCategory().equals("Accessori")){
                            if(p.getName().length()>29)
                                name=p.getName().substring(0,30)+"...";
                            else
                                name=p.getName();
            %>
            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" style="text-decoration: none;">
                <div style="width: 100%;;text-align:center">
                    <div class="card-body p-2 m-2">
                        <div class="card p-2 my-1">
                            <div class="card-img">
                                <img class="text-center" src="images/<%=p.getImage()%>" alt="Card image cap">
                            </div>
                            <div class="card-body text-left">
                                <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" class="card-title" title="<%=p.getName()%>" style="color: black "><%=name%></a>
                                <div class="text-muted mt-auto"><%=p.getCategory()%></div>
                                <div class="text-muted mt-auto"><%=p.getBrand()%></div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>

            <%
                            j++;}
                    }
                }
            %>
        </div>
    </div>
</div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>
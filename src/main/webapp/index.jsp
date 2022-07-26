<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>

<%
   User auth=(User) request.getSession().getAttribute("auth");
   if(auth!=null){
       request.setAttribute("auth",auth);
   }

    ProductDAO pd=new ProductDAO(ConPool.getConnection());
    List<Product> products= pd.getAllProducts();
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Clik</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<br>
<br>
<div class="container d-inline-block p-10 m-10">
    <h2> I nostri prodotti:</h2>
    <div class="card-header d-inline-block" style="width: 100%">
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                String name;
                if(!products.isEmpty()){
                    for(Product p:products){
                    if(p.getName().length()>39)
                        name=p.getName().substring(0,40)+"...";
                    else
                        name=p.getName();
            %>
             <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                    <div class="card p-2 my-1">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=p.getImage()%>" alt="Card image cap"> </a>
                        </div>
                            <div class="card-body text-left">
                                <h6 class="card-title" title="<%=p.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>" style="color: black "><%=name%></a></h6>
                                <h7 class="price"><%=p.getPrice()%>&euro;</h7> <br>
                                <h8 class="card-category"><%=p.getCategory()%></h8> <br>
                                <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                            </div>
                    </div>
                </div>
            </div>
            <%
                    }
                }
             %>
        </div>
    </div>
</div>

<br>
<br>
<div class="container d-inline-block p-10 m-10">
    <h2> Le nostre lenti:</h2>
    <div class="card-header d-inline-block" style="width: 100%">
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                {
                    for(Product p:products){
                        if(p.getCategory().equals("Lenti")){
                            if(p.getName().length()>39)
                                name=p.getName().substring(0,40)+"...";
                            else
                                name=p.getName();
            %>
             <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                    <div class="card p-2 my-1">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=p.getImage()%>" alt="Card image cap"> </a>
                        </div>
                            <div class="card-body text-left">
                                <h6 class="card-title" title="<%=p.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>" style="color: black "><%=name%></a></h6>
                                <h7 class="price"><%=p.getPrice()%>&euro;</h7> <br>
                                <h8 class="card-category"><%=p.getCategory()%></h8> <br>
                                <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                            </div>
                    </div>
                </div>
            </div>
            <%

            }
            }
            }
            %>
        </div>
    </div>
</div>

<br>
<br>
<div class="container d-inline-block p-10 m-10">
    <h2> Le nostre fotocamere:</h2>
    <div class="card-header d-inline-block" style="width: 100%">
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                {
                    for(Product p:products){
                        if(p.getCategory().equals("Fotocamere")){
                            if(p.getName().length()>39)
                                name=p.getName().substring(0,40)+"...";
                            else
                                name=p.getName();
            %>
               <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                    <div class="card p-2 my-1">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=p.getImage()%>" alt="Card image cap"> </a>
                        </div>
                            <div class="card-body text-left">
                                <h6 class="card-title" title="<%=p.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>" style="color: black "><%=name%></a></h6>
                                <h7 class="price"><%=p.getPrice()%>&euro;</h7> <br>
                                <h8 class="card-category"><%=p.getCategory()%></h8> <br>
                                <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                            </div>
                    </div>
                </div>
            </div>
            <%
                        }
                    }
                }
            %>
        </div>
    </div>
</div>

<br>
<br>
<div class="container d-inline-block p-10 m-10">
    <h2> I nostri accessori:</h2>
    <div class="card-header d-inline-block" style="width: 100%">
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                {
                    for(Product p:products){
                        if(p.getCategory().equals("Accessori")){
                            if(p.getName().length()>39)
                                name=p.getName().substring(0,40)+"...";
                            else
                                name=p.getName();
            %>
            <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                    <div class="card p-2 my-1">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=p.getImage()%>" alt="Card image cap"> </a>
                        </div>
                            <div class="card-body text-left">
                                <h6 class="card-title" title="<%=p.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>" style="color: black "><%=name%></a></h6>
                                <h7 class="price"><%=p.getPrice()%>&euro;</h7> <br>
                                <h8 class="card-category"><%=p.getCategory()%></h8> <br>
                                <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                            </div>
                    </div>
                </div>
            </div>
            <%
                        }
                    }
                }
            %>
        </div>
    </div>
</div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>
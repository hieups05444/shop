<%-- 
    Document   : products
    Created on : Oct 11, 2017, 12:56:07 PM
    Author     : Shun
--%>

<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="getDB.ProductGET"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        ProductGET productGET = new ProductGET();
        String category_id = "";
        if (request.getParameter("category") != null) {
            category_id = request.getParameter("category");
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
    %>

    <jsp:include page="header.jsp"></jsp:include>

        <section id="advertisement">
            <div class="container">
                <img src="images/shop/advertisement.jpg" alt="" />
            </div>
        </section>

        <section style="margin-bottom: 20px">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                    <jsp:include page="menu.jsp"></jsp:include>
                    </div>
                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Features Items</h2>      
                        <%
                            for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id))) {
                        %>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <a href="product-details.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="" /></a>
                                        <h2>$<%=p.getProductPrice()%></h2>
                                        <p><a href="product-details.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></p>
                                        <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div><!--features_items-->
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"></jsp:include>

    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>

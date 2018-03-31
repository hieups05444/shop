<%-- 
    Document   : checkcart
    Created on : Oct 11, 2017, 1:17:50 PM
    Author     : Shun
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="getDB.ProductGET"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        ProductGET productGET = new ProductGET();
        String category_id1 = "1";
        String category_id2 = "2";
        String category_id3 = "3";
        String category_id4 = "4";
        String category_id5 = "5";
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
    %>
    <jsp:include page="header.jsp"></jsp:include>

        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Check Cart</li>
                    </ol>
                </div><!--/breadcrums-->
                <div class="review-payment">
                    <h2>Review & Payment</h2>
                </div>

                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price" style="padding-left:15px">Price</td>
                                <td class="quantity" style="padding-left:50px">Quantity</td>
                                <td class="total" style="padding-left:30px">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                        <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                        <tr>
                            <td class="cart_product">
                                <a href=""><img src="<%=list.getValue().getProduct().getProductImage()%>" alt="" style="width:150px;height:130px"></a>
                            </td>
                            <td class="cart_description">
                                <a href="" style="margin-left:30px;font-weight:bold;font-size:18px"><%=list.getValue().getProduct().getProductName()%></a>
                            </td>
                            <td class="cart_price">
                                <p>$<%=list.getValue().getProduct().getProductPrice()%></p>
                            </td>
                            <td class="cart_quantity">
                                <div class="cart_quantity_button"  style="margin-left: 20px">
                                    <a class="cart_quantity_up" href=""> + </a>
                                    <input class="cart_quantity_input" type="text" name="quantity" value="<%=list.getValue().getQuantity()%>" autocomplete="off" size="2">
                                    <a class="cart_quantity_down" href=""> - </a>
                                </div>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price">$<%=list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity()%> </p>
                            </td>
                            <td class="cart_delete">
                                <a class="cart_quantity_delete" href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"><i class="fa fa-times"></i></a>
                            </td>
                        </tr>
                        <%}%>   

                        <tr>
                            <td colspan="4">&nbsp;</td>
                            <td colspan="2">
                                <table class="table table-condensed total-result">
                                    <tr>
                                        <td>Cart Sub Total</td>
                                        <td>$<%=cart.totalCart()%></td>
                                    </tr>
                                    <tr>
                                        <td>Exo Tax</td>
                                        <td>$<%=cart.totalCart() * 0.2%></td>
                                    </tr>
                                    <tr class="shipping-cost">
                                        <td>Shipping Cost</td>
                                        <td>Free</td>										
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td><span>$<%=cart.totalCart() + cart.totalCart() * 0.2%></span></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="payment-options">
                <span>
                    <label><input type="checkbox"> Direct Bank Transfer</label>
                </span>
                <span>
                    <label><input type="checkbox"> Check Payment</label>
                </span>
                <span>
                    <label><input type="checkbox"> Paypal</label>
                </span>
            </div>
        </div>
    </section> <!--/#cart_items-->



    <jsp:include page="footer.jsp"></jsp:include>



    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>

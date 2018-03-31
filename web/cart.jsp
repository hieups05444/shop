<%-- 
    Document   : cart
    Created on : Oct 11, 2017, 12:43:45 PM
    Author     : Shun
--%>

<%@page import="model.Cart"%>
<%@page import="getDB.ProductGET"%>
<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Shopping Cart</li>
                    </ol>
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
                    </tbody>
                </table>
            </div>
        </div>
    </section> <!--/#cart_items-->

    <section id="do_action">
        <div class="container">
            <div class="heading">
                <h3>What would you like to do next?</h3>
                <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="chose_area">
                        <ul class="user_option">
                            <li>
                                <input type="checkbox">
                                <label>Use Coupon Code</label>
                            </li>
                            <li>
                                <input type="checkbox">
                                <label>Use Gift Voucher</label>
                            </li>
                            <li>
                                <input type="checkbox">
                                <label>Estimate Shipping & Taxes</label>
                            </li>
                        </ul>
                        <ul class="user_info">
                            <li class="single_field">
                                <label>Country:</label>
                                <select>
                                    <option>United States</option>
                                    <option>Bangladesh</option>
                                    <option>UK</option>
                                    <option>India</option>
                                    <option>Pakistan</option>
                                    <option>Ucrane</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select>

                            </li>
                            <li class="single_field">
                                <label>Region / State:</label>
                                <select>
                                    <option>Select</option>
                                    <option>Dhaka</option>
                                    <option>London</option>
                                    <option>Dillih</option>
                                    <option>Lahore</option>
                                    <option>Alaska</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select>

                            </li>
                            <li class="single_field zip-field">
                                <label>Zip Code:</label>
                                <input type="text">
                            </li>
                        </ul>
                        <a class="btn btn-default update" href="">Get Quotes</a>
                        <a class="btn btn-default check_out" href="">Continue</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="total_area">

                        <ul>
                            <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                            <li><%=list.getValue().getProduct().getProductName()%><span>$<%=list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity()%></span></li>
                                <%}%> 
                            <li>Total <span>$<%=cart.totalCart()%></span></li>
                        </ul>


                        <a class="btn btn-default update" href="">Update</a>
                        <a class="btn btn-default check_out" href="checkcart.jsp">Check Out</a>
                    </div>
                </div>
            </div>
        </div>
    </section><!--/#do_action-->

    <jsp:include page="footer.jsp"></jsp:include>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>

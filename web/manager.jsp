<%-- 
    Document   : manager
    Created on : Oct 20, 2017, 8:21:00 PM
    Author     : Shun
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="getDB.ProductGET"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>

        <body>
        <%
            ProductGET productGET = new ProductGET();
            ArrayList<Product> Listproduct = productGET.getListproduct();
        %>
        <div id="rightContent">
            <h3 style="color:#d2322d; font-size: 35px;margin-left: 20px">Quản Lý Sản Phẩm</h3>  
            <a href="insert_product.jsp" style="margin: 23px;">Thêm sản phẩm</a>
            <table class="data" style="width:85%;margin-left: 100px;margin-top: 10px">
                <tr class="data" style="color:#FE980F; font-size: 17px">
                    <th class="data" width="100px">STT</th>
                    <th class="data" width="150px">Mã Sản Phẩm</th>
                    <th class="data" width="150px">Mã Danh Mục</th>
                    <th class="data" width="100px">Tên Sản Phẩm</th>
                    <th class="data" width="350px" style="padding-left: 150px">Tên Hình</th>
                    <th class="data" width="100px">Tiền</th>
                    <th class="data" width="100px">Chi Tiết Sản Phẩm</th>
                    <th class="data" width="75px" style="padding-left:20px">Tùy chọn</th>
                </tr>
                <%
                    int count = 0;
                    for (Product aa : Listproduct) {
                        count++;
                %>
                <tr class="data" style="border-bottom: solid 1px #000;">
                    <td class="data" width="30px"><%=count%></td>
                    <td class="data"><%=aa.getProductID()%></td>
                    <td class="data"><%=aa.getCategoryID()%></td>
                    <td class="data"><%=aa.getProductName()%></td>
                    <td class="data" style="padding-bottom: 20px;padding-top: 20px"><img width="400px"src="<%=aa.getProductImage()%>"/></td>
                    <td class="data"><%=aa.getProductPrice()%></td>
                    <td class="data" style="overflow: hidden;display: block;height: 100px;width: 200px; margin-bottom: 80px;margin-top: 80px;"><text<%=aa.getDescription()%>/></td>
                    <td class="data" width="75px">
                <center>
                    <a href="${del}">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                    <a href="#">Xóa</a>
                </center>
                </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>

    <jsp:include page="footer.jsp"></jsp:include>
</html>

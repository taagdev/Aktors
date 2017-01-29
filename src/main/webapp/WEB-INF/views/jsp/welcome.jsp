<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/head.jsp"/>

<body>
<div id="body">
    <jsp:include page="../fragments/menu.jsp"/>
    <div class="container">
        <div class="col-md-12">

        <table class="table">
            <thead>
            <tr>
                <th>Product</th>
                <th>Client</th>
                <th>Orders</th>

            </tr>
            </thead>
                <tbody>
                <tr>
                    <td><a class="btn btn-primary btn-sm" href="/addproduct">Add product</a> </td>
                    <td><a class="btn btn-primary btn-sm" href="/addclient">Add client</a> </td>
                    <td><a class="btn btn-primary btn-sm" href="/addorder">Add order</a> </td>
                </tr>
                <tr>
                    <td><a class="btn btn-primary btn-sm" href="/products">View products</a> </td>
                    <td><a class="btn btn-primary btn-sm" href="/clients">View clients</a> </td>
                    <td><a class="btn btn-primary btn-sm" href="/orders">View orders</a> </td>
                </tr>
                </tbody>
        </table>

        </div>

    </div>
</div>
<br>
<jsp:include page="../fragments/footer.jsp"/>

</body>
</html>

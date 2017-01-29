<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html land="en">
<head>
    <title>Orders</title>
<jsp:include page="../fragments/head.jsp"/>
    <link href="/resources/css/tablesorter.css" rel="stylesheet">
    <script type="text/javascript" src="/resources/js/jquery.tablesorter.min.js"></script>



    <script>
        $(function(){
            $("#myTable").tablesorter();
        });

    </script>


</head>
<body>

<jsp:include page="../fragments/menu.jsp"/>

<div class="container">
    <div class="col-md-12">
        <h2>List of orders</h2>
<a class="btn btn-primary" href="/addorder">Add Order</a>
<br>


<table id="myTable" border="0" cellpadding="0" cellspacing="1">
    <thead>
    <tr>
        <th>Order number</th>
        <th>Price</th>
        <th>Order Transaction date</th>
        <th>Client first name</th>
        <th>Client last name</th>
        <th>Product barcode</th>
        <th>Product name</th>
        <th>Product quantity</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orders}" var="order">
        <tr>
            <td>${order.id}</td>
            <td>${order.price} <span class="glyphicon-euro"></span> </td>
            <td>${order.date}</td>
            <td>${order.user.name}</td>
            <td>${order.user.secondName}</td>
            <td>${order.product.barcode}</td>
            <td>${order.product.name}</td>
            <td>${order.productQuantity}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
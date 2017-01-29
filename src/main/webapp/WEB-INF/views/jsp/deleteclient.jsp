<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/head.jsp"/>

<link href="/resources/css/tablesorter.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery.tablesorter.min.js"></script>

<script>
    $(document).ready(function() {
        $("#myTable").tablesorter({
            headers: {
                0: {sorter: false},
                1: {sorter: false},
                2: {sorter: false},
                3: {sorter: false},
                4: {sorter:false}
            }
        });
    });
</script>


<body>
<div id="body">
    <jsp:include page="../fragments/menu.jsp"/>


    <h2>Are you sure to delete this client?</h2>
    <div class="col-md-6">
        <table id="myTable" border="0" cellpadding="0" cellspacing="1">
            <thead>
            <tr>
                <th>Name</th>
                <th>Second Name</th>
                <th>Phonenumber</th>
                <th>Country</th>
                <th>Address</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${user.name}</td>
                <td>${user.secondName}</td>
                <td>${user.phonenumber}</td>
                <td>${user.country}</td>
                <td>${user.address}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-6"></div>
    <div class="col-md-12">
        <form:form method="post">
            <p>
                <input type="submit" class="btn btn-primary" value="Delete">
                <input type="submit" value="Back" class="btn btn-primary" onclick="history.go(-1)">
            </p>
        </form:form>
    </div>

</div>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>

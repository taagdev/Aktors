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
                5: {
                    sorter: false
                },
                6: {
                    sorter: false
                }
            }
        });
    });
</script>

<body>
<jsp:include page="../fragments/menu.jsp"/>

<div class="container">
    <h2>List of clients</h2>
        <div class="col-md-12">
            <a class="btn btn-primary btn-sm" href="/addclient">New Client</a>
        </div>

        <div class="col-md-12">
            <table id="myTable" border="0" cellpadding="0" cellspacing="1">
                <thead>
                <tr>
                    <th>First Name</th>
                    <th>Age</th>
                    <th>Sex</th>
                    <th>City</th>
                    <th>Joining Date</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.name}</td>
                        <td>${user.secondName}</td>
                        <td>${user.phonenumber}</td>
                        <td>${user.country}</td>
                        <td>${user.address}</td>
                        <td style="border: hidden"><a class="btn btn-primary btn-sm"
                                                      href="/editclient/${user.id}">Edit</a></td>
                        <td style="border: hidden"><a class="btn btn-primary btn-sm"
                                                      href="/deleteclient/${user.id}">Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div></div>
<br>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>

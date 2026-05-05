<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/5/2026
  Time: 9:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>User List</h2>
<a href="users?action=create">Add New</a>

<table border="1">
    <tr>
        <th>ID</th><th>Name</th><th>Email</th><th>Country</th><th>Action</th>
    </tr>

    <c:forEach var="u" items="${listUser}">
        <tr>
            <td>${u.id}</td>
            <td>${u.name}</td>
            <td>${u.email}</td>
            <td>${u.country}</td>
            <td>
                <a href="users?action=edit&id=${u.id}">Edit</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

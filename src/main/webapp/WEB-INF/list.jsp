<%@ page contentType="text/html;charset=UTF-8" %>

<h2>User List</h2>

<a href="users?action=create">Add New User</a>

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
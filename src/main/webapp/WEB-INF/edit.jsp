<form method="post" action="users?action=edit">
    <input type="hidden" name="id" value="${user.id}">

    Name: <input name="name" value="${user.name}"><br>
    Email: <input name="email" value="${user.email}"><br>
    Country: <input name="country" value="${user.country}"><br>

    <button type="submit">Update</button>
</form>
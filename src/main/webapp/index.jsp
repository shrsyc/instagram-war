<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
</head>
<body>
    <h2>Welcome to My Website</h2>

    <%-- Form to take user input --%>
    <form action="welcome.jsp" method="post">
        Enter your name: <input type="text" name="username" required>
        <input type="submit" value="Submit">
    </form>

    <%-- Processing the input and displaying a welcome message --%>
    <%
        String name = request.getParameter("username");
        if (name != null && !name.trim().isEmpty()) {
    %>
        <h3>Hello, <%= name %>! Welcome to our site.</h3>
    <%
        }
    %>
</body>
</html>

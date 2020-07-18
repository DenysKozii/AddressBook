<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
Person with name '<%=request.getParameter("first-name") + " " + request.getParameter("last-name")%>' not found in Address Book!
</body>
</html>
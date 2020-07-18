<%@ page import="com.softserve.itacademy.AddressBook" %><%--
  Created by IntelliJ IDEA.
  User: denis
  Date: 7/16/2020
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show record</title>
</head>
<body>
<%@include file="header.html"%>
<br><br>

    <p>First name: <%=request.getAttribute("firstName")%></p>
    <p>Last name: <%=request.getAttribute("lastName")%></p>
    <p>Address: <%=request.getAttribute("address")%></p>

</body>
</html>

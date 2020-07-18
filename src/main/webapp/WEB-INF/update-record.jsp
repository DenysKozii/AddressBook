<%--
  Created by IntelliJ IDEA.
  User: denis
  Date: 7/16/2020
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update existing record</title>
</head>
<body>
<form action="/records/update" method="post">
    <%@include file="header.html"%>
    <br><br>

    <table>
        <tr>
            <td>
                <label for="first-name">First name: </label>
            </td>
            <td>
                <input type="text" id="first-name" name="first-name" value="<%=request.getAttribute("first-name")%>" disabled>
            </td>
        </tr>
        <tr>
            <td>
                <label for="last-name" >Last name: </label>
            </td>
            <td>
                <input type="text" id="last-name" name="last-name" value="<%=request.getAttribute("last-name")%>" disabled>
            </td>
        </tr>
        <tr>
            <td>
                <label for="address" >Address: </label>
            </td>
            <td>
                <textarea  id="address" name="address"><%=request.getAttribute("address")%></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Update">
            </td>
            <td>
                <input type="reset" value="Clear">
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
    </table>
</form>
</body>
</html>

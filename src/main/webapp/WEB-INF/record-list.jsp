<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Show all users</title>
</head>
<body>
<%@include file="header.html"%>
<br><br>
Sort by:
<a href="/records/list?sort=asc">ascending</a>
<a href="/records/list?sort=desc">descending</a>
<table border="1">
    <tr>
        <th>No.</th>
        <th>First name</th>
        <th>Last name</th>
        <th>Address</th>
        <th colspan="3">Operation</th>
    </tr>
    <%;
        List<String> records = (ArrayList)request.getAttribute("records");
        int id;
        String firstName;
        String lastName;
        String address;
        for(String record: records){
            id = records.indexOf(record)+1;
            firstName = record.split(" ")[2].substring(0,record.split(" ")[2].length()-1);
            lastName = record.split(" ")[5].substring(0,record.split(" ")[5].length()-1);
            address = record.split(" ")[7];
    %>
    <tr>
        <td><%=id%></td>
        <td><%=firstName%></td>
        <td><%=lastName%></td>
        <td><%=address%></td>
        <td>
            <a href="/records/read?first-name=<%=firstName%>&last-name=<%=lastName%>">Read</a>
        </td>
        <td>
            <a href="/records/update?first-name=<%=firstName%>&last-name=<%=lastName%>">Update</a>

        </td>
        <td>
            <a href="/records/delete?first-name=<%=firstName%>&last-name=<%=lastName%>">Delete</a>

        </td>

    </tr>
    <%
        }
    %>
</table>
</body>
</html>

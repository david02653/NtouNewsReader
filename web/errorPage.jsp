<%--
  Created by IntelliJ IDEA.
  User: otonashi
  Date: 2020/5/5
  Time: 下午 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1>U got an error of ${pageContext.exception}</h1>
    <img src="switch.jpg" alt="">
</body>
</html>

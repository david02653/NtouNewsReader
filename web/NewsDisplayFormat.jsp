<%--
  Created by IntelliJ IDEA.
  User: otonashi
  Date: 2020/4/25
  Time: 上午 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="news" class="ntou.cs.model.News"></jsp:useBean>
<!-- TODO : display news with selected type of news -->
<html>
<head>
    <title>Ntou News Reader</title>
</head>
<style>
    #main-block{
        width: 100%;
        height: 100%;
        background-color: gray;
        position: absolute;
        top: 0;
        left: 0;
    }
    #news-area{
        background-color: darkseagreen;
        width: 70%;
        position: absolute;
        display: block;
    }
    #info-area{
        background-color: bisque;
        width: 30%;
        float: right;
        display: block;
        font-size: 18px;
    }
    .info_block{
        margin-left: 5px;
        margin-top: 5px;
        margin-bottom: 5px;
    }
</style>
<body>
<div id="main-block">
    <div id="news-area">1</div>
    <div id="info-area">
        <div class="info_block">
            history<hr>
            1
        </div>
        <div class="info_block">
            about gson<hr>
            2
        </div>
        <div class="info_block">
            update<hr>
            3
        </div>
    </div>
</div>
</body>
</html>

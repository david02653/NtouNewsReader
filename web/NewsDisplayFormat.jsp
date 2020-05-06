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
        position: absolute;
    }
    #news-area{
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
        margin-left: 20px;
    }
    .info_block{
        margin-left: 6px;
        margin-top: 5px;
        margin-bottom: 5px;
    }
    img.news {
        max-width: 35%;
        margin-left: 30px;
        float: left;
        padding-right: 10px;
    }
    a {
        text-decoration: none;
    }
    h2 {
        margin-left: 15px;
    }
    hr.nLine {
        border-top: 1px dashed;
    }
    .header {
        padding: 60px;
        text-align: center;
        background: #1abc9c;
        color: white;
        font-size: 30px;
    }
    body {
        font-family: Arial;
        margin: 0;
        background-color: #cccccc;
    }
</style>
<body>
<jsp:include page="HeadBanner.jsp" />
<div id="main-block">
    <div id="news-area">
        <c:choose>
            <c:when test="${requestScope.current.size() < 1}">
                <h1>Nothing to show</h1>
            </c:when>
            <c:otherwise>
                <c:forEach var="news" items="${requestScope.current}">
                    <div>
                        <!-- news title -->
                        <a href="${news.url}" target="_blank">
                            <h2>${news.title}</h2>
                        </a>
                        <hr class="nLine">

                        <div style="position: inherit; display: table-cell">
                            <a href="${news.urlToImage}" target="_blank">
                                <img src="${news.urlToImage}" alt="" class="news" />
                            </a>
                            <div style="padding-right: 30px">
                                <c:out value="${news.description}" default="" />
                                <c:out value="${news.publishedAt}" default="" />
                                <c:out value="${news.author}" default="" />
                            </div>
                        </div>

                    </div>
                    <br>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <div id="info-area">
        <div class="info_block">
            history<hr>
            <h4 style="color: firebrick">NOT DONE YET</h4>
        </div>
        <br>
        <div class="info_block">
            About Gson
            <hr>
            <a href="https://github.com/google/gson" target="_blank">Gson on Github</a>
        </div>
        <br>
        <div class="info_block">
            Update News<hr>
            <form method="post" action="">
                <input type="submit" value="UPDATE">
            </form>
        </div>
        <br>
        <div class="info_block">
            Choose News Type :<hr>
            <form method="post" action="news">
                <input type="hidden" name="type" value="sport">
                <input type="submit" value="Sport">
            </form>
            <form method="post" action="news">
                <input type="hidden" name="type" value="business">
                <input type="submit" value="Business">
            </form>
            <form method="post" action="news">
                <input type="hidden" name="type" value="health">
                <input type="submit" value="Health">
            </form>
            <form method="post" action="news">
                <input type="hidden" name="type" value="entertainment">
                <input type="submit" value="Entertainment">
            </form>
        </div>
    </div>
</div>
</body>
</html>

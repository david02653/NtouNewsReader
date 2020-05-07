<%--
  Created by IntelliJ IDEA.
  User: otonashi
  Date: 2020/4/25
  Time: 上午 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="news" class="ntou.cs.model.News" />
<c:set var="temp" value="${sessionScope}"/>
<html>
<head>
    <title>Ntou News Reader</title>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function(){
            let selected = "${requestScope.sub}";
            let current = selected.toLowerCase();
            console.table([selected, current]);
            $("#log-area").append(window.localStorage.getItem("log"));

            function checker(){
                console.log("i say stop at " + $.now());
            }
            setInterval(checker, 10000);

            $("div#news-area > div > a").click(function(){
                console.log("clicked !");
                console.log(this);
                let cont = this;
                let title = this.innerText;
                title = title.replace("<h2>", "");
                title = title.replace("</h2>", "");
                console.log(title);
                let link = "<a href='" + this.href + "' target='_blank'>" + title + "</a><hr class='nLine'>";
                $("#log-area").append(link);
                window.localStorage.setItem("")
            });

            $("#reload").click(function () {
                console.log("reload button clicked !");
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/reload",
                    data: {
                        current: current,
                    },
                    success: function () {
                        console.log("data reload success !!");
                        window.location.reload();
                    },
                    error: function () {
                        console.log("reload data from servlet failed !!");
                    }
                });
            });
        });
    </script>
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
                            <div style="padding: 30px">
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
            <!--
            <h4 style="color: firebrick">NOT DONE YET</h4>
            -->
            <div id="log-area" style="font-size: 14px;">

            </div>
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
            <input id="reload" type="button" value="UPDATE">
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

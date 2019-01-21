<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>
    <!-- Bootstrap core CSS -->
    <link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

    <link rel="stylesheet" href="<%=path %>/asserts/bootstrapvalidator/css/bootstrapValidator.min.css" />
    <link rel="stylesheet" href="<%=path %>/css/animate.css"/>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>
        window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')
    </script>
    <script src="<%=path%>/asserts/js/vendor/popper.min.js"></script>
    <script src="<%=path%>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script >
         function loginOut() {
            $.ajax({
                type: 'post',
                url:'<%=path %>/user/loginOut',
                dataType: "json",
                async: true,
                data: {},
                success: function (data) {
                    if (data == 1) {
                        alert("注销成功!");
                        window.location.href = "../login.jsp";
                    }


                }
            })}

    </script>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="">
        <a class="navbar-brand" href="#">WondersLibrary</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto" >
                <li class="nav-item active">
                    <a class="nav-link" href="<%=path%>/second/getTypesForUser">首页<span class="sr-only">(current)</span></a>
                </li>
           <c:forEach var="type" items="${typeList}">
                <li class="dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> ${type.type_name} <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" style=" background-color:#5a5a5a;">
                        <c:forEach var="secondType" items="${secondTypeList}">
                            <c:if test="${type.type_id==secondType.type_id}">
                                <li><a href="<%=path%>/book/selectBookToUser?tab=2&typeId=${secondType.secondType_id}" style="color:#FFFFFF">${secondType.secondType_name} </a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
           </c:forEach>
            </ul>
            </ul>
            <form class="form-inline my-2 my-lg-0"> <input class="form-control mr-sm-2" type="text" placeholder="Search"> <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> </form>
        </div>
        <c:if test="${adminIsLogin!='OK'}">
        <span class="navbar-text">&nbsp; &nbsp;<a href="<%=path%>/login.jsp"> 登陆</a>&nbsp; &nbsp;</span>
        </c:if>
        <c:if test="${adminIsLogin=='OK'}">
            <span class="navbar-text"><a href="#" onclick="loginOut()">&nbsp; &nbsp;退出&nbsp; &nbsp;</a></span>
        <ul class="navbar-nav mr-auto">
            <li class="dropdown">

            <a href="#" class="nav-link dropdown-toggle navbar-text" data-toggle="dropdown">  <img src="../images/user.jpg" style="width: 30px;height: 30px">个人中心 <b class="caret"></b>
            </a>
            <ul class="dropdown-menu " style=" background-color:#5a5a5a;">
                <li><a href="<%=path%>/borrow/listBorrowsForUsers?currPage=1"  class="navbar-text" style="color:#FFFFFF">借阅历史查询</a></li>
                <li><a href="<%=path%>/jsp/user_updatePass.jsp"  class="navbar-text" style="color:#FFFFFF">修改密码</a></li>
                <li><a href="<%=path%>/jsp/user_update.jsp?user_id=${userLogin.user_id}"  class="navbar-text" style="color:#FFFFFF">个人信息</a></li>
                <li><a href="<%=path%>/comment/plList?user_id=${userLogin.user_id}"  class="navbar-text" style="color:#FFFFFF">我的评论</a></li>
                <li><a href="<%=path%>/message/selectMessageForUser"  class="navbar-text" style="color:#FFFFFF">我的消息<span class="badge">${sessionScope.unRead}</span></a></li>
            </ul>
            </li>
        </ul>
        </c:if>
    </nav>
</header>
<main role="main" style="">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="first-slide" src="<%=path%>/images/B1.jpg" alt="First slide">
                <div class="container">
                    <div class="carousel-caption text-left">
                        <h1>one</h1>
                        <p>content</p>
                        <p><a class="btn btn-lg btn-primary" href="#" role="button"> Learn more</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img class="second-slide" src="<%=path%>/images/B1.jpg" alt="Second slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>two</h1>
                        <p>content</p>
                        <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img class="third-slide" src="<%=path%>/images/B1.jpg" alt="Third slide">
                <div class="container">
                    <div class="carousel-caption text-right">
                        <h1>three</h1>
                        <p>content</p>
                        <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- Marketing messaging and featurettes
      ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    <form action="/demo01/book/selectBookToUser?tab=3" class="form-inline" id="" method="post">
        <div class="form-group">
            <label for="exampleInputName2">书名</label>
            <input type="text" name="bookName" class="form-control" id="exampleInputName2" placeholder="1">
        </div>
        <button type="submit" class="btn btn-default">查找</button>

    </form>
    <div class="row mt-2" id="card-1" style="width: 80%;margin-left: 10%">
        <c:forEach items="${pu.list}" var="book" >
        <div class="col-sm-6 col-md-4 col-lg-3 " style="width: 300px">
            <div class="card card-inverse card-info" >
                <img class="card-img-top"  style="width:200px;height:200px;text-align: center" src="<%=path%>/images/upload/${book.bookImage}">
                <div class="card-block" style="width:100%;height:40px;text-align: center" >
                    <h4 class="card-title">${book.bookName}</h4>
                </div>
                <div class="card-footer">
                    <small>价格:${book.bookPrice}</small>
                    <button class="btn btn-info float-right btn-sm" ><a style="text-decoration:none;color:white" href="<%=path%>/comment/findBook?book_id=${book.bookId}">详情</a></button>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>


    </div>
    <!-- FOOTER -->
    <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>© 2017-2018 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
    </footer>
</main>
<!-- Bootstrap core JavaScript
  ================================================== -->


</body>

</html>
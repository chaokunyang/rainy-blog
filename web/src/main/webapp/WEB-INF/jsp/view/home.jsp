<%--
  Created by IntelliJ IDEA.
  User: chaokunyang
  Date: 2017/2/12
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="<c:url value="/resource/img/favicon.ico"/>">

    <title>首页</title>
    <link rel="stylesheet" href="<c:url value="/resource/vendor/bootstrap/css/bootstrap.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resource/stylesheet/home.css" />">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="<c:url value="/resource/stylesheet/vendor/ie10-viewport-bug-workaround.css" />" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resource/stylesheet/vendor/carousel.css"/>" rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body>
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Chaokun Yang的个人网站</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">首页</a></li>
                        <li><a href="#about">关于我</a></li>
                        <li><a href="#contact">联系方式</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="/login">登录</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="dropdown-header">Nav header</li>
                                <li><a href="/chat?action=list">聊天请求列表</a></li>
                                <li><a href="/chat?action=new">新建聊天</a></li>
                                <li><a href="/chat?action=join">加入聊天</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>


<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
            <div class="container ">
                <div class="carousel-caption">
                    <h1>Rainy-Blog</h1>
                    <p>基于<code>java8、java ee7、jsp、jstl、el、servlet、jpa</code> 构建的博客系统，仅使用Java EE技术，不使用Spring技术栈</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
            <div class="container carousel-caption-container">
                <div class="carousel-caption">
                    <h1>Spriny-Blog</h1>
                    <p>基于<code>java8、java ee7、Spring、Spring MVC、Bean Validation、JPA</code>构建的博客系统</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
            <div class="container carousel-caption-container">
                <div class="carousel-caption">
                    <h1>Sunny-Blog</h1>
                    <p>基于<code>java8、java ee7、Spring、Spring MVC、Bean Validation、JPA、Spring Security、oauth 2.0、Jcache</code>构建的博客系统</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="fourth-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Fouth slide">
            <div class="container carousel-caption-container">
                <div class="carousel-caption">
                    <h1>Wild-Blog</h1>
                    <p>基于<code>java8、java ee7、Spring Boot、thymeleaf、Bean Validation、JPA、Spring Security、oauth 2.0、Jcache</code>构建的博客系统</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="fifth-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Fifth slide">
            <div class="container carousel-caption-container">
                <div class="carousel-caption">
                    <h1>Cloud-Blog</h1>
                    <p>基于<code>java8、java ee7、Spring Boot、Spring Cloud、thymeleaf、Bean Validation、JPA、Spring Security、oauth 2.0、Jcache、React</code>构建的分布式高可用的云端内容管理系统</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div><!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>后端开发</h2>
            <p>Java、Scala、Clojure<br>
            Java EE、Spring、Spring Boot、Spring Cloud、分布式架构、分布式缓存、消息队列、并发、IO、网络</p>
            <p><a class="btn btn-default" href="#" role="button">查看详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>前端开发</h2>
            <p>HTML5、JavaScript、EcmaScript、CSS、LESS/SASS、BootStrap、React、Redux、其他类库/框架、常用工具</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>构建交付</h2>
            <p>构建、集成、部署、交付、代码质量、DevOps、SRE、Infrastructure As Code</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">


    <hr class="featurette-divider">

    <hr class="featurette-divider">

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->


    <!-- FOOTER -->
    <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2017 Person. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>
</div><!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<c:url value="/resource/vendor/jquery.min.js"/>"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="<c:url value="/resource/vendor/ie10-viewport-bug-workaround.js"/>"></script>
</body>
</html>


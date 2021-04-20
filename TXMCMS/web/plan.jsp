<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
  <title>我的计划</title>
  <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css">
  <script src="../bootstrap-3.3.7-dist/js/jquery-3.6.0.js"></script>
  <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
  <style>
    /* header {
      height: 70px;
      background: #111;
      color: #fff;
      text-align: center;
    } */

    /* .col-md-12 {
      background: #efefef;
      line-height: 32px;
      border-right: 1px solid #fff;
    }

    .content {
      width: 1200px;
      margin: 0 auto;
    }

    .blog_list {
      border-bottom: 1px dashed #fff;
      margin-bottom: 20px;
    }

    footer {
      background: #111;
      height: 120px;
    } */
    .header_content {
      width: 100%;
      margin: 0 auto;
      height: 80px;
      background: darkcyan;
      color: #fff;
      text-align: center;
      font-size: 16px;
    }

    .header_content h1 a {
      color: #111;
      text-align: center;
    }

    .container-fluid {
      padding-right: 0;
      padding-left: 0;
    }

    .row {
      /* width: 1822px; */
      margin: 0 auto;
    }

    .left {
      /* width: 142px; */
      background-color: palegreen;
    }

    .right {
      /* width: 1680px; */
      background: darkgray;
    }

    .left,
    .right {
      height: 680px;
    }

    .row {
      margin-top: 20px;
    }

    .row ul li {
      list-style-type: none;
      height: 110px;
      margin-top: 50px;
      font-size: 20px;
      text-align: center;
    }
    .row ul{
      padding: 0px;
    }

    .col-md-3>div {
      height: 130px;
      background: #555;
    }

    .col-md-6>div {
      height: 130px;
      background: #555;
    }

    .col-md-4>div {
      height: 130px;
      background: #555;
    }

    .col-md-3>div.f1 {
      background: url('../img/b1.jpg') no-repeat;
      background-size: 325px 130px;
      font-size: 16px;
    }
    .col-md-3>div.b1 {
      background: url('../img/b2.jpg') no-repeat;
      background-size: 325px 130px;
      font-size: 16px;
    }
    .col-md-6>div.b2 {
      background: url('../img/b2.jpg') no-repeat;
      background-size: 680px 130px;
      font-size: 16px;
    }
    .col-md-6>div.b3 {
      background: url('../img/b3.jpg') no-repeat;
      background-size: 680px 130px;
      font-size: 16px;
    }
    .col-md-4>div.b4 {
      background: url('../img/b4.jpg') no-repeat;
      background-size: 680px 130px;
      font-size: 16px;
    }
    
  </style>
</head>

<body>
  <header>
    <div class="header_content">
      <h1><a href="./index.html">我的计划<</a> </h1> </div> </header> <main>
            <div class="main_content container-fluid">
              <div class="row">
                <div class="col-md-1 left">
                  <ul>
                    <li><a>学习计划</a></li>
                    <li><a>财务计划</a></li>
                    <li><a>旅行计划</a></li>
                    <li><a>工作计划</a></li>
                  </ul>
                </div>
                <div class="col-md-11 right">
                  <div class="row">
                    <div class="col-md-3">
                      <div class="f1"><p>第一阶段：Java基础知识阶段目标：掌握JavaSE知识体系；熟练掌握MySQL并能通过简单实例，完成
                        一系列企业级的数据操作难点：Java语法基础是地基,如果地基不牢固，会 导致后期的.学习变得困难，特别是面向对象刚开
                        始的时候，对于新手来说
                        是一个门槛</p></div>
                    </div>
                    <div class="col-md-3">
                      <div class="f1"><p>第二阶段：前端技术阶段目标：HTML、CSS、JS、JQuery、Bootstrap JavaWeb核心内容：
                        ervlet、JSP、XML、HTTP、Ajax、过滤器、拦截器等 </p></div>
                    </div>
                    <div class="col-md-3">
                      <div class="f1"><p>第三阶段：Spring 框架：配置文件、IoC思想、DI依赖注入、面向切面编程、事务等。
                        SpringMVC：框架原理、交互、拦截器等。Maven：安装使用、基本操作。Mybatis：框架原理、Mybatis 开发 DAO 方式、与其它框架的整合。</p></div>
                    </div>
                    <div class="col-md-3">
                      <div class="f1">第四阶段：学习微信小程序，独立开发，要继续学习，而不是工作只是为了应对工作，你应该提升自己的价值。</div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-3">
                      <div class="b1"><p>现在还在上学，要支付大量的学费以及培训阶段的培训费，自己的生活费住宿费来源只能是父母。</p></div>
                    </div>
                    <div class="col-md-6">
                      <div class="b2"></div>
                    </div>
                    <div class="col-md-3">
                      <div class="b1"></div>
                    </div>
                  </div>
                  <div class="row">

                    <div class="col-md-6">
                      <div class="b3"><p>想去青岛，现在正在努力学习，希望未来有去青岛的资金，也想过青岛的一些攻略，
                        价格还没想过，毕竟现在还在学习阶段，还没有时间和精力去过多的研究，但我相信，只要努力，一定会有机会的</p></div>
                    </div>
                    <div class="col-md-6">
                      <div class="b3"></div>
                    </div>
                  </div>
                  <div class="row">

                    <div class="col-md-4">
                      <div class="b4">现在努力学习，对未来的工作很茫然，不知道能不能找到工作</div>
                    </div>
                    <div class="col-md-4">
                      <div class="b4"></div>
                    </div>
                    <div class="col-md-4">
                      <div class="b4"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </main>
            <script></script>
</body>

</html>
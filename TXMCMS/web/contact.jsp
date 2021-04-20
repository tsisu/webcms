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
    <title>BLOG</title>
    <style>
        ul {
      list-style-type: none;
    }

    .ul_content {
      height: 56px;
    }

    .ul_content>li {
      float: left;
      width: 120px;
      text-align: center;
      /* line-height: 56px; */
      /* color: #666; */
      position: relative;
      cursor: pointer;
    }

    .ul_content>li>a {
      color: #000;
      text-decoration: none;
      font-size: 12px;
      display: inline-block;
      line-height: 56px;
      height: 56px;
      width: 120px;
    }

    .ul_content>li:hover a {
      /* background-color: #222; */
      color: #222;
    }

    a.acitve {
      font-weight: bolder;
    }

    .ul_item {
      display: none;
      box-sizing: border-box;
      position: absolute;
      width: 240px;
      z-index: 99;
      background-color: rgba(222, 222, 222, 0.5);
      text-align: left;
      left: 0;
      border-bottom-left-radius: 6px;
      border-bottom-right-radius: 6px;
      box-shadow: 0px 2px 4px #fafafa;
    }

    .ul_item>li {
      padding: 10px;
      line-height: 24px;
      margin: 8px 0;
    }

    .ul_item>li:hover {
      background-color: yellow;
    } 

    /* 如果要改变：hover对象本身的样式,直接在后面追加{}，里面写样式 */
    /* 如果要改变：hover对象里面子元素的样式，父元素:hover[空格]子元素{写样式} */
    /* 如果要改变：hover对象里兄弟元素（同层同级别）的样式 兄元素：hover~弟元素{写样式} */
    .ul_content>li:hover .ul_item {
      display: block;
    }
    </style>
</head>
<body>
<div class="logo"><div class="lo1"><p>mobileversion</p></div>
<div class="lo2"><p>APP</p></div>
<div class="lo3"><p>customerCenter</p></div>
<div class="lo4"><p>more...</p></div></div>
<div class="biaoti"><h1>blog</h1></div>
    <div class="daohang">
        <nav>
            <ul class="ul_content">
            <li >
                <a class="active" href="./index.html">homepage</a>
                <ul class="ul_item">
                    <li><a href="./intro.html">introducemyself</a></li>
                    <li><a href="./plan.html">myplan</a></li>
                </ul>
            </li>
            <li ><a href="./category.html">category</a>
                <ul class="ul_item">
                    <li><a href="./delicacy.html">delicacy</a></li>
                    <li>sports&health</li>
                    <li><a href="./entertain.html">entertainment</a></li>
                </ul>
            </li>
            <li ><a href="./blog.html">blog</a>
                <ul class="ul_item">
                    <li><a href="https://blog.csdn.net/m0_53941252?spm=1000.2115.3001.5343">mycsdn</a></li>
                    <li><a href="./moments.html">moments</a></li>
                </ul>
            </li>
            <li ><a href="./style.html">style</a>
                <ul class="ul_item">
                    <li>1</li>
                    <li>2</li>
                </ul>
            </li>
            <li ><a href="./contact.html">contacts</a>
                <ul class="ul_item">
                    <li>1</li>
                    <li>2</li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
<div class="banner"><div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
  <div class="banner">
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img style="height: 600px;width: 100%;" src="../img/l1.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img style="height: 600px;width: 100%;" src="../img/l2.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img style="height: 600px;width: 100%;" src="../img/l3.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
</div>
</div>
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class="tupian"><div class="zuo"><img src="../img/j1.jpg" width="288" height="280" /></div>

<div class="zhong"><img src="../img/j2.jpg" width="288" height="280" /></div>

<div class="you"><img src="../img/j3.jpg" width="288" height="280" /></div></div>

<div class="piantu"><div class="tu3"><h2>等到山花烂漫时</h2></div>
<div class="tu4"><h2>睡到人醒饭熟时</h2></div>
<div class="tu5"><h2>今天你快乐了吗</h2></div></div>
</script>
<div class="clearit"></div>
<div class="dibu"><p>欢迎来到我的博客</p></div>
            
</body>
</html>
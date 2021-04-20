<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>娱乐</title>
    <style>
        * {
          box-sizing: border-box;
        }
         
        body {
          font-family: Arial;
          padding: 10px;
          background: #f1f1f1;
        }
         
        /* 头部标题 */
        .header {
          padding: 5px;
          text-align: center;
          background: white;
        }
         
        .header h1 {
          font-size: 50px;
        }
         
        /* 导航条 */
        .topnav {
          overflow: hidden;
          background-color: #333;
        }
         
        /* 导航条链接 */
        .topnav a {
          float: left;
          display: block;
          color: #f2f2f2;
          text-align: center;
          padding: 14px 16px;
          text-decoration: none;
        }
         
        /* 链接颜色修改 */
        .topnav a:hover {
          background-color: #ddd;
          color: black;
        }
         
        
        .leftcolumn {   
          float: left;
          width: 75%;
        }
         
        .rightcolumn {
          float: left;
          width: 25%;
          background-color: #f1f1f1;
          padding-left: 20px;
        }
         
        /* 图像部分 */
        .fakeimg {
          background-color: #aaa;
            padding:5px;
          width: 100%;
         height: 250px;
        }
            .fakeimg1 {
           background-color: #aaa;
            padding:20px;
          width: 100%;
         height: 250px;
         background: url('../img/OIP.jpg' ) no-repeat;background-size:cover;font-size: 16px;
            }
            .fakeimg2 {
          background-color: transparent;
            padding:20px;
            width: 100%;
         height: 500px;
         background: url('../img/fdm.jpg') no-repeat;background-size:cover;font-size: 16px;
            }
         
        /* 文章卡片效果 */
        .card {
          background-color: white;
          padding: 20px;
          margin-top: 20px;
        }
         
        /* 列后面清除浮动 */
        .row:after {
          content: "";
          display: table;
          clear: both;
        }
         
        /* 底部 */
        .footer {
          padding: 20px;
          text-align: center;
          background: #ddd;
          margin-top: 20px;
        }
         
        /* 响应式布局 - 屏幕尺寸小于 800px 时，两列布局改为上下布局 */
        @media screen and (max-width: 800px) {
          .leftcolumn, .rightcolumn {   
            width: 100%;
            padding: 0;
          }
        }
         
        /* 响应式布局 -屏幕尺寸小于 400px 时，导航等布局改为上下布局 */
        @media screen and (max-width: 400px) {
          .topnav a {
            float: none;
            width: 100%;
          }
        }
            .bookborder{
                border:2px auto;
            }
            .audio{
              opacity: 0.5;
            }
    </style>
</head>
<body>
    <div class="topnav">
        <a href="#">📕文学</a>
        <a href="#">电影🎦</a>
        <a href="#" style="float:right">音乐🎵</a>
      </div>
      
      <div class="row">
        <div class="leftcolumn">
          <div class="card">
            <h2>读的书</h2>
            <h5>2021 年 3 月 23 日</h5>
            <div class="fakeimg" style="text-align: center"><img src="../img/6.jpg" height="65%">
                <img src="../img/5.jpg" height="92%">
              <img src="../img/3.jpg" height="80%">
              <img src="../img/2.jpg"  height="100%">
              <img src="../img/7.jpg" height="90%">
                <img src="../img/8.jpg"height="80%">
              </div>
            <p><strong>人不过是一颗会思考的蒲苇,少些聒噪，不如安静享受人生。</strong></p>
          
          </div>
          <div class="card">
            <h2>看的电影</h2>
            <h5>2021 年 3 月 23 日</h5>
            <div class="fakeimg" style="height:400px;text-align: center">
                  <img src="../img/c1.jpg" height="100%">
                  <img src="../img/c2.jpg" height="80%">
                <img src="../img/c3.jpg"height="88%">
                <img src="../img/c4.jpg" height="80%">
            </div>
            <p>觉得还不错</p>
          </div>
        </div>
        <div class="rightcolumn">
          <div class="card">
            <h2>听的歌</h2>
               <h5>2021 年 3 月 23 日</h5>
              <div class="fakeimg1"><audio class="audio" controls><source src="../static/罗大佑 - 你的样子.mp3"></audio>
            </div>
              <p>有意志消沉的功夫,还是选择继续前进比较好</p>
          </div>
          <div class="card">
              <h5>2021 年 3 月 23 日</h5>
            <div class="fakeimg2"><audio class="audio" controls><source src="../static/老中医-花粥.mp3"></audio></div>
              <p>有意志消沉的功夫,还是选择继续前进比较好</p>
          </div>
        </div>
      </div>
      
      <div class="footer">
        <h2>纪录一下消遣的生活 🍀</h2>
      </div>
</body>
</html>
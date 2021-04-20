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
    <title>美食</title>
    <style>
    a, address, b, big, blockquote, body, center, cite, code, dd, del, div, dl, dt, em, fieldset, font, form, h1, h2, h3, h4, h5, h6, html, i, iframe, img, ins, label, legend, li, ol, p, pre, small, span, strong, u, ul, var{
    padding: 0px;
    margin: 0px;
}
a{
    text-decoration: none;
    color: blue;
}

ul{
    list-style: none;
}

body{
    background: url("../img/pattern.gif");
    font-family: "bebasneue-webfont";
}

#top{
    background-color: red;
    height: 5px;
}

#nav{
    text-align: center;
}

#nav ul {
    display: inline-block;
}

#nav ul li{
    float:left;
    margin-left:20px;
    height:50px;
    line-height:50px;/*垂直居中*/
}

#nav ul li a{
    display:inline-block;
    color:white;
    font-size:35px;
    width: 200px;
}

#nav ul li a.select{
    background-color: white;
    color:black;
}

#nav ul li a:hover{
    background-color: white;
    color:black;
}

#list{
    margin-top:40px;
    background-color: white;
    text-align: center;
}

#list .item{
    width:390px;
    display:inline-block;
    text-align: left;
    margin:20px;
}

#list .item p{
    font-family: "sans-serif";
    color:#999;
    margin:5px 0px;
}

#list .item a{
    display:inline-block;
    background-color: #C0392B;
    width:130px ;
    height:45px;
    line-height:45px;
    text-align: center;
    color:white;
    font-size: 30px;
}


#list .item a:hover {
    background-color: #0D1613;
}

#footer{
    text-align: center;
    margin-bottom: 10px;
}
#footer h2{
    color:white;
    margin-top:15px;
    margin-bottom:5px;

}

#footer ul li a{
    margin: 0px 10px;
}

#footer ul li a:hover{
    /*不透明*/
    opacity: 0.5;
}

/*响应式设计*/
@media screen and (max-width: 1120px ) {
    #nav ul li a{
        font-size:30px;
        width:150px;
    }
}

@media screen and (max-width: 865px ) {
    #nav ul li a{
        font-size:25px;
        width:100px;
    }
}

@media screen and (max-width: 614px ) {
    #nav ul li a{
        font-size:20px;
        width:80px;
    }

}
@media screen and (max-width: 520px ) {
    #nav ul li a{
        font-size:18px;
        width:50px;
    }

}
@media screen and (max-width: 505px ) {
    #nav ul li a{
        font-size:16px;
        width:50px;
    }

}
    </style>
</head>
<body>
    <h1 class="item" align='center'>美食</h1>
    <div id="list">
        <!--食物-->
    
        <div class="item">
            <img src="../img/food1.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/food2.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/food3.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/food4.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/food1.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/food2.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/food3.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/food4.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/food1.jpg">
            <p>there are countless reasons to prove the strengh of chinese cusine, here i just pick three of them to show the advantage of the chinese cusine. </p>
            <a href="#">read more</a>
        </div>
    </div>
    <!--尾部-->
    <div id="footer">
        <!--尾部的标题-->
        <h2>contact us</h2>
        <!--尾部的分享-->
        <div>
            <ul>
                <li>
                    <a href="#"><img src="../img/fb.png"></a>
                    <a href="#"><img src="../img/g+.png"></a>
                    <a href="#"><img src="../img/rss.png"></a>
                    <a href="#"><img src="../img/tw.png"></a>
    
                </li>
            </ul>
        </div>
</body>
</html>
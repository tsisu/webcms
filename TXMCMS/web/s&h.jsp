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
    <title>运动与健康</title>
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
    background-color: #1089ff;
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
    margin:20px;
}

#list .item p{
    font-family: "sans-serif";
    color:#999;
    margin:5px 0px;
}

#list .item a{
    display:inline-block;
    border: 1px solid #1089ff;
    color: #1089ff;
    font-size: 30px;
    padding: 12px 16px;
    cursor: pointer;
    border-radius: 4px;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 3px;
}

#list .item h3{
    font-weight: 300;
    font-size: 18px;
    color: #000000;
    text-align: center;
}

#list .item a:hover {
color: #fff;
background-color: #007bff;
border-color: #007bff;
}


    </style>
</head>
<body>
    <h1 class="item" align='center'>运动与健康</h1>
    <div id="list">
        <!--食物-->
    
        <div class="item">
            <img src="../img/image_1.jpg">
            <h3 class="heading">Exercise Program</h3>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/services-2.jpg">
            <h3 class="heading">Nutrition Plans</h3>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/services-3.jpg">
            <h3 class="heading">Diet Program</h3>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/image_4.jpg">
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/image_5.jpg">
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/image_6.jpg">
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/image_1.jpg">
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. </p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/services-2.jpg">
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <a href="#">read more</a>
        </div>
        <div class="item">
            <img src="../img/services-3.jpg">
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. </p>
            <a href="#">read more</a>
        </div>
    </div>
</body>
</html>
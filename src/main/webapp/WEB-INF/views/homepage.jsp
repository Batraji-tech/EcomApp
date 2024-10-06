<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        font-family: sans-serif;
      }

      #nav_bar {
        width: 100%;
        height: 80px;
        background-color: #008ecc;
        display: flex;
        position: fixed;
      }
      #menu {
        color: white;
        font-size: 40px;
        margin-left: 120px;
        margin-top: 20px;
      }
      h1 {
        margin-left: 30px;
        color: white;
        margin-top: 20px;
        font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
      }
      #search {
        height: 40px;
        width: 700px;
        background-color: white;
        margin-left: 40px;
        margin-top: 20px;
        border-radius: 5px;
        display: flex;
      }
      #search_menu {
        color: rgb(7, 7, 7);
        font-size: 20px;
        margin-left: 10px;
        margin-top: 5px;
        text-align: center;
      }
      #search_bar {
        height: 30px;
        width: 600px;
        margin-left: 20px;
        margin-top: 3px;
        border-radius: 5px;
        border: none;
        background-color: transparent;
        resize: none;
        outline: none;
      }
      #search_button {
        border: none;
        background-color: rgb(136, 132, 132);
        resize: none;
        outline: none;
        color: white;
        font-size: 20px;
        padding-right: 10px;
        text-align: center;
        align-items: center;
       
      }

      .link-container {
    display: flex;
    gap: 10px; /* Adjust the gap as needed */
    padding-right: 70px;
}

.link {
    text-decoration: none;
    color: white; /* Change the color as needed */
    font-size: 16px; /* Adjust the font size as needed */
    border: 1px  transparent; /* Optional: Add a border */
    border-radius: 4px; /* Optional: Add rounded corners */
    background-color: transparent; /* Optional: Add a background color */
    padding-top: 35px;
    padding-right: 20px ;
}

.link:hover {
    background-color: transparent; /* Optional: Change background on hover */
}

      /* -- --------------------------------------------------nav bar 2------------------------------------------- -- */
     
      .navbar2 {
        background-color: #ececed;
        text-align: center;
        position: fixed;
        margin-top: 80px;
        width: 100%;
      }
      .navbar2 ul {
        display: flex;
        list-style: none;
        margin-left: 50px;
      }
      .navbar2 ul li {
        width: 160px;
        height: 40px;
        text-align: center;
        margin-top: 20px;
      }
      .navbar2 ul li a {
        text-decoration: none;
        color: black;
        font-family: sans-serif;
        font-weight: bolder;
        font-size: 15px;
      }
      .navbar2 ul li i {
        color: #878b9c;
      }
      #loction_icon {
        display: flex;
      }
      #loction_icon p {
        margin-bottom: 0;
        margin-top: -25px;
        margin-left: -10px;
      }
      #loction_icon i {
        font-size: 30px;
        color: #878b9c;
      }
      .menu_text:nth-child(1) {
        margin-left: 70px;
      }
      .menu_text:nth-child(2) {
        margin-left: -20px;
      }
      .menu_text:nth-child(3) {
        margin-left: 20px;
      }
      .menu_text:nth-child(4) {
        margin-left: 20px;
      }
      .menu_text:nth-child(5) {
        margin-left: 10px;
      }
      .menu_text:nth-child(6) {
        margin-left: -20px;
      }
      .menu_text:nth-child(7) {
        margin-left: -20px;
      }
      .menu_text:nth-child(8) {
        margin-left: -20px;
      }
      .menu_text:nth-child(9) {
        margin-left: -60px;
      }
      .sub_menu_1 {
        display: none;
      }
      .navbar2 ul li:hover .sub_menu_1 {
        display: block;
        position: absolute;
        background-color: #ececed;
      }
      .navbar2 ul li:hover .sub_menu_1 ul {
        display: block;
        margin-left: 20px;
        margin-top: 30px;
        justify-content: center;
        align-items: center;
      }
      .navbar2 ul li:hover .sub_menu_1 ul li {
        background: transparent;
        border-radius: 0;
        text-align: left;

        margin-top: 10px;
        width: 250px;
      }
      .navbar2 ul li:hover .sub_menu_1 ul li a:hover {
        color: lightskyblue;
      }

      /* -------------------------------------------------------------sidenav bar------------------------------------------------------ */
      .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        top: 0;
        left: 0;
        background-color: white;
        overflow: hidden;
        transition: 0.5s;
      }
      #sidenav_home > a {
        padding: 20px 8px 8px 20px;
        text-decoration: none;
        color: black;
        display: block;
        transition: 0.3s;
      }
      .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 25px;
        margin-left: 70px;
        color: white;
        margin-top: 10px;
      }
      .myacc {
        background-color: #008ecc;
        height: 100px;
      }
      #hello_button {
        display: flex;
        border: none;
        background-color: transparent;
        resize: none;
        outline: none;
        color: white;
        margin-left: 10px;
      }
      #hello_icon {
        font-size: 25px;
        margin-top: 18px;
        margin-left: 5px;
      }
      #hello_text {
        margin-left: 14px;
        font-size: 15px;
        margin-top: 25px;
      }
      #account {
        display: flex;
      }
      .accdiv {
        border: 1px solid white;
        width: 150px;
        height: 25px;
        color: white;
        text-align: center;
        margin-left: 7px;
        padding-top: 7px;
        font-weight: bold;
        margin-top: 10px;
      }
      #order_box {
        margin-left: 5px;
      }
      .line {
        height: 5px;
        width: 100%;
        background-color: #ececed;
        margin-top: 6px;
      }
      #sidenav_home {
        overflow: scroll;
        height: 600px;
        top: 0;
        left: 0;
        background-color: white;
      }
      #sidenav_home > h4,
      p {
        padding: 20px 0px 0px 20px;
        margin-right: 20px;
      }
      #playstore {
        display: flex;
        margin-left: 20px;
        margin-top: 10px;
      }
      #slider {
        overflow: hidden;
      }
      .slider > img {
        margin-top: 150px;
      }
      #homeDelivery,
      #winterFashion,
      #afterWinter,
      #handWash {
        width: 99%;
      }
      #homeDelivery,
      #handWash {
        margin: 10px;
      }
      #winterFashion {
        margin: -15px 10px 0 10px;
      }
      #afterWinter {
        margin-top: -5px;
        margin-left: 10px;
      }
      ul {
        list-style: none;
      }
      a {
        text-decoration: none;
      }
      footer {
        background-color: #ededef;
        margin-top: 20px;
      }
      footer p {
        line-height: 20px;
      }
      #footerspan > p {
        line-height: 0;
      }
      #footerspan ~ p {
        line-height: 20px;
      }
      .footer-1 {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        padding: 30px 100px 30px;
      }
      .footer-1 > div {
        box-sizing: border-box;
      }
      #footerDiv3 {
        width: 70%;
        border-left: 1px solid gray;
        padding-left: 30px;
      }
      #footerDiv1 a,
      #footerDiv2 a,
      #footerDiv3 p {
        color: gray;
      }
      #footerDiv3 a {
        color: #0b92ce;
      }
      .footer-1 p,
      .footer-1 a {
        font-size: 13px;
        font-family: sans-serif;
      }
      #footerDiv1,
      #footerDiv2 {
        line-height: 20px;
      }
      .footer-1 h2 {
        line-height: 20px;
        font-size: 13px;
        font-family: JioBold;
      }

      #copyRight {
        display: flex;
        justify-content: space-around;
        font-size: 12px;
        font-family: JioLight;
        border-top: 1px solid gray;
      }
      .topCat {
        margin-left: 40px;
        font-size: 20px;
        font-family: JioBold;
      }
      .topWomen {
        margin-left: 25px;
        font-size: 20px;
        font-family: JioBold;
      }
      .womenFashion {
        margin-top: 10px;
      }
      .womenFashion,
      .AfterWomenFashion {
        display: flex;
      }
      .AfterWomenFashion {
        justify-content: center;
        margin-left: 35px;
        transition: transform .5s;
        cursor: pointer;
      }
      .womenFashion > div {
        margin-left: 30px;
      }
      .womenFashion > div > img {
        border-radius: 10px;
        width: 700px;
        transition: transform .9s;
        cursor: pointer;
      }
      .womenFashion>div>img:hover{
        -ms-transform: scale(0.9);
          transform: scale(0.9);
      }
      .AfterWomenFashion > div {
        width: 270px;

        margin: 15px 10px;
        height: 350px;
        border-radius: 10px;
        outline: 1px solid lightgray;

      }
      .AfterWomenFashion > div > img {
        width: 100%;
        height: 100%;
        border-radius: 10px;
        transition: transform .5s;
        cursor: pointer;

      }
      .AfterWomenFashion>div>img:hover{
        -ms-transform: scale(1.11);
          transform: scale(1.11);
      }
      .largeImageStart {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-template-rows: repeat(2, 430px);
        grid-gap: 20px;
        padding: 10px;
        cursor: pointer;
      }
      .largeImageStart > div > img {
        height: 100%;
        width: 100%;
      }
      .hotDeals {
        display: flex;
        justify-content: center;
        margin-left: -5px;
      }
      .hotDeals > div {
        height: 300px;
        width: 240px;
        margin: 10px;
        padding: 15px;
        outline: 1px solid lightgray;
      }
      .hotDeals > div > img {
        cursor: pointer;
        width: 100%;
        height: 100%;
        transition: transform .9s;
      }
      .hotDeals > div > img:hover{
        -ms-transform: scale(1.11);
          transform: scale(1.11);
      }
      .essential_main_box {
        width: 100%;
        margin-bottom: 20px;
        margin: auto;
      }
      .essentials {
        height: 250px;
        width: 90%;
        margin: auto;
        display: flex;
        margin-bottom: 20px;
        cursor: pointer;
      }
      .essential_small_box {
        width: 23.5%;
        margin-right: 16px;
        border-top: 20px;
        background-color: #efd6da;
        border-radius: 20px;
      }
      .offer_tags {
        width: 100%;
        height: 24px;
        background-size: 100%;
        text-align: center;
        padding: 8px 0px 0px;
        color: white;
        font-weight: bold;
        margin-bottom: 15px;
        font-family: Arial, Helvetica, sans-serif;
        background-image: url("https://www.jiomart.com/assets/version1638198149/smartweb/images/offer_bg.png");
      }
      b {
        font-style: italic;
      }
      .essential_img {
        width: 200px;
        height: 200px;
        margin: auto;
        text-align: center;
        font-weight: bold;
        transition: transform .9s;
      }
      .essential_img:hover {
        -ms-transform: scale(1.1);
  transform: scale(1.1);
      }
      .tital_box {
        width: 90%;
        margin: auto;
      }
      .essential_small_box:hover {
        box-shadow: 10px 5px 5px #a6a6a6;
      }
      .essential_name {
        color: black;
      }
      .houshold_small_box {
        width: 23.5%;
        margin-right: 16px;
        border-top: 20px;
        background-color: #c5f8c0;
        border-radius: 20px;
      }
      .grocery_small_box {
        width: 23.5%;
        margin-right: 16px;
        border-top: 20px;
        background-color: #bce1fe;
        border-radius: 20px;
      }

      .essential_main_box {
        width: 100%;
        margin-bottom: 20px;
        margin: auto;
      }
      .essentials {
        height: 250px;
        width: 90%;
        margin: auto;
        display: flex;
        margin-bottom: 20px;
        cursor: pointer;
      }
      .essential_small_box {
        width: 23.5%;
        margin-right: 16px;
        border-top: 20px;
        background-color: #efd6da;
        border-radius: 20px;
      }
      .offer_tags {
        width: 100%;
        height: 24px;
        background-size: 100%;
        text-align: center;
        padding: 8px 0px 0px;
        color: white;
        font-weight: bold;
        margin-bottom: 15px;
        font-family: Arial, Helvetica, sans-serif;
        background-image: url("https://www.jiomart.com/assets/version1638198149/smartweb/images/offer_bg.png");
      }
      b {
        font-style: italic;
      }
      .essential_img {
        width: 200px;
        height: 200px;
        margin: auto;
        text-align: center;
        font-weight: bold;
        transition: transform .5s;
      }
      .essential_img:hover {
        -ms-transform: scale(1.1); 
        transform: scale(1.1);
      }
      .tital_box {
        width: 90%;
        margin: auto;
      }
      .essential_small_box:hover {
        box-shadow: 10px 5px 5px #a6a6a6;
      }
      .essential_name {
        color: black;
      }
      .houshold_small_box {
        width: 23.5%;
        margin-right: 16px;
        border-top: 20px;
        background-color: #c5f8c0;
        border-radius: 20px;
      }
      .sliding ,.paytmOfr {
        display: flex;
        box-sizing: border-box;
        height: 246px;
        margin-left: 35px;
        margin-right: 20px;
      }
      .sliding > div {
        border-radius: 8px;
        outline: 1px solid gray;
        height: 80%;
        padding: 10px;
        margin-top: 10px;
        margin-left: 10px;
        margin-right: 5px;
        width: 20%;
      }
      .sliding > div > img {
        height: 70%;
        width: 100%;
      }
      .sliding > div > p {
        text-align: center;
        padding-top: 30px;
        font-size: 14px;
        font-family: sans-serif;
      }
      .zImage>div>img{
        height: 100%;
        width: 100%;
      }
      .paytmOfr{
        margin-bottom: 20px;
      }
      .paytmOfr>div{
        height: 100%;
        width: 750px;
        margin-top: 10px;
        margin-right: 10px;

      }
      .paytmOfr>div>img{
        height: 100%;
        width: 100%;
      }
      .sllide2{
        display: flex;
        height: 310px;
        min-width: 180px;
        overflow-x:auto;

      }
      .d1{
        box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
        height: 230px;
        border-radius: 8px;
        width: 180px;
        margin-left: 20px;
        margin-top: 20px;
       padding: 15px;
       cursor: pointer;

      }
      .d1>p{
        font-size: 15px;
        font-weight: bold;
        margin-bottom: 10px;

      }
      .i2{
        height: 160px;
        width: 160px;
        transition: transform .5s;
        cursor: pointer;

      }
      .i1{
        height: 220px;
        width: 180px;
        padding: 20px;
        margin-left: 20px;
        cursor: pointer;
        transition: transform .5s;

      }
      .i1:hover{
        -ms-transform: scale(1.1);
         transform: scale(1.1);

      }
      .i2:hover{
        -ms-transform: scale(1.1);
         transform: scale(1.1);

      }
      .sllide{
        height: 335px;
            display: flex;
            overflow-x:auto;
      }
      .classic{
            height: 340px;
            display: flex;

        }
        .one{
            height: 312px;
            width:200px;
            margin-right: 16px;
            display: flex;

        }
        .container{
           display: flex;
            overflow-x:auto;

 }
 .container .one{
     min-width: 180px;
 }


.indiv{

    height: 310px;
    width: 200px;
}

.btn,.btn2{height: 35px;
    width: 100%;
    margin-top: 15px;
    display: flex;
    flex-direction: row-reverse;
    cursor: pointer;
}
.all{
    height:320px ;
    width: 185px;
    margin-left: 20px;
    box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
    border-radius: 10px;
    margin-top:1px;
    display: flex;
}

.imgdiv{
    width: 60%;
    height: 50%;
    display: flex;
}
.price{
    height: 37px;
    padding-left: 10px;
    margin: 5px;

}
.mimg{
    width: 120px;
    padding-top: 30px;
    height:auto;
    cursor: pointer;
}
.hov:hover{
    width:130px ;
}
.plus,.plus2{
   border-radius: 5px;
    line-height: 35px;
    height: 100%;
    width:170px;
    text-align: left;
    background-color: #008ecc;
    color: white;
    border: 0;
    font-weight: bolder;
    font-family:-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    font-size: 15px;
    padding-left: 10px;
    cursor: pointer;
    margin-right: 17px;
}
.inr-sign::before{content:"\20B9";}
.p1{display: flex;}
.p2{text-decoration: line-through;}
.ic1{
height: 100%;
padding-top: 8px;
padding-left:1px;
}
.ic2{
height: 100%;
width: 20px;
padding-right: 10px;
padding-top: 5px;
}
.name{
    padding-left: 15px;
padding-right:15px;
font-family:sans-serif ;
font-weight:600;
font-size:15px;
cursor: pointer;
}

.minus,.pluss,.pluss2,.minus2{display:none;
border-radius: 20px;
color: white;
background-color: #008ecc;
border: 0;
font-size: 25px;
height: 30px;
width: 30px;}
.m1{
    border: 0;
    font-size: 18px;
    padding-top: 6px;
    background-color: transparent;
}
.minus,.minus2{
    margin-right: 10px;
}
.pluss,.pluss2{
    margin-left: 10px;
    margin-right: 12px;
}
.save{
    color:#47bb47;
    font-weight: bolder;
    line-height: 2px;
}
      /* end */
    </style>
  </head>
  <body>
    <!-- -------------------------------------------------Nav Bar-----------------------------------------------  -->
    <div id="nav_bar">
      <i onclick="sidenav()" id="menu" class="fas fa-bars"></i>
      <h1 onclick="home()">Shopology</h1>
      <div id="search">
        <input
          id="search_bar"
          type="text"
          placeholder="Search refrigerator,mobiles,and more...."
        />
        <button id="search_button"><i id="search_menu" class="fas fa-list-ul"></i>Search</button>
     </div>
     

     <div class="link-container"></div>
        <a href="#" class="link">Login as Admin</a>
        <a href="#" class="link">Login</a>
    </div>
      
      
    </div>
    <!-- --------------------------------------------------nav bar 2------------------------------------------- -->
    <div class="navbar2">
      <ul class="menu">
        <li id="loction_icon" class="menu_text">
          <i id="loction_icon" class="fas fa-map-marker-alt"></i>
          <p>Deliver to <br />444303</p>
        </li>
        <li class="menu_text">
          <a href="#">Refrigerators<i class="fas fa-chevron-down" ></i></a>
        </li>
        <li class="menu_text">
          <a href="#">Mobiles <i class="fas fa-chevron-down"></i></a>
        </li>
        <li class="menu_text">
          <a href="">Laptops<i class="fas fa-chevron-down"></i></a>
        </li>
      </ul>
    </div>
  </body>

  <!----------------------------------- First Animation part --------------------------------------->
  <div id="slider">
    <figure class="slider">
      <img
        src="https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/241b9b715c91303a.jpg?q=20"
      />
    </figure>
  </div>
  <!-------------------------------- First Animation part END her------------------------------------->
  <!-------------------------------- First images sets start------------------------------------- -->
  <img
    id="homeDelivery"
    src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1630687962_1619794516_fhd.jpg"
  />

  <img
    id="afterWinter"
    src="https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/60fe14e12571126b.jpg?q=20"
  />
  <h2 class="topCat">Up to 40% off | Deals on smartphones</h2>
  <div class="sllide">

    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/200x01._CB562237749_.jpg"
      />

    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/08._CB562237749_.jpg"
      />

    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/03._CB562237749_.jpg"
      />
    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/05._CB562237749_.jpg"
      />
    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/06._CB562237749_.jpg"
      />

    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/07._CB562237749_.jpg"
      />
    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/16._CB562237749_.jpg"
      />
    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/09._CB562237749_.jpg"
      />
    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/07._CB562237749_.jpg"
      />
    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/200x01._CB562237749_.jpg"
      />
    </div>
    <div class="i1">
      <img
        src="https://images-eu.ssl-images-amazon.com/images/G/31/img24/Wireless/Samsung/Jupiter24/MSO_Ph1/DP_sh_200/08._CB562237749_.jpg"
      />
    </div>
  </div>
  </div>
  <img
    id="handWash"
    src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1727684676_2368_400.jpg?im=Resize=(2368,400)"
  />
  <h2 class="topCat" style="font-size: 25px; padding-bottom: 20px;" >Best Deals on LG Refrigerators</h2>
  <!------------------------------------------ Prajwal's Work start------------------------------------->
  <div class="classic">
    <div class="container">
        <div class="one">
            <div class="all">
                <div class="indiv">
                    <div class="imgdiv">
                        <div class="ic1"><img src="https://www.freeiconspng.com/uploads/sale-promo-percent-20-off-png-6.png" height="40px" alt=""></div>
                        <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/493692272/lg-185-litre-5-star-single-door-direct-cool-refrigerator-blue-charm-gl-d201abcu-digital-o493692272-p598715567-0-202302232023.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
                    </div>
                   <div class="name">LG 185 L 5 Star Inverter Direct Cool Single Door Refrigerator </div>
                    <div class="price">
                        <div><b><span class="inr-sign"> 17,290.00</b></div>
                        <div class="p1">M.R.P:<div class="p2"><span class="inr-sign"> 22,199.00</span>
                        </div></div>
                        <p class="save">Save <span class="inr-sign">4,909</span></p>
                        <div class="btn">
                            <div><button class="pluss">+</button></div>
                            <div><button class="plus">Add To Cart
                            </button></div>
                            <div><button class="minus">-</button></div>
                        </div>
                    </div>
             </div>
         </div>
     </div>
 <div class="one">
    <div class="all">
        <div class="indiv">
            <div class="imgdiv">
              <div class="ic1"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiR5VgAm2UWgD5In6AlQaaaBnNoC44pCYuYK45cw7oxUpCFuccq26FEIkNCXCuFQH2o0&usqp=CAU" height="40px" alt=""></div>
              <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/493692274/lg-185-litres-5-star-direct-cool-single-door-refrigerator-scarlet-charm-gl-d201ascu-digital-o493692274-p599232104-0-202303110928.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
            </div>
            <div class="name">LG 185 L 5 Star Inverter Direct Cool Single Door Refrigerator </div>
            <div class="price">
                <div><b><span class="inr-sign"> 17,290.00</b></div>
                <div class="p1">M.R.P:<div class="p2"><span class="inr-sign"> 22,199.00</span>
                </div></div>
                <p class="save">Save <span class="inr-sign">4,909</span></p>
                <div class="btn2">
                    <div><button class="pluss2">+</button></div>
                    <div><button class="plus2">Add To Cart
                    </button></div>
                    <div><button class="minus2">-</button></div>
                </div>
            </div>

     </div>
 </div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRkw4I720czVHLZTjTB4Q0K2ZIoFH4yfSSRp5P9xrnvtra2_r1j0fQZJIpJ24HwCYRnQI&usqp=CAU" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/491666528/lg-260-l-2-star-inverter-frost-free-double-door-refrigerator-gl-s292rpzy-shinny-steel-convertible-refrigerator-digital-o491666528-p590039617-0-202305161531.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>

        </nav>
    </header>
 
    <!-- Categories Bar -->
    <div class="categories-bar">
        <div class="category">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyEvwHlH4wWYWbzMREwGMExULUIjd0KGkhXw&s" alt="Refrigerators">
            <a href="/products/display">Refrigerators</a>

        </div>
        <div class="name">LG 240 litres 2 Star Convertible Frost Free  Refrigerator</div>
        <div class="price">
            <div><b><span class="inr-sign">₹28,490.00</b></div>
            <div class="p1">M.R.P:<div class="p2"><span class="inr-sign">₹34,599.00</span>
            </div></div>
            <p class="save">Save <span class="inr-sign">6,109.00</span></p>
            <div class="btn2">
                <div><button class="pluss2">+</button></div>
                <div><button class="plus2">Add To Cart
                </button></div>
                <div><button class="minus2">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiR5VgAm2UWgD5In6AlQaaaBnNoC44pCYuYK45cw7oxUpCFuccq26FEIkNCXCuFQH2o0&usqp=CAU" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/493692095/lg-343-litres-3-star-double-door-refrigerator-shiny-steel-gl-t382tpzx-digital-o493692095-p600106986-0-202304031316.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
          </div>
     <div class="name">LG 343 litres 3 star Double door Refrigerator</div>
      <div class="price">
          <div><b><span class="inr-sign"> 46,290.00</b></div>
          <div class="p1">M.R.P:<div class="p2"><span class="inr-sign"> 59,399.00</span>
          </div></div>
          <p class="save">Save <span class="inr-sign"> 13,109.00</span></p>
          <div class="btn2">
              <div><button class="pluss2">+</button></div>
              <div><button class="plus2">Add To Cart
              </button></div>
              <div><button class="minus2">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbdHE-itFFn_5bJqMdeJ-2llla2HnAuaLCZQ&usqp=CAU" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/493692141/lg-380-litres-2-star-double-door-refrigerator-dazzle-steel-gl-n412sdsy-digital-o493692141-p600106745-0-202304031314.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
          </div>
     <div class="name">LG 380 litres 2 star double door refrigerator</div>
      <div class="price">
          <div><b><span class="inr-sign"> 44,490.00</b></div>
          <div class="p1">M.R.P:<div class="p2"><span class="inr-sign"> 53,099.00</span>
          </div></div>
          <p class="save">Save <span class="inr-sign">8,609.00</span></p>
          <div class="btn2">
              <div><button class="pluss2">+</button></div>
              <div><button class="plus2">Add To Cart
              </button></div>
              <div><button class="minus2">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://www.freeiconspng.com/uploads/sale-promo-percent-20-off-png-6.png" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/493692142/lg-398-litres-2-star-double-door-refrigerator-shiny-steel-gl-s422spzy-digital-o493692142-p603619517-0-202308041729.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
      </div>
     <div class="name">LG 398 litres 2 star double door refrigerator</div>
      <div class="price">
          <div><b><span class="inr-sign"> 48,990,00</b></div>
          <div class="p1">M.R.P:<div class="p2"><span class="inr-sign"> 59,399.00</span>
          </div></div>
          <p class="save">Save <span class="inr-sign"> 10,409.00</span></p>
          <div class="btn">
              <div><button class="pluss">+</button></div>
              <div><button class="plus">Add To Cart
              </button></div>
              <div><button class="minus">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://www.freeiconspng.com/uploads/sale-promo-percent-20-off-png-6.png" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/493858074/lg-201-litres-5-star-single-door-refrigerator-scarlet-euphoria-gl-d211hsez-digital-o493858074-p604141892-0-202308281806.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
      </div>
     <div class="name">LG 290 litres Inverter direct 3 star single door refrigerator</div>
      <div class="price">
          <div><b><span class="inr-sign"> 19,000.00</b></div>
          <div class="p1">M.R.P:<div class="p2"><span class="inr-sign"> 20,000.00</span>
          </div></div>
          <p class="save">Save <span class="inr-sign">1,000.00</span></p>
          <div class="btn">
              <div><button class="pluss">+</button></div>
              <div><button class="plus">Add To Cart
              </button></div>
              <div><button class="minus">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://www.freeiconspng.com/uploads/sale-promo-percent-20-off-png-6.png" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/494226821/lg-650-litres-convertible-side-by-side-refrigerator-shiny-steel-gl-b257epz3-digital-o494226821-p604677746-0-202309201607.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
      </div>
     <div class="name">LG 690 litres 5 star Side-by-Side refrigerator</div>
      <div class="price">
          <div><b><span class="inr-sign">98,990.00</b></div>
          <div class="p1">M.R.P:<div class="p2"><span class="inr-sign"> 1,00,000.00</span>
          </div></div>
          <p class="save">Save <span class="inr-sign"> 1,010.00</span></p>
          <div class="btn">
              <div><button class="pluss">+</button></div>
              <div><button class="plus">Add To Cart
              </button></div>
              <div><button class="minus">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiR5VgAm2UWgD5In6AlQaaaBnNoC44pCYuYK45cw7oxUpCFuccq26FEIkNCXCuFQH2o0&usqp=CAU" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/494226819/lg-650-litres-convertible-side-by-side-refrigerator-ebony-sheen-gl-b257ees3-digital-o494226819-p604677744-0-202309201607.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
          </div>
     <div class="name">Bosh 650 litres 5 star Side-by-Side refrigerator </div>
      <div class="price">
          <div><b><span class="inr-sign">98,000.00</b></div>
          <div class="p1">M.R.P:<div class="p2"><span class="inr-sign">1,00,000.00</span>
          </div></div>
          <p class="save">Save <span class="inr-sign">2,000.00</span></p>
          <div class="btn2">
              <div><button class="pluss2">+</button></div>
              <div><button class="plus2">Add To Cart
              </button></div>
              <div><button class="minus2">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://www.freeiconspng.com/uploads/sale-promo-percent-20-off-png-6.png" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com//images/product/original/492796734/lg-190-litres-3-star-direct-cool-single-door-refrigerator-shiny-steel-gl-b201apzd-digital-o492796734-p591356578-0-202205161239.jpeg?im=Resize=(150,150)" width="120px" alt=""></div>
      </div>
     <div class="name">LG 185 litres 3 star inverter direct single door refrigerator</div>
      <div class="price">
          <div><b><span class="inr-sign"> 18,000.00</b></div>
          <div class="p1">M.R.P:<div class="p2"><span class="inr-sign"> 20,000.00</span>
          </div></div>
          <p class="save">Save <span class="inr-sign"> 2,000.00</span></p>
          <div class="btn">
              <div><button class="pluss">+</button></div>
              <div><button class="plus">Add To Cart
              </button></div>
              <div><button class="minus">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
 <div class="one">
  <div class="all">
    <div class="indiv">
        <div class="imgdiv">
          <div class="ic1"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWiR5VgAm2UWgD5In6AlQaaaBnNoC44pCYuYK45cw7oxUpCFuccq26FEIkNCXCuFQH2o0&usqp=CAU" height="40px" alt=""></div>
          <div class="mimg"><img class="hov" src="https://www.jiomart.com/images/product/original/494226817/lg-650-litres-convertible-side-by-side-refrigerator-linen-white-gl-b257dlw3-digital-o494226817-p604677738-0-202309201607.jpeg?im=Resize=(420,420)" width="120px" alt=""></div>
          </div>
     <div class="name">LG 650 L, Side by Side Refrigerator with Premium Glass Door</div>
      <div class="price">
          <div><b><span class="inr-sign">1,12,090.00</b></div>
          <div class="p1">M.R.P:<div class="p2"><span class="inr-sign">1,47,199.00 </span>
          </div></div>
          <p class="save">Save <span class="inr-sign">35,109.00</span></p>
          <div class="btn2">
              <div><button class="pluss2">+</button></div>
              <div><button class="plus2">Add To Cart
              </button></div>
              <div><button class="minus2">-</button></div>
            </div>
        </div>
 </div>
</div>
 </div>
</div>
</div>
  <!------------------------------------------ Prajwal's Work end ------------------------------------->

  <div class="paytmOfr">
   <div>
     <img src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1638388102_Jio_mart_910x278-2-01_Main.jpg">
   </div>
   <div><img src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1638898535_AU_web_mob.jpg"></div>
  </div>
  <h2 class="topCat">Shop from Top Categories</h2>
  <div class="sllide2">
    <div class="d1">
      <img class="i2"
        src="https://www.jiomart.com/images/product/original/494422233/oppo-k12x-5g-128-gb-6-gb-ram-midnight-navy-mobile-phone-digital-o494422233-p609630871-0-202407311923.jpeg?im=Resize=(360,360)"
      />
      <p>Mobiles</p>
    </div>
    <div class="d1">
      <img class="i2"
        src="https://www.jiomart.com/images/product/original/494352779/apple-mba-13-mxcv3hna-macbook-air-apple-m3-chip-16-gb-512-gb-ssd-liquid-retina-34-544-cm-13-6-inch-midnight-black-digital-o494352779-p608366370-0-202403051906.jpeg?im=Resize=(360,360)"
      />
      <p>Laptops</p>
    </div>
    <div class="d1">
      <img class="i2"
        src="https://www.jiomart.com/images/product/original/494226821/lg-650-litres-convertible-side-by-side-refrigerator-shiny-steel-gl-b257epz3-digital-o494226821-p604677746-0-202309201607.jpeg?im=Resize=(360,360)"
      />
      <p>Refrigerators</p>
    </div>
  </div>
 
  <!---------------------------------------------- largeImageStart start here ------------------------------------>
  <div class="largeImageStart">
    <div>
      <img
        src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1727698083_Television.jpg?im=Resize=(768,448)"
      />
    </div>
    <div>
      <img
        src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1727633548_Realme.jpg?im=Resize=(368,452)"
      />
    </div>
    <div>
      <img
        src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1727698349_LG.jpg?im=Resize=(368,452)"
      />
    </div>
    <div>
      <img
        src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1727785769_laptops.jpg?im=Resize=(768,448)"
      />
    </div>
  </div>
  <div class="largeImageStart">
    <div>
      <img
        src="https://www.jiomart.com/images/cms/aw_rbslider/slides/1727785425_iPhone_14_.jpg?im=Resize=(768,448)"
      />
    </div>
    <div>
      <img
        src="https://rukminim2.flixcart.com/fk-p-flap/520/280/image/5a75d646ca736227.jpg?q=20"
      />
    </div>
    <div>
      <img
        src="https://rukminim2.flixcart.com/fk-p-flap/520/280/image/98d1da35ad7bd4ea.jpg?q=20"
      />
    </div>
    <div>
      <img
        src="https://rukminim1.flixcart.com/fk-p-flap/520/280/image/0c9a715e9220dc34.jpg?q=20"
      />
    </div>
  </div>
  <!---------------------------------------------- largeImageStart end here ------------------------------------>
  <!---------------------------------------------- footer start here ------------------------------------>
  <footer>
    <div class="footer-1">
      <div id="footerDiv1">
        <ul>
          <li>
            <h2>MOST POPULAR CATEGORIES</h2>
          </li>
          <li><a href="">Mobiles</a></li>
          <li><a href="">Refrigerators</a></li>
          <li><a href="">Laptops</a></li>
        </ul>
      </div>
      <div id="footerDiv2">
        <ul>
          <li>
            <h2>CUSTOMER SERVICES</h2>
          </li>
          <li><a href="">About Us</a></li>
          <li><a href="">FAQ</a></li>
          <li><a href="">Terms and conditions</a></li>
          <li><a href="">Privacy policy</a></li>
          <li><a href="">E-waste Policy</a></li>
        </ul>
      </div>
      <div id="footerDiv3">
        <h2>CONTACT US</h2>
        <p>
          WhatsApp us :
          <a
            href="https://api.whatsapp.com/send/?phone=917000370003&text=Hi&app_absent=0"
            target="_blank"
            >70003 70003</a
          >
        </p>
        <span id="footerspan">
          <p>Call Us : <a href="">1800 890 1222</a></p>
          <p>8:00 AM to 8:00 PM,365 days</p>
        </span>
        <p>
          Please note that you are accessing the BETA Version of
          <a href="">www.shopology.com</a>
        </p>
        <p>
          Should you encounter any bugs, glitches, lack of functionality,
          delayed deliveries, billing errors or other problems on the beta
          website, please email us on <a href="">cs@shopology.com</a>
        </p>
        <h2 style="line-height: 50px">DOWNLOAD APP</h2>
        <a
          href="https://play.google.com/store/apps/details?id=com.jpl.jiomart"
          target="_blank"
          style="margin-right: 16px"
        >
          <img
            src="https://www.jiomart.com/images/cms/wysiwyg/app-icons/play_store.png"
            alt="Donwload Jio mart app from Play store"
          />
        </a>
        <a
          href="https://apps.apple.com/in/app/jiomart/id1522085683"
          target="_blank"
        >
          <img
            src="https://www.jiomart.com/images/cms/wysiwyg/app-icons/ios_store.png"
            alt="Donwload Jio mart for IOS app from App store"
          />
        </a>
      </div>
    </div>
    <div id="copyRight">
      <p>
        Best viewed on Microsoft Edge 81+, Mozilla Firefox 75+, Safari 5.1.5+,
        Google Chrome 80+
      </p>
      <p>© 2024 All rights reserved.</p>
    </div>
  </footer>
  <!-------------------------------------------- Footer END here-------------------------------------------------- -->
</html>

  

  
  
  
<%@page import="vo.DateAbandon"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@page import="javax.*"%>
<%@page import="java.lang.reflect.Parameter"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@charset "utf-8";

@import url(font.css);
,

body, p, img, ul, ol, li, dl, dt, dd, table, tr, th, td, form, fieldset,
	input, select, option, textarea, div {
	margin: 0;
	padding: 0;
	border: none;
	resize: none;
	list-style: none;
	box-sizing: border-box;
	border-spacing: 0;
	border-collapse: collapse;
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

input, select, img, button {
	vertical-align: middle;
	font-size: 12px;
	font-family: '����', sans-serif;
	color: #6d6e71;
}

input[type="text"], select {
	font-size: 12px;
	font-weight: 300;
	padding-left: 6px;
	border: 1px solid #d1d3d4;
	font-family: '����', sans-serif;
	color: #6d6e71;
	background-color: #ffffff;
}

input {
	border: 1px solid #d1d3d4;
}

a {
	box-sizing: border-box; /* vertical-align:middle; */
	color: inherit;
}

input[type="text"], select, input[type="date"], input[type="password"] {
	height: 24px;
	line-height: 24px;
	font-size: 12px;
	font-family: '����', sans-serif;
	color: #6d6e71;
}

textarea {
	border: 1px solid #d1d3d4;
	font-family: '����';
	font-size: 12px;
}

select {
	background-color: #ffffff;
}

/*input:focus, select:focus, a:focus{border:dotted 2px gray !important; outline:none;}*/
input:focus, select:focus, a:focus, textarea:focus, button:focus {
	border: dotted 3px !important;
	outline: none;
	border-color: unset;
}

input[type="checkbox"]:focus {
	box-shadow: 0px 0px 2px 2px #f38b8b;
}

input[type="radio"]:focus {
	box-shadow: 0px 0px 2px 2px #f38b8b;
}

.thumbnail a {
	width: 100%;
	height: 100%;
	display: inline-block;
}

.bd1_listbtn {
	text-align: center;
}
/* .bd1_listbtn li{display:inline-block; margin-left:20px;} */
.bd1_listbtn a {
	display: inline-block;
}
/* .bd1_listbtn a{position:absolute;} */
/*.bd1_listbtn span{width:100px;}*/
.clearfix:before, .clearfix:after {
	content: "";
	display: table;
}

.clearfix:after {
	clear: both;
}

select.selectM {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	-webkit-border-radius: 0;
	background-image: url(../images/common/select-arrow.png);
	background-position: right 6px center;
	background-repeat: no-repeat;
	padding-right: 20px;
}

input[type="text"].inputM, input[type="password"].inputM {
	-webkit-appearance: none;
	-webkit-border-radius: 0;
}

.blue {
	color: #194b82 !important;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	word-break: keep-all;
}

.hide {
	width: 0;
	height: 0;
	position: absolute;
	line-height: 0;
	display: none;
}

#wrap {
	min-width: 1200px;
}

#skipnavi {
	position: absolute;
	top: -100px;
	z-index: 10000;
}

#skipnavi:focus, #skipnavi:active {
	position: absolute;
	top: 0;
	left: 0;
	height: auto;
	margin-bottom: 10px;
	padding: 5px;
	background: #000;
	font-weight: bold;
	color: #fff;
	display: inline-block;
}

/* HEADER */
#top_wrap {
	width: 100%;
	border-bottom: 1px solid #dcddde;
	background-color: #f1f2f2;
}

#top_wrap #top {
	width: 1200px;
	height: 36px;
	margin: 0 auto;
	position: relative;
}

#top_wrap #top:before, #top_wrap #top:after {
	content: "";
	display: table;
}

#top_wrap #top:after {
	clear: both;
}

#top_wrap #top .adoptLink {
	display: inline-block;
	font-size: 14px;
	font-weight: 400;
	color: #36465a;
	font-family: 'NanumSquare', sans-serif;
	line-height: 31px;
	padding-right: 20px;
	background: url(../images/common/arrow01.png) no-repeat right center;
}

#top_wrap #top .adoptLink:hover {
	text-decoration: underline;
}

#top_wrap #top .utill-left {
	float: left;
	display: inline-block;
}

#top_wrap #top .utill-left>li {
	float: left;
	display: inline-block;
	margin-right: 20px;
}

#top_wrap #top .adoptLink2 {
	display: inline-block;
	font-size: 14px;
	font-weight: 400;
	color: #ffffff;
	background-color: #36465a;
	margin-top: 5px;
	border-radius: 10px;
	font-weight: bold;
	font-family: 'NanumSquare', sans-serif;
	line-height: 26px;
	padding: 0 30px 0 20px;
	background-image: url(../images/common/arrow8.png);
	background-repeat: no-repeat;
	background-position: right 16px center;
}

#top_wrap #top .adoptLink2:hover {
	text-decoration: underline;
}

#top_wrap #top .adoptLink3 {
	display: inline-block;
	font-size: 14px;
	font-weight: 400;
	color: #ffffff;
	background-color: #808285;
	margin-top: 5px;
	border-radius: 10px;
	font-weight: bold;
	font-family: 'NanumSquare', sans-serif;
	line-height: 26px;
	padding: 0 30px 0 20px;
	background-image: url(../images/common/arrow8.png);
	background-repeat: no-repeat;
	background-position: right 16px center;
}

#top_wrap #top .adoptLink3:hover {
	text-decoration: underline;
}

#top .utill {
	float: right;
	display: inline-block;
}

#top .utill li {
	font-size: 12px;
	float: left;
	display: inline-block;
	line-height: 36px;
	margin-left: 20px;
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
}

#top .utill li a {
	color: #58595b;
	padding-left: 14px;
	background-repeat: no-repeat;
	background-position: left top;
}

#top .utill li a.loginBtn {
	background-image: url(../images/common/ico-login.png);
}

#top .utill li a.joinBtn {
	background-image: url(../images/common/ico-join.png);
	padding-left: 16px;
}

#top .utill li a.idFind {
	background-image: url(../images/common/ico-pw.png);
	padding-left: 12px;
}

#top .utill li a:hover {
	color: #194b82;
	text-decoration: underline;
}

.utillBtn {
	display: none;
}

#logo_wrap {
	width: 1200px;
	height: 100px;
	margin: 0 auto;
	position: relative;
}

#logo_wrap:before, #logo_wrap:after {
	content: "";
	display: table;
}

#logo_wrap:after {
	clear: both;
}

#logo_wrap h1 {
	float: left;
	display: inline-block;
	margin-top: 35px;
}

#logo_wrap h1 a {
	display: block;
	background: url(../images/common/logo.png) no-repeat left top;
	width: 178px;
	height: 32px;
	text-indent: -9999px;
}

/* ��ϵ������� ������ CSS �߰� */
#logo_wrap ul.animalInfoChange {
	float: left;
	text-align: right;
	padding-top: 28px;
	padding-right: 0px;
	padding-left: 7px;
}

#logo_wrap ul.animalInfoChange li input {
	font-size: 14px;
	font-weight: 300;
	background-color: green;
	height: 44px;
	line-height: 44px;
	color: #FFF;
	margin-left: 6px;
	padding: 0px 4px;
	margin-right: 10px;
	border: 0;
	font-family: "Noto Sans KR", sans-serif;
	word-break: keep-all;
	cursor: pointer;
}

.top_search {
	display: block;
	width: 420px;
	height: 44px;
	border: 4px solid #ffc22f;
	margin: 0 auto;
	margin-right: 0;
	position: relative;
	box-sizing: border-box;
	margin-top: 28px;
}

.top_search select {
	border: none;
	width: 126px;
	height: 24px;
	line-height: 24px;
	border-right: 1px solid #e6e7e8;
	margin: 6px 0;
}

.top_search input[type="text"] {
	width: 240px;
	height: 24px;
	line-height: 24px;
	color: #a7a9ac;
	font-size: 12px;
	font-weight: 300;
	border: none;
}

.top_search .t_search02 {
	width: 40px;
	height: 36px;
	line-height: 36px;
	background-color: #ffc22f;
	border: none;
	background-image: url(../images/common/ico-search.png);
	background-repeat: no-repeat;
	background-position: center center;
	float: right;
	cursor: pointer;
}

.top_search .t_search02:active {
	background-color: #0a2a4d;
}

.headerMenu {
	position: absolute;
	left: 375px;
	right: 0;
	top: 28px;
}

.headerMenu:before, .headerMenu:after {
	content: "";
	display: table;
}

.headerMenu:after {
	clear: both;
}

.headerMenu li {
	float: left;
	display: inline-block;
	margin-left: 6px;
	font-size: 14px;
	font-weight: 300;
	color: #ffffff;
	text-align: center;
}

.headerMenu li a {
	display: block;
	background-color: #194b82;
	height: 44px;
	line-height: 44px;
	padding: 0 5px;
}

.headerMenu li:first-child a {
	background-color: #1d8cd3;
}

.headerMenu li a:before {
	content: "";
	display: inline-block;
	margin-right: 6px;
	position: relative;
	top: 2px;
}

.headerMenu li a.menu01:before {
	content: url(../images/common/headerLink01.png);
}

.headerMenu li a.menu02:before {
	content: url(../images/common/headerLink02.png);
}

.allMenu {
	display: none;
}

#gnb_wrap {
	background-color: #ffffff;
	position: relative;
	z-index: 999999;
	border: 1px solid #dcddde;
	border-left: none;
	border-right: none;
}

#gnb_wrap #gnb {
	width: 1200px;
	height: 50px;
	margin: 0 auto;
	position: relative;
}

#gnb_wrap #gnb>ul {
	width: 100%;
	display: block;
}

#gnb_wrap #gnb>ul:before, #gnb_wrap #gnb>ul:after {
	content: "";
	display: table;
}

#gnb_wrap #gnb>ul:after {
	clear: both;
}

#gnb_wrap #gnb>ul>li {
	float: left;
	display: inline-block;
	font-size: 18px;
	font-weight: bold;
	position: relative;
	letter-spacing: -1px;
	font-family: 'NanumSquare', sans-serif;
}

#gnb_wrap #gnb>ul>li:first-child a {
	padding-left: 0;
	background: none;
}

#gnb_wrap #gnb>ul>li>a {
	color: #333132;
	display: block;
	padding: 0 50px;
	height: 50px;
	line-height: 50px;
	background: url(../images/common/gnb-line.jpg) no-repeat left center;
}

#gnb_wrap #gnb>ul>li>a:hover {
	color: #ffc22f;
}

#gnb_wrap #gnb>ul>li.sitemap {
	float: right;
}

#gnb_wrap #gnb>ul>li.sitemap a {
	width: 50px;
	height: 50px;
	display: inline-block;
	background-color: #ffc22f;
	background-image: url(../images/common/header-menu.png);
	background-position: center center;
	background-repeat: no-repeat;
	text-indent: -9999px;
	cursor: pointer;
	padding: 0;
}

#gnb_wrap #gnb>ul>li:first-child .submenu {
	padding-left: 0;
}

#gnb_wrap #gnb>ul>li .submenu {
	position: absolute;
	width: 100%;
	padding: 10px 20px;
}

#gnb_wrap #gnb>ul>li .submenu>li {
	font-size: 12px;
	font-weight: 300;
	line-height: 120%;
	font-family: 'Nanum Gothic', sans-serif;
	display: block;
	text-align: left;
}

#gnb_wrap #gnb>ul>li .submenu>li>a {
	display: block;
	color: #58595b;
	padding-bottom: 10px;
}
/* #gnb_wrap #gnb > ul > li .submenu > li > a:before{	content:": ";	} */
#gnb_wrap #gnb>ul>li .submenu>li>a:hover {
	text-decoration: underline;
}

#gnb_wrap .snbBox {
	border-bottom: 1px solid #dcddde;
	position: absolute;
	left: 0;
	top: 51px;
	width: 100%;
	height: 250px;
	padding: 20px 0;
	background-color: #ffffff;
}

#gnb_wrap #gnb>ul>li#naviMobile {
	display: none;
}

@media only screen and (max-width:768px) {
	#wrap {
		min-width: 320px;
		width: 100%;
	}
	#top_wrap {
		position: absolute;
		right: 0;
		top: 0;
		z-index: 9999;
	}
	#top_wrap #top {
		width: 100%;
		height: auto;
		margin: 0;
		background-color: #ffffff;
	}
	#top_wrap #top .adoptLink {
		display: none;
	}
	#top .utill {
		display: none;
		position: absolute;
		top: 60px;
		background-color: #ffffff;
		width: 100%;
	}
	#top .utill li {
		display: block;
		float: none;
		border-bottom: 1px solid #dcddde;
		margin: 0;
		padding-left: 10px;
		line-height: 140%;
	}
	#top .utill li a {
		display: block;
		padding: 10px;
		background-position: left center;
	}
	#top .utill li a:active {
		background-color: #f8f8f8;
	}
	#top .utillBtn {
		width: 30px;
		height: 30px;
		background-image: url(../images/common/ico-mypage.png);
		background-repeat: no-repeat;
		background-position: center center;
		display: block;
		text-indent: -9999px;
		position: absolute;
		right: 10px;
		top: 15px;
		background-size: 25px;
		cursor: pointer;
	}
	#top .utillBtn.active {
		background-image: url(../images/common/ico-close.png);
	}
	#top_wrap #top .utill-left {
		display: none;
	}
	#logo_wrap {
		width: 100%;
		height: auto;
		padding: 0;
		background-color: #ffc22f;
	}
	#logo_wrap h1 {
		width: 100%;
		height: 50px;
		margin: 0;
		display: block;
		float: none;
		text-align: center;
	}
	#logo_wrap h1 a {
		width: 120px;
		height: 22px;
		background: url(../images/common/logo-mobile.png) no-repeat left top;
		background-size: 100%;
		display: inline-block;
		margin-top: 15px;
	}
	.headerMenu {
		position: static;
		right: auto;
		top: auto;
		border: 10px solid #ffc22f;
		border-top: none;
		display: block;
	}
	.headerMenu>li {
		width: 49%;
		margin-left: 2%;
		font-size: 12px;
		font-weight: bold;
		border-left: 1px solid rgba(255, 255, 255, 0.3);
		font-family: 'Nanum Gothic';
		letter-spacing: -1px;
	}
	.headerMenu>li.first {
		margin-left: 0;
		border-left: none;
	}
	.headerMenu li a {
		background: none;
		padding: 0 10px;
		height: auto;
		line-height: 28px;
		color: #194b82;
	}
	.headerMenu li:first-child a {
		background: none;
	}
	.headerMenu li a:before {
		top: 4px;
	}
	.headerMenu li a.menu01:before {
		content: url(../images/common/headerLink01-m.png);
	}
	.headerMenu li a.menu02:before {
		content: url(../images/common/headerLink02-m.png);
	}
	.top_search {
		margin: 0;
		width: 100%;
		height: 60px;
		border-width: 10px;
		background-color: #ffffff;
	}
	.top_search select {
		width: 80px;
		height: 30px;
		line-height: 30px;
	}
	.top_search input[type="text"] {
		width: calc(100% - 140px);
		height: 30px;
		line-height: 30px;
	}
	.top_search .t_search02 {
		height: 40px;
		line-height: 40px;
		background: url(../images/common/ico-search2.png) no-repeat center
			center;
	}
	.allMenu {
		width: 40px;
		height: 40px;
		background: url(../images/common/header-menu.png) no-repeat center
			center;
		background-size: 22px;
		display: block;
		text-indent: -9999px;
		position: absolute;
		left: 10px;
		top: 10px;
		cursor: pointer;
	}
	#gnb_wrap {
		position: absolute;
		left: 0;
		top: 0;
		background: none;
		width: 100%;
		height: 100%;
		display: none;
	}
	#gnb_wrap .snbBox {
		position: fixed;
		left: auto;
		top: auto;
		width: 240px;
		height: 50px !important;
		left: 0;
		top: 0;
		background: #194b82;
		color: #ffffff;
		font-size: 18px;
		font-weight: 500;
		z-index: 3;
		padding: 0 0 0 10px !important;
		line-height: 50px !important;
	}
	.allMenu_close {
		width: 16px;
		height: 16px;
		display: block;
		position: absolute;
		right: 17px;
		top: 17px;
		background: url(../images/common/ico-close.png) no-repeat center center;
		text-indent: -9999px;
		cursor: pointer;
		z-index: 5;
	}
	#gnb_wrap #gnb {
		width: 100%;
		height: 100%;
		position: fixed;
		right: 0;
		top: 0;
		background: rgba(0, 0, 0, 0.5); /* overflow-y:scroll;  */
	}
	#gnb_wrap #gnb::-webkit-scrollbar {
		width: 10px;
		height: 10px;
	}
	#gnb_wrap #gnb::-webkit-scrollbar-track {
		background: #ffffff;
	}
	#gnb_wrap #gnb::-webkit-scrollbar-thumb {
		background-color: #dcddde;
		border-radius: 20px;
	}
	#gnb_wrap #gnb {
		scrollbar-3dlight-color: #ffd700;
		scrollbar-arrow-color: #353f4b;
		scrollbar-base-color: #353f4b;
		scrollbar-darkshadow-color: #353f4b;
		scrollbar-face-color: #353f4b;
		scrollbar-highlight-color: #ffffff;
		scrollbar-shadow-color: #111920;
	}
	#gnb_wrap #gnb>ul {
		background: #ffffff;
		width: 240px;
		height: 100%;
		position: relative;
		margin-top: 50px;
	}
	#gnb_wrap #gnb>ul>li {
		float: none;
		height: auto;
		line-height: 120%;
		display: block;
		font-size: 16px;
	}
	#gnb_wrap #gnb>ul>li>a {
		color: #194b82;
		padding: 10px 10px 10px 20px;
		border-bottom: 1px solid #d6d6d5;
		background: url(../images/common/arrow1.png) no-repeat 10px center;
		background-size: 6px;
		height: auto;
		line-height: 140%;
	}
	#gnb_wrap #gnb>ul>li>a:hover {
		color: #000;
	}
	#gnb_wrap #gnb>ul>li.sitemap {
		display: none;
	}
	#gnb_wrap #gnb>ul>li:first-child>a {
		padding: 10px 10px 10px 20px;
		background: url(../images/common/arrow1.png) no-repeat 10px center;
		background-size: 6px;
	}
	#gnb_wrap #gnb>ul>li .submenu {
		position: relative;
		width: 100%;
		padding: 10px 10px 10px 20px;
		border-bottom: 1px solid #d6d6d5;
	}
	#gnb_wrap #gnb>ul>li:first-child .submenu {
		padding: 10px 10px 10px 20px
	}
	#gnb_wrap #gnb>ul>li .submenu>li {
		font-size: 14px;
		text-align: left;
	}
	#gnb_wrap #gnb>ul>li#naviMobile {
		display: block;
	}

	/* ��ϵ������� ������ CSS �߰� */
	#logo_wrap ul.animalInfoChange {
		display: none;
	}
	/* ��ϵ������� ������ CSS �߰� ��*/
}

/* VISUAL */
.visual_wrap {
	width: 100%;
	background-color: #d2d7ee;
	background-image: url(../images/sub/subVisual.jpg);
	background-repeat: no-repeat;
	background-position: center bottom;
}

.visual {
	width: 1200px;
	height: 140px;
	margin: 0 auto;
}

.visual:before, .visual:after {
	content: "";
	display: table;
}

.visual:after {
	clear: both;
}

.visual>dl {
	text-align: center;
	width: 600px;
	margin: 0 auto;
	padding-top: 20px;
}

.visual>dl>dt {
	font-size: 24px;
	font-weight: normal;
	color: #333132;
	padding-bottom: 10px;
	margin-bottom: 10px;
	background: url(../images/common/line3.jpg) no-repeat center bottom;
}

.visual>dl>dd {
	font-size: 14px;
	font-weight: 300;
	color: #58595b;
	font-family: 'Nanum Gothic';
	letter-spacing: -1px;
	line-height: 140%;
}

@media only screen and (max-width:768px) {
	.visual_wrap {
		background-size: cover;
	}
	.visual {
		width: 100%;
		height: 100px;
	}
	.visual>dl {
		width: 100%;
		padding: 20px;
	}
	.visual>dl>dd {
		display: none;
	}
}

/* FOOTER */
#footerMenu_wrap {
	width: 100%;
	background-color: #58595b;
}

#footerMenu {
	width: 1200px;
	height: 36px;
	margin: 0 auto;
	position: relative;
}

#footerMenu ul {
	text-align: center;
}

#footerMenu ul li {
	display: inline-block;
	font-size: 16px;
	font-weight: 300;
	color: #ffffff;
	margin: 0 10px;
	line-height: 34px;
}

#footerMenu ul li a:hover {
	text-decoration: underline;
}

#footer_wrap {
	width: 100%;
	border-top: 1px solid #d1d3d4;
}

#footer {
	width: 1200px;
	margin: 0 auto;
	position: relative;
	padding: 30px 0;
}

#footer h2 {
	position: absolute;
	left: 0;
	bottom: 30px;
}

#footer .info {
	margin-left: 220px;
}

#footer .info:before, #footer .info:after {
	content: "";
	display: table;
}

#footer .info:after {
	clear: both;
}

#footer .info li {
	font-size: 14px;
	font-weight: 300;
	color: #6d6e71;
	float: left;
	display: inline-block;
	margin-left: 10px;
	padding-left: 10px;
	border-left: 1px solid #e3e4e4;
}

#footer .info li:first-child {
	margin-left: 0;
	padding-left: 0;
	border-left: none;
}

#footer .copy {
	font-size: 14px;
	font-weight: 300;
	color: #6d6e71;
	margin-left: 220px;
}

#footer .wa {
	display: block;
	position: absolute;
	right: 0;
	top: 20px;
	width: 100px;
}

#footer .wa_image {
	width: 100px;
}

#footer .info .mobile_version {
	display: block;
	cursor: pointer;
}

#footer .info .pc_version {
	display: none;
}

#footer a.focus {
	display: block;
	position: absolute;
	width: 100px;
	right: 0;
	top: 20px;
}

#footer a.focus::before {
	box-shadow: 0px 0px 2px 3px;
}

@media only screen and (max-width:768px) {
	#footerMenu {
		display: none;
	}
	#footer_wrap {
		background-color: #4d4d4f;
	}
	#footer {
		width: 100%;
		text-align: center;
		padding: 20px 10px;
	}
	#footer h2 {
		display: none;
	}
	#footer .footerMenu {
		display: none;
	}
	#footer .info {
		margin: 0;
	}
	#footer .info li {
		float: none;
		color: #ffffff;
		padding-left: 0;
		margin-left: 0;
		border-left: none;
		font-size: 12px;
		line-height: 120%;
		display: block;
		margin-bottom: 6px;
	}
	#footer .wa {
		position: relative;
		right: auto;
		top: auto;
		margin-top: 20px;
		display: inline-block;
		background-color: #fff;
		padding: 6px;
		border-radius: 10px;
	}
	#footer .wa img {
		width: 70px;
		height: 50px;
	}
	#footer .copy {
		font-size: 12px;
		color: #bcbec0;
		margin: 0;
		line-height: 120%;
		margin-top: 10px;
	}
	#footer .copy {
		font-size: 12px;
		color: #bcbec0;
		margin: 0;
		line-height: 120%;
		margin-top: 10px;
	}
	#footer .info .pc_version {
		display: block;
		cursor: pointer;
	}
	#footer .info .mobile_version {
		display: none;
	}
	#footer a.focus {
		display: contents;
		position: absolute;
		width: 100px;
		right: 0;
		top: 20px;
	}
}

/* SUB */
#contents {
	width: 1200px;
	min-height: 400px;
	margin: 0 auto;
	position: relative;
	padding-bottom: 60px;
}

#contents:before, #contents:after {
	content: "";
	display: table;
}

#contents:after {
	clear: both;
}

#sidebar {
	width: 260px;
	float: left;
	margin: -40px 60px 0 0;
}

#sidebar h2 {
	text-align: center;
	font-size: 22px;
	font-weight: normal;
	color: #ffffff;
	background-color: #1d8cd3;
	padding: 30px 10px;
	margin-bottom: 10px;
}

#sidebar ul {
	display: block;
	border: 2px solid #000000;
	border-left: none;
	border-right: none;
}

#sidebar ul li {
	font-size: 16px;
	font-weight: 300;
	border-bottom: 1px solid #d1d3d4;
}

#sidebar ul li a {
	display: block;
	color: #333333;
	height: 40px;
	line-height: 40px;
	padding: 0 20px;
	letter-spacing: -1px;
}

#sidebar ul li a:hover {
	color: #333132;
	font-weight: normal;
	background-image: url(../images/common/sidebar-current.jpg);
	background-repeat: no-repeat;
	background-position: right 20px center;
}

#sidebar ul li a.current {
	color: #333132;
	font-weight: normal;
	background-image: url(../images/common/sidebar-current.jpg);
	background-repeat: no-repeat;
	background-position: right 20px center;
}

#sidebar ul li a:focus {
	color: #333132;
	font-weight: normal;
	background-image: url(../images/common/sidebar-current.jpg);
	background-repeat: no-repeat;
	background-position: right 20px center;
}

#content {
	overflow: hidden;
}

@media only screen and (max-width:768px) {
	#contents {
		width: 100%;
		min-height: auto;
	}
	#content {
		padding: 0 10px;
	}
	#sidebar {
		display: none;
	}
}

/* TEXT ALIGN */
.txt_c {
	text-align: center !important;
}

.txt_r {
	text-align: right !important;
}

.txt_l {
	text-align: left !important;
}

/* COLOR */
.red {
	color: #C23E3E !important;
}

.black {
	color: #000000 !Important;
}

.green {
	color: #45a748 !important;
}

.requied {
	color: #d74f4f !important;
}

.deactivation {
	background-color: #f1f2f2;
}

/* FONT WEIGHT */
.light {
	font-weight: 300 !important;
}

.regular {
	font-weight: normal !Important;
}

.medium {
	font-weight: 500 !important;
}

.bold {
	font-weight: bold !important;
}

/* FONT SIZE */
.fs16 {
	font-size: 16px !important;
}

.fs18 {
	font-size: 18px !important;
}

/* MARGIN */
.mb6 {
	margin-bottom: 6px !important;
}

.mb10 {
	margin-bottom: 10px !important;
}

.mb20 {
	margin-bottom: 20px !important;
}

.mb30 {
	margin-bottom: 30px !important;
}

.mb40 {
	margin-bottom: 40px !important;
}

.mb60 {
	margin-bottom: 60px !important;
}

.mb80 {
	margin-bottom: 80px !important;
}

.mt4 {
	margin-top: 4px;
}

.mt10 {
	margin-top: 10px !important;
}

.mt20 {
	margin-top: 20px !important;
}

.mt50 {
	margin-top: 50px !important;
}

.mt60 {
	margin-top: 60px !important;
}

.ml10 {
	margin-left: 10px !important;
}

.ml20 {
	margin-left: 20px !important;
}

.mr10 {
	margin-right: 10px !important;
}

/* PADDING */
.pl20 {
	padding-left: 20px !important;
}

.pl30 {
	padding-left: 30px !important;
}

hr {
	border: none;
	border-top: 1px dashed #d1d3d4;
	margin: 40px 0;
}

/* WIDTH */
.w100p {
	width: 100% !important;
}

.w40 {
	width: 40px !important;
}

.w60 {
	width: 60px !important;
}

.w80 {
	width: 80px !important;
}

.w100 {
	width: 100px !important;
}

.w200 {
	width: 200px !important;
}

.w300 {
	width: 300px !important;
}

.w400 {
	width: 400px !important;
}

.w500 {
	width: 500px !important;
}

.w600 {
	width: 600px !important;
}

@media only screen and (max-width:768px) {
	.mb40 {
		margin-bottom: 4% !important;
	}
	.mb60 {
		margin-bottom: 6% !important;
	}
	.mb80 {
		margin-bottom: 8% !important;
	}
	.w100p {
		width: 100% !important;
	}
	.respon_w160 {
		width: 160px !important;
	}
}

/* POPUP */
.popup_wrap {
	background-color: #e7e8e9;
	padding: 10px;
}

.popupBox {
	border-radius: 10px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1), -1px -1px 3px
		rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
	padding: 20px;
}

.grTit {
	font-size: 16px;
	font-weight: 500;
	color: #45A748;
	margin-bottom: 10px;
}

.idSearch {
	border: 1px solid #e6e7e8;
	border-top: 2px solid #5bbc5e;
	padding: 20px;
}

.idSearch dl {
	position: relative;
	display: inline-block;
}

.idSearch dl dt {
	font-size: 14px;
	font-weight: normal;
	color: #000000;
	width: 80px;
	position: absolute;
	left: 0;
	top: 0;
}

.idSearch dl dd {
	margin-left: 80px;
}

/* ���۱���å */
#policy_bg {
	background-color: #b4d9f0;
	padding: 10px;
	position: relative;
}

#policy_bg:before {
	content: "";
	width: 42px;
	height: 36px;
	background: url(../images/common/policy_bg.png) no-repeat left top;
	position: absolute;
	right: 0;
	top: 0;
	z-index: 10;
}

#policy_box {
	background-color: #ffffff;
	box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.1), -1px -1px 10px
		rgba(0, 0, 0, 0.1);
	padding: 30px;
}

.policy_title {
	font-size: 28px;
	font-weight: bold;
	color: #194b82;
	position: relative;
	margin-bottom: 30px;
}

.policy_title:before {
	content: "������ȣ�����ý���";
	color: #ffffff;
	background-color: #194b82;
	display: block;
	font-weight: normal;
	width: 130px;
	height: 20px;
	text-align: center;
	font-size: 14px;
	margin-bottom: 10px;
}

.policy_title:after {
	content: "";
	width: 100%;
	height: 1px;
	background-color: #194b82;
	position: absolute;
	left: 0;
	top: 20px;
}

.policy_con {
	line-height: 140%;
	font-size: 14px;
	color: #58595b;
	font-family: 'Nanum Gothic', sans-serif;
}

.policy_con p {
	margin-bottom: 10px;
}

.policy_con hr {
	margin: 30px 0;
}

.policy_con strong {
	color: #194b82;
}

.policy_con .num1 {
	margin-bottom: 20px;
}

.policy_con .num1>li {
	font-weight: normal;
	margin-bottom: 10px;
}

.policy_con .num2 {
	padding-left: 14px;
}

.policy_con .num2>li {
	margin-bottom: 6px;
}

.policy_con a {
	color: #194b82;
}

.policy_con a:hover {
	text-decoration: underline;
}

.policy_con .con_title {
	font-size: 15px;
	font-weight: bold;
	color: #000000;
	margin-bottom: 10px;
}

.policy_close {
	background-color: #194b82;
	height: 40px;
	line-height: 40px;
	text-align: right;
	padding: 0 20px;
}

.policy_close .close_btn {
	font-size: 14px;
	font-weight: normal;
	color: #ffffff;
	padding-left: 18px;
	background: url(../images/common/close.png) no-repeat left center;
	display: inline-block;
}

.policy_close .close_btn:hover {
	text-decoration: underline;
}

@media only screen and (max-width:767px) {
	#policy_box {
		padding: 15px;
	}
	.policy_con {
		font-size: 12px;
	}
}

@media only screen and (max-width:500px) {
	.policy_tbl {
		overflow-x: scroll;
	}
	.policy_tbl:before {
		content: "������ ���÷��� �������� �巡���ϼ���.";
		font-size: 12px;
		font-family: 'Nanum Gothic';
		margin-bottom: 6px;
		display: block;
	}
	.boardDetail1 {
		overflow-x: scroll;
	}
	.boardDetail1:before {
		content: "������ ���÷��� �������� �巡���ϼ���.";
		font-size: 12px;
		font-family: 'Nanum Gothic';
		margin-bottom: 6px;
		display: block;
	}
}

/* 19.03.08 �߰� */
.subTopTxt {
	background-color: #f8f8f8;
	padding: 20px;
	box-shadow: inset 1px 1px 3px rgba(0, 0, 0, 0.1), inset -1px -1px 3px
		rgba(0, 0, 0, 0.1);
	overflow: hidden;
	color: #58595b;
	letter-spacing: -1px;
}

.subTopTxt p {
	font-family: 'Nanum Gothic';
	font-size: 14px;
	line-height: 160%;
}

@media only screen and (max-width:767px) {
	.subTopTxt p {
		font-size: 12px;
	}
}

/* ���������� */
.errorWrap {
	width: 100%;
	height: 100vh;
	min-width: 800px;
	min-height: 600px;
	background-color: #f2f2f3;
	text-align: center;
	position: relative;
}

.error_img {
	width: 560px;
	height: 560px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -280px 0 0 -280px;
}

.error_img dl {
	padding-top: 300px;
	background: url(../images/common/error_img.png) no-repeat center top;
	margin-bottom: 80px;
}

.error_img dl dt {
	font-size: 30px;
	font-weight: normal;
	color: #000000;
	margin-bottom: 20px;
	line-height: 100%;
}

.error_img dl dd {
	font-size: 18px;
	font-weight: 300;
	color: #58595b;
}

.error_img a {
	display: inline-block;
	height: 58px;
	line-height: 58px;
	padding: 0 40px;
	font-size: 16px;
	font-weight: normal;
	color: #ffffff;
	background-color: #194b82;
	border-radius: 3px;
}

.error_img a:after {
	width: 6px;
	height: 10px;
	display: inline-block;
	content: "";
	background: url(../images/sub/arrow5.png) no-repeat left top;
	vertical-align: middle;
	margin: -2px 0 0 20px;
}

/* ��������� ���̾� �˾� CSS �߰� */
.layer {
	position: fixed;
	left: 0;
	top: 0;
	margin: 0;
	width: 100%;
	height: 100%;
	z-index: 9999999;
	background: rgba(0, 0, 0, 0.5);
	display: none;
}

.layer .layerPopup {
	position: fixed;
	width: 600px; /*left: 55%;*/ /*margin-left: -20%;*/
	height: auto;
	top: 50%; /*margin-top: -150px;*/
	overflow: auto;
	border: 1px solid #000;
	background-color: #ffffff;
	padding: 1em;
	box-sizing: border-box;
	display: none;
}

.layer .layerPopup .layerTitle {
	width: 100%;
	height: 40px;
	line-height: 40px;
	border-bottom-style: ridge;
}

.layer .layerPopup .layerContent {
	padding: 10px;
}

.layer .layerPopup .layerContent p {
	padding-bottom: 10px;
}

.layer .layerPopup .layerBottom input[type="button"] {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding: 0 30px;
	height: 40px;
	line-height: 40px;
	background-color: #ffffff;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 5px;
}

@media only screen and (max-width:768px) {
	.layer {
		position: fixed;
		left: 0;
		top: 0;
		margin: 0;
		width: 100%;
		height: 100%;
		z-index: 9999999;
		background: rgba(0, 0, 0, 0.5);
		display: none;
	}
	.layer .layerPopup {
		position: fixed;
		width: 380px; /*left: 33%;*/ /*margin-left: -20%;*/
		height: auto;
		top: 50%; /*margin-top: -150px;*/
		overflow: auto;
		border: 1px solid #000;
		background-color: #ffffff;
		padding: 1em;
		box-sizing: border-box;
		display: none;
	}
	.layer .layerPopup .layerTitle {
		width: 100%;
		height: 40px;
		line-height: 40px;
		border-bottom-style: ridge;
		font-size: 10px;
	}
	.layer .layerPopup .layerContent {
		padding: 10px;
		font-size: 10px;
	}
	.layer .layerPopup .layerContent p {
		padding-bottom: 10px;
	}
	.layer .layerPopup .layerBottom input[type="button"] {
		font-size: 10px;
		font-weight: bold;
		text-align: center;
		padding: 0 10px;
		height: 30px;
		line-height: 30px;
		background-color: #ffffff;
		border-radius: 5px;
		cursor: pointer;
		margin-top: 5px;
	}
}
/* ��������� ���̾� �˾� CSS �߰� �� */
@charset "utf-8";
/* CSS Document */

/* NOTO SANS */
@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 100;
	src: local('Noto Sans KR Thin'), local('NotoSans-Thin'),
		url(font/NotoSans-Thin.woff) format('woff'),
		url(font/NotoSans-Thin.eot), url(font/NotoSans-Thin.eot?#iefix)
		format('embedded-opentype'), url(font/NotoSans-Thin.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 300;
	src: local('Noto Sans KR Light'), local('NotoSans-Light'),
		url(font/NotoSans-Light.woff) format('woff'),
		url(font/NotoSans-Light.eot), url(font/NotoSans-Light#iefix)
		format('embedded-opentype'), url(font/NotoSans-Light.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 400;
	src: local('Noto Sans KR  Regular'), local('NotoSans-Regular'),
		url(font/NotoSans-Regular.woff) format('woff'),
		url(font/NotoSans-Regular.eot), url(font/NotoSans-Regular.eot?#iefix)
		format('embedded-opentype'), url(font/NotoSans-Regular.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 500;
	src: local('Noto Sans KR Medium'), local('NotoSans-Medium'),
		url(font/NotoSans-Medium.woff) format('woff'),
		url(font/NotoSans-Medium.eot), url(font/NotoSans-Medium.eot?#iefix)
		format('embedded-opentype'), url(font/NotoSans-Medium.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 700;
	src: local('Noto Sans KR Bold'), local('NotoSans-Bold'),
		url(font/NotoSans-Bold.woff) format('woff'),
		url(font/NotoSans-Bold.eot), url(font/NotoSans-Bold.eot?#iefix)
		format('embedded-opentype'), url(font/NotoSans-Bold.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 900;
	src: local('Noto Sans KR Black'), local('NotoSans-Black'),
		url(font/NotoSans-Black.woff) format('woff'),
		url(font/NotoSans-Black.eot), url(font/NotoSans-Black.eot?#iefix)
		format('embedded-opentype'), url(font/NotoSans-Black.otf)
		format('opentype');
}

/* NANUM SQUARE */
@font-face {
	font-family: 'NanumSquare';
	font-style: normal;
	font-weight: 300;
	src: local('NanumSquareL'), local('NanumSquareL'),
		url(font/NanumSquareL.woff) format('woff'), url(font/NanumSquareL.eot),
		url(font/NanumSquareL.eot?#iefix) format('embedded-opentype'),
		url(font/NanumSquareL.ttf) format('opentype');
}

@font-face {
	font-family: 'NanumSquare';
	font-style: normal;
	font-weight: 400;
	src: local('NanumSquareR'), local('NanumSquareR'),
		url(font/NanumSquareR.woff) format('woff'), url(font/NanumSquareR.eot),
		url(font/NanumSquareR.eot?#iefix) format('embedded-opentype'),
		url(font/NanumSquareR.ttf) format('opentype');
}

@font-face {
	font-family: 'NanumSquare';
	font-style: normal;
	font-weight: 700;
	src: local('NanumSquareB'), local('NanumSquareB'),
		url(font/NanumSquareB.woff) format('woff'), url(font/NanumSquareB.eot),
		url(font/NanumSquareB.eot?#iefix) format('embedded-opentype'),
		url(font/NanumSquareB.ttf) format('opentype');
}

@font-face {
	font-family: 'NanumSquare';
	font-style: normal;
	font-weight: 900;
	src: local('NanumSquareEB'), local('NanumSquareEB'),
		url(font/NanumSquareEB.woff) format('woff'),
		url(font/NanumSquareEB.eot), url(font/NanumSquareEB.eot?#iefix)
		format('embedded-opentype'), url(font/NanumSquareEB.ttf)
		format('opentype');
}

/* NANUM GOTHIC */
@font-face {
	font-family: 'Nanum Gothic';
	font-style: normal;
	font-weight: 400;
	src: local('NanumGothic'), local('NanumGothic'),
		url(font/NanumGothic.woff) format('woff'), url(font/NanumGothic.eot),
		url(font/NanumGothic.eot?#iefix) format('embedded-opentype'),
		url(font/NanumGothic.ttf) format('opentype');
}

@font-face {
	font-family: 'Nanum Gothic';
	font-style: normal;
	font-weight: 700;
	src: local('NanumGothicBold'), local('NanumGothicBold'),
		url(font/NanumGothicBold.woff) format('woff'),
		url(font/NanumGothicBold.eot), url(font/NanumGothicBold.eot?#iefix)
		format('embedded-opentype'), url(font/NanumGothicBold.ttf)
		format('opentype');
}

@font-face {
	font-family: 'Nanum Gothic';
	font-style: normal;
	font-weight: 900;
	src: local('NanumGothicExtraBold'), local('NanumGothicExtraBold'),
		url(font/NanumGothicExtraBold.woff) format('woff'),
		url(font/NanumGothicExtraBold.eot),
		url(font/NanumGothicExtraBold.eot?#iefix) format('embedded-opentype'),
		url(font/NanumGothicExtraBold.ttf) format('opentype');
}

@charset "utf-8";

.sub_tit {
	margin: 30px 0;
	border-bottom: 1px solid #d1d3d4;
	padding-bottom: 10px;
	position: relative;
}

.sub_tit:before, .sub_tit:after {
	content: "";
	display: table;
}

.sub_tit:after {
	clear: both;
}

.sub_tit h3 {
	font-size: 28px;
	font-weight: 500;
	color: #000000;
	float: left;
	display: inline-block;
}

.sub_tit .breadcrumb {
	float: right;
	display: inline-block;
	position: absolute;
	right: 0;
	bottom: 15px;
}

.sub_tit .breadcrumb li {
	font-size: 12px;
	font-weight: 300;
	color: #6D6E71;
	float: left;
	display: inline-block;
	font-family: 'Nanum Gothic', sans-serif;
}

.sub_tit .breadcrumb li:before {
	content: ">";
	display: inline-block;
	margin: 0 6px;
	font-family: "����", sans-serif;
}

.sub_tit .breadcrumb li:first-child:before {
	content: "";
	margin: 0;
}

.sub_tit .breadcrumb li.current {
	color: #194b82;
}

.sub_con {
	font-size: 14px;
	font-weight: 300;
	color: #58595b;
	letter-spacing: -1px;
	line-height: 160%;
	padding-bottom: 40px;
}

#sub_con:before, #sub_con:after {
	content: "";
	display: table;
}

#sub_con:after {
	clear: both;
}

.con_txt {
	font-family: 'Nanum Gothic';
}

.note-txt {
	margin-bottom: 40px;
	font-size: 16px;
	color: #000000;
	font-family: 'Noto Sans KR';
}

.note-txt ul li {
	padding-left: 20px;
	background: url(../images/sub/note-txt.jpg) no-repeat left 4px;
	line-height: 120%;
	margin-bottom: 6px;
}

@media only screen and (max-width:767px) {
	.note-txt {
		font-size: 14px;
	}
	.note-txt ul li {
		background-size: 10px;
		padding-left: 14px;
	}
}

/*
.bbs_search{    width:100% !important; float:none !important; height:auto !important; min-height:40px; padding-top:10px;    }   
.bbs_search #searchList{    float:left; display:inline-block; }
.bbs_search #searchList ul li{  float:left; display:inline-block;   }
.bbs_search #searchList ul li input[type="text"]{   height:22px; line-height:22px; border:1px solid #d1d3d4; }
.bbs_search #rowPerList{    float:right; display:inline-block;   }
.bbs_search #rowPerList .page_no{   overflow:hidden;    }
.bbs_search #rowPerList .page_no li{    float:left; display:inline-block;   }
.bbs_search #rowPerList .page_no li select{ height:22px; border:1px solid #d1d3d4;  }
#subcon_printarea .print{   text-align:right;   }
#searchList{    font-family:'Nanum Gothic';   }
*/
.bbs_search .searchArea:before {
	background: url(../images/sub/searchArea.png) no-repeat center 10px;
}

.bbs_search .searchArea.search1:after {
	margin-top: 14px;
}

@media only screen and (max-width:440px) {
	#searchList input, #searchList select, #searchList a {
		margin-bottom: 6px;
		vertical-align: middle;
	}
	#searchList .w200 {
		width: 100px !important;
	}
	#searchList .w300 {
		width: 100px !important;
	}
}

#bd1 {
	width: 100% !important;
}

#bd1_1 {
	width: 100% !important;
}

.bd1_read {
	width: 100% !important;
}

.bbs {
	width: 100% !important;
}

.bd1_listbtn {
	width: 100% !important;
}

@media only screen and (max-width:768px) {
	.bd1_read {
		width: auto !important;
		margin: 0 15px;
	}
}

.grayBox {
	background-color: #6d6e71;
	font-size: 14px;
	font-weight: 300;
	color: #ffffff;
	display: inline-block;
	padding: 4px 20px;
}

.grayBox2 {
	background-color: #f1f2f2;
	border-radius: 10px;
	padding: 10px;
	font-size: 12px;
	border: 1px solid #e6e7e8;
}

.blue_tit {
	font-size: 16px;
	font-weight: bold;
	color: #328ac3;
	margin-bottom: 10px;
}

.blue_t {
	font-size: 15px;
	font-weight: bold;
	color: #151515;
	margin-bottom: 10px;
}

.arr_blue {
	text-align: left;
}

.arr_blue>li {
	font-size: 14px;
	font-weight: normal;
	color: #58595b;
	padding-left: 8px;
	background: url(../images/sub/arrow3.png) no-repeat left 6px;
	margin-bottom: 10px;
	line-height: 140%;
	font-family: 'Nanum Gothic', sans-serif;
}

.arr_blue>li a {
	display: inline-block;
}

.arr_blue>li a:hover {
	text-decoration: underline;
}

@media only screen and (max-width:767px) {
	.arr_blue li {
		font-size: 12px;
	}
}

.tbl01 {
	width: 100%;
}

.tbl01 thead tr th {
	background-color: #eef4f7;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: 'Nanum Gothic', sans-serif;
}

.tbl01 tbody tr th {
	font-size: 12px;
	font-weight: normal;
	color: #000000;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: 'Nanum Gothic', sans-serif;
}

.tbl01 tbody tr td {
	font-size: 12px;
	font-weight: normal;
	color: #6d6e71;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: 'Nanum Gothic', sans-serif;
}

.tbl02 {
	width: 100%;
}

.tbl02 thead tr th {
	background-color: #eef4f7;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: 'Nanum Gothic', sans-serif;
}

.tbl02 tbody tr th {
	font-size: 12px;
	font-weight: normal;
	color: #000000;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: 'Nanum Gothic', sans-serif;
}

.tbl02 tbody tr td {
	font-size: 12px;
	font-weight: normal;
	color: #6d6e71;
	text-align: left;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: 'Nanum Gothic', sans-serif;
}

.tbl03 {
	width: 100%;
}

.tbl03 tbody tr th {
	background-color: #eef4f7;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: 'Nanum Gothic', sans-serif;
}

.tbl03 tbody tr td {
	font-size: 12px;
	font-weight: normal;
	color: #6d6e71;
	text-align: left;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: 'Nanum Gothic', sans-serif;
}

.arr_step4:before, .arr_step4:after {
	content: "";
	display: table;
}

.arr_step4:after {
	clear: both;
}

.arr_step4>li {
	float: left;
	display: inline-block;
	margin-left: 40px;
	width: 190px;
	position: relative;
}

.arr_step4>li:first-child {
	margin-left: 0;
}

.arr_step4>li:before {
	width: 14px;
	height: 20px;
	content: "";
	display: block;
	background: url(../images/sub/arrow4.png) no-repeat left top;
	position: absolute;
	left: -26px;
	top: 50%;
}

.arr_step4>li:first-child:before {
	width: 0;
	height: 0;
	background: none;
}

.arr_step5:before, .arr_step5:after {
	content: "";
	display: table;
}

.arr_step5:after {
	clear: both;
}

.arr_step5>li {
	float: left;
	display: inline-block;
	margin-left: 40px;
	width: 144px;
	position: relative;
}

.arr_step5>li:first-child {
	margin-left: 0;
}

.arr_step5>li:before {
	width: 14px;
	height: 20px;
	content: "";
	display: block;
	background: url(../images/sub/arrow4.png) no-repeat left top;
	position: absolute;
	left: -26px;
	top: 34px;
}

.arr_step5>li:first-child:before {
	width: 0;
	height: 0;
	background: none;
}

.arr_step5.arr_cert>li:before {
	top: 50%;
}

.download {
	font-size: 11px;
	font-weight: normal;
	color: #C23E3E;
	font-family: '����';
	padding-left: 16px;
	background: url(../images/sub/ico-file.png) no-repeat left top;
	display: inline-block;
	line-height: 100%;
	min-height: 14px;
	vertical-align: middle;
}

.download:hover {
	text-decoration: underline;
}

.dotted_list>li {
	font-size: 14px;
	font-weight: normal;
	color: #58595b;
	padding-left: 8px;
	background: url(../images/sub/dotted1.png) no-repeat left 6px;
	line-height: 120%;
	margin-bottom: 8px;
}

.col_wrap:before, .col_wrap:after {
	content: "";
	display: table;
}

.col_wrap:after {
	clear: both;
}

.col2 {
	float: left;
	display: inline-block;
	width: 420px;
	margin-left: 40px;
}

.col2.first {
	margin-left: 0;
}

.img_explan {
	overflow: hidden;
	background-color: #f1f2f2;
	border: 1px solid #d1d3d4;
	border-radius: 10px;
	padding: 10px 20px;
}

.img_explan>img {
	float: left;
	display: inline-block;
	margin-right: 30px;
}

.img_explan>dl {
	overflow: hidden;
	display: block;
	margin-top: 30px;
}

.img_explan>dl>dd {
	font-size: 14px;
}

.animal_wrap {
	display: flex;
}

.animal_wrap:before, .animal_wrap:after {
	content: "";
	display: table;
}

.animal_wrap:after {
	clear: both;
}

.animal_registration {
	width: 280px;
	margin-left: 20px;
	float: left;
	display: inline-block;
	border: 1px solid #d1d3d4;
	border-radius: 10px;
	position: relative;
	padding: 20px;
}

.animal_registration:first-child {
	margin-left: 0;
}

.animal_registration h4 {
	font-size: 16px;
	font-weight: 500;
	color: #ffffff;
	background-color: #194b82;
	display: inline-block;
	padding: 4px 20px;
	line-height: 120%;
	position: absolute;
	left: 10px;
	top: 0;
}

.animal_registration dl {
	text-align: center;
	padding-top: 160px;
	background-repeat: no-repeat;
	background-position: center top;
}

.animal_registration dl dt {
	font-size: 14px;
	font-weight: 500;
	color: #000000;
}

.animal_registration dl dd {
	font-size: 12px;
	font-weight: 300;
	color: #58595b;
}

.animal_registration dl.animal1 {
	background-image: url(../images/sub/sub02_01_img3-1.png);
}

.animal_registration dl.animal2 {
	background-image: url(../images/sub/sub02_01_img3-2.png);
}

.animal_registration dl.animal3 {
	background-image: url(../images/sub/sub02_01_img3-3.png);
}

.tnr_info>dl {
	margin-bottom: 10px;
}

.tnr_info>dl:before, .tnr_info>dl:after {
	content: "";
	display: table;
}

.tnr_info>dl:after {
	clear: both;
}

.tnr_info>dl>dt {
	font-size: 14px;
	font-weight: 500;
	color: #328ac3;
	display: inline-block;
	float: left;
	width: 180px;
	background-color: #f1f2f2;
	margin-right: 10px;
	padding: 4px 10px;
}

.tnr_info>dl>dd {
	font-size: 14px;
	font-weight: 300;
	color: #58595b;
	overflow: hidden;
	font-family: 'Nanum Gothic';
}

.tnr_info>dl>dd>ol>li>ol {
	padding-left: 14px;
}

.tnr_info>dl a {
	color: #194b82;
}

.tnr_info>dl a:hover {
	text-decoration: underline;
}

@media only screen and (max-width:768px) {
	.sub_tit {
		margin: 10px 0;
	}
	.sub_tit h3 {
		font-size: 20px;
	}
	.sub_tit .breadcrumb {
		right: 10px;
	}
	.sub_con {
		font-size: 12px;
	}
	hr {
		margin: 6% 0;
	}
}

@media only screen and (max-width:420px) {
	.sub_tit h3 {
		float: none;
		display: block;
		margin-bottom: 4px;
	}
	.sub_tit .breadcrumb {
		float: none;
		display: block;
		position: static;
		right: auto;
		bottom: auto;
	}
}

.gr_explan dt {
	font-size: 20px;
	font-weight: 500;
	color: #359838;
	margin-bottom: 10px;
}

.gr_explan dd {
	font-size: 16px;
	font-weight: 300;
	color: #58595b;
	margin-bottom: 16px;
	line-height: 140%;
}

@media only screen and (max-width:768px) {
	.gr_explan dt {
		font-size: 16px;
	}
	.gr_explan dd {
		font-size: 12px;
	}
	.arr_step4 {
		
	}
	.arr_step4>li {
		width: 46%;
		margin-left: 4%;
		margin-bottom: 20px;
		text-align: center;
	}
	.arr_step4>li:nth-child(2n+1) {
		margin-left: 0;
	}
	.arr_step5>li {
		width: 30%;
		margin-left: 3%;
		margin-bottom: 20px;
	}
	.arr_step5>li:before {
		left: -40px;
	}
	.arr_step5>li:nth-child(3n+1) {
		margin-left: 0;
	}
	.tnr_info>dl {
		margin-bottom: 20px;
	}
	.tnr_info>dl>dt {
		float: none;
		margin-bottom: 4px;
	}
	.tnr_info>dl>dd {
		padding-left: 10px;
	}
	.col2 {
		width: 100%;
		margin: 0 0 20px 0;
	}
}

@media only screen and (max-width:520px) {
	.arr_step4>li>img {
		width: 100%;
	}
	.arr_step4>li:before {
		left: -15px;
	}
	.arr_step4>li:nth-child(2n+1):before {
		background: none;
	}
	.arr_step5>li {
		width: 50%;
		text-align: center;
		margin: 0 0 20px 0;
	}
	.arr_step5>li:before {
		left: 0;
	}
	.arr_step5>li>img {
		display: inline-block;
	}
	.arr_step5>li>ul {
		overflow: hidden;
		margin-top: 10px;
	}
	.arr_step5>li>ul>li {
		font-size: 12px;
		margin-bottom: 4px;
	}
	.arr_step5 .dotted_list li {
		background: none;
	}
	.dog-growth>li {
		width: 100%;
		text-align: left;
		overflow: hidden;
	}
	.dog-growth>li>img {
		float: left;
		display: inline-block;
		margin-right: 20px;
	}
	.dog-growth>li>ul {
		overflow: hidden;
	}
	.arr_step5.txt_c>li {
		width: 18%;
		margin-left: 2%;
	}
	.arr_step5.txt_c>li>img {
		width: 100%;
	}
	.arr_step5.txt_c>li>p {
		font-size: 12px !important;
	}
	.arr_step5.txt_c>li:before {
		width: 8px;
		height: 12px;
		background-size: 100%;
		top: 14px;
		left: -8px;
	}
	.img_explan {
		text-align: center;
	}
	.img_explan>img {
		float: none;
	}
	.img_explan>dl {
		margin-top: 10px;
	}
	.animal_wrap {
		display: block;
	}
	.animal_registration {
		width: 100%;
		float: none;
		margin: 0 0 20px 0;
	}
}

/* BOARD */
.searchArea {
	border: 1px solid #d1d3d4;
	border-radius: 5px;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1), -1px -1px 5px
		rgba(0, 0, 0, 0.1);
	padding: 20px 30px 20px 180px;
	position: relative;
}

.searchArea:before {
	content: "";
	display: block;
	width: 150px;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	background: url(../images/sub/searchArea.png) no-repeat center center;
	border-right: 1px solid #d1d3d4;
	box-sizing: border-box;
}

.searchArea:after {
	content: "SEARCH";
	font-size: 16px;
	text-align: center;
	color: #000000;
	font-weight: 500;
	display: block;
	position: absolute;
	left: 0;
	top: 50%;
	width: 150px;
	height: 100%;
	margin-top: 40px;
	font-family: 'Noto Sans KR', sans-serif;
}

.searchArea .search_ex {
	font-size: 14px;
	font-weight: normal;
	color: #194b82;
	margin-bottom: 20px;
}

.searchArea .searchList>li {
	display: block;
	margin: 6px 0;
	overflow: hidden;
}

.searchArea .searchList>li dl {
	display: block;
	float: left;
	margin-left: 20px;
}

.searchArea .searchList>li dl:first-child {
	margin-left: 0;
}

.searchArea .searchList>li dl dt {
	font-size: 14px;
	font-weight: normal;
	color: #58595b;
	text-align: left;
	display: inline-block;
	margin-right: 10px;
}

.searchArea .searchList>li dl dd {
	display: inline-block;
	font-family: '����', sans-serif;
	font-size: 12px;
	font-weight: normal;
}

.searchArea.search1:before {
	background-size: 40px;
}

.searchArea.search1:after {
	margin-top: 20px;
}

.searchArea.search2:before {
	background-size: 60px;
}

.searchArea.search2:after {
	margin-top: 30px;
}

@media only screen and (max-width:767px) {
	.searchArea .search_ex {
		font-size: 12px;
	}
}

.inputDate {
	background-image: url(../images/common/ico-file.png);
	background-repeat: no-repeat;
	background-position: right 6px center;
	padding-right: 20px;
}

.arrowBtn {
	font-size: 11px;
	border: 1px solid #bcbec0;
	color: #6D6E71;
	border-radius: 3px;
	height: 24px;
	line-height: 24px;
	padding: 0 30px 0 10px;
	display: inline-block;
	background-image: url(../images/common/arrow2.png);
	background-repeat: no-repeat;
	background-position: right 10px center;
}

.arrowBtn:hover {
	border-color: #939598;
}

.searchBtn {
	font-size: 11px;
	font-weight: bold;
	font-family: '����', sans-serif;
	color: #ffffff;
	background-color: #194b82;
	border-radius: 3px;
	display: inline-block;
	padding: 0 20px;
	height: 24px;
	line-height: 24px;
}

.searchBtn:active {
	background-color: #113c6a;
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.5), inset -1px -1px 4px
		rgba(0, 0, 0, 0.5);
}

#search_button:before {
	content: "";
	width: 10px;
	height: 10px;
	display: inline-block;
	background: url(../images/sub/ico-search.png) no-repeat left top;
	margin-right: 4px;
	vertical-align: middle;
	margin-bottom: 2px;
}

.selectBtn {
	font-size: 11px;
	font-weight: bold;
	font-family: '����', sans-serif;
	color: #ffffff;
	background-color: #58595b;
	border-radius: 3px;
	display: inline-block;
	padding: 0 20px;
	height: 24px;
	line-height: 24px;
}

.selectBtn:active {
	background-color: #113c6a;
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.5), inset -1px -1px 4px
		rgba(0, 0, 0, 0.5);
}

.searchBtnIn {
	font-size: 11px;
	font-weight: bold;
	font-family: '����', sans-serif;
	color: #ffffff;
	background-color: #194b82;
	border-radius: 3px;
	display: inline-block;
	padding: 0 20px;
	height: 24px;
	line-height: 24px;
}

.searchBtnIn:active {
	background-color: #113c6a;
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.5), inset -1px -1px 4px
		rgba(0, 0, 0, 0.5);
}

.searchBtnIn:before {
	content: "";
	width: 10px;
	height: 10px;
	display: inline-block;
	background: url(../images/sub/ico-search.png) no-repeat left top;
	margin-right: 4px;
	vertical-align: middle;
	margin-bottom: 2px;
}

.modifyBtn {
	font-size: 11px;
	font-weight: bold;
	font-family: '����', sans-serif;
	color: #ffffff;
	background-color: #194b82;
	border-radius: 3px;
	display: inline-block;
	padding: 0 20px;
	height: 24px;
	line-height: 24px;
}

.modifyBtn:active {
	background-color: #113c6a;
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.5), inset -1px -1px 4px
		rgba(0, 0, 0, 0.5);
}

.priceBtn {
	font-size: 11px;
	border-radius: 3px;
	display: inline-block;
	height: 22px;
	line-height: 22px;
	padding: 0 10px;
	border: 1px solid #d1d3d4;
	background-color: #f8f8f8;
	box-shadow: inset 0 -1px 3px rgba(0, 0, 0, 0.1), inset 0 1px 3px
		rgba(255, 255, 255, 1);
}

.excelBtn {
	font-size: 11px;
	font-weight: bold;
	font-family: '����', sans-serif;
	color: #ffffff;
	background-color: #194b82;
	border-radius: 3px;
	display: inline-block;
	padding: 0 20px;
	height: 24px;
	line-height: 24px;
	float: right;
	cursor: pointer;
}

@media only screen and (max-width:768px) {
	.searchArea {
		padding: 50px 20px 20px 20px;
	}
	.searchArea:before {
		width: 100%;
		height: 40px;
		background-position: 10px center;
		background-size: 20px !important;
		border-bottom: 1px solid #d1d3d4;
		border-right: none;
	}
	.searchArea:after {
		width: 100%;
		height: 40px;
		padding-left: 40px;
		margin-top: 0 !important;
		text-align: left;
		top: 0;
		line-height: 38px;
	}
	.searchArea .searchList>li {
		margin: 0;
	}
	.searchArea .searchList>li dl {
		margin-left: 0;
		margin: 4px 20px 4px 0;
	}
	.bbs_search .searchArea:before {
		background-position: 12px center;
	}
	.bbs_search .searchArea .searchList>li dl dt {
		display: block;
	}
}

@media only screen and (max-width:440px) {
	.searchArea .searchList>li {
		border-top: 1px dashed #d1d3d4;
		padding: 4px 0;
	}
}

.boardList .list:before, .boardList .list:after {
	content: "";
	display: table;
}

.boardList .list:after {
	clear: both;
}

.boardList .list>li {
	float: left;
	display: inline-block;
	margin: 0 2% 30px 0;
	width: 48%;
}

.boardList .list .photo {
	float: left;
	display: inline-block;
	margin-right: 20px;
}

.boardList .list .photo .thumbnail {
	width: 160px;
	height: 100px;
	padding: 5px;
	border: 1px solid #e6e7e8;
	background-color: #ffffff;
	border-radius: 5px;
	margin: 0 0 0 1px;
	overflow: hidden;
}

.boardList .list .photo .thumbnail .noImg {
	background-color: #f1f2f2;
	width: 100%;
	height: 100%;
	background-image: url(../images/common/no-img.png);
	background-repeat: no-repeat;
	background-position: center center;
	text-indent: -9999px;
	background-size: 60px;
}

.boardList .list .photo .thumbnail img {
	width: 100%;
	height: 100%;
}

.boardList .list .photo .moreBtn {
	height: 32px;
	border-radius: 5px;
	background-color: #194b82;
	color: #ffffff;
	font-size: 12px;
	font-weight: bold;
	text-align: center;
	display: block;
	border: 1px solid #123153;
	font-family: '����', sans-serif;
	line-height: 32px;
	margin-top: 10px;
}

.boardList .list .photo .moreBtn:active {
	background: #113c6a;
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.5), inset -1px -1px 4px
		rgba(0, 0, 0, 0.5);
}

.boardList .list .txt {
	overflow: hidden;
}

.boardList .list .txt>dl {
	position: relative;
	margin-bottom: 4px;
}

.boardList .list .txt>dl>dt {
	font-size: 11px;
	font-weight: bold;
	color: #1477b6;
	border: 1px solid #1477b6;
	height: 18px;
	line-height: 18px;
	width: 60px;
	text-align: center;
	font-family: '����', sans-serif;
	position: absolute;
	left: 0;
	top: 0;
}
/*
.boardList .list .txt > dl:nth-child(2n) > dt{	border-color:#5ab8f4; color:#ffffff; background-color:#5ab8f4;	}
*/
.boardList .list .txt>dl>dd {
	font-size: 12px;
	font-weight: normal;
	color: #6d6e71;
	font-family: '����', sans-serif;
	text-align: left;
	margin-left: 70px;
	height: 18px;
	line-height: 18px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

@media only screen and (max-width:768px) {
	.boardList .list>li {
		width: 100%;
		margin: 0 0 30px 0;
		border-top: 1px dashed #d1d3d4;
		padding-top: 20px;
	}
}

@media only screen and (max-width:440px) {
	.boardList .list .photo .thumbnail {
		margin: 0 auto;
		width: 100px;
		height: 62px;
	}
	.boardList .list .photo .moreBtn {
		height: 26px;
		line-height: 26px;
	}
	.boardList .list .photo .thumbnail .noImg {
		background-size: 30px;
	}
}

.paging {
	display: block;
	text-align: center;
	margin-top: 30px;
}

.paging li {
	display: inline-block;
	font-size: 12px;
	font-weight: normal;
	color: #6d6e71;
	font-family: '����', sans-serif;
	letter-spacing: 0;
}

.paging li a {
	display: block;
	height: 20px;
	line-height: 20px;
	margin: 0 8px;
}

.paging li .active {
	color: #ffffff;
	font-weight: bold;
	background: #229AE6;
	padding: 0 10px;
}

.paging li .first, .paging li .prev, .paging li .next, .paging li .last
	{
	border-radius: 3px;
	border: 1px solid #dcddde;
	padding: 0 10px;
	font-size: 11px;
	background-repeat: no-repeat;
	margin: 0;
}

.paging li .first {
	padding-left: 20px;
	background-image: url(../images/common/paging-first.png);
	background-position: 10px center;
}

.paging li .prev {
	padding-left: 20px;
	background-image: url(../images/common/paging-prev.png);
	background-position: 10px center;
	margin-right: 8px;
}

.paging li .next {
	padding-right: 20px;
	background-image: url(../images/common/paging-next.png);
	background-position: right 10px center;
	margin-left: 8px;
}

.paging li .last {
	padding-right: 20px;
	background-image: url(../images/common/paging-last.png);
	background-position: right 10px center;
}

.paging li a:hover {
	text-decoration: underline;
}

@media only screen and (max-width:768px) {
	.paging {
		margin-top: 20px;
		border-bottom: none;
	}
	.paging li .first, .paging li .prev, .paging li .next, .paging li .last
		{
		text-indent: -9999px;
		padding: 0 10px;
		background-position: center center;
	}
	.paging li a {
		margin: 0 4px;
	}
}

.subimg02_tit {
	padding: 0 0 0 200px;
	background: url(../images/sub/subimg02.png) no-repeat left center;
	min-height: 118px;
	margin-bottom: 30px;
}

.subimg02_tit p {
	font-size: 14px;
	font-weight: 300;
	color: #000000;
	border: 1px solid #d1d3d4;
	border-radius: 10px;
	padding: 20px 30px;
	position: relative;
}

.subimg02_tit p b {
	font-weight: 500;
}

.subimg02_tit p:before {
	content: "";
	width: 8px;
	height: 14px;
	background: url(../images/sub/subimg02_tit.png) no-repeat left top;
	display: block;
	position: absolute;
	left: -7px;
	top: 50%;
	margin-top: -7px;
}

.bullet01 {
	font-size: 16px;
	font-weight: normal;
	color: #000000;
	padding-left: 24px;
	background: url(../images/common/bullet01.png) no-repeat left top;
	line-height: 100%;
	margin-bottom: 10px;
	min-height: 18px;
	font-family: 'Noto Sans KR', sans-serif;
}

.requied_item {
	font-size: 12px;
	font-weight: normal;
	color: #d74f4f;
	font-family: '����', sans-serif;
	text-align: right;
	position: absolute;
	right: 0;
	top: -30px;
}

.boardDetail1 {
	position: relative;
}

.boardDetail1 .photo {
	width: 210px;
	height: 150px;
	padding: 5px;
	border: 1px solid #dcddde;
	background-color: #ffffff;
	border-radius: 5px;
	overflow: hidden;
	position: absolute;
	right: 0;
	top: 10px;
}

.boardDetail1 .photo a {
	display: block;
}

.boardDetail1 .photo .noImg {
	background-color: #f1f2f2;
	width: 100%;
	height: 100%;
	background-image: url(../images/common/no-img.png);
	background-repeat: no-repeat;
	background-position: center center;
	text-indent: -9999px;
}

.boardDetail1 .photo img {
	width: 100%;
	height: 138px;
}

.boardDetail1 .publicPhotoArea {
	position: absolute;
	width: 530px;
	right: 0px;
	top: 10px;
	text-align: right;
}

.boardDetail1 .publicPhoto {
	width: 170px;
	height: 130px;
	padding: 5px;
	margin: 2px;
	border: 1px solid #dcddde;
	background-color: #ffffff;
	border-radius: 5px;
	overflow: hidden;
	top: 10px;
	display: inline-block;
}

.boardDetail1 .publicPhoto a {
	display: block;
	height: 100%;
}

.boardDetail1 .publicPhoto .noImg {
	background-color: #f1f2f2;
	width: 100%;
	height: 100%;
	background-image: url(../images/common/no-img.png);
	background-repeat: no-repeat;
	background-position: center center;
	text-indent: -9999px;
}

.boardDetail1 .publicPhoto img {
	width: 100%;
	height: 100%;
}

.boardDetail1 table {
	width: 100%;
	border-top: 2px solid #194b82;
	letter-spacing: 0;
}

.boardDetail1 table tr th {
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	background-color: #eef4f7;
	text-align: center;
	font-family: '����', sans-serif;
	padding: 10px;
	border-bottom: 1px solid #e6e7e8;
	min-height: 36px;
}

.boardDetail1 table tr td {
	font-size: 12px;
	font-weight: normal;
	color: #6d6e71;
	font-family: '����', sans-serif;
	text-align: left;
	padding: 10px;
	border-bottom: 1px solid #e6e7e8;
	min-height: 36px;
}

.boardDetail1 table tr td.noDB {
	text-align: center;
}

.boardDetail1 table tr td#imgHtml {
	
}

.boardDetail1 table tr td#imgHtml a {
	display: inline-block;
	vertical-align: top;
	margin: 0 4px 6px 0;
}

.boardDetail1 table tr td#imgHtml .deleteBtn {
	color: #C23E3E;
	padding: 0 10px 0 20px;
	font-size: 11px;
	background: url(../images/sub/deleteBtn.png) no-repeat 10px center;
	height: 20px;
	line-height: 20px;
	border: 1px solid #c23e3e;
	border-radius: 2px;
}

.boardDetail1 table tr td#imgHtml .deleteBtn:hover {
	text-decoration: underline;
}

.boardDetail1 table tr td#fileHtml {
	
}

.boardDetail1 table tr td#fileHtml a {
	display: inline-block;
	vertical-align: top;
	margin: 0 4px 6px 0;
}

.boardDetail1 table tr td#fileHtml .deleteBtn {
	color: #C23E3E;
	padding: 0 10px 0 20px;
	font-size: 11px;
	background: url(../images/sub/deleteBtn.png) no-repeat 10px center;
	height: 20px;
	line-height: 20px;
	border: 1px solid #c23e3e;
	border-radius: 2px;
}

.boardDetail1 table tr td#fileHtml .deleteBtn:hover {
	text-decoration: underline;
}

@media only screen and (max-width:767px) {
	.boardDetail1 .photo {
		position: static;
		right: auto;
		top: auto;
		margin: 20px auto;
	}
	.boardDetail1 .publicPhotoArea {
		position: static;
		width: 100%;
		top: auto;
		right: auto;
		margin: 5px auto;
		height: 110px;
		text-align: center;
	}
	.boardDetail1 .publicPhoto {
		display: inline-block;
		position: static;
		float: none;
		width: 30%;
		height: 100%;
	}
	.requied_item {
		position: static;
		margin-bottom: 10px;
		text-align: left;
	}
}

@media only screen and (max-width:520px) {
	.subimg02_tit {
		padding: 80px 0 0 0;
		background-size: 80px;
		background-position: center 10px;
	}
	.subimg02_tit p {
		font-size: 12px;
		text-align: center;
		border: none;
		padding: 0;
	}
	.subimg02_tit p:before {
		width: 0;
		height: 0;
		display: none;
	}
}

/*
@media only screen and (max-width:768px){
	.boardDetail1 .photo{	top:6px;	}
	.boardDetail1 table tr{	overflow:hidden; width:100%; display:block;	}
	.boardDetail1 table tr:before,
	.boardDetail1 table tr:after{  content:""; display:table;  }
	.boardDetail1 table tr:after{  clear:both; }
	.boardDetail1 table tr th{	display:block; width:25%; height:100%; float:left;	}
	.boardDetail1 table tr td{	display:block; width:75%; overflow:hidden; height:100%;	}
	.boardDetail1 table tr td:after{   content:"&nbsp;";}
	.boardDetail1 table tr td[colspan="4"]{    width:100%; }
	.boardDetail1 table tr td.noDB{	width:100%;	}
	.boardDetail1 table tr td .w200, .boardDetail1 table tr td .w400{	width:100% !important;	}
	.boardDetail1 table tr td #userAddressDetail{	margin-top:4px;	}
	.boardDetail1 table tr td label{	margin:4px 0;	}
}

@media only screen and (max-width:520px){
	.boardDetail1 .photo{		position:static; right:auto; top:auto; margin:0 auto; margin-bottom:20px;	}
	.subimg02_tit{	padding:80px 0 0 0; background-size:80px; background-position:center 10px;	}
	.subimg02_tit p{	 font-size:12px; text-align:center; border:none; padding:0;	}
	.subimg02_tit p:before{	width:0; height:0; display:none;	}
	
	.boardDetail1 table tr th{	width:35%;	}
	.boardDetail1 table tr td{	width:65%;	}
}
*/
.boardList2 {
	
}

.boardList2 table {
	width: 100%;
	border-top: 2px solid #194b82;
}

.boardList2 table thead tr th {
	background-color: #eef4f7;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: '����', sans-serif;
}

.boardList2 table tbody tr td {
	font-size: 12px;
	font-weight: normal;
	color: #6d6e71;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
	font-family: '����', sans-serif;
}

.boardList2 table tbody tr td a:hover {
	text-decoration: underline;
}

.boardList2 table tr th:first-child {
	border-left: none;
}

.boardList2 table tr th:last-child {
	border-right: none;
}

.boardList2 table tr td:first-child {
	border-left: none;
}

.boardList2 table tr td:last-child {
	border-right: none;
}

@media only screen and (max-width:500px) {
	.boardList2 {
		overflow-x: scroll;
	}
	.boardList2:before {
		content: "������ ���÷��� �������� �巡���ϼ���";
		display: inline-block;
		margin-bottom: 10px;
		font-family: 'Nanum Gothic';
		font-size: 12px;
	}
}

.boardBtns {
	margin-top: 30px;
}

.boardBtns * {
	display: inline-block;
	font-size: 12px;
	font-weight: bold;
	color: #ffffff;
	font-family: '����', sans-serif;
	height: 32px;
	line-height: 32px;
	border-radius: 5px;
	padding: 0 20px;
	background-color: #194b82;
	border: 1px solid #123153;
}

.boardBtns *:active {
	background-color: #123153;
	box-shadow: inset 1px 1px 3px rgba(0, 0, 0, 0.5), inset -1px -1px 3px
		rgba(0, 0, 0, 0.5);
}

.boardBtns .gray {
	background-color: #58595b;
}

.listBtn:before {
	content: "";
	width: 8px;
	height: 9px;
	display: inline-block;
	margin-right: 6px;
	background: url(../images/common/ico-list.png) no-repeat left top;
}

.saveBtn {
	background-color: #5bbc5e;
	border-color: #439c46;
}

.saveBtn:before {
	content: "";
	width: 9px;
	height: 9px;
	display: inline-block;
	margin-right: 6px;
	background: url(../images/common/ico-save.png) no-repeat left top;
}

.saveBtn:active {
	background-color: #439c46;
}

.photoList {
	border-bottom: 1px solid #e6e7e8;
	padding: 30px 0;
}

.photoList ul {
	display: block;
}

.photoList ul:before, .photoList ul:after {
	content: "";
	display: table;
}

.photoList ul:after {
	clear: both;
}

.photoList ul li {
	float: left;
	display: inline-block;
	margin-left: 20px;
	text-align: center;
}

.photoList ul li:first-child {
	margin-left: 0;
}

.photoList ul li .photo {
	width: 280px;
	height: 180px;
	padding: 5px;
	border: 1px solid #dcddde;
	background-color: #ffffff;
	border-radius: 5px;
	overflow: hidden;
	position: relative;
}

.photoList ul li .photo .noImg {
	background-color: #f1f2f2;
	width: 100%;
	height: 100%;
	background-image: url(../images/common/no-img.png);
	background-repeat: no-repeat;
	background-position: center center;
	text-indent: -9999px;
}

.photoList ul li .photo img {
	width: 100%;
}

.photoList ul li p {
	font-size: 16px;
	font-weight: normal;
	color: #000000;
	margin-top: 10px;
}

@media only screen and (max-width:768px) {
	.photoList ul {
		text-align: center;
	}
	.photoList ul li {
		float: none;
		display: inline-block;
	}
	.photoList ul li .photo {
		width: 140px;
		height: 90px;
	}
	.photoList ul li .photo .noImg {
		background-size: 40px;
	}
	.photoList ul li p {
		font-size: 14px;
	}
}

@media only screen and (max-width:520px) {
	.photoList ul li .photo {
		width: 100px;
		height: 64px;
	}
	.photoList ul li p {
		font-size: 12px;
	}
}

@media only screen and (max-width:380px) {
	.photoList {
		padding: 10px 0;
	}
	.photoList ul li {
		display: block;
		text-align: left;
		overflow: hidden;
		margin: 0 0 10px 0;
	}
	.photoList ul li .photo {
		width: 140px;
		height: 90px;
		display: inline-block;
		float: left;
	}
	.photoList ul li p {
		font-size: 12px;
		display: inline-block;
		margin: 0 0 0 10px;
		float: left;
		line-height: 90px;
	}
}

/* LOGIN */
/*.login_wrap{	border:4px solid #e6e7e8; border-radius:10px; padding:40px 40px 40px 260px; background-image:url(../images/sub/login-bg.png); background-repeat:no-repeat; background-position:80px center;	}*/
.login_wrap {
	border: 4px solid #e6e7e8;
	border-radius: 10px;
	padding: 40px 0px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}
/*.login_wrap .loginBox{	border-left:1px solid #e6e7e8; padding-left:50px;	}*/
.login_wrap .loginBox {
	padding-left: 10px;
	padding-top: 120px;
	background-image: url(../images/sub/login-bg.png);
	background-repeat: no-repeat;
	background-position: center 0px;
	width: 400px;
	border-right: 1px solid #e6e7e8;
}

.login_wrap .oacxBox {
	padding-left: 10px;
	text-align: center;
}

.login_wrap .loginTit {
	display: inline-block;
	font-size: 16px;
	font-weight: 500;
	color: #45A748;
	margin-bottom: 20px;
}

.login_wrap .login:before, .login_wrap .login:after {
	content: "";
	display: table;
}

.login_wrap .login:after {
	clear: both;
}

.login_wrap .login li {
	float: left;
	display: inline-block;
	margin-right: 10px;
}

.login_wrap .login li dl {
	display: block;
	position: relative;
	margin-bottom: 10px;
}

.login_wrap .login li dl dt {
	font-size: 14px;
	font-weight: normal;
	color: #000000;
	width: 80px;
	position: absolute;
	left: 0;
	top: 0;
	height: 24px;
	line-height: 24px;
}

.login_wrap .login li dl dd {
	margin-left: 80px;
}

.login_wrap .login input[type="text"], .login_wrap .login input[type="password"]
	{
	width: 200px;
	height: 24px;
	line-height: 24px;
	border: 1px solid #d1d3d4;
}

.login_wrap .login li .loginBtn {
	font-size: 14px;
	font-weight: normal;
	color: #ffffff;
	text-align: center;
	border-radius: 3px;
	background-color: #194b82;
	display: block;
	height: 58px;
	padding: 0 20px;
	line-height: 58px;
}

.login_wrap .loginBtn2 {
	font-size: 14px;
	font-weight: normal;
	color: #ffffff;
	text-align: center;
	border-radius: 3px;
	background-color: #194b82;
	display: block;
	height: 58px;
	padding: 0 20px;
	line-height: 58px;
}

.login_wrap .login li .loginBtn:active {
	box-shadow: inset 1px 1px 3px rgba(0, 0, 0, 0.1), inset -1px -1px 3px
		rgba(0, 0, 0, 0.1);
}

.login_wrap .joinBox {
	font-size: 14px;
	font-weight: 300;
	color: #58595b;
	margin-top: 20px;
}

.login_wrap .joinBox .joinBtn {
	font-size: 12px;
	font-weight: normal;
	color: #333333;
	height: 26px;
	line-height: 26px;
	font-family: '����', sans-serif;
	border: 1px solid #dcddde;
	border-radius: 3px;
	padding: 0 10px;
	background-image: url(../images/common/gra-bg.png);
	background-repeat: repeat-x;
	background-size: 100% 100%;
	display: inline-block;
	margin-left: 10px;
}

.login_wrap .joinBox .joinBtn:after {
	content: "";
	width: 14px;
	height: 14px;
	display: inline-block;
	background: url(../images/common/arrow01.png) no-repeat left top;
	margin-left: 14px;
	position: relative;
	top: 2px;
}

@media only screen and (max-width:768px) {
	/*.login_wrap{	padding:100px 20px 20px 20px; background-position:center 00px;	}
	.login_wrap .loginBox{	border-left:none; border-top:1px solid #e6e7e8; padding-top:20px; margin:0 auto; padding-left:0; width:380px;	}*/
	.login_wrap {
		padding: 20px 20px 20px 20px;
		background-position: center 0px;
	}
	.login_wrap .loginBox {
		border-left: none;
		margin: 0 auto;
		padding-left: 0;
		width: 380px;
	}
	.login_wrap .login input[type="text"], .login_wrap .login input[type="password"]
		{
		width: 120px;
	}
}

@media only screen and (max-width:440px) {
	.login_wrap {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.login_wrap .loginBox {
		padding-top: 120px;
		width: auto;
		background-position: center 0px;
		border-right: none;
		padding-bottom: 20px;
	}
	.login_wrap .loginTit {
		font-size: 14px;
	}
	.login_wrap .login input[type="text"], .login_wrap .login input[type="password"]
		{
		width: 120px;
	}
	.login_wrap .joinBox .joinBtn {
		margin-left: 0;
		margin-top: 6px;
	}
	.login_wrap .oacxBox {
		width: 100%;
		border-top: 1px solid #e6e7e8;
		padding-top: 20px;
	}
	/* .login_wrap .oacxBox{display:none;} */
}

/* JOIN */
.join1_wrap {
	border: 4px solid #e6e7e8;
	border-radius: 10px;
	padding: 40px;
}

.join1_wrap .joinList:before, .join1_wrap .joinList:after {
	content: "";
	display: table;
}

.join1_wrap .joinList:after {
	clear: both;
}

.join1_wrap .joinList li {
	float: left;
	display: inline-block;
	width: 50%;
	border-left: 1px solid #e6e7e8;
	padding-left: 40px;
	background-repeat: no-repeat;
	background-position: right bottom;
}

.join1_wrap .joinList li.foreigner {
	background-image: url(../images/sub/join1_img01.png);
	background-position: right 40px bottom;
}

.join1_wrap .joinList li.basic {
	background-image: url(../images/sub/join1_img02.png);
}

.join1_wrap .joinList li:first-child {
	border-left: none;
	padding-left: 0;
	padding-right: 40px;
}

.join1_wrap .joinList li dl {
	display: block;
	margin-bottom: 30px;
}

.join1_wrap .joinList li dl dt {
	font-size: 20px;
	font-weight: 500;
	color: #45a748;
	margin-bottom: 10px;
}

.join1_wrap .joinList li dl dd {
	font-size: 14px;
	font-weight: 300;
	color: #58595b;
	font-family: 'Nanum Gothic';
}

.join1_wrap .joinList li .joinBtn {
	border-radius: 5px;
	background: #45a748;
	display: inline-block;
	text-align: center;
	color: #ffffff;
	font-size: 14px;
	font-weight: normal;
	width: 160px;
	height: 58px;
	line-height: 120%;
	padding: 20px;
}

.join1_wrap .joinList li .joinBtn:active {
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.2), inset -1px -1px 4px
		rgba(0, 0, 0, 0.2);
}

.join1_wrap .joinList li.basic dl dt {
	color: #328ac3;
}

.join1_wrap .joinList li.basic .joinBtn {
	background: #328ac3;
	margin-right: 6px;
}

.join1_wrap .joinList li.basic .joinBtn.gray {
	background: #58595b;
}

@media only screen and (max-width:767px) {
	.join1_wrap {
		padding: 20px;
	}
}

.join_finish {
	border: 4px solid #e6e7e8;
	border-radius: 10px;
	padding: 40px;
	text-align: center;
}

.join_finish dl {
	margin-bottom: 40px;
	padding-top: 140px;
	background: url(../images/sub/join-finish.png) no-repeat center top;
}

.join_finish dl dt {
	font-size: 26px;
	font-weight: 500;
	color: #45a748;
	margin-bottom: 10px;
}

.join_finish dl dd {
	font-size: 16px;
	font-weight: 300;
	color: #58595b;
}

.join_finish dl dd .name {
	color: #000000;
}

.join_finish .btns a {
	font-size: 14px;
	font-weight: normal;
	height: 40px;
	line-height: 40px;
	border-radius: 3px;
	display: inline-block;
	color: #ffffff;
	background-color: #45a748;
	padding: 0 20px;
	margin: 0 2px;
}

.join_finish .btns a.gray {
	background-color: #58595b;
}

.join_finish .btns a:hover {
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.2), inset -1px -1px 4px
		rgba(0, 0, 0, 0.2)
}

@media only screen and (max-width:767px) {
	.join_finish {
		padding: 20px;
	}
	.join_finish dl {
		background-size: 260px;
		padding-top: 100px;
		margin-bottom: 20px;
	}
	.join_finish dl dt {
		font-size: 18px;
	}
	.join_finish dl dd {
		font-size: 12px;
		line-height: 140%;
	}
}

.certiBtn {
	font-size: 14px;
	font-weight: normal;
	color: #000000;
	padding: 0 50px 0 30px;
	height: 40px;
	line-height: 38px;
	border: 1px solid #dcddde;
	border-radius: 50px;
	background: url(../images/common/gra-bg.png) repeat-x;
	background-size: 100% 100%;
	display: inline-block;
	position: relative;
}

.certiBtn:after {
	width: 32px;
	height: 32px;
	display: inline-block;
	content: "";
	background: url(../images/common/arrow6.png) no-repeat left top;
	position: absolute;
	right: 4px;
	top: 4px;
}

.certiBtn:active {
	background: #58595b;
	color: #ffffff;
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.2), inset -1px -1px 4px
		rgba(0, 0, 0, 0.2);
}

.joinCerti p {
	text-align: left;
}
/*
.boardBtn{	background-color:#194b82; border-radius:3px; font-size:11px; font-weight:bold; color:#ffffff; font-family:'����', sans-serif; height:24px; line-height:24px; display:inline-block; padding:0 10px;	}
.boardBtn:active{	box-shadow:inset 1px 1px 4px rgba(0,0,0,0.3), inset -1px -1px 4px rgba(0,0,0,0.3);	}
*/
@media only screen and (max-width:620px) {
	.join1_wrap .joinList li {
		width: 100%;
		border-left: none;
		padding: 40px 0;
		border-top: 1px solid #e6e7e8;
	}
	.join1_wrap .joinList li:first-child {
		border-top: none;
		padding-top: 0;
		background-position: right bottom 40px;
	}
}

.joinStep:before, .joinStep:after {
	content: "";
	display: table;
}

.joinStep:after {
	clear: both;
}

.joinStep li {
	float: left;
	display: inline-block;
	border: 1px solid #dcddde;
	border-radius: 10px;
	height: 74px;
	margin-left: 4%;
	width: 22%;
	background: url(../images/common/gra-bg.png) repeat-x;
	background-size: 100% 100%;
	padding: 0 14px;
	color: #6d6e71;
	position: relative;
	font-family: 'Noto Sans KR', sans-serif;
}

.joinStep li:before {
	content: "";
	width: 10px;
	height: 20px;
	background: url(../images/common/arrow7.png) no-repeat left top;
	display: inline-block;
	position: absolute;
	left: -12%;
	top: 24px;
}

.joinStep li:first-child:before {
	width: 0;
	height: 0;
}

.joinStep li:first-child {
	margin-left: 0;
}

.joinStep li .num {
	float: left;
	display: inline-block;
	font-size: 34px;
	font-weight: bold;
	margin-right: 16px;
	height: 74px;
	line-height: 74px;
}

.joinStep li h4 {
	overflow: hidden;
	font-size: 16px;
	font-weight: normal;
	padding: 24px 0;
	letter-spacing: -2px;
	line-height: 120%;
}

.joinStep li.step3 h4 {
	padding-top: 14px;
}

.joinStep li.active {
	background: #194b82;
	color: #ffffff;
}

.joinAgreeCon {
	margin-bottom: 20px;
}

.joinAgreeCon textarea {
	width: 100%;
	height: 160px;
	border: 1px solid #d1d3d4;
	box-shadow: inset 1px 1px 4px rgba(0, 0, 0, 0.05), inset -1px -1px 4px
		rgba(0, 0, 0, 0.05);
	background-color: #f8f8f8;
	padding: 10px;
}

.joinAgreeCon .acctermsAgree {
	border: 1px solid #d1d3d4;
	padding: 10px;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	margin: -1px 0 30px 0;
}

.joinStepCon .nextBtn {
	font-size: 14px;
	font-weight: bold;
	color: #ffffff;
	text-align: center;
	padding: 0 30px;
	height: 40px;
	line-height: 40px;
	background-color: #229AE6;
	border-radius: 5px;
	border: none;
	cursor: pointer;
}

.joinStepCon .nextBtn:after {
	width: 6px;
	height: 10px;
	display: inline-block;
	background: url(../images/sub/arrow5.png) no-repeat left top;
	content: "";
	margin-left: 10px;
	cursor: pointer;
}

.old-member {
	border: 4px solid #e6e7e8;
	border-radius: 10px;
	padding: 40px;
	text-align: center;
}

.old-member dl {
	padding-top: 220px;
	background: url(../images/sub/old-member.png) no-repeat center top;
}

.old-member dl dt {
	font-size: 26px;
	font-weight: 500;
	color: #45A748;
	margin-bottom: 10px;
}

.old-member dl dd {
	font-size: 16px;
	font-weight: 300;
	color: #58595b;
}

@media only screen and (max-width:767px) {
	.old-member {
		padding: 20px;
	}
	.old-member dl {
		background-size: 200px;
		padding-top: 140px;
	}
	.old-member dl dt {
		font-size: 18px;
		margin-bottom: 6px;
	}
	.old-member dl dd {
		font-size: 12px;
	}
}

.tabset .tabs {
	background-color: #f6f6f6;
	border: 1px solid #dcddde;
}

.tabset .tabs:before, .tabset .tabs:after {
	content: "";
	display: table;
}

.tabset .tabs:after {
	clear: both;
}

.tabset .tabs li {
	font-size: 14px;
	font-weight: 300;
	float: left;
	display: inline-block;
}

.tabset .tabs li a {
	border-right: 1px solid #dcddde;
	padding: 0 40px;
	height: 40px;
	line-height: 40px;
	display: block;
}

.tabset .tabs li .active {
	background-color: #ffffff;
	font-weight: 500;
	color: #000000;
	background-image: url(../images/common/arrow5.png);
	background-repeat: no-repeat;
	background-position: right 10px center;
}

.tabset .panels {
	border: 1px solid #dcddde;
	margin-top: -1px;
}

.tabset .panel {
	padding: 20px;
	position: relative;
}

.tabset .panel:before, .tabset .panel:after {
	content: "";
	display: table;
}

.tabset .panel:after {
	clear: both;
}

@media only screen and (max-width:768px) {
	.joinStep li {
		width: 48%;
		margin-bottom: 10px;
	}
	.joinStep li:before {
		width: 0;
		height: 0;
	}
	.joinStep li:nth-child(3) {
		margin-left: 0;
	}
	.joinStep li.step3 h4 {
		padding-top: 24px;
	}
}

@media only screen and (max-width:580px) {
	.joinStep li .num {
		font-size: 22px;
	}
	.joinStep li h4 {
		font-size: 14px;
	}
	.joinStep li.step3 h4 {
		padding-top: 14px;
	}
	.tabset .tabs li a {
		padding: 0 20px;
	}
}

@media only screen and (max-width:380px) {
	.joinStep li {
		width: 100%;
		height: auto;
		margin-left: 0;
	}
}

.joinCert {
	border: 4px solid #e6e7e8;
	border-radius: 10px;
	padding: 40px;
}

.joinCert>dl>dt {
	font-size: 20px;
	font-weight: 500;
	color: #45a748;
	margin-bottom: 10px;
}

.joinCert>dl>dd {
	font-size: 13px;
	font-weight: 300;
	color: #58595b;
	font-family: 'Nanum Gothic';
	line-height: 140%;
}

.joinCert>div>dl>dt {
	font-size: 20px;
	font-weight: 500;
	color: #45a748;
	margin-bottom: 10px;
}

.joinCert>div>dl>dd {
	font-size: 13px;
	font-weight: 300;
	color: #58595b;
	font-family: 'Nanum Gothic';
	line-height: 140%;
}

.joinCert>div>label {
	font-size: 18px;
}

.layer-popup-wrap {
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	position: fixed;
	left: 0;
	top: 0;
	z-index: 999999;
}

.joinCert.layer-popup {
	position: absolute;
	left: 50%;
	top: 20%;
	background-color: #ffffff;
	width: 480px;
	margin-left: -240px;
}

.layer-popup .popup-close {
	position: absolute;
	right: 14px;
	top: 14px;
	width: 20px;
	height: 20px;
	background: url(../images/common/ico-close2.png) no-repeat left top;
	background-size: 100%;
	text-indent: -9999px;
	display: block;
	cursor: pointer;
}

@media only screen and (max-width:767px) {
	.joinCert {
		padding: 20px;
	}
}

@media only screen and (max-width:580px) {
	.joinCert.layer-popup {
		width: 90%;
		margin-left: -45%;
		min-width: 300px;
	}
	.joinCert.layer-popup .idpwFindCert>li {
		font-size: 12px;
	}
}

.easyCert {
	border-top: 1px solid #e6e7e8;
	padding-top: 15px;
	margin-top: 15px;
}

.easyCert>div {
	text-align: center;
}

.easyCert .loginTit {
	display: inline-block;
	font-size: 16px;
	font-weight: 500;
	color: #45A748;
	margin-bottom: 20px;
}

.easyCert .loginBtn2 {
	font-size: 16px;
	font-weight: normal;
	color: #ffffff;
	text-align: center;
	border-radius: 3px;
	background-color: #194b82;
	display: block;
	height: 58px;
	padding: 0 20px;
	line-height: 58px;
}

.kakaoCert {
	border: 4px solid #e6e7e8;
	border-radius: 10px;
	padding: 40px;
}

.kakaoCert>dl>dt {
	font-size: 20px;
	font-weight: 500;
	color: #45a748;
	margin-bottom: 10px;
}

.kakaoCert>dl>dd {
	font-size: 13px;
	font-weight: 300;
	color: #58595b;
	font-family: 'Nanum Gothic';
	line-height: 140%;
}

.kakaoCert.layer-popup {
	position: absolute;
	left: 50%;
	top: 10%;
	background-color: #ffffff;
	width: 480px;
	margin-left: -240px;
	overflow-y: scroll;
	height: 300px;
}

@media only screen and (max-width:767px) {
	.kakaoCert {
		padding: 20px;
	}
}

@media only screen and (max-width:580px) {
	.kakaoCert.layer-popup {
		width: 90%;
		margin-left: -45%;
		min-width: 300px;
	}
	.kakaoCert.layer-popup .idpwFindCert>li {
		font-size: 12px;
	}
}

.align_c {
	text-align: center !important;
}

.reserveRegistList {
	border: 4px solid #e6e7e8;
	border-radius: 10px;
	overflow: hidden;
	padding: 40px 40px 40px 200px;
	font-size: 16px;
	font-weight: 300;
	color: #58595b;
	vertical-align: top;
	background-image: url('../images/sub/login-bg.png');
	background-repeat: no-repeat;
	background-position: 40px center;
}

.reserveRegistList p {
	margin-bottom: 20px;
	display: inline-block;
}

.reserveRegistList .loginBtn {
	display: inline-block;
	border-radius: 50px;
	height: 40px;
	line-height: 40px;
	color: #000000;
	font-size: 14px;
	font-weight: bold;
	background-image: url('../images/common/gra-bg.png');
	background-repeat: repeat-x;
	background-size: 100% 100%;
	padding: 0 60px;
	border: 1px solid #dcddde;
	position: relative;
}

.reserveRegistList .loginBtn:after {
	content: "";
	width: 32px;
	height: 32px;
	display: inline-block;
	background: url('../images/common/arrow6.png') no-repeat left top;
	position: absolute;
	right: 3px;
	top: 3px;
}

.reserveRegistList .loginBtn:hover {
	background: #57585a;
	color: #ffffff;
}

@media only screen and (max-width:767px) {
	.reserveRegistList {
		background-position: center 30px;
		padding: 160px 20px 20px 20px;
		text-align: center;
		font-size: 14px;
		font-weight: normal;
		line-height: 140%;
	}
}

/* ������ �˾� */
.competition {
	padding-top: 390px;
	background: url(../images/common/competition-bg.png) no-repeat left top;
}

.competition .btns {
	text-align: center;
}

.competition .btns a {
	display: inline-block;
	font-size: 14px;
	color: #ffffff;
	height: 36px;
	line-height: 36px;
	border-radius: 3px;
	background-color: #3377d3;
	border: 1px solid #2b66b6;
	border-left: none;
	border-top: none;
	padding: 0 30px;
}

.competition .btns .grBtn {
	background-color: #58c432;
	border-color: #489d2a;
}

.competition .btns a:hover {
	border-left-width: 1px;
	border-top-width: 1px;
}

#competition_wrap {
	background-color: #e6e7e8;
	padding: 20px 10px;
}

#competition_wrap h1 {
	font-size: 22px;
	font-weight: bold;
	color: #ffffff;
	background-color: #86c1ee;
	display: inline-block;
	height: 42px;
	line-height: 42px;
	padding: 0 40px;
	position: relative;
}

#competition_wrap h1:before {
	content: "";
	width: 16px;
	height: 42px;
	display: block;
	position: absolute;
	left: -16px;
	top: 0;
	background: url(../images/common/competition-tit1.png) no-repeat;
}

#competition_wrap h1:after {
	content: "";
	width: 16px;
	height: 42px;
	display: block;
	position: absolute;
	right: -16px;
	top: 0;
	background: url(../images/common/competition-tit2.png) no-repeat;
}

#competition_wrap .panels {
	padding: 50px 20px 20px 20px;
	background-color: #ffffff;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1), -1px -1px 3px
		rgba(0, 0, 0, 0.1);
	margin-top: -20px;
}

#competition_wrap .tbl2 table {
	width: 100%;
	border-top: 2px solid #194b82;
	letter-spacing: 0;
}

#competition_wrap .tbl2 table tr th {
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	background-color: #eef4f7;
	text-align: center;
	font-family: '����', sans-serif;
	padding: 6px;
	border-bottom: 1px solid #e6e7e8;
	min-height: 36px;
}

#competition_wrap .tbl2 table tr td {
	font-size: 12px;
	font-weight: normal;
	color: #77787b;
	font-family: '����', sans-serif;
	text-align: left;
	padding: 6px;
	border-bottom: 1px solid #e6e7e8;
	min-height: 36px;
}

#competition_wrap .result {
	text-align: center;
	font-size: 14px;
	line-height: 140%;
}

/* SITEMAP */
.sitemap {
	display: block;
}

.sitemap:before, .sitemap:after {
	content: "";
	display: table;
}

.sitemap:after {
	clear: both;
}

.sitemap>li {
	float: left;
	display: inline-block;
	width: 33.3%;
	border-left: 1px solid #e6e7e8;
	padding: 30px;
	border-top: 1px solid #e6e7e8;
	-webkit-transition: ease 0.2s;
}

.sitemap>li:hover {
	background: url(../images/sub/sitemap.png) no-repeat right 20px bottom
		20px;
}

.sitemap>li:nth-child(3n+1) {
	border-left: none;
	padding-left: 0;
}

.sitemap>li:first-child {
	border-top: none;
	padding-top: 0;
}

.sitemap>li:nth-child(2) {
	border-top: none;
	padding-top: 0;
}

.sitemap>li:nth-child(3) {
	border-top: none;
	padding-top: 0;
}

.sitemap>li h4 {
	font-size: 18px;
	font-weight: bold;
	color: #328ac3;
	margin-bottom: 20px;
}

.sitemap>li>ul>li {
	font-size: 14px;
	font-weight: normal;
	font-weight: 300;
	line-height: 100%;
	margin-bottom: 10px;
}

.sitemap>li>ul>li>a {
	color: #58595b;
	display: block;
	padding-left: 10px;
	background-repeat: no-repeat;
	background-position: left 4px;
	background-image: url(../images/sub/sitemap-off.png);
}

.sitemap>li>ul>li>a:hover {
	background-image: url(../images/sub/sitemap-on.png);
	color: #5ab8f4;
}

.sitemap>li>ul>li a:hover {
	text-decoration: underline;
}

@media only screen and (max-width:520px) {
	.sitemap>li {
		width: 100%;
		height: auto !important;
		padding: 15px;
		border-bottom: 1px solid #e6e7e8;
		border-left: none;
		border-right: none;
		border-top: none;
	}
	.sitemap>li:nth-child(2) {
		padding-top: 15px;
	}
	.sitemap>li:nth-child(3) {
		padding-top: 15px;
	}
	.sitemap>li:nth-child(3n+1) {
		padding-left: 15px;
	}
	.sitemap>li:first-child {
		padding-top: 15px;
	}
}

/* ID PW ã�� 19.03.13 �߰� */
.idpwFind {
	font-family: 'Noto Sans KR', sans-serif;
}

.idpwFind:before, .idpwFind:after {
	content: "";
	display: table;
}

.idpwFind:after {
	clear: both;
}

.idpwFind p {
	font-size: 13px;
	line-height: 140%;
	font-family: 'Nanum Gothic';
}

.idpwFind h5 {
	font-size: 20px;
	font-weight: 500;
	margin-bottom: 20px;
}

.idpwFind1 {
	width: 100%;
	padding: 30px;
}

.idpwFind1 h5 {
	color: #45a748;
}

.idpwFind2 {
	float: left;
	display: inline-block;
	width: 50%;
	border-left: 1px solid #e6e7e8;
	padding: 40px;
}

.idpwFind2 h5.requied_item {
	color: #328ac3;
}

.idpwFindCert {
	
}

.idpwFindCert:before, .idpwFindCert:after {
	content: "";
	display: table;
}

.idpwFindCert:after {
	clear: both;
}

.idpwFindCert>li {
	float: left;
	display: inline-block;
	margin-left: 2%;
	margin-bottom: 8px;
	width: 49%;
	font-size: 16px;
	font-weight: normal;
	text-align: center;
}

.idpwFindCert>li>a {
	display: block;
	background-color: #194b82;
	color: #ffffff;
	border-radius: 3px;
	height: 58px;
	line-height: 58px;
}

.idpwFindCert>li>a:hover {
	text-decoration: underline;
}

.idpwFindCert>li:first-child {
	margin-left: 0;
}

.idpwFindCert>li:first-child>a {
	background-color: #45a748;
}

.idpwFindCert>.kakaobtn {
	margin-left: 0;
}

.idpwFindCert>.kakaobtn>.kakaoColor {
	background-color: #FFCC66;
}

.idpwFindCert2 {
	
}

.idpwFindCert2:before, .idpwFindCert2:after {
	content: "";
	display: table;
}

.idpwFindCert2:after {
	clear: both;
}

.idpwFindCert2>li {
	float: left;
	display: inline-block;
	margin-left: 2%;
	width: 30%;
	font-size: 16px;
	font-weight: normal;
	text-align: center;
}

.idpwFindCert2>li>a {
	display: block;
	background-color: #194b82;
	color: #ffffff;
	border-radius: 3px;
	height: 58px;
	line-height: 58px;
}

.idpwFindCert2>li #cancle {
	display: block;
	background-color: #FF0000;
	color: #ffffff;
	border-radius: 3px;
	height: 58px;
	line-height: 58px;
}

.idpwFindCert2>li>a:hover {
	text-decoration: underline;
}

.idpwFindCert2>li:first-child {
	margin-left: 0;
}

.idpwFindCert2>li:first-child>a {
	background-color: #45a748;
}

.idpwFind table {
	width: 100%;
	border: 1px solid #d1d3d4;
	border-left: none;
	border-right: none;
}

.idpwFind table tr th {
	font-size: 14px;
	font-weight: 300;
	color: #000000;
	text-align: left;
	border-bottom: 1px solid #d1d3d4;
	background-color: #f8f8f8;
}

.idpwFind table tr td {
	font-size: 12px;
	font-weight: normal;
	color: #6d6e71;
	font-family: '����';
	letter-spacing: -1px;
	border-bottom: 1px solid #d1d3d4;
}

.idpwFind table tr th, .idpwFind table tr td {
	padding: 10px;
}

.idpwFind .idpwFindBtn {
	display: block;
	border-radius: 3px;
	font-size: 16px;
	font-weight: normal;
	color: #ffffff;
	background-color: #328ac3;
	height: 58px;
	line-height: 58px;
	text-align: center;
}

.idpwLayer {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: #ffffff;
	text-align: center;
	padding-top: 12%;
	display: none;
	font-family: 'Noto Sans KR', sans-serif;
}

.idpwLayer p {
	margin-bottom: 20px;
	color: #666666;
	font-size: 14px;
}

.idpwLayer #findId {
	font-size: 18px;
	font-weight: 500;
	color: #194b82;
	display: block;
	margin-bottom: 40px;
}

.idpwLayer #findId:before {
	content: ' " ';
	display: inline-block;
	font-size: 26px;
	color: #bcbec0;
	font-weight: bold;
	margin-right: 6px;
}

.idpwLayer #findId:after {
	content: ' " ';
	display: inline-block;
	font-size: 26px;
	color: #bcbec0;
	font-weight: bold;
	margin-left: 6px;
}

.idpwLayer a {
	display: inline-block;
	border-radius: 3px;
	height: 40px;
	line-height: 40px;
	font-size: 14px;
	font-weight: normal;
	color: #ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	padding: 0 20px;
	background-color: #328ac3;
}

.idpwLayer .blueBtn {
	background-color: #328ac3;
}

.idpwLayer .grayBtn {
	background-color: #58595b;
}

.idpwFind3 {
	width: 100%;
	padding: 30px;
	border-top: 1px solid #e6e7e8;
}

.idpwFind3 .oacxBox {
	width: 49%;
	text-align: center;
}

.idpwFind3 .loginTit1 {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: left;
	font-size: 20px;
	font-weight: 500;
	color: #45a748;
}

.idpwFind3 .loginTit2 {
	text-align: left;
	margin: 15px 0px;
}

.idpwFind3 .oacxBox #oacxBtn {
	display: block;
	background-color: #194b82;
	color: #ffffff;
	border-radius: 3px;
	height: 58px;
	line-height: 58px;
	width: 100%;
	font-size: 16px;
	font-weight: normal;
	text-align: center;
}

.idpwFind3 div {
	padding-bottom: 20px;
}

br.for_pc {
	display: none;
}

@media only screen and (max-width:767px) {
	.idpwFind1 {
		padding: 0;
	}
}

@media only screen and (max-width:767px) {
	img[src*="sub03_04_img1"] {
		width: 100%;
	}
	img[src*="sub03_04_img2"] {
		width: 100%;
	}
}

@media only screen and (max-width:767px) {
	.join_tbl.boardDetail1 input[type="text"], .join_tbl.boardDetail1 input[type="password"],
		.join_tbl.boardDetail1 input[type="num"], .join_tbl.boardDetail1 select
		{
		width: 100% !important;
	}
	.join_tbl.boardDetail1 input#juminNo {
		width: 200px !important;
	}
	.join_tbl.boardDetail1 select {
		font-size: 11px;
	}
	br.for_pc {
		display: block;
	}
	.join_tbl.boardDetail1 tr th {
		font-size: 10px;
	}
	.join_tbl.boardDetail1 tr td {
		font-size: 10px !important;
	}
	.join_tbl.boardDetail1 table tr td input {
		margin-bottom: 4px;
	}
	/*
    .join_tbl.boardDetail1 table tr{   display:block; overflow:hidden; width:100%; }
    .join_tbl.boardDetail1 table tr th{    display:inline-block; background:none; text-align:left;  min-height:auto; padding:6px 6px 0 6px; width:100% !important;   }
    .join_tbl.boardDetail1 table tr td{    display:inline-block; min-height:auto; width:100% !important;  }
    .join_tbl.boardDetail1 table tr td input{  margin-bottom:4px;}
    .join_tbl.boardDetail1 table tr td:before,
    .join_tbl.boardDetail1 table tr td:after{content:""; display:table;}
    .join_tbl.boardDetail1 table tr td:after{clear:both;}
    */
}

.cert_doc table {
	width: 100%;
	font-family: 'Nanum Gothic';
}

.cert_doc table thead tr th {
	font-size: 14px;
	font-weight: bold;
	color: #000000;
	padding: 10px;
	text-align: center;
	background-color: #eef4f7;
	border: 1px solid #e6e7e8;
}

.cert_doc table tbody tr th {
	font-size: 14px;
	font-weight: bold;
	color: #000000;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
}

.cert_doc table tbody tr td {
	font-size: 14px;
	font-weight: normal;
	color: #6d6e71;
	text-align: center;
	padding: 10px;
	border: 1px solid #e6e7e8;
}

.cert_doc table tbody tr td a {
	display: block;
}

.cert_doc table tbody tr td a:hover {
	text-decoration: underline;
}

.num1 {
	padding-left: 10px;
}

.btn_withdrawal {
	display: none;
}

@media only screen and (max-width:768px) {
	.btn_withdrawal {
		display: inline-block;
	}
}

.animal_reg_ul {
	padding-left: 30px;
	list-style: circle;
}

.animal_reg_ul li {
	list-style: circle;
}

.flax_center {
	display: flex;
	align-items: center;
	text-align: center;
	justify-content: center;
}

.ml20 {
	margin-left: 20px;
	margin-right: 20px
}

.animal_reg_box {
	width: 280px;
	float: left;
	border: 1px solid #d1d3d4;
	border-radius: 10px;
	position: relative;
	padding: 20px;
}

@media only screen and (max-width:520px) {
	.animal_reg_box {
		width: 100%;
		float: none;
		margin: 0 0 0 0;
	}
	.flax_center {
		
	}
}

@charset "utf-8";

caption {
	left: -10000px;
	text-indent: -10000px;
	width: 1px;
	height: 1px;
	font-size: 0;
	overflow: hidden;
}

img {
	border: 0px;
}

body, div, ol, ul, li, dl, dt, dd, p, form {
	margin: 0px;
	padding: 0px;
}

#area_bg #board {
	float: left;
	clear: both;
	width: 680px;
	height: 100%;
	font-size: 12px;
	color: #666666;
}
/* 
#bd1,#pyo1,.search_box1 select,input,form,textarea,center,option,pre{color: #666666; font-family:NanumGothic, "�������,����"; font-size: 12px; text-decoration:none; line-height: 120%;} 
*/
#bd1, #pyo1 input {
	display: inline;
	vertical-align: middle;
}

.search_box1 input {
	display: inline;
	vertical-align: middle;
}

#bd1, #pyo1 select {
	display: inline;
	vertical-align: middle;
}

.search_box1 select {
	display: inline;
	vertical-align: middle;
}

/* �Խ��� �˻�  */
/*
.bbs_search {float:left; clear:both; width:680px; height:40px;}
*/
.bbs_search .search {
	padding: 9px 0px 0px 20px;
	float: left;
}

.bbs_search .bbs_search_input {
	background-color: #f9f9f9;
	border: 1px solid #ebebeb;
	color: #666666;
	font-size: 12px;
	font-family: "����,����ü";
	width: 200px;
	height: 17px;
	padding-top: 2px;
}

.bbs_search .bbs_search_select {
	background-color: #FFFFFF;
	border: 1px solid #ebebeb;
	color: #666666;
	font-size: 11px;
	font-family: "����,����ü";
	height: 21px;
	width: 90px;
}

.bbs_search .bbs_search_select2 {
	background-color: #FFFFFF;
	border: 1px solid #ebebeb;
	color: #666666;
	font-size: 11px;
	font-family: "����,����ü";
	height: 21px;
	width: 200px;
}

.bbs_search li {
	list-style: none;
}

.bbs_search .page_no {
	float: right;
}

.bbs_search .page_no li {
	list-style: none;
}

.bbs_search .organize_search {
	float: right;
}

.bbs_search .organize_search li {
	list-style: none;
	padding-left: 5px;
}

.bbs_searchbtn {
	float: left;
	margin-left: 5px;
	font-size: 0px;
	line-height: 0px;
}

.array_gobtn {
	float: right;
	margin-top: 1px;
	margin-left: 5px;
	font-size: 0px;
	line-height: 0px;
}

/* EPIS �Խ��� ��� ���� CSS */
#bd1 {
	float: left;
	width: 680px;
	border: 0px;
	padding-bottom: 30px;
}

#bd1 .blank {
	width: 100%;
	padding: 0;
	border: 1px dotted #e5e5e5;
	background-color: #ffffff;
}

#bd1 .bd1_t1 {
	width: 100%;
	border-bottom: 1px solid #e5e5e5;
}

#bd1 .bd1_t1 TH {
	border-top: 2px solid #194b82;
	border-bottom: 1px solid #194b82;
	height: 38px;
	color: #454545;
	font-weight: bold;
	font-size: 12px;
	text-align: center;
	font-family: ����;
}

#bd1 .bd1_t1 TH.start {
	width: 61px;
}

#bd1 .bd1_t1 TH.end {
	
}

#bd1 .bd1_t1 TD {
	height: 30px;
	padding-left: 0px;
	padding-top: 4px;
	padding-right: 0px;
	padding-bottom: 4px;
	color: #454547;
	font-size: 12px;
	font-family: ����;
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	background-position: bottom;
}

#bd1 .bd1_t1 TD.title {
	text-align: left;
}

#bd1 .bd1_t1 TD.title_bold {
	text-align: left;
	font-weight: bold;
}

#bd1 .bd1_t1 TD.title_left {
	text-align: left;
	word-break: break-all;
} /* 2019.10.25 JYJ �ٳ��� ���� */
#bd1 .bd1_t1 TD.faq_tdleft {
	text-align: left;
	background-color: #f9f9f9;
}

#bd1 .bd1_t1 TD.faq_tdcenter0 {
	text-align: center;
	background-color: #FFFFFF;
}

#bd1 .bd1_t1 TD.faq_tdcenter {
	text-align: center;
	background-color: #f9f9f9;
}

#bd1 .bd1_t1 TD a:link {
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD a:visited {
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD a:active {
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD a:hover {
	text-decoration: underline;
	color: #666666;
}

#bd1 .bd1_t1 TD.title a:link {
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD.title a:visited {
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD.title a:active {
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD.title a:hover {
	text-decoration: underline;
	color: #666666;
}

#bd1 .bd1_t1 TD.title_bold a:link {
	font-weight: bold;
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD.title_bold a:visited {
	font-weight: bold;
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD.title_bold a:active {
	font-weight: bold;
	text-decoration: none;
	color: #666666;
}

#bd1 .bd1_t1 TD.title_bold a:hover {
	font-weight: bold;
	text-decoration: underline;
	color: #666666;
}

#bd1 .newicon {
	margin-left: 10px;
}

#bd1 .lockicon {
	margin-left: 10px;
}

#bd1_1 {
	width: 680px;
	border: 0px
}

#bd1_1 .blank {
	width: 100%;
	padding: 0;
	border: 1px dotted #e5e5e5;
	background-color: #ffffff;
}

#bd1_1 .bd1_1_t1 {
	width: 100%;
	border-bottom: 1px solid #e5e5e5;
	border-spacing: 0;
}

#bd1_1 .bd1_1_t1 TH {
	border-top: 2px solid #194b82;
	border-bottom: 1px solid #194b82;
	background-position: right;
	height: 38px;
	color: #424242;
	font-weight: bold;
	font-size: 12px;
	text-align: center;
	font-family: ����;
}

#bd1_1 .bd1_1_t1 TH.start {
	width: 5px;
}

#bd1_1 .bd1_1_t1 TH.end {
	background-position: right;
}

#bd1_1 .bd1_1_t1 TD {
	height: 30px;
	padding-left: 0px;
	padding-top: 4px;
	padding-right: 0px;
	padding-bottom: 4px;
	color: #454547;
	font-size: 12px;
	font-family: ����;
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	background-position: bottom;
}

#bd1_1 .bd1_1_t1 TD.title {
	text-align: left;
}

#bd1_1 .bd1_1_t1 TD.title_bold {
	text-align: left;
	font-weight: bold;
}

#bd1_1 .bd1_1_t1 TD a:link {
	text-decoration: underline;
	color: #4040c8;
}

#bd1_1 .bd1_1_t1 TD a:hover {
	text-decoration: underline;
	color: #000000;
}

#bd1_1 .bd1_1_t2 {
	width: 100%;
	border-bottom: 1px solid #e5e5e5;
}

#bd1_1 .bd1_1_t2 TH {
	background: url('../images/common/sub/board/bd1_middle.gif');
	background-position: left;
	height: 38px;
	padding-left: 10px;
	color: #424242;
	font-weight: bold;
	font-size: 12px;
	text-align: left;
	font-family: ����;
}

#bd1_1 .bd1_1_t2 TH.start {
	background: url('../images/common/sub/board/bd1_start.gif');
	width: 5px;
}

#bd1_1 .bd1_1_t2 TH.end {
	background: url('../images/common/sub/board/bd1_end.gif');
	background-position: right;
}

#bd1_1 .bd1_1_t2 TD {
	height: 30px;
	padding-left: 0px;
	padding-top: 4px;
	padding-right: 0px;
	padding-bottom: 4px;
	color: #454547;
	font-size: 12px;
	font-family: ����;
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	background-position: bottom;
}

#bd1_1 .bd1_1_t2 TD.title {
	text-align: left;
}

#bd1_1 .bd1_1_t2 TD.title_bold {
	text-align: left;
	font-weight: bold;
}

#bd1_1 .bd1_1_t2 TD a:link {
	text-decoration: underline;
	color: #4040c8;
}

#bd1_1 .bd1_1_t2 TD a:hover {
	text-decoration: underline;
	color: #000000;
}

#bd1_1 .bd1_1_t3 {
	width: 100%;
	border-spacing: 0;
	table-layout: fixed;
	border-top: 2px solid #005eab;
	border-right: 1px solid #e5e5e5;
	word-break: break-all;
}

#bd1_1 .bd1_1_t3 th {
	height: 29px;
	padding: 2px;
	border-bottom: 1px solid #e5e5e5;
	border-left: 1px solid #e5e5e5;
	font-family: Malgun Gothic;
	font-size: 12px;
	color: #424242;
	text-align: center;
	background: #f7f7f7;
}

#bd1_1 .bd1_1_t3 th.bd {
	border-bottom: 1px solid #5c8db8;
}

#bd1_1 .bd1_1_t3 td {
	height: 29px;
	padding: 2px 5px;
	border-bottom: 1px solid #e5e5e5;
	border-left: 1px solid #e5e5e5;
	font-family: Malgun Gothic;
	font-size: 12px;
	color: #454547;
	text-align: left;
}

#bd1_1 .bd1_1_t3 td a:link {
	text-decoration: underline;
	color: #4040c8;
}

#bd1_1 .bd1_1_t3 td a:hover {
	text-decoration: underline;
	color: #000000;
}

#bd1_1 .bd1_1_t3 td.textC {
	text-align: center;
}

#bd1_1 .tblTitle {
	clear: both;
	font-family: Malgun Gothic;
	font-size: 14px;
	color: #464646;
	margin: 20px 0 10px 5px;
	font-weight: bold;
	padding-left: 20px;
	background: url('../images/renewal/dot.png') no-repeat 0 4px;
}

.bd1_detail {
	clear: both;
	width: 680px;
}

.bd1_detailtable {
	float: left;
	width: 680px;
	border: 1px solid #FFFFFF;
	background: #454545;
}

.bd1_detailtable thead {
	font-size: 12px;
	text-align: center;
	height: 35px;
	background-color: #eff9f9;
}

.bd1_detailtable tbody {
	text-align: left;
}

/* �Խ��� ���� */
.bd1_read {
	min-height: 200px;
}

.bd1_picture {
	width: 680px;
}

.bd1_read_opt {
	float: left;
	width: 660px;
	margin-left: 15px;
	color: #eb4848;
	margin-bottom: 10px;
}

.bd1_read_opt2 {
	width: 660px;
	margin-left: 15px;
	margin-top: 10px;
}

.opt_text {
	float: left;
	width: 60px;
	font-weight: bold;
}

.bd1_comment {
	float: left;
	width: 660px;
	color: #00479c;
	margin-bottom: 10px;
	font-size: 11px;
}

.tablein_comt {
	font-size: 11px;
	padding-left: 10px;
}

.tablein_radiobtn {
	float: left;
	padding-right: 20px;
}

.reply_opt {
	color: #ea6014;
	padding-left: 5px;
	font-weight: bold;
}

.bd1_listbtn {
	width: 680px;
	text-align: center;
	margin-top: 30px;
}

.bd1_listbtn span {
	font-size: 0px;
	line-height: 0px;
	padding: 5px;
}

.icon_file {
	float: left;
	padding-right: 10px;
	width: 16px;
	height: 16px;
	background: url('../images/common/sub/board/fileicon.gif') no-repeat;
}

.icon_hwp {
	float: left;
	padding-right: 10px;
	width: 16px;
	height: 16px;
	background: url('../images/common/sub/board/icon_hwp.png') no-repeat;
}

.icon_excel {
	float: left;
	padding-right: 10px;
	width: 16px;
	height: 16px;
	background: url('../images/common/sub/board/icon_excel.png') no-repeat;
}

.icon_pdf {
	float: left;
	padding-right: 10px;
	width: 16px;
	height: 16px;
	background: url('../images/common/sub/board/icon_pdf.png') no-repeat;
}

.icon_pptx {
	float: left;
	padding-right: 10px;
	width: 16px;
	height: 16px;
	background: url('../images/common/sub/board/icon_pptx.png') no-repeat;
}

.icon_word {
	float: left;
	padding-right: 10px;
	width: 16px;
	height: 16px;
	background: url('../images/common/sub/board/icon_word.png') no-repeat;
}

.icon_zip {
	float: left;
	padding-right: 10px;
	width: 16px;
	height: 16px;
	background: url('../images/common/sub/board/icon_zip.png') no-repeat;
}

.icon_swf {
	float: left;
	padding-right: 10px;
	width: 16px;
	height: 16px;
	background: url('../images/common/sub/board/icon_swf.png') no-repeat;
}

/* �������������� ���� */
.prev-next {
	width: 680px;
}

dl.prev-next {
	width: 100%;
	padding: 0;
	border-top: 1px solid #dbdbdb;
	border-bottom: 1px solid #e5e5e5;
}

dl.prev-next dt, dl.prev-next dd {
	padding: 0.6em 0 0.4em;
	background: url('../images/common/sub/board/view_bar.gif') no-repeat 5em
		0.9em;
}

dl.prev-next dt {
	float: left;
	padding-left: 15px;
	padding-right: 1.4em;
	font-size: 1em;
	color: #1B5463;
	font-weight: bold;
}

dl.prev-next dt.prev {
	background: url('../images/common/sub/board/view_prev.gif') no-repeat
		2px 50%;
}

dl.prev-next dt.next {
	background: url('../images/common/sub/board/view_next.gif') no-repeat
		2px 50%;
}

dl.prev-next dd.next {
	border-top: 1px dotted #B3D4D9;
}

dl.prev-next dt.file {
	color: #777777;
}

dl.prev-next dd {
	color: #666;
}

dl.prev-next dd a {
	color: #333;
}

dl.prev-next dd a:link, .dl.prev-next dd a:visited {
	text-decoration: none;
}

dl.prev-next dd a:hover, .dl.prev-next dd a:active {
	text-decoration: underline;
}

ul.memberList li {
	padding: 2px 0;
}

/* �Խ��� ����  */
.bbs {
	clear: both;
	width: 680px;
}

.bbs01 {
	float: left;
	clear: both;
	width: 640px;
	margin-bottom: 20px;
}

.bbs th {
	background: #f5f5f5;
	border-top: 1px solid #ddd;
	border-right: 1px solid #ddd;
	text-align: center;
	height: 30px;
	color: #666;
	font-size: 12px;
}

.bbs .th_left {
	background: #f5f5f5;
	border-top: 1px solid #ddd;
	border-right: 1px solid #ddd;
	text-align: left;
	padding-left: 20px;
	height: 30px;
	color: #666;
	font-size: 12px;
}

.bbs .th_left2 {
	background: #f5f5f5;
	border: 1px solid #ddd;
	text-align: left;
	padding-left: 20px;
	height: 30px;
	color: #666;
	font-size: 12px;
}

.bbs .th_left3 {
	background: #f5f5f5;
	border-top: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	text-align: left;
	padding-left: 20px;
	height: 30px;
	color: #666;
	font-size: 12px;
}

.bbs .th_comt {
	padding-left: 30px;
	font-size: 11px;
}

.bbs .th_rightbtn {
	float: right;
	padding-right: 10px;
	font-size: 0px;
	line-height: 0px;
}

.bbs .thr {
	background: #f5f5f5;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	text-align: center;
	height: 30px;
	color: #666;
	font-size: 12px;
}

.bbs .thr02 {
	background: #f5f5f5;
	border-right: none;
	text-align: center;
	height: 30px;
	color: #666;
	font-size: 12px;
}

.bbs td {
	height: 30px;
	border-top: 1px solid #ddd;
	padding-left: 10px;
	text-align: left;
	color: #666;
	font-size: 12px;
}

.bbs .td_bg03_inline {
	padding-left: 20px;
	padding-top: 15px;
	padding-bottom: 20px;
	border-bottom: 1px dotted #ddd;
}

.bbs .comment_cell {
	padding-left: 20px;
}

.bbs .cell_left {
	float: left;
	width: 80px;
}

.bbs .cell_cont {
	float: left;
	width: 450px;
}

.bbs .cell_right {
	padding-left: 5px;
}

td.lt {
	text-align: left;
}

td.cn {
	text-align: center;
}

.td_bg01 {
	background: #f5f5f5;
	border-top: 1px solid #ddd;
}

.td_bg02 {
	background: #f5f5f5;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.bbs .td_bg02_left {
	background: #f5f5f5;
	padding-left: 20px;
	text-align: left;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.bbs .td_option {
	float: right;
	position: absolute;
	right: 30px;
	padding-left: 15px;
	padding-right: 10px;
	font-size: 11px;
}

.bbs .td_option2 {
	float: right;
	position: absolute;
	right: 0px;
	padding-left: 15px;
	padding-right: 10px;
	padding-top: 2px;
	font-size: 11px;
	height: 17px;
}

.td_bg03 {
	border-bottom: 1px solid #ddd;
}

th.td_bg04 {
	background: #ffffff;
	border-top: 1px solid #ddd;
	border-right: none;
	text-align: left;
	padding-left: 5px;
}

.td_text {
	padding: 10px 20px;
}

.text_area5 {
	padding: 5px;
}

.text_area10 {
	padding: 10px;
}

.text_area20 {
	padding: 20px;
}

.text_area {
	padding: 0px 20px 20px 20px;
}

.bbs_bgline {
	background: url('../images/common/sub/board/bbs_bgline.gif') repeat-x
		left 0;
	height: 3px;
	font-size: 0px;
	line-height: 0px;
}

.bbs_searchno {
	float: right;
	padding-right: 5px;
}

.bbs_prev {
	float: right;
	position: relative;
	top: 7px;
	right: 10px;
	width: 7px;
	height: 4px;
	background: url('../images/common/sub/board/view_prev.gif') no-repeat;
}

.bbs_next {
	float: right;
	position: relative;
	top: 7px;
	right: 10px;
	width: 7px;
	height: 4px;
	background: url('../images/common/sub/board/view_next.gif') no-repeat;
}

.bbs a:active {
	font-size: 12px;
	font-weight: none;
	color: #666666;
	text-decoration: none;
}

.bbs a:visited {
	font-size: 12px;
	font-weight: none;
	color: #666666;
	text-decoration: none;
}

.bbs a:link {
	font-size: 12px;
	font-weight: none;
	color: #666666;
	text-decoration: none;
}

.bbs a:hover {
	font-size: 12px;
	font-weight: none;
	color: #666666;
	text-decoration: underline;
}

/* �Խ��� ����Ʈ ������ �ѹ� */
.page_num1 {
	font-size: 11px;
	font-weight: none;
	font-family: ����;
	color: #CCCCCC;
	text-decoration: none;
	letter-spacing: 2px;
}

.page_num1 a:active {
	font-size: 12px;
	font-weight: none;
	font-family: ����;
	color: #666666;
	text-decoration: none;
}

.page_num1 a:visited {
	font-size: 12px;
	font-weight: none;
	font-family: ����;
	color: #666666;
	text-decoration: none;
}

.page_num1 a:link {
	font-size: 12px;
	font-weight: none;
	font-family: ����;
	color: #666666;
	text-decoration: none;
}

.page_num1 a:hover {
	font-size: 12px;
	font-weight: none;
	font-family: ����;
	color: #3565cb;
	text-decoration: none;
}

.page_num1_thin {
	font-size: 12px;
	font-weight: bold;
	font-family: ����;
	color: #3565cb;
	text-decoration: none;
	letter-spacing: 2px;
}

/* ���Ŀ� ���� ���� (����) 111*/
.row_1px {
	width: 1px;
	height: 1px;
	font-size: 0px;
}

.row_2px {
	width: 1px;
	height: 2px;
	font-size: 0px;
}

.row_3px {
	width: 1px;
	height: 3px;
	font-size: 0px;
}

.row_4px {
	width: 1px;
	height: 4px;
	font-size: 0px;
}

.row_5px {
	width: 1px;
	height: 5px;
	font-size: 0px;
}

.row_6px {
	width: 1px;
	height: 6px;
	font-size: 0px;
}

.row_7px {
	width: 1px;
	height: 7px;
	font-size: 0px;
}

.row_8px {
	width: 1px;
	height: 8px;
	font-size: 0px;
}

.row_9px {
	width: 1px;
	height: 9px;
	font-size: 0px;
}

.row_10px {
	width: 1px;
	height: 10px;
	font-size: 0px;
}

.row_20px {
	width: 1px;
	height: 20px;
	font-size: 0px;
}

.row_30px {
	width: 1px;
	height: 30px;
	font-size: 0px;
}

.row_40px {
	width: 1px;
	height: 40px;
	font-size: 0px;
}

.row_50px {
	width: 1px;
	height: 50px;
	font-size: 0px;
}

/* �����Ϳ� ���̺� CSS */
.editor_table {
	float: left;
	width: 650px;
	margin-left: 15px;
	margin-bottom: 30px;
}

.editor_table628 {
	float: left;
	width: 628px;
	margin-bottom: 20px;
	margin-top: 7px;
}

.editor_table655 {
	float: left;
	width: 655px;
	margin-bottom: 20px;
	margin-top: 7px;
}

.editor_table645 {
	float: left;
	width: 645px;
	margin-bottom: 20px;
	margin-top: 7px;
}

TABLE#pyo1 {
	background-color: #c8d0de;
	border: 0;
	border-top-color: #c8d0de;
	border-top-style: solid;
}

TABLE#pyo1 th {
	background-color: #f4f6f8;
	padding: 5px;
	border-spacing: 1px;
	font-size: 11px;
	color: #26406e;
	line-height: 15px;
	border: 1px;
	font-weight: bold;
	text-align: center;
}

TABLE#pyo1 td {
	background-color: #FFFFFF;
	padding: 5px;
	border-spacing: 1px;
	font-size: 11px;
	color: #26406e;
	line-height: 13px;
	border: 1px;
}

TABLE#pyo1 TD#title1 {
	background-color: #f3f3f3;
	padding: 5px;
	border-spacing: 1px;
	font-size: 11px;
	color: #89AB3A;
	line-height: 13px;
	border: 1px;
	font-weight: bold;
}

TABLE#pyo1 TD.center {
	text-align: center;
}

TABLE#pyo1 TD.center_color {
	text-align: center;
	background-color: #dfe8f0;
}

TABLE#pyo1 TD.center_colorbold {
	text-align: center;
	font-weight: bold;
	background-color: #dfe8f0;
}

TABLE#pyo1 TD.left_colorbold {
	text-align: left;
	font-weight: bold;
	background-color: #dfe8f0;
}

TABLE#pyo1 TD.left_topalign {
	background-color: #FFFFFF;
	padding: 5px;
	border-spacing: 1px;
	font-size: 11px;
	letter-spacing: -1px;
	color: #444;
	line-height: 160%;
	vertical-align: top;
	border: 1px;
}

TABLE#pyo1 TD.left_centeralign {
	background-color: #FFFFFF;
	padding: 5px;
	border-spacing: 1px;
	font-size: 11px;
	color: #444;
	line-height: 180%;
	vertical-align: middle;
	border: 1px;
}

#pyo1 TD a:link {
	color: #ee7000;
	text-decoration: underline;
}

#pyo1 TD a:visited {
	color: #ee7000;
	text-decoration: underline;
}

#pyo1 TD a:active {
	color: #000000;
	text-decoration: underline;
}

#pyo1 TD a:hover {
	color: #000000;
	text-decoration: underline;
}

TABLE#pyo2 {
	background-color: #d3d3d3;
	border: 0;
	border-top-color: #d3d3d3;
	border-top-style: solid;
}

TABLE#pyo2 th {
	background-color: #f6f6f6;
	padding: 5px;
	border-spacing: 1px;
	font-size: 11px;
	color: #5f5f5f;
	line-height: 15px;
	border: 1px;
	font-weight: bold;
	text-align: center;
}

TABLE#pyo2 td {
	background-color: #fafafa;
	padding: 5px;
	border-spacing: 1px;
	font-size: 11px;
	color: #717171;
	line-height: 13px;
	border: 1px;
}

TABLE#pyo2 TD.center {
	text-align: center;
}

.td_text_bold {
	font-weight: bold;
	font-size: 12px;
	line-height: 220%;
	color: #000000;
}

.intable_span {
	float: left;
	width: 100%;
}

.intable_span_bold {
	float: left;
	font-weight: bold;
	width: 100%;
}

.intable_span2 {
	float: left;
	width: 100%;
	padding-left: 8px;
}

.tabletop_right {
	float: right;
	position: relative;
	right: 5px;
	font-size: 11px;
}

.bd1_read img {
	max-width: 100%
}

.img100 {
	width: 100% !important
}
</style>
</head>
<body>
	<div id="content">


		<div id="content_topbg0" class="sub_tit">
			<h3 id="contentTitle">�Ϲ�����</h3>
		</div>


		<script>
			$(function() {
				var category = "��������";
				$("#left_title").html(category);
				$('.visual > dl > dt').html(category);
			});
		</script>


		<div id="sub_con" class="sub_con">
			<!-- ������ ����  �����ϼ��� ���� -->
			<!-- �� ���� ���� -->


			<!-- ���� ���� -->
			<div class="area_bg">
				<div class="sub_con">


					<!-- �Ϲ����� -->
					<div class="txt_l">

						<p class="blue_tit">������ ���������� ��� ��(������ȣ�� �����Ģ ��3�� ��ǥ1)</p>

						<h4 class="bullet01">�Ϲݱ���</h4>

						<div class="mb30 con_txt">
							<span class="green bold">��. </span>������ �����ڵ��� ������ ������������ ���� ������ ����� �� ������ ��ȣ�ϰ� ������ �����Ͽ��� �Ѵ�.<br> <span class="green bold">��. </span>������ �����ڵ��� ������ �Ͽ��� �����������, ����ҷ�, ������, �������λ������, �η���� ���������� �ൿ�� �� ���� ������ ���Ͽ� ������ ���� �ƴ��ϵ��� ����Ͽ��� �Ѵ�.<br> <span class="green bold">��. </span>������ �����ڵ��� �����������ϴ� ������ ������ ���������ν� �ִ��� ������ ������ ������ �����������ϰ�, ������ ��ȣ�� ������ å�Ӱ��� ������ �Ѵ�.
						</div>

						<h4 class="bullet01">��������</h4>
						<div class="con_txt">
							<span class="green bold">��. ����ȯ��</span><br>
							<ul class="num1">
								<li class="first">1) ������ ����, ũ��, Ư��, �ǰ�����, ���� ���� ���� ����Ͽ� �ִ��� ������ ����ȯ���� �����Ͽ��� �Ѵ�.</li>
								<li class="last">2) ������ �������� �� �����ü��� ������ �ڿ������� �ڼ��� �Ͼ�ų� ���ų� �����̴� �� �ϻ����� ������ �ϴ� ���� ������ ���� ũ���̾�� �Ѵ�.</li>
							</ul>
						</div>

						<div class="con_txt">
							<span class="green bold">��. �ǰ�����</span><br>
							<ul class="num1">
								<li class="first">1) ������ ������ ���Ͽ� ���������� ������ Ư���� ���� ���������� �Ͽ��� �Ѵ�.</li>
								<li class="last">2) ���� �б⸶�� 1ȸ �̻� ������ �Ͽ��� �Ѵ�.</li>
							</ul>
						</div>

						<hr>

						<p class="blue_tit">�����Ǹž����� �ؼ����� �� �ֿϵ��� �Ǹž��� ���� �Һ��ں����ذ� ����</p>

						<h4 class="bullet01">�����Ǹž����� �ؼ�����</h4>
						<div class="mb30 con_txt">
							<span class="green bold">��. </span>������ ����(����) �̻��� ������ �Ǹ�, �˼� �Ǵ� �߰��ؾ� �Ѵ�.<br>
							<ul class="num1">
								<li class="first">1) ���������: 2���� �̻�</li>
								<li class="last">2) �� ���� ����: ����(����) �� ������ ��� �� ���̸� ���� �� �ִ� ����</li>
							</ul>
							<span class="green bold">��. </span>�̼����ڿ��Դ� ������ �Ǹ�, �˼� �Ǵ� �߰��ؼ��� �� �ȴ�.<br> <span class="green bold">��. </span>���� �Ǹ�, �˼� �Ǵ� �߰� �� �ش� ������ ���� ������ ������ �����ڿ��� �ݵ�� �˷��־�� �Ѵ�. <br>
							<ul class="num1">
								<li class="first">1) ������ ����, Ư¡ �� �������</li>
								<li class="last">2) ��ϴ�󵿹��� �Ǹ��ϴ� ��� ��Ϲ��, ��ϱ��� �� ������������� ���γ���</li>
							</ul>
							<span class="green bold">��. </span>���Һ��ڱ⺻�� ����ɡ� ��8����3�׿� ���� �Һ��ں����ذ���ؿ� ���� ������ ������ ������ ��༭�� �ش� ������ �����ϴ� ������ �Ǹ��� �� �����ؾ� �ϸ�, ��༭�� ������ �ǹ��� ������ ������ ����(���ڻ�ŷ� ������� �Ǹ��ϴ� ��쿡�� ���ͳ� Ȩ������ �Ǵ� �޴���ȭ���� ���Ǵ� �������α׷��� �����Ѵ�)�� �� ���̴� ���� �Խ��ؾ� �Ѵ�. <br>
							<ul class="num1">
								<li class="first">1) �����Ǹž� ��Ϲ�ȣ, ���Ҹ�, �ּ� �� ��ȭ��ȣ</li>
								<li>2) ������ ������� �� �Ǹž��ڰ� �Լ��� ��</li>
								<li>3) ������ ����(����)�� ��������(����)���� ���Ҹ� �� �ּ�</li>
								<li>4) ������ ����, ǰ��, ���� �� �Ǹ� ���� Ư¡</li>
								<li>5) ��������, �๰���� �� ���ǻ��� ġ���� ��</li>
								<li>6) �Ǹ� ���� �ǰ����¿� �� ��������</li>
								<li>7) �Ǹ��� �� �Ǹűݾ�</li>
								<li>8) �Ǹ��� �������� ���� �Ǵ� ��� �� �ǰ����� ������ ���� ����� ó�����</li>
								<li class="last">9) ��ϵ� ������ ��� �� ��ϳ���</li>
							</ul>
							<span class="green bold">��. </span>��.�� ���� ��༭�� ���ô� ������ ����, �����Ǹž��ڴ� ���� ��༭�� ��������� �߰��ϰų� ������ �����ϴ� �� �����ؼ� ����� �� �ִ�.<br> <span class="green bold">��. </span>��ǥ 9 ��2ȣ����2)�� ���� ������ ������ ���� ������ ��Ź���� ���� ������ �ŷ��� �˼����߰��ؼ��� �� �ȴ�.<br> <span class="green bold">��. </span>�¶����� ���� ȫ���ϴ� ��쿡�� ��Ϲ�ȣ, ���Ҹ�, �ּ� �� ��ȭ��ȣ�� �� ���̴� ���� ǥ���ؾ� �Ѵ�.<br> <span class="green bold">��. </span>�����Ǹž��� �� ��Ź���� ���� �ŷ��� �˼����߰��ϴ� �����Ǹž��ڴ� ���� ������ �ؼ��ؾ� �Ѵ�.<br>
							<ul class="num1">
								<li class="first">1) ��ż����Ḧ ��������ڿ��� �̸� �˷��� �Ѵ�.</li>
								<li>2) ��������� ���塤��������û�忡�� ����� 10�� ������ �뺸�ؾ� �ϰ�, �뺸�� ������ �����Ϸ��� ��쿡�� ���塤��������û�忡�� ����� 3�� ������ �뺸�ؾ� �Ѵ�.</li>
								<li>3) ��ŵǴ� ������ ���� ���ǻ�� ��η��� ���� ������ �ؾ� �Ѵ�</li>
								<li>4) �غ�ǿ����� ��ŵǴ� ������ �ĺ��� �����ϵ��� �����ؾ� �Ѵ�.</li>
								<li>5) ��ſ� �����ϴ� �ڿ��� ��ŵǴ� ������ �����ڿ� ������ �ǰ����¿� ���� ������ �����ؾ� �Ѵ�.</li>
								<li class="last">6) ��� ��Ȳ�� ��ȭ�Ͽ� 30�ϰ� �����ؾ� �Ѵ�.</li>
							</ul>
							<span class="green bold">��. </span>���� ��30ȣ������ ������ ���� ������ ���� ���� 1�� ���ϱ��� �������������û�忡�� �����ؾ� �Ѵ�. <br>
						</div>

						<hr>

						<h4 class="bullet01">�Һ��ں����ذ����(�����ŷ�����ȸ��� ��2019-3ȣ)</h4>
						<table class="tbl01" summary="�ֿϵ����Ǹž��� ��������, �ذ����, ��� ������ ������ ����">
							<caption>�Һ��ں��������� �ذ����</caption>
							<colgroup>
								<col width="20%">
								<col width="*">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th colspan="3" class="first last">�ֿϵ����Ǹž� (��, ����̿� ����)</th>
								</tr>
								<tr>
									<th class="first">��������</th>
									<th>�ذ����</th>
									<th class="last">���</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="txt_l first">1) ���� �� 15�� �̳� ��� ��</td>
									<td class="txt_l">������ �ֿϵ����� ��ȯ �Ǵ� ���԰� ȯ��(��, �Һ����� �ߴ��� ���Ƿ� ���Ͽ� ���ذ� �߻��� ��쿡�� ����� �䱸�� �� ����)</td>
									<td class="last"></td>
								</tr>
								<tr>
									<td class="txt_l first">2) ���� �� 15�� �̳� ���� �߻�</td>
									<td class="txt_l">�Ǹž���(�����)�� ���ݺ���� �δ��Ͽ� ȸ������ �Һ��ڿ��� �ε�. �ٸ�, ���� å������ ȸ���Ⱓ�� 30���� ����ϰų�, �Ǹž��� ���� �� ��� �ÿ��� ������ �ֿϵ����� ��ȯ �Ǵ� ���԰� ȯ��</td>
									<td class="last"></td>
								</tr>
								<tr>
									<td class="txt_l first">3) ��༭ �̱��� ��</td>
									<td class="txt_l">�������(��, ���� �� 7�� �̳�)</td>
									<td class="last"></td>
								</tr>
							</tbody>
						</table>

						<hr>

						<p class="blue_tit">�ݷ������� ���߱��� �̿��ϱ�</p>

						<div class="mb30 con_txt">
							<h4 class="bullet01">�ڰ�����</h4>
							<b>�ݷ������� ���� ���¿����� ��������</b>
							<ul class="arr_blue">
								<li class="first">���� ���� �����ؼ� �ݷ������� �̵��� �� �ֽ��ϴ�. �ٸ�, ���������� ���� �ݷ������� ���� ���·� �����ؼ��� �� �˴ϴ�(�����α������ ��39����5��).</li>
								<li class="last">���� ������ �ݷ������� ȣ������� �̸����� �����̰ų� ���۽����� �����ൿ�� �� ���, ������ �ɰ��� ���ذ� �Ǿ� �������������� ������ �����ϰ� �˴ϴ�. �׷��Ƿ� �ٸ� �������� ������ ���ؼ� �ݷ������� �Ȱ� �����ϴ� ������ �ؼ��� �� �˴ϴ�.<br> �� �̸� ������ �ݷ������� ���� ���·� �����ϸ� 20���� ������ �����̳� ���� �Ǵ� ���ῡ ó�� �� �ְ�(�����α������ ��156����1ȣ), 5������ ��Ģ���� �ΰ��޽��ϴ�(�����α������ ��162��, �����α���� ����ɡ� ��93����1�� �� ��ǥ 8 ��33ȣ).
								</li>
							</ul>
						</div>



						<h4 class="bullet01">����� ������ ž�� �ź� ����</h4>
						<div class="mb30 con_txt">
							<b>����� ������ ž�� �ź� ����</b>
							<ul class="arr_blue">
								<li class="first last">�������� ����� ������ǥ���� ���� ����� �������� ������ ������� ���߱�������� �̿��Ϸ��� �� ������ ������ ���� ���� �ź��ؼ��� �� �˴ϴ�(������κ������� ��40����3�� ����).<br> �� �̸� ������ ����� ������ǥ���� �ִµ� ������ ���� ���� ����� �������� ž���� �ź��ϸ� 300���� ������ ���·Ḧ �ΰ��޽��ϴ�(������κ������� ��90����3����3ȣ, ������κ����� ����ɡ� ��46�� �� ��ǥ 5 ��2ȣ�ٸ�).
								</li>
							</ul>
						</div>


						<h4 class="bullet01">�ó�����</h4>
						<div class="mb30 con_txt">
							<b>�̵���� �ִ� �� ������ġ�� ���� �� ž���ϱ�</b>
							<ul class="arr_blue">
								<li class="first last">�ó������� �̿��ؼ� �ݷ������� �̵��ϴ� ���� ������ ���� �� �ֽ��ϴ�. �������ȸ�縶�� ��۾���� ������ħ�� ���� �ణ�� ���̰� �ֱ� ������, ��κ��� ��� �ݷ������� ũ�Ⱑ �۰� ��ݿ�⸦ ���� ��쿡�� ž���� ����ϰ� �ֱ� �����Դϴ�(�������ڵ��� ���������� ��9��, ������Ư���� �ó����� ��ۻ�� ����� ��10����3ȣ). ���� �̿��Ϸ��� �ó������� ���ȸ�翡 �̸� �ݷ������� ž�°��� ���θ� �˾ƺ��ô� ���� �����ϴ�.<br> �� �̸� �����ϸ� ž���� ������ �� �ֽ��ϴ�(������Ư���� �ó����� ��ۻ�� ����� ��12����1ȣ �� ��2ȣ).
								</li>
							</ul>
						</div>

						<h4 class="bullet01">��ӹ������ÿܹ���</h4>
						<div class="con_txt">
							<b>�̵���� �ִ� �� ������ġ�� ���� �� ž���ϱ�</b>
							<ul class="arr_blue">
								<li class="first last">��ӹ��� �Ǵ� �ÿܹ����� �̿��ؼ� �ݷ������� �̵��ϴ� ���� ������ ���� �� �ֽ��ϴ�. �������ȸ�縶�� ��۾���� ������ħ�� �ణ�� ���̰� �ֱ� ������, ��κ��� ��� �����̵���� ���� �ݷ������� ž���� ����ϰ� �ֱ� �����Դϴ�(�������ڵ��� ���������� ��9��, ����ӹ��� ��ۻ�� ��۾���� ��25����2ȣ, ����⵵ �ÿܹ��� ��ۻ�� ��۾���� ��22����3ȣ). ���� �̿��Ϸ��� ��ӹ����� �ÿܹ����� ���ȸ�翡 �̸� �ݷ������� ž�°��� ���θ� �˾ƺ��ô� ���� �����ϴ�.<br> �� �̸� �����ϸ� ž���� ������ �� �ֽ��ϴ�(����ӹ��� ��ۻ�� ��۾���� ��20����2ȣ, ����⵵ �ÿܹ��� ��ۻ�� ��۾���� ��17����2ȣ �� ��27����1ȣ).
								</li>
							</ul>
						</div>

						<hr>

						<p class="blue_tit">��ö(����ö��������ö��)</p>
						<div class="con_txt">
							<b>�̵���� �ִ� �� ������ġ�� ���� �� ž���ϱ�</b>
							<ul class="arr_blue">
								<li class="first last">������ö �Ǵ� ����ö���� �̿��ؼ� �ݷ������� �̿��ϴ� ���� ������ ���� �� �ֽ��ϴ�. �ݷ������� �̵���� �־� ������ �ʰ� �ϰ�, ������ ������ �߻����� �ʰ� �ϴ� �� �ٸ� �������� ������ �� ������ ������ ������ġ�� ���� �� ž���ؾ� �ϱ� �����Դϴ�(������ö������ ��32��, ������ö�� ������� ����� ��31����2ȣ, ��32����1��, �����ﱳ����� ������۾���� ��34����1����4ȣ).<br> �� �̸� �����ϸ� ž���� ������ �� �ֽ��ϴ�(������ö�� ������� �������6����3����3ȣ, �����ﱳ����� ������۾���� ��36��).
								</li>
							</ul>
						</div>


						<h4 class="bullet01">����</h4>
						<div class="mb30 con_txt">
							<b>�̵���� �ִ� �� ������ġ�� ���� �� ž���ϱ�</b>
							<ul class="arr_blue">
								<li class="first last">ö���� �̿��ؼ� �ݷ������� �̵��ϴ� ���� ������ ���� �� �ֽ��ϴ�. �� �ݷ�����(�̵���� ����)�� ũ�Ⱑ �¼� �Ǵ� ��θ� �������� �ʴ� ���� �̳��� ���ѵǸ�, �� �ٸ� ������� ���س� ������ ��ĥ ������ ���� �ݷ������� ���밡�� � �־� �ܺη� ������� �ʰ� �ϰ�, ���ߺ� �������� �� �ʿ��� ���������� �� ��� �� ������ġ�� ���� �� ž���ؾ� �ϱ� �����Դϴ�(��ö���������� ��47����1����7ȣ, ��ö�������� �����Ģ�� ��80����1ȣ, ���ѱ�ö������ ������۾���� ��22����1����2ȣ).<br> �� �̸� �����ϸ� ž���� �����ǰų� �����ġ�� �� ������(��ö���������� ��50����4ȣ, ���ѱ�ö������ ������۾���� ��5����1�ס���2��), ���� �� 5������ ���·Ḧ �ΰ��޽��ϴ�(��ö���������� ��81����1����11ȣ, ��ö�������� ����ɡ� ��64�� �� ��ǥ 6 ��2ȣ���).
								</li>
							</ul>
						</div>


						<h4 class="bullet01">�����</h4>
						<div class="mb30 con_txt">
							<b>ž�°��� ���� �����ϱ�</b>
							<ul class="arr_blue">
								<li class="first last">����⸦ �̿��ؼ� �ݷ������� �̵��ϴ� ���� ������ ���� �� �ֽ��ϴ�. �װ��縶�� ��۾���� ������ħ�� �ణ�� ���̰� �ֱ� ������, ���� �װ������ �Ϲ������� ž�� ������ �ݷ������� ���� 8�ְ� ���� ��, �����, ���� �����ϰ�, ���� ������ ���� 5��7kg ������ ��� �⳻������ �����ϸ�, �� �̻��� ��Ź���Ϲ��� ����ؾ� �մϴ�(���װ�������� ��62����1��, �������װ� ����������۾���� ��31��, �������װ� ����������۾���� ��10����9ȣ, ���ƽþƳ� ����������۾���� ��29��, ���ƽþƳ� ����������۾���� ��9����10ȣ).</li>
							</ul>

							<b>������ �غ��ϱ�</b>
							<ul class="arr_blue">
								<li class="first last">�������� �����ġ�� �ְ� �ٴ��� ����Ǿ�� �մϴ�. �װ��縶�� Ư�� �������� �䱸�� �� �����Ƿ� ������ Ȯ���ؾ� �մϴ�.</li>
							</ul>

							<b>�װ��翡 ���Ϲ����� ��û�ϱ�</b>
							<ul class="arr_blue">
								<li class="first">����⸦ �̿��ؼ� �ݷ������� �̵��� ��쿡�� �̿��Ϸ��� �װ��翡 �����ؼ� �̸� ����� �� �ݷ����� ���Ϲ����񽺸� ��û�ϴ� ���� �����ϴ�. �װ��縶�� ��۾���� � ��ħ�� �ణ�� ���̰� �־� �Ϻ� �װ����� ��� �ݷ������� ��(��) �Ǵ� ���߷�(��ݿ�⸦ ����)�� ���� �⳻ ���� �Ǵ� ���Ϲ� ���񽺰� ������ �� �ֽ��ϴ�.</li>
								<li class="last">�ݷ������� ��ݺ���� ������ ���� ���Ϲ� ��뷮�� ������� �ݷ������� ���߷�(��ݿ�⸦ ����)�� �������� �ʰ� ���Ϲ� ����� ����˴ϴ�(�������װ� ����������۾���� ��31����2ȣ�ٸ�, �������װ� ����������۾���� ��10����9ȣ���, ���ƽþƳ� ����������۾���� ��29����2ȣ�ٸ�, ���ƽþƳ� ����������۾���� ��9����10ȣ�ٸ�).</li>
							</ul>
						</div>

						<h4 class="bullet01">�� ���� �������</h4>
						<div class="con_txt">
							<b>�ý�</b>
							<ul class="arr_blue">
								<li class="first last">�ýÿ� �ݷ������� �Բ� ž���� �� �ִ����� �ýû���ڰ� ���ϴ� ��۾�� �Ǵ� ������ħ�� ���� �����˴ϴ�(�������ڵ��� ���������� ��9��).</li>
							</ul>

							<b>���ȿ�����</b>
							<ul class="arr_blue">
								<li class="first last">���ȿ������� �̿��ؼ� �ݷ������� �̵��ϴ� ���� ������ ���� �� �ֽ��ϴ�. ���ȿ���ȸ�縶�� ��۾���� ������ħ�� �ణ�� ���̰� �ֱ� ������, ��κ��� ��� �����̵���� ���� �ݷ������� ž���� ����ϰ� �ֱ� �����Դϴ�(���ؿ���� ��11����2, �����ȿ����� ��۾���� ��29����3��). ���� �̿��Ϸ��� ���ȿ���ȸ�翡 �̸� �ݷ������� ž�°��� ���θ� �˾ƺ��ô� ���� �����ϴ�.</li>
							</ul>

							<b>ȭ���ڵ���</b>
							<ul class="arr_blue">
								<li class="first last">�ݷ������� ���� ���߱�������� �̿��ϴ� ���� ����� ��쿡�� ȭ������� �̿��ϴ� �͵� �� ����Դϴ�. �ݷ������� �߷��� 20kg�̻��̰ų�, �������� �ִ� ������ ��쿡�� ���� ȭ���ڵ����� �ݷ������� ������ �� �ֽ��ϴ�(��ȭ���ڵ��� ���������� ��2����3ȣ, ��ȭ���ڵ��� �������� �����Ģ�� ��3����2).</li>
							</ul>
						</div>


						<hr>


						<p class="blue_tit">�������ÿ����� �ֿϵ��� ����</p>
						<h4 class="bullet01">�������ù� ����� ��19��(�����Ծ��� ��Ģ)</h4>
						<div class="con_txt">
							<ul class="num1">
								<li class="first">�� - ���� -</li>
								<li class="last">�� �����ڵ��� ���� �� ȣ�� ��� �ϳ��� �ش��ϴ� ������ �Ϸ��� ��쿡�� ������ü�� ���Ǹ� �޾ƾ� �Ѵ�. &lt;���� 2017. 1. 10., 2018. 11. 20.&gt;
									<ul class="num1">
										<li class="first last">4. ����(����� �������� �����Ѵ�)�� �����ϰų� ��۽ü� ���� ��������ν� �����ְŻ�Ȱ�� ���ظ� ��ġ�� ����</li>
									</ul>
								</li>
							</ul>
						</div>

					</div>
					<!-- �Ϲ����� -->

				</div>
			</div>



			<div class="bbs">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>

				</table>
			</div>

			<!-- ������ ���� �����ϼ��� �� -->
		</div>


	</div>
</body>
</html>
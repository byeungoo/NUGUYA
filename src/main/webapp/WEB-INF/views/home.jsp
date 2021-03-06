<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>누구야 - 인물 맞추기 게임</title>
	<link href="/nuguya/resources/app.css" rel="stylesheet"></head>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-153425898-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-153425898-1');
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>

    <header class="header">
    <a href="/nuguya"><h1 class="header_logoname">NUGUYA</h1></a>
</header>

    <main class="home-main">
        <ul class="unit-wrap">
          <c:forEach items="${writingDtlDtoList}" var="writingDtlDto">
            <li class="unit-wrap_item">
                <a href="detail?writing_no=${writingDtlDto.writing_no}">
                    <section class="unit">
                        <img src="http://2weeks.io${writingDtlDto.title_img_path}" alt="카드 이미지" class="unit_img unit_img--sm">
                        <span class="unit_tit">${writingDtlDto.title}</span>
                    </section>
                </a>
            </li>
          </c:forEach>
        </ul>
    </main>
    

    <script src="<c:url value="/resources/app.js" />"></script>
    <script src="<c:url value="/resources/server.js" />"></script>

</html>
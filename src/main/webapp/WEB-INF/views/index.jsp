<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NUGUYA</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" type="text/css" href="/nuguya/resources/vendor/bootstrap/css/bootstrap.css">

  <!-- Custom styles for this template -->          
  <link rel="stylesheet" type="text/css" href="/nuguya/resources/css/shop-homepage.css">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">NUGUYA</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

	  <!-- 네비게이션바 
      <div class="col-lg-3">
        <h1 class="my-4">Shop Name</h1>
        <div class="list-group">
          <a href="#" class="list-group-item">연예인 맞추기</a>
        </div>
      </div>
	  -->
	  
      <div class="col-lg-9">
		<!-- 메인 데이터 -->
        <div class="row">
		  <c:forEach items="${writingDtlDtoList}" var="writingDtlDto">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="detail?writing_no=${writingDtlDto.writing_no}"><img class="card-img-top" src="..${writingDtlDto.title_img_path}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="detail?writing_no=${writingDtlDto.writing_no}">${writingDtlDto.title}</a>
                </h4>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
		  </c:forEach>
        </div>
        
      </div>
    </div>
  </div>


  <!-- 하단 Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; pickvs.com 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- 부트스트랩 자바 스크립트 -->
  <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>
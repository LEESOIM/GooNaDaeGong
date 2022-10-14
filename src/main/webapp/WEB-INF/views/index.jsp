<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>구디나라 대기공주</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/resources/css/index/index.css" rel="stylesheet">
</head>
<body>
	<!-- Wrap Start -->
	<div class="wrap">
		<c:import url="./template/header.jsp"></c:import>

		<section>
			
			<!-- Carousel Start -->
			<div id="carouselExampleInterval" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true"	 aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<img src="/resources/images/index/1.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="/resources/images/index/2.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/resources/images/index/3.jpg" class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- Carousel End -->

			<div class="products">
				<h1>최신 제품</h1>
				<c:forEach items="${newlist}" var="list">
				<a href="/item/detail?item_num=${list.item_num}"> 
					<img src="/resources/upload/item/${list.itemFileDTOs[0].fileName}">
<%-- 					<p>${list.item_title}</p>
					<p class="price">
					<fmt:formatNumber value="${list.item_price}" pattern="###,###"/>
					원
					</p> --%>
				</a>
				</c:forEach>
				
				<div class="clearfix"></div>
			</div>
							<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			<img alt="" src="//file.spigen.co.kr/_data/old_attach/store/main/main_banner/2022/0809_galaxy_z/mb_ipad_pc.jpg" style="margin-left: 50px;">
			<img alt="" src="//file.spigen.co.kr/_data/old_attach/store/main/main_banner/2022/0907_apple/mb_apple_watch_pc.jpg">
			<img alt="" src="//file.spigen.co.kr/_data/old_attach/store/main/main_banner/2022/0809_galaxy_z/mb_airpods_pc.jpg">
			<img alt="" src="http://file.spigen.co.kr/_data/old_attach/store/main/main_banner/2022/0809_galaxy_z/mb_macsafe_pc.jpg" style="width: 1519px;">
			<img alt="" src="http://file.spigen.co.kr/_data/old_attach/store/main/main_banner/2022/0809_galaxy_z/mb_galaxy_fold4_pc.jpg" style="width: 1519px;">
			
			<div class="products" style="margin-bottom: 250px;">
				<h1>인기 상품</h1>
				<c:forEach items="${poplist}" var="pop">
				<a href="/item/detail?item_num=${pop.item_num}"> 
					<img src="/resources/upload/item/${pop.itemFileDTOs[0].fileName}">
<%-- 					<p>${pop.item_title}</p>
					<p class="price">
					<fmt:formatNumber value="${pop.item_price}" pattern="###,###"/>
					원
					</p> --%>
				</a>
				</c:forEach>
				<div class="clearfix"></div>
			</div>
			
			<div class="products">
				<h1>추천 상품</h1>
				<c:forEach items="${recommendlist}" var="recommend">
				<a href="/item/detail?item_num=${recommend.item_num}"> 
					<img src="/resources/upload/item/${recommend.itemFileDTOs[0].fileName}">
<%-- 					<p>${recommend.item_title}</p>
					<p class="price">
					<fmt:formatNumber value="${recommend.item_price}" pattern="###,###"/>
					원
					</p> --%>
				</a>
				</c:forEach>
				<div class="clearfix"></div>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			
		</section>

		<c:import url="./template/footer.jsp"></c:import>

	</div>
	<!-- Wrap End -->

</body>
</html>
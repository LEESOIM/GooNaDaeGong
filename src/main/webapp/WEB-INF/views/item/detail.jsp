<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/item/detail.css">
<title>상세페이지</title>
<style>
a {
	color: black !important;
}
</style>
</head>

<body>
	<!-- Wrap Start -->
	<div class="wrap">
		<c:import url="../template/header.jsp"></c:import>
		<!-- Section Start -->
		<section>
			<div id="json" style="display: none;">${json}</div>
			<input type="hidden" name="item_num" id="item_num" value="${cart.item_num }"> 
			<input type="hidden" name="user_id" id="user_id" value="${cart.user_id}">
			<input type="hidden" name="item_price" id="item_price" value="${dto.item_price}">
			<main class="content_buy">
				<div class="item_list_area">
					<div class="item_list_area_box">
						<div class="main_area">
							<div class="main_area_center">
								<section class="main">
									<div class="detail_box">

										<span class="breadcrumbs container_buy mt-5"> 
											<a href="../item/list?cate_num=${dto.cate1}">
											<span id="category1" style="font-size: 13px;"></span></a>
											 
											<a href="../item/list?cate_num=${dto.cate2}">
											<span id="category2" style="font-size: 13px;"></span></a>
											 
											<a href="../item/list?cate_num=${dto.cate3}">
											<span id="category3" style="font-size: 13px;"></span></a>
											 
											<a href="../item/list?cate_num=${dto.cate4}">
											<span id="category4" style="font-size: 13px;"></span></a>
										</span>


										<article class="detail_box_top">
											<section class="detail_top_area my-5">
												<div class="photo_area">
													<div class="large_img mt-4">
														<c:forEach items="${dto.itemFileDTOs }" var="fileDTO">
															<c:choose>
																<c:when test="${fileDTO eq dto.itemFileDTOs[0] }">
																	<div class="carousel-item active"
																		data-bs-interval="5000" height="550">
																		<img src="/resources/upload/item/${fileDTO.fileName }"
																			class="d-block w-100" height="550" alt="...">
																	</div>
																</c:when>
															</c:choose>
														</c:forEach>
													</div>
												</div>
												<div class="mt-3 d-grid gap-2 d-md-flex btn-sm justify-content-md-end">
													<span class="mx-3"> 
													<a class="btn" style="background-color: #6667AB; color: white!important; --bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;"
														href="update?item_num=${dto.item_num }">수정</a>
													<a id="deleteButton" class="btn" style="background-color: #6667AB; color: white!important; --bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;"
														href="delete?item_num=${dto.item_num }">삭제</a> 
													<a class="btn" style="background-color: #6667AB; color: white!important; --bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="list?cate_num=${dto.cate_num}">목록보기</a>

													</span>
												</div>
												<div class="item_info ">
													<div class="item_title_area mb-3 "
														style="font-size: 15px; color: gray; ">
														<span class=" mx-2"> <span
															class="bi bi-suit-heart-fill" style="color: gainsboro;"></span>
															<span id="likeUpDown"></span>
														</span> <span class=" mx-2"> <span class="bi bi-eye-fill"
															style="color: gainsboro;"></span> <span>${dto.item_hit }</span>
														</span> <span class=" mx-2"> <span
															class="bi bi-clock-fill" style="color: gainsboro;"></span>
															<span id="item_date"> <fmt:formatDate
																	value="${dto.item_date}" pattern="yy/MM/dd" />
														</span>
														</span>
													</div>
													<p class="H1-sc-1jnmmbn-0 lUWLJ" style="font-size: 25px;">${dto.item_title }</p>
													<div class="item_price_box item_price_box_bottom">
														<div class="item_price_box_bottom_low">
															<div class="item_price item_price_bottom my-2">
																<span> <fmt:formatNumber 
																		value="${dto.item_price}" pattern="###,###,###" />원
																</span>
															</div>
														</div>
														<div class="description_hellopay  only_hellopay_area my-4">
															<table class="detail_table mb-2">
																<tbody>
																	<tr class="first">
																		<td class="title">거래방법</td>
																		<td class="description" style="padding-bottom: 3px;">카드,
																			네이버페이, 카카오페이</td>
																	</tr>
																	<tr>
																		<td class="title">배송비</td>
																		<td class="description">3만원 이상 시 무료배송</td>
																	</tr>
																	<tr>
																		<td class="title">배송 방법</td>
																		<td class="description">택배</td>
																	</tr>
																	<tr>
																		<td class="title">남은 갯수</td>
																		<td class="description"><span>${dto.item_stock}</span>개
																		</td>
																	</tr>
																</tbody>
															</table>

															<div class="bd_2cuha">
																<button id="minus" type="button"
																	class="bd_EZ05h bd_3ex46 bd_2jhSJ N=a:pcs.quantity">
																	<span class="blind">수량 빼기</span>
																</button>

																<input id="itemCount" type="number" class="bd_2eiJL N=a:pcs.quantity"
																	value="1">

																<button id="plus" type="button"
																	class="bd_EZ05h bd_2nJMW N=a:pcs.quantity">
																	<span class="blind">수량 추가</span>
																</button>
															</div>

															<div class="bd_2qCsT bd_xMsL8 bd_7h93m">
																<strong class="bd_28JKM">총 상품 금액</strong>
																<div class="bd_CVTqI" style="margin: 4px 0 0 6px">
																	<button type="button" class="bd_32dL8 N=a:pcs.price"
																		aria-haspopup="true" aria-expanded="false">
																		<svg xmlns="http://www.w3.org/2000/svg" width="6"
																			height="8" class="bd_3GYLw">
																						<path fill="#5f5f5f" fill-rule="evenodd"
																				d="M5 3v1H4v2H2V4h1V3h1V1H2v1H0V1h1V0h4v1h1v2H5zM4 8H2V7h2v1z">
																						</path>
																					</svg>
																		<span class="blind">도움말</span>
																	</button>
																	<div class="bd_y5n6u bd_2ZJCl bd_2K79u"
																		style="display: none">
																		<i class="bd_1XGXQ"></i>
																		<button type="button" class="bd_3gqWB">
																			<svg xmlns="http://www.w3.org/2000/svg" width="11"
																				height="11" viewBox="0 0 17 17" class="bd_K4Ce9">
																							<path fill-rule="evenodd"
																					d="M16.272 0L8.5 7.772.728 0 0 .728 7.772 8.5 0 16.272.728 17 8.5 9.228 16.272 17l.728-.728L9.228 8.5 17 .728 16.272 0z">
																							</path>
																						</svg>
																			<span class="blind">닫기</span>
																		</button>
																	</div>
																</div>
																<div class="bd_3XvVU">
																	<em class="bd_1hU3G">총 수량 <em id="hap"></em> 개</em> 
																	<strong class="bd_1Ukv5 bd_2WCtq"> 
																		<span class="bd_32Qz_"><fmt:formatNumber 
																			value="${dto.item_price}" pattern="###,###,###" />원</span>
																	</strong>
																</div>
															</div>

														
														</div>
														<div class="item_sns item_detail_sns">
															<div class="item_hello_box">
																<div class="item_hello_box_talk" style="font-size: 25px; text-align: center;">
																<c:choose>
																	<c:when test="${like eq null }">
																		<div id="likeButton" class="wish_img_box bi bi-heart" style="color: #6667AB; width: 85px;">
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div id="likeButton" class="wish_img_box bi bi-heart-fill" style="color: #6667AB; width: 85px;">
																		</div>
																	</c:otherwise>
																</c:choose>

																	<span class="dropdown">
																		<button class="wish_img_box dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: white; color: #6667AB; width: 85px;">
																			<i class="bi bi-share"></i>
																		</button>
																		<ul class="sns dropdown-menu">
																		  <li class="facebook">
																			<button type="button" href="#n" onclick="share('facebook');return false;" class="facebook dropdown-item" target="_self" title="페이스북 새창열림">
																			<span class="skip">페이스북</span></button>
																		</li>
																		<li class="twitter">
																			<a type="button" href="#n" onclick="share('twitter');return false;" class="twitter dropdown-item" target="_self" title="트위터 새창열림">
																			<span class="skip">트위터</span></a>
																		</li>
																		<li class="band">
																			<a type="button" href="#n" onclick="share('band');return false;" class="band dropdown-item" target="_self" title="네이버밴드 새창열림">
																			<span class="skip">네이버밴드</span></a>
																		</li>
																		</ul>
																	  </span>


																	<div class="item_hello_box_pay item_hello_box_chat_pay mx-2">
																		<button type="button" class="hello_pay_btn cartbtn">장바구니</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
											<section>
												<div class="detail_box_bottom detail_box_item"
													style="padding-top: 0px;">
													<div class="detail_comment">

														<section class="description">
															<h3 class="H3-sc-7ikhff-0 hUvHkp">
																<div class="description_title">상세설명</div>
															</h3>
															<div class="description_text">
																<span>${dto.item_contents }</span>
															<c:forEach items="${dto.itemFileDTOs}" var="fileDTO">
																<img alt=""
																	src="../resources/upload/item/${fileDTO.fileName}">
															</c:forEach>

														</div>
														</section>


														<section class="item_buy_area">
															<div class="item_wish_box">
																<div class="item_wish_box_border">
																	<button type="button" class="image_wish_box_btn">
																		<img
																			src="https://ccimage.hellomarket.com/web/2018/item/ico_zzim.png"
																			alt="찜하기이미지" class="ad_wish_icon">
																	</button>
																</div>
															</div>
															<div class="item_talk_box">
																<div class="item_talk">헬로톡</div>
															</div>
															<div class="item_buy_box">
																<button type="button" class="item_buy">헬로페이 구매</button>
															</div>
														</section>


														<div id="reviewContents"></div>

														<!-- 구디나라 댓글창 -->
														<!-- <section class="comment_title">
															<span class="comment_title_comment">댓글</span>
															<span>(0)</span>
														</section>

														<section class="input_custorm">
															<div class="cm_in_box">
																<textarea type="text" placeholder="댓글을 입력해주세요." class="input_txt"></textarea>
															</div>
															<div class="cms_btn_box">
																<div class="comment_send_btn">댓글등록</div>
															</div>
														</section> -->
														<!-- 구디나라 댓글창 끝 -->
													</div>
												</div>
											</section>
										</article>
									</div>
								</section>
							</div>
						</div>
					</div>
				</div>
			</main>
		</section>
		<!--  Section End -->
		<c:import url="../template/footer.jsp"></c:import>
	</div>
	<!-- Wrap End -->
	<script src="/resources/js/item/detail.js"></script>
	
	<script>
		getLikeCount();
		getCategory();
		getReview(1);
		share();
	</script>
	<script src="/resources/js/item/testdetail.js"></script>
</body>
</html>
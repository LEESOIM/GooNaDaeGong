<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        ol, ul {
            padding-left: 0rem !important;
        }
    </style>
    <link rel="stylesheet" href="/resources/css/member/mypage.css">
</head>
<body>
	<div class="wrap">
	<c:import url="../template/header.jsp"></c:import>
    <section>
    	<div class="css-luwwab">
          <div class="css-833hqy ecbxmj4">
              <div class="css-1v4whg ecbxmj3">마이페이지</div>
	              <ul class="css-1x9bshx ecbxmj2">
	                  <li class="css-0 ecbxmj1">
	                      <a class="css-nk8664 ecbxmj0" href="./myOrder">주문 내역<span class="css-e41glx e1x0rfoo0"></span></a>
	                  </li>
	                  <li class="css-0 ecbxmj1">
	                      <a class=" css-nk8664 ecbxmj0" href="./myLike">찜한 상품<span class="css-e41glx e1x0rfoo0"></span></a>
	                  </li>
	                  <li class="css-0 ecbxmj1">
	                      <a class=" css-nk8664 ecbxmj0" href="./myReview">상품 후기<span class="css-e41glx e1x0rfoo0"></span></a>
	                  </li>
	                  <li class="css-0 ecbxmj1">
	                      <a class="active css-nk8664 ecbxmj0" href="./myQNA">상품 문의<span class="css-e41glx e1x0rfoo0"></span></a>
	                  </li>
	                  <li class="css-0 ecbxmj1">
	                      <a class=" css-nk8664 ecbxmj0" href="./myUpdate">개인 정보 수정<span class="css-e41glx e1x0rfoo0"></span></a>
	                  </li>
	              </ul>
              <a href="../qna/inquiry" class="css-17gln34 e19l01ug3">
                  <div class="css-1niy3no e19l01ug2">
                      <span class="css-1sdidca e19l01ug1">도움이 필요하신가요 ?</span>
                      <span class="css-rnnx2x e19l01ug0">1:1 문의하기</span>
                  </div>
                  <span class="css-1wkaywz e1x0rfoo0"></span>
              </a>
          </div>
	    	<div class="css-171zbec">
                <!-- 찜목록 대가리부분 -->
                <div class="css-xa5js9 e17r87fc2">
                    <h2 class="css-y83uep e17r87fc1">찜한 상품(총 갯수)</h2>
                </div>
                <!-- 대가리부분 END -->
                <!-- 찜한 상품에 대한 리스트부분 -->
		        <div class="css-10xk59j e15gkkfg4">
                    <input type="hidden" id="user_id" name="user_id" value="${member.user_id}"> 
                    <!-- 찜한 상품에 대한 반복문 자리 -->
                    <c:forEach items="${like}" var="like" varStatus="i">
		            <div class="css-i3aepa e1c07x4811">
		                <div class="css-1u8qly9 e1c07x489">
		                    <div class="e1c07x4810 css-1qpsnts e3um3060">
		                        <img src="../resources/upload/item/${like.itemFileDTOs[0].fileName}" alt="응애" loading="lazy">
		                    </div>
		                </div>
                        <div class="css-c1cgl e1c07x486">
                            <span >
                                <c:choose>
                                    <c:when test="${like eq null }">
                                        <svg class="likeButton" style="color: black; float:right" 
                                            xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                            fill="currentColor" class="bi bi-heart-fill"
                                            viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                                d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                                    </svg>
                                    </c:when>
                                    <c:otherwise>
                                        <svg class="likeButton" style="color: red; float:right;" data-item-num="${like.item_num}" 
                                            xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                            fill="currentColor" class="bi bi-heart-fill"
                                            viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                                d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                                    </svg>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                                <a href="../item/detail?item_num=${like.itemDTO.item_num}" style="text-decoration:none">
                                <div class="css-1qsrhd e1c07x485">상품이름 ${like.itemDTO.item_title}
                                </div>

                                <div class="e1c07x484 css-1drr403 ei5rudb2">
                                    <span class="sales-price css-1qe668a ei5rudb1">상품가격 ${like.itemDTO.item_price}원</span>
                                </div>
                            </a>
                            </div>
		            </div>
                    </c:forEach>
				</div>
                <!-- 페이징 처리 -->
                <div class="css-15jhycr e3tf63e0">
                    <div class="css-sxxs1g eytury60">
                    <c:choose>
                            <c:when test="${pager.pre}">
                                <button  type="button" class="css-rzcdhr e1hbwyso0" onClick="location.href='./myLike?page=${pager.startNum-1}'">
                                    <div class="css-7qb0sc e1ilyb3p0">이전</div>
                                </button>
                            </c:when>
                            <c:otherwise>
                                    <button type="button" class="css-rzcdhr e1hbwyso0" disabled="">
                                    <div class="css-7qb0sc e1ilyb3p0">이전</div>
                                </button>
                            </c:otherwise>
                        </c:choose>
                        <div style = "display:none">
                            <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                                <li class="page-item"><a class="page-link" href="./myLike?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
                            </c:forEach>
                        </div>
                        <c:choose>
                            <c:when test="${pager.next}">
                                <button type="button" class="css-1jwilit e1pk9060" onClick="location.href='./myLike?page=${pager.lastNum+1}'">
                                <div class="css-7qb0sc e1ilyb3p0">다음</div>
                            </button>
                            </c:when>
                            <c:otherwise>
                                <button disabled="" type="button" class="css-1jwilit e1pk9060">
                                <div class="css-7qb0sc e1ilyb3p0">다음</div>
                            </button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
	    	</div>
    	</div>
    </section>
    <c:import url="../template/footer.jsp"></c:import>
	</div>
    <script src="/resources/js/mypage/like.js"></script>
</body>
</html>
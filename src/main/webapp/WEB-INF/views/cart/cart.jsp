<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <!-- jQuery -->
	<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!---->
    <link rel="stylesheet" href="/resources/css/cart/cart.css">
    <script>
    
    const checkbox = document.getElementsByClassName("css-agvwxo");
    const img = document.getElementsByClassName("css-1wfsi82");
        
    console.log(checkbox,img);
    </script>
</head>
<body>
	<div class="wrap">
	<c:import url="../template/header.jsp"></c:import>
    <section>
       <div class="css-1pz4b76">

           <div class="css-1n2hipb">장바구니</div>
           <form action="cart" method="post">
            <input type="hidden" name="user_id" id="user_id" value="${member.user_id}">
            <div class="css-a6t9xs er0tf673">
                <div class="css-8wfj4z er0tf672">
                    <div class="css-20o6z0 e149z643">
                        <div class="css-zbxehx e149z642"> 
                            <!-- <input type="checkbox" class="css-agvwxo e1dcessg0" id="allcheck" checked="">
                            <label class="css-1j5mumb e1dcessg1" for="allcheck">
                                <img src="/resources/images/member/checked.svg" alt="" class="css-1wfsi82all e31wziv0">전체선택 
                            </label> -->
                                전체(${result})
                                <span class="css-454d5e e149z641"></span>
                                <!-- <button class="css-0 e149z640">선택삭제</button> -->
                        </div>
                        </div>
                        <div class="css-2lvxh7 ej77nku0">
                            <div>
                                <h4 class="css-td54hr e1w1cmkx0">
                                    <span class="css-1nzj0g2 e6yclqm1"></span>
                                    <button type="button" class="css-lvqq7y e17cst861" id="accordion">
                                        <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iN2EwMnFxZzNqYSIgZD0iTTExIDEyaDl2OSIvPgogICAgPC9kZWZzPgogICAgPGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8cGF0aCBkPSJNMCAwaDMwdjMwSDB6Ii8+CiAgICAgICAgPHVzZSBzdHJva2U9IiMzMzMiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIgdHJhbnNmb3JtPSJyb3RhdGUoLTQ1IDE1LjUgMTYuNSkiIHhsaW5rOmhyZWY9IiM3YTAycXFnM2phIi8+CiAgICA8L2c+Cjwvc3ZnPgo=" alt="접기" class="css-hvzkdq accimg">
                                    </button>
                                </h4>
                                <ul id="cartList">
                                    <c:choose>
                                    <c:when test="${empty cart}">
                                       <p class="css-l1lu2l eqymnpn0">장바구니에 담긴 상품이 없습니다.</p>
                                    </c:when>
                                    <c:otherwise>
                                    <c:forEach items="${cart}" var="list">
                                            <!-- <input type="hidden" name="cart_num" id="cart_num" value="${list.cart_num}"> -->
                                            <li class="css-1d6kgf6 esoayg811 cartList" data-cart-num="${list.cart_num}">
                                                <!-- <label class="css-dar8hv e1dcessg1" >
                                                    <input type="checkbox" class="css-agvwxo checks" data-item-price="${list.totalPrice}" data-cart-num="${list.cart_num}" checked="">
                                                    <img src="/resources/images/member/checked.svg" alt="" class="css-1wfsi82 e31wziv0">
                                                </label> -->
                                            <a class="css-3u0haf esoayg810">
                                                <span class="css-rnzd62 esoayg89">
                                                    <img src="../resources/upload/item/${list.itemFileDTOs[0].fileName}" alt="" class="css-1oc1pausale e1437c648" value="" width="60px">
                                                </span>
                                            </a>
                                            <div class="css-14sb0pe esoayg88">
                                            
                                            <a class="css-e0dnmk esoayg87">
                                                <p class="css-5cezqo esoayg86">${list.itemDTO.item_title}</p>
                                            </a>
                                            <div class="css-ar9i78 esoayg82"></div>
                                            </div>
                                            
                                            <div class="css-1gueo66 e1cqr3m40">
                                                    <c:if test="${list.item_count eq 1 }">
                                                        <button type="button" aria-label="수량내리기" disabled class="css-1e90glc minusbutton" id="minusbtn"></button>
                                                    </c:if>
                                                    <c:if test="${list.item_count > 1}">
                                                        <button type="button" aria-label="수량내리기" class="css-8azp8 minusbutton" data-cart-num="${list.cart_num}"></button>
                                                    </c:if>
                                                
                                                <div class="css-6m57y0 e1cqr3m41 data-cartlist=0 count"  data-cart-num="${list.cart_num}">${list.item_count}</div>
                                                
                                                <button type="button" aria-label="수량올리기" class="css-18y6jr4 e1hx75jb0 plusbutton" data-cart-num="${list.cart_num}"></button>
                                            </div>
                                            <div class="css-5w3ssu esoayg84">
                                                <span aria-label="판매 가격" data-testid="product-price" class="css-zq4evb e2qzex51">
                                                <fmt:formatNumber value="${list.totalPrice}" pattern="###,###"/>원
                                                </span>
                                            </div>
                                            <button class="css-h5zdhc eudrkjx0 delete" type="button" data-testid="delete" data-cart-num="${list.cart_num}">
                                                <span class="css-6mgkir e5h3i930"></span>
                                            </button>
                                            </li>
                                        </c:forEach>
                                    </c:otherwise>
                                    </c:choose>
                                    </ul>
                            </div>
                        </div>
                </div>
                <div class="css-1dta0ch er0tf671">
                    <div class="css-50ad8x er0tf670">
                        <div class="css-oft680 e15fcx0p3">
                            <h3 class="css-1guaarh e15fcx0p2">배송지</h3>
                            <div class="css-50yi3o e15fcx0p1">
                                <p class="css-xxfxl7 e1tweaw10">(${cart[0].memberDTO.user_post}) ${cart[0].memberDTO.user_addr}${cart[0].memberDTO.user_addr2}</p>
                            </div>
                        </div>
                        <div class="css-1t6so8j em21elb0">
                            <div class="css-8jmoub ea1mry77">
                                <span class="css-vmo0an ea1mry76">상품금액</span>
                                <span class="css-iinokh ea1mry74">
                                <fmt:formatNumber value="${sum}" pattern="###,###"/>
                                <span class="css-hfgifi sum" value="">원</span>
                                </span>
                            </div>
                            <div class="css-t4mc5m ea1mry77">
                                <span class="css-vmo0an ea1mry76">배송비</span>
                                <c:choose>
                                	<c:when test="${sum >= 30000 || sum == 0}">
                                <span class="css-iinokh ea1mry74">0<span class="css-hfgifi ea1mry72">원</span></span>
                                	</c:when>
                                	<c:otherwise>
                                <span class="css-iinokh ea1mry74">3,000<span class="css-hfgifi ea1mry72">원</span></span>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="css-7ygxxm eepcpbj4">
                                <span class="css-vmo0an eepcpbj3">결제예정금액</span>
                                <c:choose>
                                	<c:when test="${sum >= 30000 || sum == 0 }">
		                                <span class="css-da7gr8 eepcpbj2">
		                                    <strong class="css-xmbce4 eepcpbj0">
		                                    <fmt:formatNumber value="${sum}" pattern="###,###"/>
		                                    </strong>
		                                    <span class="css-aro4zf eepcpbj1">원</span>
		                                </span>
                                	</c:when>
                                	<c:otherwise>
		                                <span class="css-da7gr8 eepcpbj2">
		                                    <strong class="css-xmbce4 eepcpbj0">
		                                    <fmt:formatNumber value="${sum+3000}" pattern="###,###"/>
		                                    </strong>
		                                    <span class="css-aro4zf eepcpbj1">원</span>
		                                </span>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="css-8qz8ia e1mybczi1">
                            <button class="css-fwelhw e4nu7ef3" type="button" onClick="location.href='../order/checkout?user_id=${member.user_id}'" height="56" radius="3">
                                <span class="css-ymwvow e4nu7ef1">주문하기</span>
                            </button>
                            <ul class="css-19kxq7d">
                                <li class="css-7s0nna ejr204i0">[주문완료] 상태일 경우에만 주문 취소 가능합니다.</li>
                                <li class="css-7s0nna ejr204i0">[마이페이지 주문내역 상세페이지] 에서 직접 취소하실 수 있습니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
           </form>
       </div> 
    </section>
    <c:import url="../template/footer.jsp"></c:import>
	</div><!-- wrap end -->
    <script src="/resources/js/cart/cart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>		
</body>
</html>
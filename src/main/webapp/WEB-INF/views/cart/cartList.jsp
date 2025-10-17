<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 장바구니</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <style>
        /* ==================== 0. 기본 스타일 & 초기화 (mainpage.jsp 기준) ==================== */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Noto Sans KR', 'Montserrat', sans-serif;
            background-color: #f9f9f9; /* mainpage.jsp 배경색 */
            color: #333;
            line-height: 1.6;
            min-height: 100vh;
        }

        a {
            text-decoration: none;
            color: inherit;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #b08d57; /* mainpage.jsp 강조색 */
        }

        ul {
            list-style: none;
        }

        /* ==================== 1. 헤더 스타일 (mypage.jsp에서 복사) ==================== */
        .main-header {
            background-color: #2c2c2c;
            padding: 15px 0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0 20px;
        }
        
        .header-top {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .logo a {
            font-family: 'Montserrat', sans-serif;
            font-size: 20px;
            font-weight: 800;
            color: #ffffff;
            letter-spacing: 1px;
        }

        .categories {
            width: 100%;
            border-top: 1px solid #555;
            padding: 8px 0;
            margin-bottom: 0;
        }

        .categories ul {
            display: flex;
            gap: 30px;
        }

        .categories a {
            font-size: 14px;
            font-weight: 500;
            padding: 5px 0;
            color: #ccc;
        }

        .categories a:hover {
            color: #b08d57;
            border-bottom: 2px solid #b08d57;
        }
        /* ==================== End of Header Styles ==================== */


        /* ==================== 2. 장바구니 본문 스타일 ==================== */
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 4px; /* 둥근 박스 제거(작게) */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            max-width: 1100px; /* 너비 확장 */
            margin: 50px auto;
            border: 1px solid #e0e0e0;
        }
        
        h1 {
            color: #2c2c2c; /* 헤더 색상과 통일 */
            margin-bottom: 30px;
            font-size: 28px;
            border-bottom: 3px solid #b08d57; /* 강조색 밑줄 */
            padding-bottom: 10px;
            text-align: left;
            font-weight: 600;
        }

        .message {
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 4px;
            font-size: 1.1em;
            text-align: center;
            border: 1px solid #c3e6cb;
            background-color: #e6f7e9;
            color: #1a7c36;
        }
        
        .no-items {
            text-align: center;
            padding: 30px;
            margin-top: 20px;
            font-size: 1.2em;
            color: #777;
            border: 1px dashed #ccc;
            border-radius: 4px;
            background-color: #fcfcfc;
        }

        /* 장바구니 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            font-size: 15px;
        }
        
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background-color: #4a4a4a; /* 어두운 색상으로 변경 */
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.95em;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        tr:hover {
            background-color: #f1f1f1;
        }

        /* 수량 입력 필드 */
        .quantity-input {
            width: 60px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: center;
            margin-right: 5px;
            font-size: 14px;
        }
        
        /* 버튼 공통 스타일 */
        .cart-action-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.3s;
        }

        /* 수량 수정 버튼 */
        .update-btn {
            background-color: #6c757d;
            color: white;
        }
        .update-btn:hover {
            background-color: #5a6268;
        }

        /* 삭제 버튼 */
        .remove-btn {
            background-color: #dc3545;
            color: white;
        }
        .remove-btn:hover {
            background-color: #c82333;
        }

        /* 총 가격 표시 */
        .total-price {
            text-align: right;
            margin-top: 30px;
            padding: 15px 20px;
            font-size: 1.5em;
            font-weight: 700;
            color: #2c2c2c;
            border-top: 2px solid #b08d57;
        }

        /* 하단 액션 버튼 그룹 */
        .action-buttons {
            text-align: center;
            margin-top: 40px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        /* 쇼핑 계속하기 버튼 */
        .action-buttons a {
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 4px;
            border: 1px solid #ccc;
            transition: background-color 0.3s;
        }
        
        /* 주문하기 버튼 (강조) */
        .order-btn {
            background-color: #b08d57 !important; /* 강조색 적용 */
            color: #2c2c2c !important;
            border: 1px solid #b08d57 !important;
        }
        
        .order-btn:hover {
            background-color: #a07d47 !important;
        }
        
        .action-buttons a:not(.order-btn) {
            background-color: #f5f5f5;
            color: #444;
        }
        .action-buttons a:not(.order-btn):hover {
            background-color: #e0e0e0;
        }

    </style>
</head>
<body>
    
    <header class="main-header">
        <div class="header-content">
            <div class="header-top">
                <div class="logo">
                    <a href='<c:url value="/"/>' title="메인 페이지로 이동">MY MODERN SHOP</a>
                </div>
            </div>

            <nav class="categories">
                <ul>
                    <li><a href="/category/mans">MANS</a></li>
                    <li><a href="/category/women">WOMEN</a></li>
                    <li><a href="/category/kids">KIDS</a></li>
                    <li><a href="/category/shoes">SHOES</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="container">
        <h1>나의 장바구니</h1>

        <c:if test="${empty cartList}">
            <p class="no-items">장바구니에 담긴 상품이 없습니다.</p>
        </c:if>

        <c:if test="${not empty cartList}">
            <table>
                <thead>
                    <tr>
                        <th>상품명</th>
                        <th>판매가</th>
                        <th style="width: 150px;">수량</th>
                        <th style="width: 150px;">총 금액</th>
                        <th style="width: 80px;"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cartItem" items="${cartList}">
                        <c:set var="itemTotalPrice" value="${cartItem.prodPrice * cartItem.cartQty}" />
                        <tr>
                            <td style="text-align: left;">
                                <a href="${pageContext.request.contextPath}/product/detail?prodId=${cartItem.prodId}">${cartItem.prodName}</a>
                            </td>
                            <td><fmt:formatNumber value="${cartItem.prodPrice}" type="currency" currencySymbol="₩"/></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/cart/update" method="post" style="display:flex; align-items:center; justify-content:center;">
                                    <input type="hidden" name="memberId" value="${memberId}">
                                    <input type="hidden" name="cartId" value="${cartItem.cartId}">
                                    <input type="number" name="cartQty" value="${cartItem.cartQty}" min="1" class="quantity-input">
                                    <button type="submit" class="cart-action-btn update-btn">수정</button>
                                </form>
                            </td>
                            <td><fmt:formatNumber value="${itemTotalPrice}" type="currency" currencySymbol="₩"/></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/cart/remove" method="post" style="display:inline;">
                                    <input type="hidden" name="memberId" value="${memberId}">
                                    <input type="hidden" name="cartId" value="${cartItem.cartId}">
                                    <button type="submit" class="cart-action-btn remove-btn">삭제</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="total-price">
                총 장바구니 금액: <fmt:formatNumber value="${totalCartPrice}" type="currency" currencySymbol="₩"/>
            </div>
        </c:if>

        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/">쇼핑 계속하기</a>
            <c:if test="${not empty cartList}">
                <a href="${pageContext.request.contextPath}/order/form" class="order-btn">주문하기</a>
            </c:if>
        </div>
    </div>
</body>
</html>
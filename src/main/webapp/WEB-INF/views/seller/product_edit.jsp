<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>상품 수정</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerstyle.css" />
</head>
<body>
  <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

  <main class="mypage-body">
    <aside class="mypage-sidebar">
      <nav>
        <ul>
          <li class="sidebar-title">판매자 마이페이지</li>
          <li><a href="${pageContext.request.contextPath}/seller/products" class="active">상품 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/seller/members">회원 관리</a></li>
          <li><a href="#">공지사항</a></li>
        </ul>
      </nav>
    </aside>

    <section class="mypage-content-area">
      <h2>상품 수정 (#${product.prodId})</h2>

      <form action="${pageContext.request.contextPath}/seller/products/${product.prodId}/edit" method="post" class="product-form">
        <div class="form-group">
          <label>상품명</label>
          <input type="text" name="prodName" value="${product.prodName}" required />
        </div>
        <div class="form-group">
          <label>가격(원)</label>
          <input type="number" name="prodPrice" value="${product.prodPrice}" required min="0" step="1" />
        </div>
        <div class="form-group">
          <label>재고</label>
          <input type="number" name="prodStock" value="${product.prodStock}" required min="0" step="1" />
        </div>
        <div class="form-group">
          <label>코드(선택)</label>
          <input type="text" name="prodCode" value="${product.prodCode}" />
        </div>
        <div class="form-group">
          <label>상품 설명</label>
          <textarea name="prodDesc" rows="6">${product.prodDesc}</textarea>
        </div>


        <div class="button-group">
          <button type="submit" class="submit-btn">저장</button>
          <a href="${pageContext.request.contextPath}/seller/products/${product.prodId}" class="reset-btn">취소</a>
        </div>
      </form>
    </section>
  </main>

  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>

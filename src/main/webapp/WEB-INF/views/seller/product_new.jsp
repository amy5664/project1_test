<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>신규 상품 등록</title>
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
          <li><a href="${pageContext.request.contextPath}/seller/notices" class="active">공지사항</a></li>
        </ul>
      </nav>
    </aside>

    <section class="mypage-content-area">
      <h2>신규 상품 등록</h2>

      <form action="${pageContext.request.contextPath}/seller/products" method="post" accept-charset="UTF-8" class="product-form">
        <div class="form-group">
          <label for="prod_name">상품명</label>
          <input type="text" id="prod_name" name="prodName" required />
        </div>
        <div class="form-group">
          <label for="prod_price">가격 (원)</label>
          <input type="number" id="prod_price" name="prodPrice" required min="0" step="1" />
        </div>
        <div class="form-group">
          <label for="prod_stock">재고</label>
          <input type="number" id="prod_stock" name="prodStock" required min="0" step="1" />
        </div>
		<div class="form-group">
			<label for="prod_code">상품 코드</label>
			<p class="hint">상품 코드는 등록 시 자동 부여됩니다.</p>
		</div>
        <div class="form-group">
          <label for="prod_desc">상품 설명</label>
          <textarea id="prod_desc" name="prodDesc" rows="4" maxlength="4000"></textarea>
        </div>

        <!-- 판매자 ID를 세션에서 주입하실 경우 -->
        <%-- <input type="hidden" name="prodSeller" value="${loginSellerId}"> --%>

        <div class="button-group">
          <button type="submit" class="submit-btn">등록</button>
          <a href="${pageContext.request.contextPath}/seller/products" class="reset-btn">목록으로</a>
        </div>
      </form>
    </section>
  </main>

  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항 등록</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerstyle.css" />
</head>
<body>
  <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

  <main class="mypage-body">
    <aside class="mypage-sidebar">
      <nav>
        <ul>
          <li class="sidebar-title">판매자 마이페이지</li>
          <li><a href="${pageContext.request.contextPath}/seller/products" >상품 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/seller/members">회원 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/seller/notices">공지사항</a></li>
        </ul>
      </nav>
    </aside>

    <section class="mypage-content-area">
      <h2>공지사항 등록</h2>

      <form action="${pageContext.request.contextPath}/seller/notices" method="post" class="info-form">
        <div class="form-group">
          <label for="NOT_TITLE">제목</label>
          <input type="text" id="NOT_TITLE" name="NOT_TITLE" required style="width:60%" />
        </div>

        <div class="form-group">
          <label for="NOT_NAME">작성자</label>
          <input type="text" id="NOT_NAME" name="NOT_NAME" required style="width:60%" />
        </div>

        <div class="form-group">
          <label for="NOT_CONTENT">내용</label>
          <textarea id="NOT_CONTENT" name="NOT_CONTENT" rows="15" maxlength="4000" required style="width:100%"></textarea>
        </div>

        <div class="button-group">
          <button type="submit" class="submit-btn">등록하기</button>
          <a href="${pageContext.request.contextPath}/seller/notices" class="reset-btn">취소</a>
        </div>
      </form>
    </section>
  </main>

  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>

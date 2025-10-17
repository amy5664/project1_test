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
          <li><a href="${pageContext.request.contextPath}/seller/products">상품 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/seller/members">회원 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/seller/notices" class="active">공지사항</a></li>
        </ul>
      </nav>
    </aside>

    <!-- 공지 등록 카드 -->
    <section class="mypage-content-area detail-card notice-create">
      <div class="detail-header">
        <h2 class="page-title">공지사항 등록</h2>
        <div class="actions">
        </div>
      </div>

      <form action="${pageContext.request.contextPath}/seller/notices" method="post" class="kv-grid notice-form">
        <div class="form-group">
          <label for="NOT_TITLE">제목</label>
          <input type="text" id="NOT_TITLE" name="NOT_TITLE" required class="input" placeholder="제목을 입력하세요" />
        </div>

        <div class="form-group">
          <label for="NOT_NAME">작성자</label>
          <input type="text" id="NOT_NAME" name="NOT_NAME" required class="input" placeholder="작성자명을 입력하세요" />
        </div>

        <div class="form-group form-group--full">
          <label for="NOT_CONTENT">내용</label>
          <textarea id="NOT_CONTENT" name="NOT_CONTENT" rows="12" maxlength="4000" required class="textarea" placeholder="공지 내용을 입력하세요"></textarea>
        </div>

        <div class="button-row">
         <a href="${pageContext.request.contextPath}/seller/notices" class="btn btn-outline">목록으로</a>
          <button type="submit" class="btn btn-primary">등록하기</button>
          <a href="${pageContext.request.contextPath}/seller/notices" class="btn btn-ghost">취소</a>
        </div>
      </form>
    </section>
    <!-- // 공지 등록 카드 -->
  </main>

  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>

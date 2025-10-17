<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 상세보기</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerstyle.css">
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

    <section class="mypage-content-area notice-view">
      <!-- 카드 1: 제목 + 메타 -->
      <div class="nv-card nv-head">
        <h2 class="nv-title">${notice.NOT_TITLE}</h2>
        <ul class="nv-meta">
          <li><strong>작성자</strong> ${notice.NOT_NAME}</li>
          <li><strong>작성일</strong> <fmt:formatDate value="${notice.NOT_TIME}" pattern="yyyy-MM-dd HH:mm" /></li>
        </ul>
      </div>

      <!-- 카드 2: 내용 -->
      <div class="nv-card nv-body">
        <div class="nv-content">
          <pre>${notice.NOT_CONTENT}</pre>
        </div>
      </div>

      <!-- 카드 3: 버튼 -->
      <div class="nv-card nv-actions">
        <div class="notice-buttons">
          <a href="${pageContext.request.contextPath}/seller/notices" class="btn btn-outline">목록으로</a>
          <a href="${pageContext.request.contextPath}/seller/notices/modify?notNo=${notice.NOT_NO}" class="btn btn-primary">수정</a>
          <form action="${pageContext.request.contextPath}/seller/notices/delete" method="post" style="display:inline;">
            <input type="hidden" name="notNo" value="${notice.NOT_NO}" />
            <button type="submit" class="btn btn-ghost" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
          </form>
        </div>
      </div>
    </section>
  </main>

  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>

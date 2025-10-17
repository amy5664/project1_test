<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerstyle.css" />
</head>
<body>
  <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

  <main class="mypage-body">
    <aside class="mypage-sidebar">
      <nav>
        <ul>
          <li class="sidebar-title">판매자 마이페이지</li>
          <li><a href="${pageContext.request.contextPath}/seller/mypage">상품 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/seller/members" class="active">회원 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/seller/notices">공지사항</a></li>
        </ul>
      </nav>
    </aside>

    <!-- ====== 회원 상세 콘텐츠 영역 ====== -->
    <section class="mypage-content-area seller-member-detail detail-card">
      <div class="detail-header">
        <h2 class="page-title">회원 상세</h2>
      </div>

      <c:if test="${empty user}">
        <div class="empty-state">
          <p>회원 정보를 찾을 수 없습니다.</p>
        </div>
      </c:if>

      <c:if test="${not empty user}">
        <div class="info-form kv-grid">
          <div class="form-group"><label>아이디</label><span class="value">${user.memberId}</span></div>
          <div class="form-group"><label>이름</label><span class="value strong">${user.memberName}</span></div>
          <div class="form-group"><label>이메일</label><span class="value">${user.memberEmail}</span></div>
          <div class="form-group"><label>전화번호</label><span class="value">${user.memberPhone}</span></div>
          <div class="form-group">
            <label>주소</label>
            <span class="value">
              <c:choose>
                <c:when test="${not empty user.memberZipcode or not empty user.memberAddr1 or not empty user.memberAddr2}">
                  [${empty user.memberZipcode ? '-' : user.memberZipcode}]
                  ${empty user.memberAddr1 ? '' : user.memberAddr1}
                  <c:if test="${not empty user.memberAddr2}">, ${user.memberAddr2}</c:if>
                </c:when>
                <c:otherwise>-</c:otherwise>
              </c:choose>
            </span>
          </div>
        </div>

        <h3 class="section-title"><span>의류 구매 내역</span></h3>
        <p class="muted">구매 내역 기능은 추후 연동 예정입니다.</p>
        
         <div class="detail-footer">
    <a class="btn btn-outline" href="${pageContext.request.contextPath}/seller/members">목록으로</a>
  </div>
      </c:if>
    </section>
    <!-- ====== //회원 상세 콘텐츠 영역 끝 ====== -->
  </main>

  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>

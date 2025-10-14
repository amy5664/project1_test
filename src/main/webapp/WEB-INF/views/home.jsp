<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head><title>USER_DB 확인</title></head>
<body>
<h2>USER_DB 목록</h2>
<c:if test="${empty users}">
    <p>데이터가 없습니다.</p>
</c:if>
<c:forEach var="u" items="${users}">
    <div>
        <b>${u.memberId}</b> / ${u.memberName} / ${u.memberEmail} / ${u.memberPhone}
    </div>
</c:forEach>
</body>
</html>

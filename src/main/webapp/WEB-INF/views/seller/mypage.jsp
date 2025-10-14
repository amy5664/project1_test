<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>판매자 마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerstyle.css" />
</head>
<body>
	<!-- 공통 header include -->
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />

	<main class="mypage-body">
		<aside class="mypage-sidebar">
			<nav>
				<ul>
					<li class="sidebar-title">판매자 마이페이지</li>
					<li><a href="${pageContext.request.contextPath}/seller/mypage" class="active">상품 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/seller/members">회원 관리</a></li>
					<li><a href="#notice-board">공지사항</a></li>
				</ul>
			</nav>
		</aside>

		<section class="mypage-content-area">

			<!-- 상품 관리 -->
			<div id="product-management-content" class="content-panel active">
				<h2>상품 관리</h2>

				<section class="product-registration">
					<h3>신규 상품 등록</h3>
					<form action="#" method="post" class="product-form">
						<div>
							<label for="prod_name">상품명</label><br /> <input type="text"
								id="prod_name" name="prod_name" required />
						</div>
						<div>
							<label for="prod_price">가격 (원)</label><br /> <input type="text"
								id="prod_price" name="prod_price" required pattern="\\d+"
								title="숫자만 입력하세요" />
						</div>
						<div>
							<label for="prod_desc">상품 설명</label><br />
							<textarea id="prod_desc" name="prod_desc" rows="4"
								maxlength="4000"></textarea>
						</div>
						<div>
							<button type="submit">상품 등록</button>
							<button type="reset">초기화</button>
						</div>
					</form>
				</section>

				<hr />

				<!-- 상품 목록 (DB 연동 후 JSTL로 반복 예정) -->
				<table>
					<thead>
						<tr>
							<th>상품명</th>
							<th>가격</th>
							<th>재고</th>
							<th>등록일</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>여름 반팔 티셔츠</td>
							<td>19,000원</td>
							<td>120</td>
							<td>2025-10-01</td>
							<td>
								<button>수정</button>
								<button>삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

<!-- 			<!-- 회원 관리 --> -->
<!-- 			<div id="member-management-content" class="content-panel"> -->
<!-- 				<h2>회원 관리</h2> -->
<!-- 				<p>해당 판매자의 상품을 구매한 회원 목록</p> -->
<!-- 				<table> -->
<!-- 					<thead> -->
<!-- 						<tr> -->
<!-- 							<th>회원명</th> -->
<!-- 							<th>이메일</th> -->
<!-- 							<th>전화번호</th> -->
<!-- 							<th>최근 주문일</th> -->
<!-- 						</tr> -->
<!-- 					</thead> -->
<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<td>홍길동</td> -->
<!-- 							<td>hong@example.com</td> -->
<!-- 							<td>010-1111-2222</td> -->
<!-- 							<td>2025-10-05</td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 				</table> -->
<!-- 			</div> -->

			<!-- 공지사항 -->
			<div id="notice-board-content" class="content-panel">
				<h2>공지사항</h2>
				<ul>
					<li><a href="#">[중요] 추석 연휴 배송 안내</a> <span>2025-09-20</span></li>
					<li><a href="#">[공지] 신규 카테고리 오픈</a> <span>2025-09-10</span></li>
				</ul>
				<hr />
				<section class="notice-write">
					<h3>공지사항 글쓰기</h3>
					<form action="#" method="post" class="notice-form">
						<div>
							<label for="notice_title">제목</label><br /> <input type="text"
								id="notice_title" name="notice_title" required />
						</div>
						<div>
							<label for="notice_content">내용</label><br />
							<textarea id="notice_content" name="notice_content" rows="6"
								required></textarea>
						</div>
						<div>
							<button type="submit">등록</button>
							<button type="reset">초기화</button>
						</div>
					</form>
				</section>
			</div>
		</section>
	</main>

	<!-- 공통 footer include -->
<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

<script>
document.querySelectorAll('.mypage-sidebar a').forEach(tab => {
  tab.addEventListener('click', function(e) {
    const href = this.getAttribute('href') || '';
    // 해시(#)로 시작하는 링크만 탭 전환 처리
    if (href.startsWith('#')) {
      e.preventDefault();
      document.querySelectorAll('.mypage-sidebar a').forEach(a => a.classList.remove('active'));
      this.classList.add('active');
      document.querySelectorAll('.content-panel').forEach(panel => panel.classList.remove('active'));
      const id = href.replace('#', '') + '-content';
      const target = document.getElementById(id);
      if (target) target.classList.add('active');
    }
    // URL(예: /seller/members)은 기본 동작(페이지 이동) 그대로 둠
  });
});
</script>
</body>
</html>
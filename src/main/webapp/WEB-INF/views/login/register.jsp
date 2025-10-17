<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 신청</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/register.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function daumZipCode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다.
							// (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("memberAddr1").value = extraAddr;

						} else {
							document.getElementById("memberAddr2").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('memberZipcode').value = data.zonecode;
						document.getElementById("memberAddr1").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("memberAddr2").focus();
					}
				}).open();
	}

</script>
<style>
/* mainpage.jsp 스타일을 기반으로 수정 */
	* { box-sizing: border-box; margin: 0; padding: 0; }
	body { 
		font-family: 'Noto Sans KR', 'Montserrat', sans-serif; 
		color: #333; 
		line-height: 1.6; 
		background-color: #f9f9f9; 
		min-height: 100vh;
	}

.container {
	width: 650px; /* ⭐️ 너비 200px 확장 (450px -> 650px) */
	margin: 50px auto;
	border: 1px solid #ccc; /* 테두리 유지 */
	padding: 30px; /* 패딩 확장 */
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1); /* 그림자 강화 */
	border-radius: 4px; /* 둥근 박스 제거(작게) */
	background-color: #ffffff;
}

.form-group {
	margin-bottom: 20px; /* 간격 확장 */
	display: flex;
	align-items: center; /* ⭐️ 수직 정렬 유지 (입력 필드와 버튼 높이 맞춤) */
}

.form-group label {
	flex-shrink: 0; /* 라벨 너비 고정 */
	width: 120px; /* 라벨 너비 확장 */
	font-weight: 500;
}

.form-group input[type="text"],
.form-group input[type="password"] {
	flex: 1; /* 남은 공간을 입력 필드가 차지 */
	padding: 8px 10px;
	border: 1px solid #e0e0e0;
	border-radius: 3px;
}

/* 버튼 스타일: mainpage.jsp의 auth-btn 스타일 기반 */
.form-group button, .form-actions input[type="button"] {
	padding: 8px 15px; 
	border: none; 
	border-radius: 3px; 
	font-size: 13px;
	cursor: pointer;
	font-weight: 500;
	margin-left: 10px; /* ⭐️ 입력 필드와의 간격 확장 */
	flex-shrink: 0; /* 버튼 너비 고정 */
	transition: background-color 0.3s ease, color 0.3s ease;
	background-color: #4a4a4a; /* 어두운 배경색 */
	color: #fff;
}

.form-group button:hover, .form-actions input[type="button"]:hover {
	background-color: #b08d57; /* 포인트 색상 */
	color: #2c2c2c;
}

.form-actions input[type="reset"] {
	padding: 8px 15px; 
	border: 1px solid #ccc;
	border-radius: 3px; 
	font-size: 13px;
	cursor: pointer;
	font-weight: 500;
	transition: background-color 0.3s ease;
	background-color: #f0f0f0;
	margin-left: 5px;
}
.form-actions input[type="reset"]:hover {
	background-color: #e0e0e0;
}


.form-title {
	text-align: center;
	margin-bottom: 30px;
}
.form-title h1 {
	font-weight: 700;
	color: #2c2c2c;
	font-size: 28px;
	border-bottom: 2px solid #b08d57; /* 포인트 색상 밑줄 */
	padding-bottom: 10px;
}

.form-actions {
	text-align: center;
	margin-top: 30px;
}

/* 주소 검색 입력 필드 스타일 조정 */
.form-group .form-control {
	padding: 8px 10px;
	border: 1px solid #e0e0e0;
	border-radius: 3px;
}

/* ⭐️ 주소 필드 레이아웃 조정 */
/* 주소 필드는 라벨과 주소 입력 공간이 별도의 행으로 분리될 수 있도록 flex: 1; 을 제거하고 block 형태로 처리 */
/* (기본 주소, 상세 주소는 별도의 form-group에 분리되어 있으므로 문제 없음) */

/* ⭐️ 우편번호 row 조정 */
.zipcode-row {
	display: flex;
	align-items: center;
	flex: 1; /* 남은 공간을 차지하도록 설정 */
}

/* 우편번호 입력 필드 */
.zipcode-row input[name="memberZipcode"] {
	width: 120px; /* ⭐️ 너비 확보 */
	flex-grow: 0;
}

/* 주소 검색 버튼 */
.zipcode-row button {
	flex-grow: 0;
	margin-left: 10px;
}


</style>
</head>
<body>
	<div class="container">
		<form name="reg_frm" method="post" action="registerOk">
			<div class="form-title">
				<h1>회원 가입 신청</h1>
			</div>

			<div class="form-group">
				<label for="member_id">User ID</label> 
				<input type="text" id="member_id" name="memberId" size="20" placeholder="아이디를 입력하세요.(4글자 이상))">
				<button type="button" onclick="fn_idCheck()" id="idCheck" name="idCheck" value="N">중복 확인</button>
				
			</div>

			<div class="form-group">
				<label for="member_pw">비밀번호</label> <input type="password" id="member_pw"
					name="memberPw" size="20" placeholder="비밀번호를 입력하세요.">
			</div>

			<div class="form-group">
				<label for="pwd_chk">비밀번호 확인</label> <input type="password" id="pwd_chk"
					name="pwd_chk" size="20" placeholder="비밀번호를 한번 더 입력하세요.">
			</div>

			<div class="form-group">
				<label for="member_name">이름</label> <input type="text"
					id="member_name" name="memberName" size="20" placeholder="이름을 입력하세요.">
			</div>

			<div class="form-group">
				<label for="member_email">이메일</label> 
				<input type="text" id="member_email" name="memberEmail" size="20" placeholder="이메일을 입력하세요.">
				<button type="button" onclick="fn_emailCheck()" id="emailCheck" value="N">중복 확인</button>
			</div>

			<div class="form-group">
				<label for="member_phone">휴대폰</label> <input type="text"
					id="member_phone" name="memberPhone" size="20" placeholder="휴대폰 번호를 입력하세요.">
			</div>

			<div class="form-group">
				<label for ="memberZipcode">우편번호</label>
				<div class="zipcode-row">
					<input class="form-control" name="memberZipcode" id="memberZipcode" type="text" readonly placeholder="우편번호">
					<button type="button" class="btn btn-default" onclick="daumZipCode()">
						우편번호 찾기
					</button>
				</div>
			</div>
			
			<div class="form-group">
				<label for="memberAddr1">주소</label>
				<input class="form-control" name="memberAddr1" id="memberAddr1" type="text" readonly placeholder="도로명 주소 (검색 결과)">
			</div>
			<div class="form-group">
				<label for="memberAddr2">상세 주소</label>
				<input class="form-control" placeholder="상세 주소" name="memberAddr2" id="memberAddr2" type="text">
			</div>

			<div class="form-actions">
				<input type="button" value="등록" onclick="check_ok()">
				<input type="reset" value="초기화">
				<input type="button" value="돌아가기" onclick="location.href='login'">
			</div>
		</form>
	</div>
</body>
</html>
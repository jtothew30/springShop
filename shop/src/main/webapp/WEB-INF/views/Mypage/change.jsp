<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보변경</title>
<link rel="stylesheet" href="resources/css/mypage/common.css">
<link rel="stylesheet" href="resources/css/mypage/side.css">
<link rel="stylesheet" href="resources/css/mypage/openid.css">
</head>
<body>

<div id="openIdWrap"> 
			<div class="contentsWrap">
				<form name="PasswordCertify" method="post" action="/member/memberjoin.do">
					<div class="subConWrap">
						<h2 class="mainTitle">회원정보수정</h2>
						<div class="pwTopBox">
							<p class="topTitle step2">정보를 안전하게 보호하기 위해
								<br>
								<span>비밀번호를 다시 한 번 확인</span>합니다.</p>
							<span class="caution">비밀번호가 타인에게 노출되지 않도록 항상 주의해주세요.</span>
						</div>
						<div class="pwConfBox conTable">
							<dl>
								<dt>아이디</dt>
								<dd id="memId">아이디~</dd>
							</dl>
							<dl>
								<dt>비밀번호</dt>
								<dd>
									<div class="styleInput">
										<input id="memPwd" name="memPwd" type="password" class="iInput" onblur="javascript:fn_checkPassword(this.value);"/>
										<span id="conClear" class="delBtn"></span>
										<p id="errorMsg" name="errorMsg" class="error"></p>
									</div>
								</dd>
							</dl>
						</div>
						<div class="interBtnArea">
							<span>
								<button type="submit" class="btnRed" onclick="javascript:fn_send(); return false;">확인</button>
							</span>
							<span>
								<button type="submit" class="btnWhite" onclick="javascript:fn_goMain(); return false;">취소</button>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>

</body>
</html>
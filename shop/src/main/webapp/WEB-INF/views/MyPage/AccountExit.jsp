<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 전 인증페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/snb.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/openid.css">
</head>
<body>

<c:import url="../header.jsp"/>

<div id="openIdWrap"> 
			<div class="contentsWrap">
					<div class="subConWrap">
						<h2 class="mainTitle">회원탈퇴 확인</h2>
						<div class="pwTopBox">
							<p class="topTitle step2">정보를 안전하게 보호하기 위해
								<br>
								<span>비밀번호를 다시 한 번 확인</span>합니다.</p>
							<span class="caution">비밀번호가 타인에게 노출되지 않도록 항상 주의해주세요.</span>
						</div>
						<div class="pwConfBox conTable">
							<dl>
								<dt>아이디</dt>
								<dd id="memId">${sessionScope.account}</dd>
							</dl>
							<dl>
								<dt>비밀번호</dt>
								<dd>
									<div class="styleInput">
										<input id="memPwd" name="memPwd" type="password" class="iInput"/>
										<span id="conClear" class="delBtn"></span>
										<p id="errorMsg" name="errorMsg" class="error"></p>
									</div>
								</dd>
							</dl>
						</div>
						<div class="interBtnArea">
							<span>
							<%-- <a onclick="exitAccount('${sessionScope.account}');"> --%>
								<button onclick="exitAccount('${sessionScope.account}');" class="btnblue">확인</button>
							</span>
							<span>
								<input type="button" class="btnWhite" onclick="history.back();" value="취소">
							</span>
						</div>
					</div>
			</div>
		</div>
		
<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var ctx = "${pageContext.request.contextPath}";
function exitAccount(id){
	swal({
		title: '회원 탈퇴',
		text: id+' 회원님 정말 회원탈퇴를 진행하시겠습니까?',
		icon: 'warning',
		buttons: true, 
	}).then((value)=>{
		if(!value) throw null;
		$.ajax({
			url : ctx +"/account/accountDeleteAjax.do",
			type : "POST",
			data : {"id" : id, "pw": $("#memPwd").val()},
			"success":function(data){
				if(data == "false"){
					swal({
						title:"회원탈퇴 실패",
						text:"비밀번호를 다시 확인해주세요.",
						icon : "error",
					}).then((willDelete) => {
						location.reload();
					});
				} else if(data == "true"){
					swal({
						title:"회원탈퇴 성공",
						text : "그동안의 성원에 감사드립니다.",
						icon : "success"
					}).then((willDelete) => {
						location.replace( ctx + "/main.do");
					});
				}	
			},
			"error": function(data){
				console.log(data);
				swal({
					title:"서버문제",
					text : "관리자에게 문의하세요. (회원탈퇴오류)",
					icon : "error"
				}).then((willDelete) => {
					location.reload();
				});
			}
		});	
	});
}
</script>
<c:import url="../footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인화면</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/snb.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/openid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/foundation-icons/foundation-icons.css">
</head>
<c:import url="../header.jsp"/>
<body>

<form id="openIdForm" name="openIdForm" method="get">
			<div id="openIdWrap">
				<div class="interparkLogo" align="center">
					<img src="${pageContext.request.contextPath}/resources/image/logo.JPG">
				</div>
			
				<div class="contentsWrap">
					<div class="myInfoMain">
						<div class="memberClass">
							<div class="mylevel">
							<img src="${pageContext.request.contextPath}/resources/image/welcome.JPG">
							<p class="infoTxt">${sessionScope.account}님 <span>환영합니다!</span></p>
							</div>
						</div>
						<div class="mainMenu">
							<div class="menuBox infoModify">
								<a href="${pageContext.request.contextPath}/account/change.do?id=${sessionScope.account}">
									<p class="title">회원정보수정</p>
									<span class="noti">비밀번호, 휴대폰번호 등<br/>내정보를 보호하세요.</span>
								</a>
							</div>
							<div id="shipping" class="menuBox shipping">
								<a href="${pageContext.request.contextPath}/mypage/myorder.do">						
									<p class="title">이용내역확인</p>
									<span class="noti">주문/배송/취소/반품/교환<br>내 상품리뷰 및 Q&A</span>
								</a>
							</div>
							<div class="menuBox withdrawal">
								<a href="${pageContext.request.contextPath}/account/exitPage.do">
									<p class="title">회원탈퇴</p>
									<span class="noti"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
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
				text: id+' 회원님 정말 회원탈퇴를 진행하시겠습니까?\n비밀번호 확인:',
				icon: 'warning',
				content: {
				    element: "input",
				    attributes: {
				      placeholder: "비밀 번호 입력",
				      type: "password",
				    },
				  },
				buttons: true, 
			}).then((value, willDelete)=>{
				if(!value) throw null;
				$.ajax({
					url : ctx +"/account/accountDeleteAjax.do",
					type : "POST",
					data : {"id" : id , "pw": value},
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

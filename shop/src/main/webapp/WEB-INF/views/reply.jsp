<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>reply page</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	/* function replyEdit(content, no, bno) {
		$("#content"+no).html(
		  "<input type='text' id='edit"+no+"' value='' required>"	
		);
		$("#bt"+no).html(
			"<input type='button' class='btn btn-success' onclick=\"editSave("+no+","+bno+")\" value='완료'>&nbsp;"+
			"<a class='btn btn-danger' href='javascript:location.reload();'>취소</a>"
		);
	}
	
	function editSave(no, bno) {
		var content = $("#edit"+no).val();
		location.href="reply_edit.do?r_no="+no+"&r_bno="+bno+"&r_content="+content;
	} */
</script>
</head>
<body>
	댓글 / 답변
	<%-- <table>
		<c:forEach var="rep" items="${list}">
			<tr>
				<td width="200">
					<div>
						${rep.r_id}<br>
						<font size="2" color="lightgray">${rep.r_date}</font>
					</div>
				</td>
				<td width="400" id="content${rep.r_no}">${rep.r_content}</td>
				<td width="300" id="bt${rep.r_no}">
					<c:if test="${session == rep.r_id}">
						<input type="button" class="btn btn-info" onclick="javascript:replyEdit('${rep.r_content}', ${rep.r_no}, ${rep.r_bno})" value="수정">
						<a class="btn btn-danger" href="reply_delete.do?r_no=${rep.r_no}&r_bno=${rep.r_bno}">삭제</a>
					</c:if>					
				</td>			
			</tr>
		</c:forEach>
	</table>
	<hr>
	<c:if test="${session != 'null'}">
		<form method="post"  action="reply.do" >
			<input type="hidden" name="r_bno" value="${dto.no}">
	 		<textarea  name="r_content" cols="60" rows=3 placeholder="댓글" required></textarea>&nbsp;
	 	 	<input type="submit" class="btn btn-success" value="댓글작성">
		</form>
	</c:if> --%>

</body>
</html>




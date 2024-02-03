<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 회원 정보 페이지 FOOTER 부분 설정으로 특별한것은 회원탈퇴 버튼을누르면 userId 를 outform.do 서블릿 파일로 보낸다. -->
<footer class="w3-container w3-black w3-padding-16" style="text-align: center;">
    <div style="display: inline-block">  이 홈페이지는 연습을 위해 제작되었습니다.</div>
	<div style="display: inline-block">다같이 멋진 개발자가 됩시다! <a href="getDeptList.do"  style="color: red;">메인으로가기</a></div>  
	<c:if test="${not empty sessionScope.userId}">
		<span style="font-size:12pt;">
		<input type="button" value="회원탈퇴"  onclick="location.href='outform.do?userId=${sessionScope.userId}'">
	  	</span>
</c:if>
	</div>

</footer>
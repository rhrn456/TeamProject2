<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/layout/mainstyle.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>


  <div class="backimg">
    <div class="main-title">
      <h1>Team 2 Company</h1>
    </div>
    <div class="logo">
      <img src="https://cdn-icons-png.flaticon.com/128/919/919847.png" alt="Your Logo">
    </div>
  
    <div class="buttons">
     
           <c:if test="${empty sessionScope.userId}">
                <button class="custom-button" onclick="openPopup('getDeptList.do')">로그인</button>
                <button class="custom-button" onclick="openPopup('join.jsp')">회원가입</button>
           </c:if>
           
      <c:if test="${not empty sessionScope.userId}">
    <span>${sessionScope.userName}님</span>
    <span style="font-size:12pt;">
        <input type="button" value="로그아웃" onclick="logoutFunction()">
    </span>
</c:if>
		
          
     
    </div>
  
	</div>

	<!-- 추가된 overlay와 popup -->
	 <div class="overlay" id="overlay" onmousedown="closePopup()"></div>
	<div class="popup" id="popup">
	    <!-- JSP 파일이 로드될 위치 -->
	    <div id="popupContent"></div>
	    <button onclick="closePopup()">닫기</button>
	</div>
	 


<script>
if ('${not empty sessionScope.userId}') {
    document.querySelectorAll('.custom-button').forEach(button => {
        button.style.display = 'none';
    });
}

function logoutFunction() {
    // Perform the logout action using Ajax or other necessary logic
    // For simplicity, assuming a synchronous logout (not recommended for production)
    // You may want to use asynchronous methods like fetch or jQuery.ajax in a real application
    // Redirect to logout URL if needed

    // Update UI as necessary
    document.querySelector('span').innerHTML = ''; // Clear the welcome message
    document.querySelector('.custom-button').style.display = 'block'; // Show login button
    document.querySelector('input[type="button"]').style.display = 'none'; // Hide logout button
}

    function openPopup(jspFile) {
        // overlay와 popup 열기
        document.getElementById('overlay').style.display = 'block';
        document.getElementById('popup').style.display = 'block';

        // JSP 파일을 popupContent에 로드
        document.getElementById('popupContent').innerHTML = '';
        var iframe = document.createElement('iframe');
        iframe.src = jspFile;
        iframe.style.width = '100%';
        iframe.style.height = '800px';
        iframe.style.border = 'none';
        document.getElementById('popupContent').appendChild(iframe);
        window.loginSuccessful = false;
    }

    function closePopup() {
        // overlay와 popup 닫기
        document.getElementById('overlay').style.display = 'none';
        document.getElementById('popup').style.display = 'none';
        location.reload();
        //window.location.href = 'getDeptList.do';
    }
    
</script>
</body>
</html>
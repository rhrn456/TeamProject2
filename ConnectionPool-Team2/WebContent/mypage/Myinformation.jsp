<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="../layout/style.jsp" %>
<title>Dept Detail</title>

</head>
<body class="w3-content" style="max-width:1300px">

<!-- w3-row 아래에 속해있는 div 를 저부 userId가 비어있을때 보이지않도록 설정 -->
<c:if test="${not empty sessionScope.userId}">
<div class="w3-row">
<!-- 하나의 div 그룹으로 묶고 높이를 설정 넓이는 웹CSS에 설정되어 한줄에 두개의 div가 들어가도록 설정되어있다. -->
  <div class="w3-half w3-black w3-container w3-center" style="height:700px">
    <div class="w3-padding-64">
      <h1>My Profile</h1>
    </div>
    <!-- 메첫뻔재 왼쪽 UI 4개의 하이퍼링크 TEXT 설정 CSS는 웹에 연결되어있다 -->
    <div class="w3-padding-64">
      <a href="getDeptList.do" class="w3-button w3-black w3-block w3-hover-blue-grey w3-padding-16">Home</a>
      <a href="#work" class="w3-button w3-black w3-block w3-hover-teal w3-padding-16">My Work</a>
      <a href="#work" class="w3-button w3-black w3-block w3-hover-dark-grey w3-padding-16">Resume</a>
      <a href="#contact" class="w3-button w3-black w3-block w3-hover-brown w3-padding-16">Contact</a>
    </div>
  </div>
  <!-- 오른쪽 첫번째 UI 설정 requestScope 를 이용해 로그인되어있는 userID를 사용해 해당하는 직원에 정보를 가져와 출력함 -->
  <div class="w3-half w3-blue-grey w3-container" style="height:700px">
    <div class="w3-padding-64 w3-center">
      <h1>About Me</h1>
      <img src="https://cdn-icons-png.flaticon.com/128/5957/5957124.png" class="w3-margin w3-circle" alt="Person" style="width:50% height:50%">
      <div class="w3-left-align w3-padding-large"  >
      
        <p style="text-align: center;"> 저의 이름은 ${requestScope.emp.ename}입니다</p>
        <p style="text-align: center;"> 저의 부서는 ${requestScope.dept.dname}입니다</p>
        <p style="text-align: center;">지금은 회사에 다니고있으며 ${requestScope.dept.loc}지역에서 근무하고있습니다.</p>
        <p style="text-align: center;">언제나 성실한 직원이 되겠습니다.</p>
        <p style="text-align: center;">감사합니다.</p>
      </div>
    </div>
  </div>
</div>

<!-- 오른쪽 두번째 UI  -->
<div class="w3-row">
  <div class="w3-half w3-light-grey w3-center" style="min-height:800px" id="work">
    <div class="w3-padding-64">
      <h2>My Work</h2>
      <p>내가 하는 일을 ${requestScope.emp.job}입니다.</p>
    </div>
    <div class="w3-row">
      <div class="w3-half">
        <img src="https://cdn-icons-png.flaticon.com/128/3361/3361135.png" style="width:40%">
      </div>
      <br>
      <div class="w3-half">
        <img src="https://cdn-icons-png.flaticon.com/128/4254/4254405.png" style="width:40%">
      </div>
    </div>
    <br>
    <div class="w3-row w3-hide-small">
      <div class="w3-half">
        <img src="https://cdn-icons-png.flaticon.com/128/2728/2728989.png" style="width:40%">
      </div>
      <br>
      <div class="w3-half">
        <img src="https://cdn-icons-png.flaticon.com/128/1535/1535026.png" style="width:40%">
      </div>
    </div>

   <br>
    <p style= "font-weight : bold;">저는 주로 커피를 먹으면서 아침을 시작합니다.</p>
     <p style= "font-weight : bold;">언제나 열정적으로 주어진 업무를 열심히합니다.</p>
     <p style= "font-weight : bold;">회사를 다니면서 제일행복한시간은 점심 시간입니다.</p>
     <p style= "font-weight : bold;">팀원들과 회의를 하며 소통을 하는것은 보람찹니다.</p>
  </div>
  <!--  오른쪽 두번째 UI  설정 -->
  <div class="w3-half w3-indigo w3-container" style="min-height:800px">
    <div class="w3-padding-64 w3-center">
      <h2>Resume</h2>
      <p style= "font-weight : bold;">나의 이력서</p>
      <div class="w3-container w3-responsive">
        <table class="w3-table" >
          <tr>
           <th style="text-align: center;">Year</th>
            <th style="text-align: center;">Title</th>
           <th style="text-align: center;">Where</th>
          </tr>
          <tr class="w3-white">
            <td style="text-align: center;" >${requestScope.emp.hiredate} ~ 2024</td>
            <td style="text-align: center;"> 나의 취업 이력</td>
            <td style="text-align: center;">Samsung ${requestScope.dept.loc}지사</td>
          </tr>
          <tr>
            <td style="text-align: center;">공백</td>
            <td style="text-align: center;">취업을 위한 자기개발</td>
            <td style="text-align: center;">자격증 시험</td>
          </tr>
          <tr class="w3-white">
            <td style="text-align: center;">공백</td>
            <td style="text-align: center;"> 휴식을 공부의 연장</td>
            <td style="text-align: center;">신나게 여행가기</td>
          </tr>
          <tr>
            <td style="text-align: center;">공백</td>
            <td style="text-align: center;">해외 연수</td>
            <td style="text-align: center;">university, USA</td>
          </tr>
          <tr class="w3-white" >
            <td style="text-align: center;">공백</td>
            <td style="text-align: center;">여러가지 일들을 했습니다</td>
            <td style="text-align: center;">Cooking, Riding, Fighting</td>
          </tr>
          <tr class="w3-hide-medium">
            <td style="text-align: center;">공백</td>
            <td style="text-align: center;">춤을추며 놀았다</td>
            <td style="text-align: center;">춤추며 노래하는 나는야 곰돌이</td>
          </tr>
        </table>
         <img src="https://cdn-icons-png.flaticon.com/128/3227/3227027.png" class="w3-margin w3-circle" alt="Person" style="width:35%">
      </div>
    </div>
  </div>
</div>

<!--세번째 왼쪽 UI 설정 -->
<div class="w3-row" id="contact">
  <div class="w3-half w3-dark-grey w3-container w3-center" style="height:700px">
    <div class="w3-padding-64">
      <h1>Swing By</h1>
    </div>
    <div class="w3-padding-20">
   <!--  <iframe id="map" width="600" height="450" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
    	src="https://map.naver.com/v5/iframe/mainMap.nhn?scale=9&lng=126.9780&lat=37.5665&pinTitle=서울&initHideMarker=false&initHideInfoLayer=true&initShowTraffic=true"></iframe>-->
    	<a href="https://map.naver.com/p?c=15.00,0,0,0,dh"><img src = "https://cdn-icons-png.flaticon.com/128/854/854870.png" style="width:35%"></a>
      <p>Question or whatever</p>
      <p>${requestScope.dept.loc}</p>
      <p>010-1234-5678</p>
      <p> ${requsetScope.emp.ename}@test.com</p>
    </div>
  </div>
  <!-- 세번째 왼쪽 UI로 설정 -->
  <div class="w3-half w3-teal w3-container" style="height:700px">
    <div class="w3-padding-64 w3-padding-large">
      <h1>Contact</h1>
      <p class="w3-opacity">GET IN TOUCH</p>
      <form class="w3-container w3-card w3-padding-32 w3-white" action="/action_page.php" target="_blank">
        <div class="w3-section">
          <label>Name</label>
          <input class="w3-input" style="width:100%;" type="text" required name="Name">
        </div>
        <div class="w3-section">
          <label>Email</label>
          <input class="w3-input" style="width:100%;" type="text" required name="Email">
        </div>
        <div class="w3-section">
          <label>Message</label>
          <input class="w3-input" style="width:100%;" type="text" required name="Message">
        </div>
        <button type="submit" class="w3-button w3-teal w3-right">Send</button>
      </form>
    </div>
  </div>
</div>

<!-- Footer -->
<%@ include file="../layout/footer-information.jsp" %>
</c:if>
 

</body>
</html>

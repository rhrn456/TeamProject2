<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<form action="Join" method="POST" id="JoinForm" onsubmit="checkData()">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
	    <tr>
	        <td width="1220" height="20" colspan="2" bgcolor="#336699">
	            <p align="center">
	            	<font color="white" size="3">
	            		<b>회원가입</b>
	            	</font>
	            </p>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">사원번호</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input id="empno" type="text" name="empno" size="30">
	        		</span>
	        		<div id="show-msg"/>
	        	</b>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">사원이름</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input type="text" name="ename" size="30">
	        		</span>
	        	</b>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">직    무</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input type="text" name="job" size="30">
	        		</span>
	        	</b>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">담당매니저</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input type="text" name="mgr" size="30">
	        		</span>
	        	</b>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">입사년도</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input type="date" name="hiredate" size="30">
	        		</span>
	        	</b>
	        </td>
	    </tr>
	   	<tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">급    여</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input type="text" name="sal" size="30">
	        		</span>
	        	</b>
	        </td>
	    </tr>
	   	<tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">보 너 스</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input type="text" name="comm" size="30">
	        		</span>
	        	</b>
	        </td>
	    </tr>
	   	<tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">부서번호</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input type="text" name="deptno" size="30">
	        		</span>
	        	</b>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p><b><span style="font-size:12pt;">&nbsp;</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input type="submit" value="회원가입">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="메인으로" onclick="location.href='getDeptList.do'">
					</span>
				</b>
			</td>
	    </tr>
	</table>
</form>

<script>
const inputEmpno = document.getElementById('empno');
	inputEmpno.addEventListener('blur', (e) => {
		e.preventDefault();
		const showMsg = document.getElementById('show-msg');
		axios.get('http://localhost:8080/step07_ConnectionPool_c/api/getEmp', {params : {empno : inputEmpno.value}})
			.then(response => response.data)
			.then(result => {
				if(result.msg === '존재') {
					showMsg.innerHTML = '이미 존재하는 사원입니다.';
				} else {
					showMsg.innerHTML = '회원가입 가능한 사원입니다.';
				}
			})
	})
</script>


<%@ include file="../layout/footer.jsp" %>

<script type="text/javascript">
function checkData() {
	let joinForm = document.getElementById('');
	
	if(joinForm.empno.value == "") {
		
		return;
	}
	if(joinForm.ename.value == "") {
		
		return;
	}
	if(joinForm.job.value == "") {
		
		return;
	}
	if(joinForm.mgr.value == "") {
		
		return;
	}
	if(joinForm.hiredate.value == "") {
		
		return;
	}
	if(joinForm.sal.value == "") {
		
		return;
	}
	if(joinForm.comm.value == "") {
		
		return;
	}
	if(joinForm.deptno.value == "") {
		
		return;
	}
	
}
</script>

</body>
</html>
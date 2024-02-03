<%@page import="com.sun.corba.se.spi.orbutil.fsm.Input"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emp List</title>
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%@ include file="../layout/header.jsp" %>

<c:if test="${true}">
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
	<tr>
        <td bgcolor="#336699">
            <p align="center">
            <font color="white"><b><span style="font-size:12pt;">EMPNO</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">ENAME</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">JOB</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">MGR</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">HIREDATE</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">SAL</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">COMM</span></b></font></p>
        </td>
         <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:12pt;">DEPTNO</span></b></font></p>
        </td>
    </tr>

	<!-- 부서 객체 유무 검증 -->
	<c:if test="">    
		<tr>
	        <td colspan="5">
	            <p align="center"><b><span style="font-size:12pt;">등록된 부서가 존재하지 않습니다.</span></b></p>
	        </td>
	    </tr>
	</c:if>
	<!-- 반복 출력 -->
	<c:forEach items="${requestScope.empList}" var="emp">
		    <tr>
		        <td bgcolor="">
		            <p align="center">
			            <span style="font-size:12pt;">
			            	<!-- 부서번호 -->
			            	<b>
			            		<a href="getEmp.do?empno=${emp.empno}">${emp.empno}<a>
			            	</b>
			            </span>
		            </p>
		        </td>
		        <td bgcolor="">
					<p align="center">
						<span style="font-size:12pt;">
							<!--
								부서명 클릭 시, 부서번호로 해당부서 상세정보 출력
							 -->
							<b>
								${emp.ename}
							</b>
						</span>
					</p>
		        </td>
		        <td bgcolor="">
		            <p align="center">
		            	<span style="font-size:12pt;">
		            		<!-- 부서위치 -->
		         		   <b>${emp.job}</b>
		             	</span>
		             </p>
		        </td>
		        <td bgcolor="">
		            <p align="center">
			            <span style="font-size:12pt;">
			            	<!-- 부서번호 -->
			            	<b>${emp.mgr}</b>
			            </span>
		            </p>
		        </td>
		        <td bgcolor="">
		            <p align="center">
			            <span style="font-size:12pt;">
			            	<!-- 부서번호 -->
			            	<b>${emp.hiredate}</b>
			            </span>
		            </p>
		        </td>
		        <td bgcolor="">
		            <p align="center">
			            <span style="font-size:12pt;">
			            	<!-- 부서번호 -->
			            	<b>${emp.sal}</b>
			            </span>
		            </p>
		        </td>
		        <td bgcolor="">
		            <p align="center">
			            <span style="font-size:12pt;">
			            	<!-- 부서번호 -->
			            	<b>${emp.comm}</b>
			            </span>
		            </p>
		        </td>
		        <td bgcolor="">
		            <p align="center">
			            <span style="font-size:12pt;">
			            	<!-- 부서번호 -->
			            	<b>${emp.deptno}</b>
			            </span>
		            </p>
		        </td>		       		        		        		        		        
		    </tr>
    </c:forEach>
</table>
<hr>
<div align=center>
	<!-- 메인으로 클릭 시, 모든 부서 정보 출력 -->
	<span style="font-size:12pt;"><input type="button" value="메인으로" onclick="location.href='getDeptList.do'"></span>
	<!-- 부서생성 클릭 시, 새로운 부서 정보 입력 페이지로 이동 -->
		
</div>
</c:if>
<c:if test="">
	<div align="center">
  		<span style="font-size:12pt;">로그인이 필요한 서비스입니다.</span>
	</div>
</c:if>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>
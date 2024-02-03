package common.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.dao.EmpDAO;
import emp.dto.Emp;

@WebServlet("/Join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		1) '회원가입' 버튼 누르면 input이 존재하는 페이지 출력
		2) Information name, number, birth 값 입력받기
			name, number O -> 에러 발생 (존재하는 회원 정보)
			name, number X -> emp 정보 입력 창 이동
		3) Emp 세부 사항 입력 (empno 생성 방식 고민해볼 것)
			해당 사원 O -> 에러 페이지 이동
			해당 사원 X -> 생성 및 dept 부여 방식 고민
		*/
		
		String url = "errors/error.jsp";
		
		String empno = request.getParameter("empno");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		int mgr = Integer.parseInt(request.getParameter("mgr"));
		Date hiredate = Date.valueOf((request.getParameter("hiredate")));
		Float sal = Float.parseFloat(request.getParameter("sal"));
		int comm = Integer.parseInt(request.getParameter("comm"));
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		
		if(empno == null || empno == "") {
			request.setAttribute("error", "사원번호를 확인해주세요.");
			request.getRequestDispatcher(url).forward(request, response);
		} else if(ename == null || ename == "") {
			request.setAttribute("error", "사원명을 확인해주세요.");
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		boolean result = false;
		
		Emp newEmp = new Emp(Integer.parseInt(empno), ename, job, mgr, hiredate, sal, comm, deptno);
		
		try {
			result = EmpDAO.insertEmp(newEmp);
			
			if(result) {
				url = "login.jsp";
				response.sendRedirect(url);
				return;
			} else {
				request.setAttribute("error", "회원가입 실패");
				request.getRequestDispatcher(url).forward(request, response);
			}
			
		} catch (SQLException e) {
			request.setAttribute("error", "회원가입 실패");
			request.getRequestDispatcher(url).forward(request, response);
		}
		
	}
}

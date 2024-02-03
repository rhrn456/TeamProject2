package common.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import emp.dao.EmpDAO;
import emp.dto.Emp;

/**
 * Servlet implementation class MainLog
 */
@WebServlet("/mainlog.do")
public class MainLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String empno = request.getParameter("empno");
		String ename = request.getParameter("ename");
		
		String url = "errors/error.jsp";
		// step01 : 데이터 체크
		if(empno == null || empno == "" || ename == null || ename == "") {
			request.setAttribute("error", "사원번호 또는 사원명 재확인 필요");
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		// step02 Emp
		Emp emp = null;
		
		try {
			emp = EmpDAO.getEmpByEmpnoAndEname(Integer.parseInt(empno), ename);
			
			if(emp == null) {
				request.setAttribute("error", "존재하지 않는 사원 정보 오류");
				request.getRequestDispatcher(url).forward(request, response);
			}else {
				
				HttpSession session = request.getSession();
				session.setAttribute("userId", emp.getEmpno());
				session.setAttribute("userName", emp.getEname());
				
				url = "maincon.do";
				response.sendRedirect(url);
				return;
			}
		} catch (NumberFormatException | SQLException e) {
			request.setAttribute("error", "로그인 실패");
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}


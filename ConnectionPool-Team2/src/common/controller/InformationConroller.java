package common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dept.dao.DeptDAO;
import dept.dto.Dept;
import emp.dao.EmpDAO;
import emp.dto.Emp;

/**
 * Servlet implementation class Information
 */
@WebServlet("/information")
public class InformationConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "errors/error.jsp";

		/*
		 * getDeptList.do 서블릿에서 회원정보 버튼을 누를때 userId가 같이 넘어옵니다
		 * userId값을 int empno에 저장하여 해당하는 사원번호와 일치하면 일치한 사원에 정보를 가저옵니다.
		 */
		int empno = Integer.parseInt(request.getParameter("userId"));
		Emp emp = null;
		Dept dept = null;
		try {
			emp = EmpDAO.getEmpByEmpno(empno);
			int deptno = emp.getDeptno();
			dept = DeptDAO.getDeptByDeptno(deptno);

			if (emp != null || dept !=null) {
				url = "/mypage/Myinformation.jsp";
				
				request.setAttribute("dept", dept);
				request.setAttribute("emp", emp);
				request.getRequestDispatcher(url).forward(request, response);

			} else {
				request.setAttribute("error", "로그인 오류");
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("error", "로그인을 해주세요");
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	/*
	 * protected void service(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String url =
	 * "errors/error.jsp";
	 * 
	 * HttpSession session = request.getSession(false);
	 * 
	 * if (session == null) { url = "login.jsp"; response.sendRedirect(url); return;
	 * }
	 * 
	 * // 여기에서 Myinformation.jsp로 이동하는 코드 추가 url = "/mypage/Myinformation.jsp";
	 * request.setAttribute("name", "dev");
	 * request.getRequestDispatcher(url).forward(request, response); }
	 */
}
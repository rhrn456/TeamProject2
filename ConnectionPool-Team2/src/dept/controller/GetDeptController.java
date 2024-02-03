package dept.controller; 

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dept.dao.DeptDAO;
import dept.dto.Dept;

@WebServlet("/getDept.do")
public class GetDeptController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		/*
		 * 시나리오
		 * DB로부터 특정 부서 검색 후 반환
		 * 	-> dept 존재 O -> getDept.jsp에 출력
		 * 	-> dept 존재 X -> error.jsp에 error메세지 출력
		 * 							"존재하지 않는 부서" / "부서 정보 검색 실패"
		 */
		
		// ?
		String url = "errors/error.jsp";
		
		//int deptno = Integer.parseInt(request.getParameter("deptno"));
		int deptno = Integer.parseInt(request.getParameter("deptno"));
//		if(deptno == null) {
//			deptno = "0";
//			request.setAttribute("error","존재하지 않는 부서");
//			request.getRequestDispatcher(url).forward(request, response);
//		}
		Dept dept = null;
		
		try {
			dept = DeptDAO.getDeptByDeptno(deptno);
			if(dept != null) {
				request.setAttribute("dept",dept);
				url = "dept/getDept.jsp";
				request.getRequestDispatcher(url).forward(request, response);
			}else {
				request.setAttribute("error","존재하지 않는 부서");
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("error","qntj wjdqh cnffur tlfvo");
			request.getRequestDispatcher(url).forward(request, response);
		}
				
		
		
		
	}
}

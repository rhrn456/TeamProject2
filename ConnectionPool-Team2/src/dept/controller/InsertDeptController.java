package dept.controller; 

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dept.dao.DeptDAO;
import dept.dto.Dept;

@WebServlet("/insertDept.do")
public class InsertDeptController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// ?
		String deptno = request.getParameter("deptno");
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		
		String url = "errors/error.jsp";
		
		Dept newDept = new Dept(Integer.parseInt(deptno), dname, loc);
		boolean result = false;
		
		try {
			result = DeptDAO.insertDept(newDept);
			if(result) {
				url = "getDeptList.do";
				response.sendRedirect(url);
			}else {
				request.setAttribute("error", "부서 생성 실패");
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("error", "부서 생성 실패");
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		
	
}

}
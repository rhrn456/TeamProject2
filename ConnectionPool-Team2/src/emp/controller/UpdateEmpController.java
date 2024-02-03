package emp.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.dao.EmpDAO;
import emp.dto.Emp;


@WebServlet("/updateEmp.do")
public class UpdateEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String empno = request.getParameter("empno");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String mgr = request.getParameter("mgr");
//		Date hiredate = Date.valueOf(request.getParameter("hiredate"));
		String sal = request.getParameter("sal");
		String comm = request.getParameter("comm");
		String deptno = request.getParameter("deptno");
				
		String url = "errors/error.jsp";
		
		Emp emp = null;
		boolean result = false;
		
		try {
			emp = EmpDAO.getEmpByEmpno(Integer.parseInt(empno));
	
			
			if(emp != null){
				emp.setEname(ename);
				emp.setJob(job);
				emp.setMgr(Integer.parseInt(mgr));
//				emp.setHiredate(hiredate);
				emp.setSal(Float.parseFloat(sal));
				emp.setComm(Integer.parseInt(comm));
				emp.setDeptno(Integer.parseInt(deptno));
				
				
				
				result = EmpDAO.updateEmp(emp);
			}
			
			if(result) {
				url = "getEmp.do?empno=" + empno;
				response.sendRedirect(url);
				return;
			}else {
				request.setAttribute("error", "1");
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (Exception e) {
//			e.printStackTrace();
			request.setAttribute("error", "2");
			request.getRequestDispatcher(url).forward(request, response);
		} 
		
		
	}

}

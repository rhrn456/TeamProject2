package emp.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.dao.EmpDAO;
import emp.dto.Emp;

/**
 * Servlet implementation class GetEmpList
 */
@WebServlet("/getEmpList.do")
public class GetEmpList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "errors/error.jsp";
		ArrayList<Emp> empList = null;
		
		try {
			empList = EmpDAO.getEmpList();
			
			if (empList != null) {
				url = "emp/getEmpList.jsp"; 
				request.setAttribute("empList", empList);
				request.getRequestDispatcher(url).forward(request, response);;
			}else {
				request.setAttribute("error", "모든부서를 가져오지 못함");
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("error", "모든부서를 찾지 못함");
			request.getRequestDispatcher(url).forward(request, response);
		}
		
	}

}

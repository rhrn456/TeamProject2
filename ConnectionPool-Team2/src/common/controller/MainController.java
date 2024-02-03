package common.controller; 

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/main.do")
public class MainController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "errors/error.jsp";
		
		/*
		 * 시나리오
		 * 1) 세션 유무 확인
		 * 		세션 X -> 로그인 페이지 "login.jsp"
		 * 		세션 O -> 세션 객체 제거 -> 로그인 페이지 "login.jsp"
		 * 
		 */
		
		// getSession()
		// : 기존의 세션이 존재 하지 않으면 -> return 새로운 세션 객체;
		
		// getSession(false)
		// : 기존의 세션이 존재 하지 않으면 -> return null;
		
		// 
		
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			url = "login.jsp";
			response.sendRedirect(url);
			return;
		}
		
		session.invalidate();
		session = null;
		url = "getDeptList.do";
		response.sendRedirect(url);
		return;
	}
}
package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"*.do"})
public class LoginFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpSession session = httpRequest.getSession(false);
		
		String path = httpRequest.getRequestURI();
		System.out.println(path);
		
		if(!path.contains("/login.do")) {
			if(session == null || session.getAttribute("userId") == null) {
				httpResponse.sendRedirect("login.jsp");
				return;
			}
			
		}
		
		
		
		chain.doFilter(request, response);
	}

}
/* 다른방법
 * package common.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"*.do"},
			initParams = {@WebInitParam(name = "excludeURL", value = "/step07_ConnectionPool_c/login.do,/test.do")})
public class LoginFilter implements Filter {
	
	private List<String> excludeURLList;
	
	public void init(FilterConfig fconfig) {
		String excludeURLstring = fconfig.getInitParameter("excludeURL");
		excludeURLList = Arrays.asList(excludeURLstring.split(","));
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpSession session = httpRequest.getSession(false);
		
		String path = httpRequest.getRequestURI();
		
		if(!excludeURLList.contains(path)) {
			if(session == null || session.getAttribute("userId") == null) {
				httpResponse.sendRedirect("login.jsp");
				return;
			}
		}
		
		chain.doFilter(request, response);
	}

}

*/

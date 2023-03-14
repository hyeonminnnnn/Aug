package kr.ac.kopo.aug.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.aug.model.Users;

public class UsersInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {			//리퀘스트가 컨트롤러에 전달하기 전에 인터셉트, 우클릭 해서 오버라이드 HIA함
		HttpSession session = request.getSession(); //세션에서 값을 얻어서
		
		Users users = (Users) session.getAttribute("users"); //멤버 값을 꺼내봤을때 널이면 트루
		if(users != null) {
			System.out.println("UserInterceptor: TRUE");
			return true;
		}
																	//쿼리 스트링도 있다면 합쳐서
		String query = request.getQueryString();					//우리 프로그램 안에서만 움직여서 uri로 필요없는건 뺌
		session.setAttribute("target_url", request.getRequestURI() + (query != null ? "?" + query : ""));
		//로그인 가기전에 그 전 주소를 세션에 기억해둠
		
		response.sendRedirect("/login"); //로그인 하지않으면 리턴 false, 로그인 리퀘스트를 보내서 로그인페이지가뜸
		
			System.out.println("UserInterceptor: FALSE");
			return false;
	}

	
	
}

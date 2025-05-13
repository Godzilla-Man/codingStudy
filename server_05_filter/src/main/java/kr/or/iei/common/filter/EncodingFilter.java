package kr.or.iei.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncodingFilter
 */
//@WebFilter("/EncodingFilter")
public class EncodingFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public EncodingFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		//서버 중지 시, 또는 필터 코드 변경 시 기존 필터 객체를 소멸시킬 때 수행되는 메소드
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/* HttpServletRequest는 ServletRequest의 자식.
		* 필요하다면 다운캐스팅 하여 사용할 것.		 
		*  
		
		HttpServletRequest req = (HttpServletRequest) request;		
		
		*/		
		
		//서블릿에서 공통적으로 수행해야 하는 코드 => 인코딩
		request.setCharacterEncoding("utf-8");
		System.out.println("EncodingFilter doFilter !!!!");
				
		//현재 필터 작업이 끝난 후, 다음 필터가 존재하면 다음 필터에게 요청을 전달하고, 더 이상 수행할 필터가 없다면 적절한 서블릿을 호출
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		//서버 실행 시 또는 필터 클래스 내부 코드 변경 시, 필터 객체가 자동생성되는데 그때 필터에 필요한 내용을 초기화 하는 메소드
	}

}

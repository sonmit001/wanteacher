package kr.or.css.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;


@WebFilter(
	      description = "프로그램 실행시 한글처리를 위해 만든 파일",
	      urlPatterns = {"/*"},
	      //"/*" <--모든 파일에 대해 동작
	      initParams = {
	                  @WebInitParam(name="encoding", value="UTF-8")
	                }      
	      )
public class EncodingFilter implements Filter {
	
	private String Encoding;
	
    public EncodingFilter() {
        
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	      if(request.getCharacterEncoding() == null){
	         System.out.println("Before : " + request.getCharacterEncoding());
	         request.setCharacterEncoding(this.Encoding);
	         System.out.println("After  : " + request.getCharacterEncoding());
	      }
	      // pass the request along the filter chain
	      chain.doFilter(request, response); //다음 필터 있으면 필터 체인
	         System.out.println("response ....");
	      //response 처리 코드
	   }

	 public void init(FilterConfig fConfig) throws ServletException {
	      
	      this.Encoding = fConfig.getInitParameter("encoding");
	      //this.Encoding web.xml 설정된 : UTF-8
	      System.out.println("EncodingFilter init 함수:" + this.Encoding);
	   }


}

package edu.etime.txmcms.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodeFilter implements Filter {
	private String encode = "utf-8";
	private String contenttype = "text/html";
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		Filter.super.init(filterConfig);
		encode = filterConfig.getInitParameter("encode");
		contenttype = filterConfig.getInitParameter("contenttype");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding(encode);
		response.setCharacterEncoding(encode);
		response.setContentType(contenttype);
		chain.doFilter(request, response);
	}

}

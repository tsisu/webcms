package edu.etime.txmcms.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysUser;
import edu.etime.txmcms.services.LoginService;
import edu.etime.txmcms.services.LoginServiceImpl;

/**
 * 权鉴过滤器
 */
public class RightFilter implements Filter {

	/* map<key,value>
	 * key:资源地址作为key
	 * value:list<roleid>
	 */
	private Map<String, List<String>> rightMap = new HashMap<String, List<String>>();
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		//验证用户是否已经登录（验证session)
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("currentUser")!=null){
			SysUser user = (SysUser) session.getAttribute("currentUser");
			String roleid = user.getRoleid();
			//获取访问资源的路径（加上cmd参数）
			String uri = request.getRequestURI(); // /YQXCMS/admin/art
			//String url = request.getRequestURL().toString();
			String contextPath = request.getContextPath(); // /YQXCMS
			//System.out.println(uri+"\r\n"+contextPath);
			String path = uri.replace(contextPath, ""); // 结果：/admin/art
			//System.out.println(path);
			if(request.getParameter("cmd")!=null){
				path +="?cmd="+request.getParameter("cmd"); //结果：/admin/art?cmd=xxx
			}
			//System.out.println(path);
			//判断访问地址是否在权限列表中
			if(rightMap.containsKey(path)){
				//判断该用户的角色id是否在权限列表中
				if(rightMap.get(path).contains(roleid)){
					chain.doFilter(req, resp);
				}else{
					//无访问权限
					response.sendRedirect(request.getContextPath()+"/noaccess.jsp");
				}
			}else{
				//不再权限列表中，那么直接通过
				chain.doFilter(req, resp);
			}
			
		}else{
			//未登录
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//Filter.super.init(filterConfig);
		//查询权限数据
		LoginService service = new LoginServiceImpl();
		List<SysRightDto> list = service.selectRightList();
		//重新组织权限数据，将其放入rightMap中
		for(SysRightDto sysright : list){
			if(sysright.getFunurl()!=null && !sysright.getFunurl().equals("")){
				String key = sysright.getFunurl();
				if(rightMap.containsKey(key)){
					rightMap.get(key).add(sysright.getRoleid());
				}else{
					List<String> rolelist = new ArrayList<String>();
					rolelist.add(sysright.getRoleid());
					rightMap.put(key, rolelist);
				}
			}
		}
	}

}

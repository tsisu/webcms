package edu.etime.txmcms.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysUser;
import edu.etime.txmcms.services.SysUserService;
import edu.etime.txmcms.services.SysUserServiceImpl;
@WebServlet("/admin/user")
public class SysUserservlet extends HttpServlet{
	private SysUserService service = new SysUserServiceImpl();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("cmd")!=null){
			String cmd = request.getParameter("cmd");
			if(cmd.equals("list")){
				list(request,response);
			}else if(cmd.equals("initright")){
				initright(request,response);
			}else if(cmd.equals("right")){
				right(request,response);
			}
	}
	
}

	private void right(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String userid = request.getParameter("userid");
		String[] roleids = request.getParameterValues("roleids");
		service.saveUserRight(userid, roleids);
		response.sendRedirect(request.getContextPath()+"/admin/user?cmd=list");
	}

	private void initright(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String roleid = request.getParameter("roleid");
		List<SysRightDto> list = service.selectRightList(roleid);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/user/right.jsp").forward(request, response);
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		List<SysUser> list = service.selectSysUser(null);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/user/list.jsp").forward(request, response);
	}
}
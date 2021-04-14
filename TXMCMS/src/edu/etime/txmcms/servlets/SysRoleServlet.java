package edu.etime.txmcms.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysRole;
import edu.etime.txmcms.services.SysRoleService;
import edu.etime.txmcms.services.SysRoleServiceImpl;

/**
 * 角色管理servlet控制层
 *
 */
@WebServlet("/admin/role")
public class SysRoleServlet extends HttpServlet {

	private SysRoleService service = new SysRoleServiceImpl();
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
	
	/**
	 * 保存权限
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void right(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//获取参数
		String roleid = request.getParameter("roleid");
		String[] funids = request.getParameterValues("funids");
		service.saveRoleRight(roleid, funids);
		response.sendRedirect(request.getContextPath()+"/admin/role?cmd=list");
	}
	/**
	 * 初始化角色权限分配页面
	 * 1、所有可用的系统功能-->在页面上以树形结构显示。
	 * 2、角色已有的权限
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void initright(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String roleid = request.getParameter("roleid");
		List<SysRightDto> list = service.selectRightList(roleid);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/role/right.jsp").forward(request, response);
	}
	/**
	 * 查询角色列表
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<SysRole> list = service.selectSysRole(null);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/role/list.jsp").forward(request, response);
	}

}

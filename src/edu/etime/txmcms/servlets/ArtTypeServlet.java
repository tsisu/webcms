package edu.etime.txmcms.servlets;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.etime.txmcms.pojo.ArtType;
import edu.etime.txmcms.services.ArtTypeService;
import edu.etime.txmcms.services.ArtTypeServiceImpl;

/**
 * Servlet implementation class ArtTypeServlet
 */
@WebServlet("/admin/arttype")
public class ArtTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ArtTypeService service = new ArtTypeServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("cmd") != null) {
			String cmd = request.getParameter("cmd");
			if (cmd.equals("add")) {
				add(request, response);
			}else if(cmd.equals("list")) {
				list(request,response);
			}else if(cmd.equals("init")) {
				init(request,response);
			}else if(cmd.equals("edit")) {
				toedit(request,response);
		}
	}
}	
	private void add(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String typeid = UUID.randomUUID().toString();
		String typename = request.getParameter("typename");
		String typedesc = request.getParameter("typedesc");
		Integer typesort = Integer.parseInt(request.getParameter("typesort"));
		Integer typestate = Integer.parseInt(request.getParameter("typestate"));
		ArtType type = new ArtType();
		type.setTypeid(typeid);
		type.setTypename(typename);
		type.setTypedesc(typedesc);
		type.setTypesort(typesort);
		type.setTypestate(typestate);
		int rtn = service.add(type);
		if (rtn > 0) {
			request.setAttribute("msg", "保存文章类型成功");
		} else {
			request.setAttribute("msg", "保存文章类型失败");
		}
		request.getRequestDispatcher("/admin/arttype/add.jsp").forward(request, response);
		// response.sendRedirect("/admin/arttype/add.jsp");
	}
	private void list(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		//1、获取查询条件参数(x)
		ArtType type = new ArtType();
		if (request.getParameter("typename") != null && request.getParameter("typestate") != null) {
			String typename = request.getParameter("typename");
			Integer typestate = Integer.parseInt(request.getParameter("typestate"));
			type.setTypename(typename);
			type.setTypestate(typestate);
		}
	
		// type.setTypename(typename);
		//调用service中的方法获取查询结果
		List<ArtType> list = service.selectArtType(type);
		//将查询结果通过request对象转发到list页面
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/arttype/list.jsp").forward(request, response);
	}
	private void init(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		ArtType type = service.selectArtTypeById(id);
		request.setAttribute("type", type);
		request.getRequestDispatcher("/admin/arttype/edit.jsp").forward(request, response);
	}
	private void toedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//获取页面参数
		String typeid = request.getParameter("typeid");
		String typename = request.getParameter("typename");
		String typedesc = request.getParameter("typedesc");
		Integer typesort = Integer.parseInt(request.getParameter("typesort"));
		Integer typestate = Integer.parseInt(request.getParameter("typestate"));
		//修改文章页面参数
		ArtType type = new ArtType();
		type.setTypeid(typeid);
		type.setTypename(typename);
		type.setTypedesc(typedesc);
		type.setTypesort(typesort);
		type.setTypestate(typestate);
		//调用service方法进行修改
		int rtn = service.updateArtType(type);
		if (rtn > 0) {
			//直接跳转到list页面(重定向到list页面--list这个servlet)
			response.sendRedirect(request.getContextPath()+"/admin/arttype?cmd=list");
		}else {
			request.setAttribute("msg", "初始化页面失败");
			request.getRequestDispatcher("/admin/arttype/edit.jsp").forward(request, response);
		}
	}
}

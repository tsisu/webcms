package edu.etime.txmcms.servlets;
//文章管理的servlet控制类

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import edu.etime.txmcms.dto.ArtManageDto;
import edu.etime.txmcms.pojo.ArtManage;
import edu.etime.txmcms.pojo.ArtType;
import edu.etime.txmcms.pojo.SysUser;
import edu.etime.txmcms.services.ArtManageService;
import edu.etime.txmcms.services.ArtManageServiceImpl;
import edu.etime.txmcms.services.ArtTypeService;
import edu.etime.txmcms.services.ArtTypeServiceImpl;

@WebServlet("/admin/art")
@MultipartConfig
public class ArtManageServlet extends HttpServlet {
	private ArtManageService service = new ArtManageServiceImpl();
	private ArtTypeService artTypeService = new ArtTypeServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("cmd") != null) {
			String cmd = request.getParameter("cmd");
			if (cmd.equals("toadd")) {
				toadd(request, response);
			} else if (cmd.equals("add")) {
				add(request, response);
			} else if (cmd.equals("list")) {
				list(request, response);
			} else if (cmd.equals("init")) {
				init(request, response);
			} else if (cmd.equals("edit")) {
				edit(request, response);
			} else if (cmd.equals("auditlist")) {
				auditlist(request, response);
			} else if (cmd.equals("initaudit")) {
				initaudit(request, response);
			} else if (cmd.equals("audit")) {
				audit(request, response);
			}
		}
	}

	private void audit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		ArtManage art = new ArtManage();
		art.setArtid(request.getParameter("artid"));
		art.setArtauditstate(Integer.parseInt(request.getParameter("artauditstate")));
		art.setArtauditdesc(request.getParameter("artauditdesc"));
		art.setArtaudittime(new Date());
		// 调用方法审核
		int rtn = service.auditArt(art);
		// 处理结果
		if (rtn > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/art?cmd=auditlist");
		} else {
			request.setAttribute("msg", "失败");
			request.getRequestDispatcher("/admin/art?cmd=initaudit&id=" + art.getArtid()).forward(request, response);
		}
	}

	private void initaudit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 获取参数
		String id = request.getParameter("id");
		// 初始化下拉列表
		ArtType type = new ArtType();
		type.setTypestate(1);
		List<ArtType> arttypelist = artTypeService.selectArtType(type);
		request.setAttribute("arttypelist", arttypelist);
		// 初始化页面内容
		ArtManage art = service.selectArtById(id);
		request.setAttribute("art", art);
		// 转发到修改页面
		request.getRequestDispatcher("/admin/art/audit.jsp").forward(request, response);
	}

	private void auditlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1、获取查询条件
		ArtManage art = new ArtManage();
		if (request.getParameter("arttitle") != null) {
			art.setArttitle(request.getParameter("arttitle"));
		}
		if (request.getParameter("typeid") != null) {
			art.setTypeid(request.getParameter("typeid"));
		}
		if (request.getParameter("artauditstate") != null) {
			art.setArtauditstate(Integer.parseInt(request.getParameter("artauditstate")));
		}
		if (request.getParameter("artpublishstate") != null) {
			art.setArtpublishstate(Integer.parseInt(request.getParameter("artpublishstate")));
		}
		// 2、调用service方法获取查询结果
		List<ArtManageDto> list = service.selectArt(art);
		request.setAttribute("list", list);
		// 将文章类型列表转发到页面
		ArtType type = new ArtType();
		type.setTypestate(1);
		List<ArtType> arttypelist = artTypeService.selectArtType(type);
		request.setAttribute("arttypelist", arttypelist);
		// 3、转发到list页面
		request.getRequestDispatcher("/admin/art/auditlist.jsp").forward(request, response);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 获取参数并放入实体类中
		ArtManage art = new ArtManage();
		art.setArtid(request.getParameter("artid"));
		art.setTypeid(request.getParameter("typeid"));
		art.setArttitle(request.getParameter("arttitle"));
		art.setArtsummary(request.getParameter("artsummary"));
		art.setArtcontent(request.getParameter("artcontent"));
		art.setArtuploadtime(new Date());// 上传时间，就是当前系统时间
		art.setArtauthor(request.getParameter("artauthor"));
		art.setArtsource(request.getParameter("artsource"));
		art.setArtauditstate(0);// 审核状态默认为0--未审核
		art.setArtpublishstate(0);// 发布状态默认为0--未发布
		art.setArtuserid("-1");// 暂时默认为-1，后面从session中进行获取
		art.setArtusername("默认");// 后面从session中获取
		// 上传文件
		Part part = request.getPart("img");
		// 判断是否有文件上传
		if (part != null && part.getSize() > 0) {
			// 构建文件的保存路径(1、文件名-重命名；2、后缀名)
			String name = part.getHeader("content-disposition");
			System.out.println("name:" + name);// 测试使用
			// 获取文件的后缀
			String extname = name.substring(name.lastIndexOf("."), name.length() - 1);
			System.out.println("extname:" + extname);
			// 新文件名
			String newname = UUID.randomUUID().toString() + extname;
			System.out.println("newname:" + newname);
			// 文件保存的相对路径（保存到数据库中路径）
			String savepath = "/file/" + newname;
			System.out.println("savepath:" + savepath);
			// 获取保存的绝对路径
			String abspath = request.getServletContext().getRealPath(savepath);
			System.out.println("abspath:" + abspath);
			// 保存文件
			part.write(abspath);
			// 保存文件路径到数据库
			art.setArtimg(savepath);
		} else {
			art.setArtimg(request.getParameter("artimg"));
		}
		// 调用方法增加
		int rtn = service.updateArt(art);
		// 处理结果
		if (rtn > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/art?cmd=list");
		} else {
			request.setAttribute("msg", "失败");
			request.getRequestDispatcher("/admin/art?cmd=init&id=" + art.getArtid()).forward(request, response);
		}
	}

	private void init(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 获取参数
		String id = request.getParameter("id");
		// 初始化下拉列表
		ArtType type = new ArtType();
		type.setTypestate(1);
		List<ArtType> arttypelist = artTypeService.selectArtType(type);
		request.setAttribute("arttypelist", arttypelist);
		// 初始化页面内容
		ArtManage art = service.selectArtById(id);
		request.setAttribute("art", art);
		// 转发到修改页面
		request.getRequestDispatcher("/admin/art/edit.jsp").forward(request, response);
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1、获取查询条件
		ArtManage art = new ArtManage();
		if (request.getParameter("arttitle") != null) {
			art.setArttitle(request.getParameter("arttitle"));
		}
		if (request.getParameter("typeid") != null) {
			art.setTypeid(request.getParameter("typeid"));
		}
		if (request.getParameter("artauditstate") != null) {
			art.setArtauditstate(Integer.parseInt(request.getParameter("artauditstate")));
		}
		if (request.getParameter("artpublishstate") != null) {
			art.setArtpublishstate(Integer.parseInt(request.getParameter("artpublishstate")));
		}
		// 2、调用service方法获取查询结果
		List<ArtManageDto> list = service.selectArt(art);
		request.setAttribute("list", list);
		// 将文章类型列表转发到页面
		ArtType type = new ArtType();
		type.setTypestate(1);
		List<ArtType> arttypelist = artTypeService.selectArtType(type);
		request.setAttribute("arttypelist", arttypelist);
		// 3、转发到list页面
		request.getRequestDispatcher("/admin/art/list.jsp").forward(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtManage art = new ArtManage();
		art.setArtid(UUID.randomUUID().toString());
		art.setTypeid(request.getParameter("typeid"));
		art.setArttitle(request.getParameter("arttitle"));
		art.setArtsummary(request.getParameter("artsummary"));
		art.setArtcontent(request.getParameter("artcontent"));
		art.setArtuploadtime(new Date());
		art.setArtauthor(request.getParameter("artauthor"));
		art.setArtsource(request.getParameter("artsource"));
		art.setArtauditstate(0);
		art.setArtpublishstate(0);
		HttpSession session = request.getSession();
		SysUser currentUser = (SysUser)session.getAttribute("currentUser");
		art.setArtuserid(currentUser.getUserid());
		art.setArtusername(currentUser.getUsername());
		request.getPart("img");
		Part part = request.getPart("img");
		if (part != null && part.getSize() > 0) {
			// 构建文件保存路径(1、文件名-重命名；2、后缀名)
			String name = part.getHeader("content-disposition");
			System.out.println("name:" + name);// 测试使用
			// 获取文件的后缀
			String extname = name.substring(name.lastIndexOf("."), name.length() - 1);
			System.out.println("extname:" + extname);
			// 新文件名
			String newname = UUID.randomUUID().toString() + extname;
			System.out.println("newname:" + newname);
			// 文件保存的相对路径(保存到数据库中路径)
			String savepath = "/file/" + newname;
			System.out.println("savepath:" + savepath);
			// 文件保存的绝对路径()
			String abspath = request.getServletContext().getRealPath(savepath);
			System.out.println("abspath:" + abspath);
			// 保存文件
			part.write(abspath);
			art.setArtimg(savepath);
		} else {
			art.setArtimg(request.getParameter("artimg"));
		}
		// 使用方法增加
		int rtn = service.insertArt(art);
		if (rtn > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/art?cmd=list");
		} else {
			request.setAttribute("msg", "失败");
			request.getRequestDispatcher("/admin/art?cmd=toadd").forward(request, response);
		}

	}

	private void toadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1、组织查询条件：typeid=1
		ArtType type = new ArtType();
		type.setTypestate(1);
		// 2、查询
		List<ArtType> arttypelist = artTypeService.selectArtType(type);
		// 3、增加到转发页面
		request.setAttribute("arttypelist", arttypelist);
		request.getRequestDispatcher("/admin/art/add.jsp").forward(request, response);
	}
}

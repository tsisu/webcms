package edu.etime.txmcms.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.etime.txmcms.pojo.SysFunction;
import edu.etime.txmcms.pojo.SysUser;
import edu.etime.txmcms.services.LoginService;
import edu.etime.txmcms.services.LoginServiceImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private LoginService service = new LoginServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("cmd") != null) {
			String cmd = request.getParameter("cmd");
			if (cmd.equals("login")) {
				login(request, response);
			}
		}

	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1获取参数
		SysUser user = new SysUser();
		user.setUsername(request.getParameter("username"));
		user.setUserpwd(request.getParameter("userpwd"));
		// 2根据用户名和密码查询用户
		SysUser loginuser = service.Login(user);
		// 3判断查询结果是否为null，null则登录失败，否则成功
		if (loginuser != null) {
			// 4如果成功，记录session，跳转到主页面
			// 记录session之前，一般会将密码清空
			loginuser.setUserpwd("");
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", loginuser);
			// 跳转到主页面
			initmain(request, response, loginuser);
		} else {
			// 登录失败
			request.setAttribute("msg", "用户名密码不正确，请核对后重新输入");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	/**
	 * 登录成功后初始化主页面的方法
	 * 
	 * @param request
	 * @param response
	 * @param user
	 * @throws IOException
	 * @throws ServletException
	 */
	private void initmain(HttpServletRequest request, HttpServletResponse response, SysUser user)
			throws ServletException, IOException {
		// 查询功能列表
		List<SysFunction> list = service.selectFunByRoleId(user.getRoleid());
		// 转发到主页面
		request.setAttribute("list", list);
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}

}
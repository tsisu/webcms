package edu.etime.txmcms.servlets;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import edu.etime.txmcms.common.Message;
import edu.etime.txmcms.pojo.SysFunction;
import edu.etime.txmcms.services.SysFunctionService;
import edu.etime.txmcms.services.SysFunctionServiceImpl;

@WebServlet("/admin/fun")
public class SysFunctionServlet extends HttpServlet {

	private SysFunctionService service = new SysFunctionServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("cmd") != null) {
			String cmd = request.getParameter("cmd");
			if (cmd.equals("init")) {
				init(request, response);
			} else if (cmd.equals("save")) {
				save(request, response);
			}
		}
	}

	private void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String funid = request.getParameter("funid");
		SysFunction fun = new SysFunction();
		fun.setFunname(request.getParameter("funname"));
		fun.setFunurl(request.getParameter("funurl"));
		fun.setFunpid(request.getParameter("funpid"));
		fun.setFunstate(Integer.parseInt(request.getParameter("funstate")));
		Message message = new Message();
		if (funid.equals("")) {// 增加
			fun.setFunid(UUID.randomUUID().toString());
			message.setCode(service.insertSysFunction(fun));
			message.setMsg("增加系统功能");
		} else {
			fun.setFunid(funid);
			message.setCode(service.updateSysFunction(fun));
			message.setMsg("修改系统功能");
		}
		// 反馈内容到页面
		String jsonmsg = JSONObject.toJSONString(message);
		response.getWriter().println(jsonmsg);
	}

	private void init(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 查询所有的系统功能树
		List<SysFunction> list = service.selectSysFunction(null);
		// 转发到fun.jsp页面
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/fun/fun.jsp").forward(request, response);
	}

}

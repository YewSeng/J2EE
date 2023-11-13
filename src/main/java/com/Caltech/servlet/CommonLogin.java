package com.Caltech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Caltech.dao.AdminDao;
import com.Caltech.dao.SuperAdminDao;
import com.Caltech.dao.UserDao;

/**
 * Servlet implementation class CommonLogin
 */
public class CommonLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SuperAdminDao superAdminDao;
    private AdminDao adminDao;
    private UserDao userDao;
    
    private static final String SUPER_ADMIN_DASHBOARD = "/SuperAdminHome.jsp";
    private static final String ADMIN_DASHBOARD = "/AdminHome.jsp";
    private static final String USER_DASHBOARD = "/UserHome.jsp";
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	// TODO Auto-generated method stub
    	super.init(config);
        superAdminDao = new SuperAdminDao();
        adminDao = new AdminDao();
        userDao = new UserDao();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommonLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        HttpServletRequest httpRequest = (HttpServletRequest) request;
	        HttpServletResponse httpResponse = (HttpServletResponse) response;
	        HttpSession session = httpRequest.getSession();
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        if (superAdminDao.verifySuperAdmin(username, password)) {
	            session.setAttribute("SuperAdmin", username);
	            // Set response status to 200 (OK) and send a JSON response
	            response.setStatus(HttpServletResponse.SC_OK);
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write("{\"redirect\": \"/SuperAdminHome.jsp\"}");
	        } else if (adminDao.verifyAdmin(username, password)) {
	            session.setAttribute("Admin", username);
	            response.setStatus(HttpServletResponse.SC_OK);
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write("{\"redirect\": \"/AdminHome.jsp\"}");
	        } else if (userDao.verifyUser(username, password)) {
	            session.setAttribute("User", username);
	            response.setStatus(HttpServletResponse.SC_OK);
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write("{\"redirect\": \"/UserHome.jsp\"}");
	        } else {
	            // If login fails, set an error message in the response
	            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write("{\"error\": \"Incorrect username or password. Please try again.\"}");
	        }
	    }

}

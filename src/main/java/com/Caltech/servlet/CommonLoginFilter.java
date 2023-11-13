package com.Caltech.servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Caltech.dao.AdminDao;
import com.Caltech.dao.SuperAdminDao;
import com.Caltech.dao.UserDao;

/**
 * Servlet Filter implementation class CommonLoginFilter
 */
public class CommonLoginFilter implements Filter {

    private SuperAdminDao superAdminDao;
    private AdminDao adminDao;
    private UserDao userDao;
    
    private static final String SUPER_ADMIN_DASHBOARD = "/SuperAdminHome.jsp";
    private static final String ADMIN_DASHBOARD = "/AdminHome.jsp";
    private static final String USER_DASHBOARD = "/UserHome.jsp";


    /**
     * Default constructor.
     */
    public CommonLoginFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // Cleanup code if needed
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
    HttpServletRequest httpRequest = (HttpServletRequest) request;
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    HttpSession session = httpRequest.getSession();
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (superAdminDao.verifySuperAdmin(username, password)) {
        session.setAttribute("SuperAdmin", username);
        httpResponse.sendRedirect(httpRequest.getContextPath() + SUPER_ADMIN_DASHBOARD);
    } else if (adminDao.verifyAdmin(username, password)) {
        session.setAttribute("Admin", username);
        httpResponse.sendRedirect(httpRequest.getContextPath() + ADMIN_DASHBOARD);
    } else if (userDao.verifyUser(username, password)) {
        session.setAttribute("User", username);
        httpResponse.sendRedirect(httpRequest.getContextPath() + USER_DASHBOARD);
    } else {
        // If login fails, set an error message and redirect to the index page or another error page
        request.setAttribute("errorMessage", "<span style='color: red; font-weight: bold;'>Incorrect username or password. Please try again.</span>");
        httpRequest.getRequestDispatcher("/home.jsp").forward(request, response);
        return; // return after forwarding
    }
}


    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // Initialize your DAO objects or perform any other setup
        superAdminDao = new SuperAdminDao();
        adminDao = new AdminDao();
        userDao = new UserDao();
    }
}

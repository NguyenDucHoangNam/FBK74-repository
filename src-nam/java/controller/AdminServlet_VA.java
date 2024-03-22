/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AdminDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Datnt
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/admin/manageuser"})
public class AdminServlet_VA extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        if (session != null && session.getAttribute("account") != null) {
            switch (action) {
                case "viewList":
                    getListUser(request, response);
                    break;
                case "enableUser":
                    enalbleUser(request, response);
                    break;
                case "disableUser":
                    disableUser(request, response);
                    break;
                case "setRole":
                    setRoleUser(request, response);
                    break;
            }
        } else {
            response.sendRedirect("sign-in.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        if (session != null && session.getAttribute("account") != null) {
            switch (action) {
                case "viewList":
                    getListUser(request, response);
                    break;
            }
        } else {
            response.sendRedirect("sign-in.jsp");
        }
    }

    private void getListUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String indexS = request.getParameter("index");
            int index = 0;
            int endPage = 0;
            if (indexS == null) {
                indexS = "1";
            }
            index = Integer.parseInt(indexS);
            AdminDAO adminDAO = new AdminDAO();
            List<User> listUsers = adminDAO.getUsers(index);
            int count = adminDAO.getTotalUser();
            System.out.println("Count " + count);
            
            // chinh phan trang.
            // end page = cont / so phan tu tren 1 trang
            // count / so phan tu tren 1 trang
            endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            System.out.println("List User Count " + listUsers.size());
            if (listUsers.size() > 0) {
                request.setAttribute("endP", endPage);
                request.setAttribute("selectedPage", index);
                request.setAttribute("listUser", listUsers);
            } else {
                String msg = "There are no users in your system";
                request.setAttribute("msg", msg);
            }
            request.getRequestDispatcher("manage-user_VA.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void disableUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String idAccountS = request.getParameter("id");
            if (idAccountS != null) {
                int idAccount = Integer.parseInt(idAccountS);
                AdminDAO adminDAO = new AdminDAO();
                int result = adminDAO.disableUser(idAccount);
                if (result > 0) {
                    String msg = "Disable successfully";
                    request.setAttribute("isDisable", msg);

                } else {
                    String msg = "Disable User Failed";
                    request.setAttribute("isDisableError", msg);
                }
            }
            request.getRequestDispatcher("manageuser?action=viewList").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void enalbleUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String idAccountS = request.getParameter("id");
            if (idAccountS != null) {
                int idAccount = Integer.parseInt(idAccountS);
                AdminDAO adminDAO = new AdminDAO();
                int result = adminDAO.enableUser(idAccount);
                if (result > 0) {
                    String msg = "Enable successfully";
                    request.setAttribute("isDisable", msg);

                } else {
                    String msg = "Enable User Failed";
                    request.setAttribute("isDisableError", msg);
                }
            }
            request.getRequestDispatcher("manageuser?action=viewList").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setRoleUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String idAccountS = request.getParameter("id");
            String roleIdS = request.getParameter("roleId");
            if (idAccountS != null && roleIdS != null) {
                int idAccount = Integer.parseInt(idAccountS);
                int roleId = Integer.parseInt(roleIdS);
                AdminDAO adminDAO = new AdminDAO();
                int result = adminDAO.setRoleUser(idAccount, roleId );
                if (result > 0) {
                    String msg = "Enable successfully";
                    request.setAttribute("isDisable", msg);

                } else {
                    String msg = "Enable User Failed";
                    request.setAttribute("isDisableError", msg);
                }
            }
            request.getRequestDispatcher("manageuser?action=viewList").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

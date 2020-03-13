package com.java.code.servlet;

import com.java.code.jdbc.StudentHomeworkJdbc;
import com.java.code.model.Homework;
import com.java.code.model.Student;
import com.java.code.model.StudentHomework;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;


@WebServlet("/addhomework")
public class AddHomeworkServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码，以防表单提交的内容乱码
        req.setCharacterEncoding("utf-8");

        Homework homework = new Homework();
        homework.setId(Long.parseLong(req.getParameter("hid")));
        homework.setTitle(req.getParameter("htitle"));
        Date date = new Date();
        homework.setCreateTime(date);

        boolean result = StudentHomeworkJdbc.addhomework(homework);

        req.setAttribute("isOK", result);  //用来判断是否添加作业成功
        req.setAttribute("type","addHomework");
        req.getRequestDispatcher("result.jsp").forward(req,resp);
    }
}

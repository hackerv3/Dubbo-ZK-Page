package cn.arebirth.controller;

import cn.arebirth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 登录
     *
     * @param userName
     * @param password
     * @return
     */
    @RequestMapping("/login")
    public String login(@RequestParam(value = "username") String userName, @RequestParam String password, HttpSession session) {
        int result = userService.login(userName, password);
        if (result > 0) {
            session.removeAttribute("msg");
            return "redirect:/customer/findByPage";
        } else {
            session.setAttribute("msg", "用户名或密码错误！");
            return "redirect:/login.jsp";
        }
    }
}

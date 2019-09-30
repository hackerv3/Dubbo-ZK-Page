package cn.arebirth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    /**
     * 跳转页面
     *
     * @param path
     * @return
     */
    @RequestMapping("/{path}")
    public String path(@PathVariable String path) {
        return path;
    }
}

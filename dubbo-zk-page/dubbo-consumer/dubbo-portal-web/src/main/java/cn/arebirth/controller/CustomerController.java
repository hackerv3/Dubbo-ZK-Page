package cn.arebirth.controller;

import cn.arebirth.pojo.Customer;
import cn.arebirth.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/findByPage")
    public String list(Customer customer,
                       @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "2") int pageSize,
                       Model model) {
        //echo
        model.addAttribute("page", customerService.findByPage(customer, pageIndex, pageSize));
        model.addAttribute("customer", customer);
        return "list";
    }
}

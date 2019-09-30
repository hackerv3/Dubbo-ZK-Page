package cn.arebirth.service.impl;

import cn.arebirth.dubbo.service.CustomerDubboService;
import cn.arebirth.pojo.Customer;
import cn.arebirth.pojo.PageBean;
import cn.arebirth.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDubboService customerDubboService;

    @Override
    public PageBean findByPage(Customer customer, int pageIndex, int pageSize) {
        return customerDubboService.findByPage(customer, pageIndex, pageSize);
    }
}

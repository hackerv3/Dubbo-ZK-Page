package cn.arebirth.service;

import cn.arebirth.pojo.Customer;
import cn.arebirth.pojo.PageBean;

public interface CustomerService {
    /**
     * 分页查询
     *
     * @param customer  查询条件
     * @param pageIndex 当前页码
     * @param pageSize  每页显示数量
     * @return
     */
    PageBean findByPage(Customer customer, int pageIndex, int pageSize);
}

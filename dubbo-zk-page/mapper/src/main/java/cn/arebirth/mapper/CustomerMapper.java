package cn.arebirth.mapper;

import cn.arebirth.pojo.Customer;
import com.github.pagehelper.Page;

public interface CustomerMapper {
    Page<Customer> selectByPage(Customer customer);
}

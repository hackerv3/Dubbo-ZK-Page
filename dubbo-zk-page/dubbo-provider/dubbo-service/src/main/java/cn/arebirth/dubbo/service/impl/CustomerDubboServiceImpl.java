package cn.arebirth.dubbo.service.impl;

import cn.arebirth.dubbo.service.CustomerDubboService;
import cn.arebirth.mapper.CustomerMapper;
import cn.arebirth.pojo.Customer;
import cn.arebirth.pojo.PageBean;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerDubboServiceImpl implements CustomerDubboService {
    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public PageBean findByPage(Customer customer, int pageIndex, int pageSize) {
        //使用 Mybatis分页插件
        PageHelper.startPage(pageIndex, pageSize);

        //调用分页查询方法，其实就是查询下旬所有数据，mybatis自动帮我们进行分页计算
        Page<Customer> page = customerMapper.selectByPage(customer);

        //总页数
        int totalPage = (int) Math.ceil((double) (page.getTotal() / (double) pageSize));

        return new PageBean(pageIndex, totalPage, (int) page.getTotal(), pageSize, page.getResult());
    }
}

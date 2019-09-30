package cn.arebirth.dubbo.service.impl;

import cn.arebirth.dubbo.service.UserDubboService;
import cn.arebirth.mapper.UserMapper;
import cn.arebirth.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDubboServiceImpl implements UserDubboService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Integer login(String username, String password) {
        User user = userMapper.getUserByUserName(username);
        if (user != null && user.getPassword().equals(password)) {
            return 1;
        }
        return -1;
    }
}

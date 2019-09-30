package cn.arebirth.service.impl;

import cn.arebirth.dubbo.service.UserDubboService;
import cn.arebirth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDubboService userDubboService;

    @Override
    public Integer login(String username, String password) {
        return userDubboService.login(username, password);
    }
}

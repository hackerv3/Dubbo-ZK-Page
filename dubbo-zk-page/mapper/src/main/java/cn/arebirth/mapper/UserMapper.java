package cn.arebirth.mapper;

import cn.arebirth.pojo.User;

public interface UserMapper {
    User getUserByUserName(String userName);
}

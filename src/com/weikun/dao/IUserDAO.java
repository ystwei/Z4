package com.weikun.dao;

import com.weikun.vo.User;

import java.util.List;

/**
 * Created by Administrator on 2017/3/27.
 */
public interface IUserDAO {
    public boolean add(User user);
    public boolean del(int id);
    public boolean update(User user);
    public List<User> queryAll();
    public User queryUserByid(int id);
    public User queryUserByUsername(String username);
}

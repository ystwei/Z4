package com.weikun.service;

import com.weikun.dao.IUserDAO;
import com.weikun.dao.UserDAOImpl;
import com.weikun.vo.User;

import java.util.List;

/**
 * Created by Administrator on 2017/3/27.
 */
public class UserServiceImpl implements IUserService {
    private IUserDAO dao=new UserDAOImpl();
    @Override
    public boolean add(User user) {
        if(this.queryUserByUsername(user.getUsername())!=null){
            return false;
        }
        return dao.add(user);
    }

    @Override
    public boolean del(int id) {
        return dao.del(id);
    }

    @Override
    public boolean update(User user) {
        if(this.queryUserByUsername(user.getUsername())!=null){
            return false;
        }
        return dao.update(user);
    }

    @Override
    public List<User> queryAll() {
        return dao.queryAll();
    }

    @Override
    public User queryUserByid(int id) {
        return dao.queryUserByid(id);
    }

    @Override
    public User queryUserByUsername(String username) {
        return dao.queryUserByUsername(username);
    }
}

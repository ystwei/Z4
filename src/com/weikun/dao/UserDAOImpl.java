package com.weikun.dao;

import com.weikun.db.DB;
import com.weikun.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2017/3/27.
 */
public class UserDAOImpl implements  IUserDAO{

    private Connection conn;
    public UserDAOImpl(){
        conn= DB.getConnection();
    }

    @Override
    public boolean add(User user) {
        PreparedStatement pstmt=null;
        boolean flag=false;
        String sql="insert into user(username,password) values(?,?)";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,user.getUsername());
            pstmt.setString(2,user.getPassword());

            flag=pstmt.executeUpdate()>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            if(pstmt!=null){
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        DB.closeConnection();
        return flag;
    }

    @Override
    public boolean del(int id) {
        return false;
    }

    @Override
    public boolean update(User user) {
        return false;
    }

    @Override
    public List<User> queryAll() {
        return null;
    }

    @Override
    public User queryUserByid(int id) {
        return null;
    }
}

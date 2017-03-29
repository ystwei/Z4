package com.weikun.dao;

import com.weikun.db.DB;
import com.weikun.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        boolean flag=false;
        PreparedStatement pstmt=null;
        try {
            pstmt=conn.prepareStatement("delete from user where id =?");
            pstmt.setInt(1,id);

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


        return flag;
    }

    @Override
    public boolean update(User user) {
        boolean flag=false;

        PreparedStatement pstmt=null;
        try {
            pstmt=conn.prepareStatement("update user set username=? , password=? where id=?");
            pstmt.setString(1,user.getUsername());
            pstmt.setString(2,user.getPassword());
            pstmt.setInt(3,user.getId());
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

        return flag;
    }

    @Override
    public List<User> queryAll() {
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        List<User> list=new ArrayList<User>();
        try {
            pstmt=conn.prepareStatement("select * from user order by id desc");

            rs=pstmt.executeQuery();
            while(rs.next()){
                User user=new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));

                list.add(user);


            }

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
            if(rs!=null){
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return list;
    }

    @Override
    public User queryUserByid(int id) {
        PreparedStatement pstmt=null;
        User user=null;
        ResultSet rs=null;
        try {
            pstmt=conn.prepareStatement("select * from user WHERE  id=?");
            pstmt.setInt(1,id);

            rs=pstmt.executeQuery();

            if(rs.next()){
                user=new User();
                user.setUsername(rs.getString("username"));
                user.setId(rs.getInt("id"));
                user.setPassword(rs.getString("password"));

            }

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
            if(rs!=null){
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return user;
    }

    @Override
    public User queryUserByUsername(String username) {

        PreparedStatement pstmt=null;
        User user=null;
        ResultSet rs=null;
        try {
            pstmt=conn.prepareStatement("select * from user WHERE  username=?");
            pstmt.setString(1,username);

            rs=pstmt.executeQuery();

            if(rs.next()){
                user=new User();
                user.setUsername(rs.getString("username"));
                user.setId(rs.getInt("id"));
                user.setPassword(rs.getString("password"));

            }

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
            if(rs!=null){
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return user;
    }
}

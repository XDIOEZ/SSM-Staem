package com.ssmdemo.dao;

import com.ssmdemo.dao.entity.UserEntity;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author Barry Wang
 * */

public interface UserDao {

    void addUser(@Param("id") int id, @Param("username") String username, @Param("password") String password);

    void delete(@Param("id") int id);

    int update(@Param("id") int id, @Param("username") String username, @Param("password") String password);

    UserEntity selectByid(@Param("id") int id);

    UserEntity selectByName(@Param("username") String username);

}

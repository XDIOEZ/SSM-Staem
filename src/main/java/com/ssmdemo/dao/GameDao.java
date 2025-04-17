package com.ssmdemo.dao;

import com.ssmdemo.dao.entity.GameEntity;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GameDao {
    // 添加游戏
    void addGame(GameEntity gameEntity);

    // 根据 ID 更新游戏
    void updateGameById(GameEntity gameEntity);

    // 根据 Name 更新游戏
    void updateGameByName(GameEntity gameEntity);

    // 根据 Name 查询游戏
    GameEntity selectGameByName(String name);

    // 根据部分 Name 模糊查询
    List<GameEntity> selectGameByPartialName(String name);

    // 根据 Name 删除游戏
    void deleteGameByName(String name);

    @Select("SELECT id, name, price, description, comment, pictures " +
            "FROM game " +
            "WHERE comment LIKE CONCAT('%', #{comment}, '%')")
    List<GameEntity> selectGameByComment(@Param("comment") String comment);

}

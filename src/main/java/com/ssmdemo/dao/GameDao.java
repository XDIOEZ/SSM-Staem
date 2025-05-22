package com.ssmdemo.dao;

import com.ssmdemo.dao.entity.GameEntity;
import org.apache.ibatis.annotations.Insert;
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

    @Select("SELECT * FROM game WHERE name = #{name}")
    GameEntity selectGameByName(@Param("name") String name);

    // 根据部分 Name 模糊查询
    List<GameEntity> selectGameByPartialName(String name);

    // 根据 Name 删除游戏
    void deleteGameByName(String name);

    @Select("SELECT id, name, price, description, comment, pictures " +
            "FROM game " +
            "WHERE comment LIKE CONCAT('%', #{comment}, '%')")
    List<GameEntity> selectGameByComment(@Param("comment") String comment);

    @Insert("INSERT INTO user_game (user_id, game_id) VALUES (#{user_Id}, #{game_ID})")
    void buyGame(@Param("user_Id") int user_id, @Param("game_ID") int game_ID);

    @Select("SELECT g.* FROM game g JOIN user_game ug ON g.id = ug.game_id WHERE ug.user_id = #{userId}")
    List<GameEntity> findGamesByUserId(@Param("userId") int userId);

    @Select("SELECT * FROM game ORDER BY RAND() LIMIT #{limit}")
    List<GameEntity> RandomGetGames(@Param("limit") int limit);



}

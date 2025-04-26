package com.ssmdemo.service;

import com.ssmdemo.common.ServerResponse;
import com.ssmdemo.dao.entity.GameEntity;

import java.util.List;

public interface GameService {

    GameEntity FindByName(String name);

    List<GameEntity> FindByPartialName(String name);

    public List<GameEntity> FindByPartialComment(String keyString);

    public ServerResponse BuyGame(int userID, int GameId);

    public List<GameEntity> findGamesByUserId(int userId) ;

    public List<GameEntity> getRandomGames(int count);

}

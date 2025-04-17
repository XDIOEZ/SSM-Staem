package com.ssmdemo.service;

import com.ssmdemo.dao.entity.GameEntity;

import java.util.List;

public interface GameService {

    GameEntity FindByName(String name);

    List<GameEntity> FindByPartialName(String name);

    public List<GameEntity> FindByPartialComment(String keyString);
}

package com.ssmdemo.service.impl;

import com.ssmdemo.dao.GameDao;
import com.ssmdemo.dao.UserDao;
import com.ssmdemo.dao.entity.GameEntity;
import com.ssmdemo.dao.entity.UserEntity;
import com.ssmdemo.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GameServiceImpl implements GameService {
    @Resource
    private GameDao gameDao;
    @Autowired
    private GameEntity gameEntity;

    @Override
    public GameEntity FindByName(String name) {
       return gameDao.selectGameByName(name);
    }

    @Override
    public List<GameEntity> FindByPartialName(String name) {
        return gameDao.selectGameByPartialName(name);
    }

    @Override
    public List<GameEntity> FindByPartialComment(String keyString) {
        return gameDao.selectGameByComment(keyString); // 确保 gameDao 正常初始化
    }
}

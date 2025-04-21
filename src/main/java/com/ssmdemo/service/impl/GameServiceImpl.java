package com.ssmdemo.service.impl;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.ssmdemo.common.ServerResponse;
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

    @Override
    public ServerResponse BuyGame(int userId, int gameId) {
        gameDao.buyGame(userId, gameId);
        // 如果插入成功，返回成功信息
        return ServerResponse.createBySuccess("购买成功！");
    }

}

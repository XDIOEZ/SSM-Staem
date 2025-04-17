package com.ssmdemo.controller;

import com.ssmdemo.dao.entity.GameEntity;
import com.ssmdemo.dao.entity.UserEntity;
import com.ssmdemo.service.impl.GameServiceImpl;
import com.ssmdemo.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Component
@Controller
@RequestMapping(value = "/game")
public class GameController {
    @Autowired
    private GameServiceImpl gameService;



    @RequestMapping(value = "/findGameByName.do", method = RequestMethod.POST)
    public String findGameByName(@RequestParam("name") String name, Model model) {

        GameEntity game = gameService.FindByName(name);

        if (game == null)
        {
            model.addAttribute("errorMessage", "未找到对应的用户，请检查ID是否正确。");
            return "GameSearchShow"; // 返回 admin.jsp 页面
        }

        model.addAttribute("gameEntity", game);
        return "GameSearchShow"; // 显示 userDetail.jsp 页面
    }

    @RequestMapping(value = "/FindByPartialName.do", method = RequestMethod.POST)
    public String FindByPartialName(@RequestParam("name") String name, Model model) {

        List<GameEntity> game = gameService.FindByPartialName(name);
        List<GameEntity> game2 = gameService.FindByPartialComment(name);

        // 将 game2 中的所有元素添加到 game 中
        if (game2 != null && !game2.isEmpty()) {
            game.addAll(game2);
        }

        if (game == null)
        {
            model.addAttribute("errorMessage", "未找到对应的用户，请检查ID是否正确。");
            return "GameSearchShow"; // 返回 admin.jsp 页面
        }

        model.addAttribute("gameEntities", game);
        return "GameSearchShow"; // 显示 userDetail.jsp 页面
    }

}

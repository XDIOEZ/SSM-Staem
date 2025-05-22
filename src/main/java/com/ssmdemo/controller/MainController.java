package com.ssmdemo.controller;

import com.ssmdemo.dao.entity.GameEntity;
import com.ssmdemo.service.impl.GameServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Component
@Controller
@RequestMapping(value = "/user")
public class MainController {
    @Autowired
    private GameServiceImpl gameService;


    @RequestMapping(value = "/mainPage.do", method = RequestMethod.GET)
    public String showMainPage(Model model) {
        List<GameEntity> randomGames = gameService.getRandomGames(12); // 推荐 8 款游戏
        model.addAttribute("randomGames", randomGames);
        return "Main"; // 对应你的主页面 JSP，比如叫 mainPage.jsp
    }

    @RequestMapping(value = "/Login_Administer.do", method = RequestMethod.GET)
    public String Login_Administer(Model model) {

        return "Main"; // 对应你的主页面 JSP，比如叫 mainPage.jsp
    }
}

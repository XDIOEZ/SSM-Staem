package com.ssmdemo.controller;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
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

import javax.servlet.http.HttpSession;
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

    @RequestMapping(value = "/findGameByUser.do", method = RequestMethod.POST)
    public String findGameByUser(HttpSession session, Model model) {
        // 从 session 中获取用户 ID
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            model.addAttribute("errorMessage", "请先登录！");
            return "login"; // 未登录，重定向到登录页面
        }

        // 查询该用户拥有的游戏列表
        List<GameEntity> ownedGames = gameService.findGamesByUserId(userId);

        model.addAttribute("gameList", ownedGames);
        model.addAttribute("gameCount", ownedGames != null ? ownedGames.size() : 0);
        return "userStock"; // 显示 JSP 页面 userInventory.jsp
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


    @RequestMapping(value = "/buyGame.do", method = RequestMethod.POST)
    public String buyGame(@RequestParam("gameId") int gameId,
                          HttpSession session,
                          Model model) {

        // 从 session 中获取用户 ID
        Integer userId = (Integer) session.getAttribute("userId");

        // 如果用户未登录，提示用户登录
        if (userId == null) {
            model.addAttribute("errorMessage", "请先登录再进行购买！");
            return "login"; // 重定向到登录页面
        }

        try {
            // 调用服务层的购买方法进行购买操作
            gameService.BuyGame(userId, gameId);
            // 购买成功后，返回购买成功的提示信息
            model.addAttribute("successMessage", "购买成功！");
        } catch (Exception e) {
            // 捕获其他异常并显示相关错误信息
            model.addAttribute("errorMessage", "购买失败：" + e.getMessage());
        }

        // 返回购买结果页面，显示购买结果信息
        return "buy";
    }


}

package com.ssmdemo.controller;

import com.ssmdemo.common.ServerResponse;
import com.ssmdemo.dao.entity.UserEntity;
import com.ssmdemo.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 用户控制器类，用于处理与用户相关的RESTful API请求
 *
 * @author Barry Wang
 */
@Component
@Controller
@RequestMapping(value = "/user")
public class UserController {


    @Autowired
    private UserServiceImpl userService; // 用户服务实现类，处理业务逻辑

    @Autowired
    private UserEntity userEntity; // 用户实体类（注意：此处可能存在线程安全风险，建议改用方法参数传递）


    /**
     * 用户登录验证接口
     *
     * @param id       用户ID（前端传递的字符串形式）
     * @param username 用户名
     * @param password 密码
     * @return ServerResponse 包含用户信息或错误信息的响应对象
     */
    @RequestMapping(value = "/checkUser.do", method = RequestMethod.POST)
    public String checkUser(
            @RequestParam("id") String id,
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpServletRequest request) {

        // 将参数设置到实体对象中
        userEntity.setId(Integer.parseInt(id));
        userEntity.setUsername(username);
        userEntity.setPassword(password);

        if (userEntity != null)
        {
            UserEntity user = new UserEntity();
            user.setId(Integer.parseInt(id));
            user.setUsername(username);
            user.setPassword(password);

            if (userService.checkLogin(user) != null) {
                HttpSession session = request.getSession();
                session.setAttribute("userId", user.getId());
                session.setAttribute("username", user.getUsername());
                return "redirect:mainPage.do";
            } else {
                return "loginFail";
            }
        }
        return "loginFail";
    }


    @RequestMapping(value = "/findById.do", method = RequestMethod.POST)
    public String findById(@RequestParam("id") String id, Model model) {
        int userId = Integer.parseInt(id);

        UserEntity user = userService.findById(userId);

        if (user == null) {
            model.addAttribute("errorMessage", "未找到对应的用户，请检查ID是否正确。");
            return "userDetail"; // 返回 admin.jsp 页面
        }

        model.addAttribute("user", user);
        return "userDetail"; // 显示 userDetail.jsp 页面
    }


    /**
     * 添加用户接口
     *
     * @param userid   用户ID（前端传递的字符串形式）
     * @param username 用户名
     * @param password 密码
     * @return ServerResponse 包含操作结果的响应对象
     * @throws IOException 可能抛出的IO异常（此处未实际使用）
     */
    @RequestMapping(value = "/addUser.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<UserEntity> addUser(
            @RequestParam("userid") String userid,
            @RequestParam("username") String username,
            @RequestParam("password") String password) throws IOException {

        // 将参数设置到实体对象中
        userEntity.setId(Integer.parseInt(userid));
        userEntity.setUsername(username);
        userEntity.setPassword(password);

        if (userEntity != null) {
            // 调用服务层添加用户
            return userService.addUser(Integer.parseInt(userid), username, password);
        } else {
            return ServerResponse.createByErrorMessage("用户实体对象为空，添加失败");
        }
    }

    /**
     * 根据用户ID删除用户接口
     *
     * @param user_id 用户ID（前端传递的字符串形式）
     * @return ServerResponse 包含操作结果的响应对象
     * @throws IOException 可能抛出的IO异常（此处未实际使用）
     */
    @RequestMapping(value = "/delUserById.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<UserEntity> delUser(@RequestParam("user_id") String user_id) throws IOException {

        if (user_id != null) {
            // 调用服务层删除用户
            return userService.deleteUser(Integer.parseInt(user_id));
        } else {
            return ServerResponse.createByErrorMessage("用户ID为空，删除失败");
        }
    }

    /**
     * 更新用户信息接口
     *
     * @param user_id   用户ID（前端传递的字符串形式）
     * @param username  新用户名
     * @param password  新密码
     * @return ServerResponse 包含操作结果的响应对象
     * @throws IOException 可能抛出的IO异常（此处未实际使用）
     */
    @RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
    public String updateUser
    (@RequestParam("user_id") String user_id,
     @RequestParam("username") String username,
     @RequestParam("password") String password,
     Model model)
            throws IOException

    {

        // 将参数设置到实体对象中
        userEntity.setId(Integer.parseInt(user_id));
        userEntity.setUsername(username);
        userEntity.setPassword(password);


        // 调用服务层更新用户信息
        userService.updateUser(userEntity);

        // 添加时间戳提示信息
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        String message = "✅ 用户信息已成功更新！（" + time + "）";


        System.out.println(message);
        model.addAttribute("updateMessage", message);
        model.addAttribute("user", userEntity);
        return "userDetail";
    }
}
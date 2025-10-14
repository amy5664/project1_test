package com.lgy.Product_sales_platform.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lgy.Product_sales_platform.dao.mapper.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping("/home")
    public String list(Model model) {
        model.addAttribute("users", userDAO.getUserList());
        log.info("@# "+model.toString());
        return "home"; 
    }
}
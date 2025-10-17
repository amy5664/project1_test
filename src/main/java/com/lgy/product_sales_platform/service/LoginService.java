package com.lgy.product_sales_platform.service;

import java.util.ArrayList;

import com.lgy.product_sales_platform.dto.LoginDTO;

public interface LoginService {
    public LoginDTO loginYn(LoginDTO loginDTO); 
    public void write(LoginDTO loginDTO);
    public ArrayList<LoginDTO> idCheck(LoginDTO loginDTO);
    public ArrayList<LoginDTO> emailCheck(LoginDTO loginDTO);
    public ArrayList<LoginDTO> findId(LoginDTO loginDTO);
    public ArrayList<LoginDTO> findPw(LoginDTO loginDTO);
    public void makeRandomNumber();
	public String joinEmail(String email);
	public void mailSend(String setFrom, String toMail, String title, String content);
}

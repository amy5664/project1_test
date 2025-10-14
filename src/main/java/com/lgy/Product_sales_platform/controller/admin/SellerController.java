package com.lgy.Product_sales_platform.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lgy.Product_sales_platform.dao.mapper.UserDAO;
import com.lgy.Product_sales_platform.dto.UserDTO;

@Controller
public class SellerController {
	
	@Autowired
	private UserDAO userDAO;

	//마이페이지 메인
	@RequestMapping("/seller/mypage")
	public String mypage() {
		return "seller/mypage";
	}
	
	//회원 목록
	@GetMapping("/seller/members")
	public String memberList(Model model) {
		model.addAttribute("users", userDAO.getUserList());
		return "seller/members"; // /WEB-INF/views/seller/members.jsp
	}

	//회원 상세
	@GetMapping("/seller/members/{memberId}")
	public String memberDetail(@PathVariable("memberId") String memberId ,Model model) {
		UserDTO user = userDAO.getUser(memberId);
	    model.addAttribute("user", user);
		// TODO: 이후 구매내역 orders도 같이 model에 넣을 예정
		return "seller/memberDetail"; // /WEB-INF/views/seller/memberDetail.jsp
	}
}

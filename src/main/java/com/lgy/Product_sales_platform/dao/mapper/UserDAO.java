package com.lgy.Product_sales_platform.dao.mapper;

import java.util.List;
import com.lgy.Product_sales_platform.dto.UserDTO;

public interface UserDAO {
    List<UserDTO> getUserList();       // 전체 회원 조회
    UserDTO getUser(String memberId);  // 특정 회원 조회
}

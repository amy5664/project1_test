package com.lgy.product_sales_platform.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lgy.product_sales_platform.dto.OrderDetailDTO;

/**
 * OrderDetail 관련 데이터베이스 작업을 위한 MyBatis Mapper 인터페이스입니다.
 */
@Mapper
public interface OrderDetailDAO {
    /**
     * 주문 상세 정보를 저장합니다.
     * @param orderDetail 저장할 주문 상세 정보 DTO
     */
    void save(OrderDetailDTO orderDetail);
}

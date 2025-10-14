package com.lgy.Product_sales_platform.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lgy.Product_sales_platform.dto.ProductDTO;

public interface ProductDAO {
	List<ProductDTO> getProductList();         // 전체 목록
    ProductDTO getProduct(Long prodId);        // 상세
    int insertProduct(ProductDTO product);     // 등록
    int updateProduct(ProductDTO product);     // 수정
    int deleteProduct(@Param("prodId") long prodId); // 삭제
}

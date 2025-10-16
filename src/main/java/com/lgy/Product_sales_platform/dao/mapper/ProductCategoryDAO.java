package com.lgy.Product_sales_platform.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lgy.Product_sales_platform.dto.ProductCategoryDTO;

public interface ProductCategoryDAO {
	List<ProductCategoryDTO> selectByProdId(@Param("prodId") Long prodId);
	 int deleteAllByProdId(@Param("prodId") Long prodId);
	 int bulkInsert(@Param("list") List<ProductCategoryDTO> list);
}

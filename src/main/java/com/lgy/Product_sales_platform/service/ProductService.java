package com.lgy.Product_sales_platform.service;

import java.util.List;

import com.lgy.Product_sales_platform.dto.ProductDTO;

public interface ProductService {
	 void createProductWithCategories(ProductDTO product, List<Long> catIds, Long mainCatId);
	 void updateProductWithCategories(ProductDTO form, List<Long> catIds, Long mainCatId);
}

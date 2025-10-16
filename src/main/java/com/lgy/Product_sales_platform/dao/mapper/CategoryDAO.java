package com.lgy.Product_sales_platform.dao.mapper;

import java.util.List;
import com.lgy.Product_sales_platform.dto.CategoryDTO;

public interface CategoryDAO {
	List<CategoryDTO> selectTreeFlat();
}

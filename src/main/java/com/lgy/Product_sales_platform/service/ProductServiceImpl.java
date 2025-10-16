package com.lgy.Product_sales_platform.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lgy.Product_sales_platform.dao.mapper.ProductCategoryDAO;
import com.lgy.Product_sales_platform.dao.mapper.ProductDAO;
import com.lgy.Product_sales_platform.dto.ProductCategoryDTO;
import com.lgy.Product_sales_platform.dto.ProductDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {
    private final ProductDAO productDAO;
    private final ProductCategoryDAO productCategoryDAO;
    
	@Override
	@Transactional
	public void createProductWithCategories(ProductDTO product, List<Long> catIds, Long mainCatId) {
		productDAO.insertProduct(product); // selectKey로 prodId 세팅

		// 카테고리 유효성 검사
		if (catIds == null || catIds.isEmpty()) {
            throw new IllegalArgumentException("카테고리를 최소 1개 선택해 주세요.");
        }
        if (mainCatId == null || !catIds.contains(mainCatId)) {
            mainCatId = catIds.get(0);
        }

        
        // 매핑 리스트 작성
        List<ProductCategoryDTO> list = new ArrayList<ProductCategoryDTO>();
        for (Long cid : catIds) {
            ProductCategoryDTO m = new ProductCategoryDTO();
            m.setProdId(product.getProdId());
            m.setCatId(cid);
            m.setIsMain(cid.equals(mainCatId) ? "Y" : "N");
            list.add(m);
        }
        // 일괄 등록
        productCategoryDAO.bulkInsert(list);
		
	}
	@Override
	@Transactional
	public void updateProductWithCategories(ProductDTO form, List<Long> catIds, Long mainCatId) {
        productDAO.updateProduct(form);
        productCategoryDAO.deleteAllByProdId(form.getProdId());

        // 카테고리 유효성 검사
        if (catIds == null || catIds.isEmpty()) {
            throw new IllegalArgumentException("카테고리를 최소 1개 선택해 주세요.");
        }
        if (mainCatId == null || !catIds.contains(mainCatId)) {
            mainCatId = catIds.get(0);
        }

        // 매핑 리스트 생성
        List<ProductCategoryDTO> list = new ArrayList<ProductCategoryDTO>();
        for (Long cid : catIds) {
            ProductCategoryDTO m = new ProductCategoryDTO();
            m.setProdId(form.getProdId());
            m.setCatId(cid);
            m.setIsMain(cid.equals(mainCatId) ? "Y" : "N");
            list.add(m);
        }
        // 일괄 등록
        productCategoryDAO.bulkInsert(list);
	}
}

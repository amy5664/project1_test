package com.lgy.Product_sales_platform.dto;

import java.util.Date;
import lombok.Data;

@Data
public class ProductDTO {
	private Long prodId; //상품 ID
	private String prodSeller; //판매자 ID
	private String prodName; //상품명
	private Integer prodPrice; //상품 가격
	private Integer prodStock; //재고 수량
	private String prodDesc; // 상품 설명
    private Long prodCode; //상품 코드
    private Date   prodReg; //등록일
    private Date   prodUpd; //수정일
}

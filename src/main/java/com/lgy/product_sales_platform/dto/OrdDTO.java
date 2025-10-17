package com.lgy.product_sales_platform.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdDTO {
	private String ordId;
	private String ordMemId;
	private Timestamp ordDate;
	private int ordAmount;
	private int ordDfee;
	private int ordDiscount;
	private String ordStatus;
}

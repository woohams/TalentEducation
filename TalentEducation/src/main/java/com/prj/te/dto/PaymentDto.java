package com.prj.te.dto;

import java.util.Date;

public class PaymentDto {

	private String order_id;
	private String id;
	private String item_name;
	private int amount;
	private Date payment_date;
	
	public PaymentDto() {
		
	}

	public PaymentDto(String order_id, String id, String item_name, int amount, Date payment_date) {
		this.order_id = order_id;
		this.id = id;
		this.item_name = item_name;
		this.amount = amount;
		this.payment_date = payment_date;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	
}

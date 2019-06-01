package com.shopcar.demo.po;

public class ShopCarCustom extends ShopCar {

	private String name;
	private String picture;
	private double price;
	
	public ShopCarCustom() {
		super();
	}
	
	public ShopCarCustom(String name, String picture, double price) {
		super();
		this.name = name;
		this.picture = picture;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
}

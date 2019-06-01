package com.shopcar.demo.service;

import com.shopcar.demo.po.ShopCar;
import com.shopcar.demo.po.ShopCarCustom;

import java.util.List;

public interface ShopCarService {
	
	public int insertGoods(ShopCar shopCar) throws Exception;
	
	public List<ShopCarCustom> findShopCarByUserId(Integer userId)throws Exception;
	
	public boolean deleteById(Integer[] id)throws Exception;
		
	public int updataShopCarById(ShopCar shopCar)throws Exception;
	
	public ShopCarCustom findShopCarById(Integer userId, Integer goodsId)throws Exception;
	
}

package com.shopcar.demo.service.impl;

import com.shopcar.demo.mapper.ShopCarMapper;
import com.shopcar.demo.mapper.ShopCarMapperCustom;
import com.shopcar.demo.po.ShopCar;
import com.shopcar.demo.po.ShopCarCustom;
import com.shopcar.demo.service.ShopCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopCarServiceImpl implements ShopCarService {
	
	@Autowired
	private ShopCarMapper shopCarMapper;
	
	@Autowired
	private ShopCarMapperCustom shopCarMapperCustom;

	@Override
	public int insertGoods(ShopCar shopCar) throws Exception {
		return shopCarMapper.insertSelective(shopCar);
	}
	
	@Override
	public List<ShopCarCustom> findShopCarByUserId(Integer userId)throws Exception{
		return shopCarMapperCustom.findShopCarByUserId(userId);
	}
	
	@Override
	public boolean deleteById(Integer[] id)throws Exception{
		int i;
		for(i=0; i<id.length; i++) {
			if(shopCarMapper.deleteByPrimaryKey(id[i])==0) {
				break;
			}	
		}
		if(i==id.length)
			return true;
		return false;	
	}
	
	@Override
	public int updataShopCarById(ShopCar shopCar)throws Exception{
		return shopCarMapper.updateByPrimaryKeySelective(shopCar);
	}
	
	@Override
	public ShopCarCustom findShopCarById(Integer userId,Integer goodsId)throws Exception{
		return shopCarMapperCustom.findShopCarById(userId, goodsId);
	}

}

package com.shopcar.demo.mapper;

import com.shopcar.demo.po.ShopCarCustom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ShopCarMapperCustom {
	
	public List<ShopCarCustom> findShopCarByUserId(@Param("userId") Integer userId)throws Exception;

	public ShopCarCustom findShopCarById(@Param("userId") Integer userId,
                                         @Param("goodsId") Integer goodsId)throws Exception;
}

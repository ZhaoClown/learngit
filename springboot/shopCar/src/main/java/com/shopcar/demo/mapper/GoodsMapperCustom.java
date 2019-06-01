package com.shopcar.demo.mapper;


import com.shopcar.demo.po.GoodsCustom;
import com.shopcar.demo.po.GoodsQueryVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsMapperCustom {
	
	public List<GoodsCustom> findGoodsByName(GoodsQueryVo goodsQueryVo)throws Exception;

}

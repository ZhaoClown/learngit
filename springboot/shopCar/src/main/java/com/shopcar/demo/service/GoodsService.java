package com.shopcar.demo.service;



import com.shopcar.demo.po.Goods;
import com.shopcar.demo.po.GoodsCustom;
import com.shopcar.demo.po.GoodsQueryVo;

import java.util.List;

public interface GoodsService {
	
	public List<GoodsCustom> findGoodsByName(GoodsQueryVo goodsQueryVo)throws Exception;
	public Goods findGoodsById(Integer id)throws Exception;
	

}

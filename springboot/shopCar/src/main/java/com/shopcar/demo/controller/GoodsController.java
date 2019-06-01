package com.shopcar.demo.controller;

import com.shopcar.demo.po.Goods;
import com.shopcar.demo.po.GoodsCustom;
import com.shopcar.demo.po.GoodsQueryVo;
import com.shopcar.demo.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/queryGoods")
	public List<GoodsCustom> queryGoods(GoodsQueryVo goodsQueryVo)throws Exception{
		List<GoodsCustom> list=goodsService.findGoodsByName(goodsQueryVo);
		if(list.isEmpty())
			return null;
		return list;
	}
	
	@RequestMapping("/viewGoods")
	public Goods viewGoods(Integer id)throws Exception{
		Goods goods=goodsService.findGoodsById(id);
		return goods;
	}

}

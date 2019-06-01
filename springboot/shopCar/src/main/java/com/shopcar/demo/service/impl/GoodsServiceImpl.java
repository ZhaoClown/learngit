package com.shopcar.demo.service.impl;

import com.shopcar.demo.mapper.GoodsMapper;
import com.shopcar.demo.mapper.GoodsMapperCustom;
import com.shopcar.demo.po.Goods;
import com.shopcar.demo.po.GoodsCustom;
import com.shopcar.demo.po.GoodsQueryVo;
import com.shopcar.demo.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Autowired
	private GoodsMapperCustom goodsMapperCustom;
	
	@Override
	public List<GoodsCustom> findGoodsByName(GoodsQueryVo goodsQueryVo) throws Exception {
		return goodsMapperCustom.findGoodsByName(goodsQueryVo);
	}
	
	@Override
	public Goods findGoodsById(Integer id) throws Exception {
		return goodsMapper.selectByPrimaryKey(id);
	}
	

}

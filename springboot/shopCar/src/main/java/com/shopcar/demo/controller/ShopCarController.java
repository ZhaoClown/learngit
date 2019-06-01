package com.shopcar.demo.controller;

import com.shopcar.demo.po.ShopCar;
import com.shopcar.demo.po.ShopCarCustom;
import com.shopcar.demo.po.UserCustom;
import com.shopcar.demo.service.ShopCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/shopCar")
public class ShopCarController {
	
	@Autowired
	private ShopCarService shopCarService;

	@RequestMapping("/addShopCar")
	public int addShopCar(HttpSession session, ShopCar shopCar)throws Exception{
		UserCustom userCustom=(UserCustom) session.getAttribute("user");
		if(userCustom!=null)
			shopCar.setUserId(userCustom.getId());
		ShopCarCustom shopCarCustom=shopCarService.findShopCarById(userCustom.getId(), shopCar.getGoodsId());
		if(shopCarCustom==null) {
			return shopCarService.insertGoods(shopCar);
		}else {
			shopCar.setId(shopCarCustom.getId());
			shopCar.setNum(shopCar.getNum()+shopCarCustom.getNum());
			return shopCarService.updataShopCarById(shopCar);
		}
	}
	
	@RequestMapping("/showShopCar")
	public List<ShopCarCustom> showShopCar(HttpSession session)throws Exception{
		Integer userId=null;
		UserCustom userCustom=(UserCustom) session.getAttribute("user");
		if(userCustom!=null)
			userId=userCustom.getId();
		List<ShopCarCustom> list=shopCarService.findShopCarByUserId(userId);
		if(list.isEmpty())
			return null;
		return list; 
	}
	
	@RequestMapping("/deleteShopCar")
	public boolean deleteShopCar(Integer[] id)throws Exception{
		return shopCarService.deleteById(id);
	}
	
	@RequestMapping("/openShopCar")
	public boolean addShopCar(HttpSession session)throws Exception{
		UserCustom userCustom=(UserCustom) session.getAttribute("user");
		if(userCustom!=null)
			return true;
		return false;
	}

}

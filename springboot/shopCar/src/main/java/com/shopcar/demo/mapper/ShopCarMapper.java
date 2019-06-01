package com.shopcar.demo.mapper;

import com.shopcar.demo.po.ShopCar;
import com.shopcar.demo.po.ShopCarExample;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ShopCarMapper {
    int countByExample(ShopCarExample example);

    int deleteByExample(ShopCarExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ShopCar record);

    int insertSelective(ShopCar record);

    List<ShopCar> selectByExample(ShopCarExample example);

    ShopCar selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ShopCar record, @Param("example") ShopCarExample example);

    int updateByExample(@Param("record") ShopCar record, @Param("example") ShopCarExample example);

    int updateByPrimaryKeySelective(ShopCar record);

    int updateByPrimaryKey(ShopCar record);
}
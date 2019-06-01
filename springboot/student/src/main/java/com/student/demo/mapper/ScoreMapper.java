package com.student.demo.mapper;

import com.student.demo.po.ScoreCustom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ScoreMapper {
	public ScoreCustom findScoreById(@Param("id") Integer id) throws Exception;
	public void deleteScoreById(@Param("id") Integer id) throws Exception;
	public void updateScoreById(ScoreCustom scoreCustom) throws Exception;
}

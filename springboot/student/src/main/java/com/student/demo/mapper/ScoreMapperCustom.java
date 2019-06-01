package com.student.demo.mapper;

import com.student.demo.po.ScoreCustom;
import com.student.demo.po.ScoreQueryVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ScoreMapperCustom {
	public List<ScoreCustom> findScoreList(ScoreQueryVo scoreQueryVo)
			throws Exception;

}

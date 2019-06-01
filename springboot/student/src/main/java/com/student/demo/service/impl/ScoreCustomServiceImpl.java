package com.student.demo.service.impl;

import com.student.demo.mapper.ScoreMapperCustom;
import com.student.demo.po.ScoreCustom;
import com.student.demo.po.ScoreQueryVo;
import com.student.demo.service.ScoreCustomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreCustomServiceImpl implements ScoreCustomService {

	@Autowired
	private ScoreMapperCustom scoreMapperCustom;
	@Override
	public List<ScoreCustom> findScoreList(ScoreQueryVo scoreQueryVo) throws Exception {
		return scoreMapperCustom.findScoreList(scoreQueryVo);
	}

}

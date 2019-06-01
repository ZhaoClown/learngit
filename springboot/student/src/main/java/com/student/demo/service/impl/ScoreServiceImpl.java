package com.student.demo.service.impl;

import com.student.demo.mapper.ScoreMapper;
import com.student.demo.po.ScoreCustom;
import com.student.demo.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	private ScoreMapper scoreMapper;

	@Override
	public ScoreCustom findScoreById(Integer id) throws Exception {
		return scoreMapper.findScoreById(id);
	}
	@Override
	public void deleteScoreById(Integer id) throws Exception {
		scoreMapper.deleteScoreById(id);
	}
	@Override
	public void updateScoreById(Integer id,ScoreCustom scoreCustom) throws Exception {
		scoreMapper.updateScoreById(scoreCustom);
	}

}

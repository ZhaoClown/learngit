package com.student.demo.service;

import com.student.demo.po.ScoreCustom;

public interface ScoreService {
	public ScoreCustom findScoreById(Integer id) throws Exception;
	public void deleteScoreById(Integer id) throws Exception;
	public void updateScoreById(Integer id, ScoreCustom scoreCustom) throws Exception;

}

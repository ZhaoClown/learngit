package com.student.demo.service;


import com.student.demo.po.ScoreCustom;
import com.student.demo.po.ScoreQueryVo;

import java.util.List;

public interface ScoreCustomService {
	public List<ScoreCustom> findScoreList(ScoreQueryVo scoreQueryVo)
			throws Exception;
}

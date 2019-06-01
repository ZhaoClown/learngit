package com.student.demo.controller;

import com.student.demo.po.ScoreCustom;
import com.student.demo.po.ScoreQueryVo;
import com.student.demo.service.ScoreCustomService;
import com.student.demo.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/score")
public class ScoreController {
	
	@Autowired
	private ScoreCustomService scoreCustomService;
	
	@Autowired
	private ScoreService scoreService;
	
	@RequestMapping("/queryScore")
	public List<ScoreCustom> queryScore(ScoreQueryVo scoreQueryVo) throws Exception{
		List<ScoreCustom> scoreList=scoreCustomService.findScoreList(scoreQueryVo);
		return scoreList;
	}
	
	@RequestMapping("/deleteScore")
	public @ResponseBody
    String deleteScore(Integer id) throws Exception{
		scoreService.deleteScoreById(id);
		return "ok";
	}
	
	@RequestMapping("/editScore")
	public @ResponseBody
    ScoreCustom findScore(Integer id) throws Exception{
		ScoreCustom scoreCustom=scoreService.findScoreById(id);
		return scoreCustom;
		
	}
	
	@RequestMapping("/editScoreSubmit")
	public @ResponseBody
    String editScore(Integer id, ScoreCustom scoreCustom) throws Exception{
		scoreService.updateScoreById(id, scoreCustom);
		return "ok";
	}
	
}

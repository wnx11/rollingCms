package com.bidr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("project")
@Controller("ProjectController")
public class ProjectController {
	/**
	 * 跳转工程
	 * @return
	 */
	@RequestMapping("/project")
	public String plane(ModelMap model) {
		return "project/project";
	}
	/**
	 * 跳转车辆
	 * @return
	 */
	@RequestMapping("/car")
	public String car(ModelMap model) {
		return "project/car";
	}
	
	/**
	 * 跳转司机
	 * @return
	 */
	@RequestMapping("/driver")
	public String driver(ModelMap model) {
		return "project/driver";
	}
}

package com.bidr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/workBin")
@Controller("WorkBinController")
public class WorkBinController {
	
	/**
	 * 跳转碾压机范围
	 * @return
	 */
	@RequestMapping("/roller")
	public String plane(ModelMap model) {
		return "workBin/roller";
	}
	/**
	 * 跳转RTK范围
	 * @return
	 */
	@RequestMapping("/rtk")
	public String index(ModelMap model) {
		return "workBin/rtk";
	}
}

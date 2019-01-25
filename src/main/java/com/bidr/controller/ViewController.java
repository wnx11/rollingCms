package com.bidr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/view")
@Controller("viewController")
public class ViewController {
	/**
	 * 跳转平面
	 * @return
	 */
	@RequestMapping("/plane")
	public String plane(ModelMap model) {
		return "view/plane";
	}
	/**
	 * 跳转三维视图
	 * @return
	 */
	@RequestMapping("/three")
	public String index(ModelMap model) {
		return "view/three";
	}
}

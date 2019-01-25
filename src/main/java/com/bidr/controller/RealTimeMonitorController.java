package com.bidr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@RequestMapping("/realtime")
@Controller("RealTimeMonitorController")
public class RealTimeMonitorController {
	/**
	 * 跳转实时监控页面
	 * @return
	 */
	@RequestMapping("/index")
	public String index(ModelMap model) {
		return "realtime/index";
	}
	
	
	/**
	 * 获取仓位信息
	 * @return
	 */
	@RequestMapping("/{position}")
	public @ResponseBody String position(ModelMap model) {
		JSONObject jsonObject=new JSONObject();
		return jsonObject.toJSONString();
	}
}

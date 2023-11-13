/**
 *
 */
package com.packt.webstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.packt.webstore.service.shopService;

/**
 *
 */
@Controller
public class HomeController {
	@Autowired
	shopService service;

	@RequestMapping("/")
	public String welcome(Model model) {
		model.addAttribute("greeting", "Welcome to Web Store!");
		model.addAttribute("tagline", "The one and only amazing web store");
		return "welcome";
	}

//	@RequestMapping("/")
//	public String index(Model model) {
//		model.addAttribute("list", service.getList());
//		model.addAttribute("view", "sanpham/indexhome.jsp");
//		return "/layout";
//	}
}

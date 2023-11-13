/**
 * 
 */
package com.packt.webstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.packt.webstore.service.danhMucService;
import com.packt.webstore.service.shopService;

/**
 * 
 */
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	shopService sService;

	@Autowired
	danhMucService dMucService;

	@RequestMapping("/")
	public String index(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		model.addAttribute("list", sService.getList());
		model.addAttribute("danhmuc", dMucService.getList());
		model.addAttribute("view", "sanpham/shop.jsp");
		return "/layout";
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam("id") Integer id, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		model.addAttribute("danhmuc", dMucService.getList());
		model.addAttribute("sanpham", sService.detail(id));
		model.addAttribute("view", "sanpham/detail.jsp");
		return "/layout";
	}
}

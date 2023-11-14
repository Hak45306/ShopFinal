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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.packt.webstore.domain.danhmuc;
import com.packt.webstore.service.danhMucService;

/**
 * 
 */
@Controller
@RequestMapping("/admin/danhmuc")
public class DanhMucController {
	@Autowired
	danhMucService service;

	@RequestMapping("")
	public String index(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		model.addAttribute("list", service.getList());
		model.addAttribute("view", "danhmuc/index.jsp");
		return "/layout";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@RequestParam("name") String name, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		danhmuc dm = new danhmuc();
		dm.setName(name);
		service.add(dm);
		return "redirect:/admin/danhmuc/";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Integer id) {
		service.delete(id);
		return "redirect:/admin/danhmuc/";
	}

	@RequestMapping("/edit")
	public String detail(@RequestParam("id") Integer id, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		model.addAttribute("danhmuc", service.detail(id));
		model.addAttribute("view", "danhmuc/edit.jsp");
		return "/layout";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam("id") Integer id, @RequestParam("name") String name, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		danhmuc dm = service.detail(id);
		dm.setName(name);
		service.update(id, dm);
		return "redirect:/admin/danhmuc/";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam("name") String name, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		danhmuc dm = new danhmuc();
		dm.setName(name);
		service.saveOrUpdate(dm);
		return "redirect:/admin/danhmuc/";
	}
}

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

import com.packt.webstore.domain.sanpham;
import com.packt.webstore.service.hoaDonService;
import com.packt.webstore.service.sanPhamService;

/**
 * 
 */
@Controller
@RequestMapping("/admin/hoadon")
public class HoaDonController {

	@Autowired
	sanPhamService sPhamService;
	@Autowired
	hoaDonService hDonService;

	@RequestMapping("")
	public String index(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		model.addAttribute("list", sPhamService.getList());
		model.addAttribute("hoadon", hDonService.getList());
		model.addAttribute("view", "hoadon/index.jsp");
		return "/layout";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@RequestParam("name") String name, @RequestParam("price") Double price,
			@RequestParam("soluong") Integer soluong, @RequestParam("img") String img,
			@RequestParam("mota") String mota, @RequestParam("danhmuc") Integer danhmuc, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		sanpham sp = new sanpham();
		sp.setName(name);
		sp.setPrice(price);
		sp.setSoluong(soluong);
		sp.setImg(img);
		sp.setMota(mota);
		sp.setIddm(danhmuc);
		sPhamService.add(sp);
		return "redirect:/admin/hoadon/";
	}

	@RequestMapping("/edit")
	public String detail(Model model, @RequestParam("id") Integer id) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		model.addAttribute("list", sPhamService.getList());
		model.addAttribute("hoadon", hDonService.detail(id));
		model.addAttribute("view", "hoadon/edit.jsp");
		return "/layout";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam("name") String name, @RequestParam("price") Double price,
			@RequestParam("soluong") Integer soluong, @RequestParam("img") String img,
			@RequestParam("mota") String mota, @RequestParam("danhmuc") Integer danhmuc, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		sanpham sp = new sanpham();
		sp.setName(name);
		sp.setPrice(price);
		sp.setSoluong(soluong);
		sp.setImg(img);
		sp.setMota(mota);
		sp.setIddm(danhmuc);
		sPhamService.add(sp);
		return "redirect:/admin/hoadon/";
	}

	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("id") Integer id) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		sPhamService.delete(id);
		return "redirect:/admin/hoadon/";
	}
}

/**
 * 
 */
package com.packt.webstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.packt.webstore.domain.giohang;
import com.packt.webstore.service.gioHangService;
import com.packt.webstore.service.shopService;
import com.packt.webstore.service.taiKhoanService;

/**
 * 
 */
@Controller
@RequestMapping("/giohang")
public class GioHangController {
	@Autowired
	gioHangService gHangService;
	@Autowired
	shopService sService;
	@Autowired
	taiKhoanService tKhoanService;

	@RequestMapping("")
	public String index(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}

		model.addAttribute("listsp", sService.getList());
		model.addAttribute("listgh", gHangService.getListUser(tKhoanService.accountName(auth.getName()).getId()));
		model.addAttribute("view", "giohang/index.jsp");
		return "/layout";
	}

//	@RequestMapping(value = "/add", method = RequestMethod.POST)
//	public String add(Model model, @RequestParam("idpro") Integer idpro) {
//		giohang gh = new giohang();
//		gh.setIduser(57);
//		gh.setIdpro(idpro);
//		sanpham sp = sService.detail(idpro);
//		gh.setTensp(sp.getName());
//		gh.setAnhsp(sp.getImg());
//		gh.setSoluong(1);
//		gh.setDongia(sp.getPrice());
//		gHangService.add(gh);
////			sp.setSoluong(sp.getSoluong() - 1);
////			sService.update(idpro, sp);
//		model.addAttribute("giohang/index.jsp");
//		return "redirect:/shop/";
//	}

	@RequestMapping(value = "/addlink", method = RequestMethod.GET)
	public String addlink(Model model, @RequestParam("idpro") Integer idpro) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
//		giohang detailidpro = gHangService.detailIdSP(idpro);
		List<giohang> list = gHangService.getListUser(tKhoanService.accountName(auth.getName()).getId());
		for (giohang gh : list) {
			if (gh.getIdpro() == idpro) {
				gHangService.updateSlHigh(gh.getId());
				sService.updateSlLow(idpro);
				return "redirect:/shop/";
			}
		}
		giohang newGh = new giohang();
		newGh.setIdpro(idpro);
		newGh.setIduser(tKhoanService.accountName(auth.getName()).getId());
		newGh.setSoluong(1);
		gHangService.add(newGh);
		sService.updateSlLow(idpro);
		model.addAttribute("giohang/index.jsp");
		return "redirect:/shop/";
	}

	@RequestMapping("/edit")
	public String detail(@RequestParam("id") Integer id, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		model.addAttribute("giohang", gHangService.detail(id));
		model.addAttribute("danhmuc/edit.jsp");
		return "/layout";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Integer id) {
		sService.updateSlHigh(gHangService.detail(id).getIdpro());
		gHangService.delete(id);
		return "redirect:/giohang/";
	}
}

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
import com.packt.webstore.domain.hoadon;
import com.packt.webstore.domain.hoadonchitiet;
import com.packt.webstore.domain.sanpham;
import com.packt.webstore.service.danhMucService;
import com.packt.webstore.service.gioHangService;
import com.packt.webstore.service.hoaDonChiTietService;
import com.packt.webstore.service.hoaDonService;
import com.packt.webstore.service.shopService;
import com.packt.webstore.service.taiKhoanService;

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

	@Autowired
	hoaDonService hDonService;

	@Autowired
	hoaDonChiTietService hdcTietService;

	@Autowired
	taiKhoanService tKhoanService;

	@Autowired
	gioHangService gHangService;

	@RequestMapping("")
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

	@RequestMapping(value = "/hoadon/addlink", method = RequestMethod.GET)
	public String addlink(Model model, @RequestParam("idpro") Integer idpro) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		hoadon newHd = new hoadon();
		newHd.setIduser(tKhoanService.accountName(auth.getName()).getId());
		newHd.setTrangthai(1);
		hDonService.add(newHd);
		sanpham sp = sService.detail(idpro);
		hoadon hd = hDonService.detailIduser(tKhoanService.accountName(auth.getName()).getId());
		List<giohang> list = gHangService.getListUser(tKhoanService.accountName(auth.getName()).getId());
		for (giohang gh : list) {
			hoadonchitiet hdct = new hoadonchitiet();
			hdct.setIdhd(hd.getId());
			hdct.setIdpro(gh.getIdpro());
			hdct.setDongia(sp.getPrice() * gh.getSoluong());
			hdct.setSoluong(gh.getSoluong());
			hdcTietService.add(hdct);
		}
//		gHangService.(idpro);
		model.addAttribute("giohang/index.jsp");
		return "redirect:/shop/";
	}
}

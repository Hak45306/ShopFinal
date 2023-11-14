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
import org.springframework.web.servlet.ModelAndView;

import com.packt.webstore.domain.taikhoan;
import com.packt.webstore.service.taiKhoanService;

/**
 *
 */
@Controller
public class TaiKhoanController {
	@Autowired
	taiKhoanService tKhoanService;

	@RequestMapping("/login")
	public ModelAndView viewLogin() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("taikhoan/login");
		return modelAndView;
	}

	@RequestMapping("/viewRegister")
	public ModelAndView viewRegister() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("taikhoan/register");
		return modelAndView;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@RequestParam("email") String email, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("phonenumber") String phonenumber,
			@RequestParam("address") String address) {
		taikhoan tk = new taikhoan();
		tk.setEmail(email);
		tk.setUser(username);
		tk.setPass(password);
		tk.setTel(phonenumber);
		tk.setAddress(address);
		tKhoanService.register(tk);
		return "redirect:/login";
	}

	@RequestMapping("/viewProfile")
	public String viewProfile(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		model.addAttribute("profile", tKhoanService.detail(tKhoanService.accountName(auth.getName()).getId()));
		model.addAttribute("view", "taikhoan/profile.jsp");
		return "/layout";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String profile(@RequestParam("id") Integer id, @RequestParam("email") String email,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("phonenumber") String phonenumber, @RequestParam("address") String address, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName().equals("anonymousUser")) {
			model.addAttribute("username", "");
		} else {
			model.addAttribute("username", "" + " Hi," + "" + auth.getName());
		}
		taikhoan tk = tKhoanService.detail(id);
		tk.setEmail(email);
		tk.setUser(username);
		tk.setPass(password);
		tk.setTel(phonenumber);
		tk.setAddress(address);
		tKhoanService.update(id, tk);
		model.addAttribute("view", "taikhoan/profile.jsp");
		return "/layout";
	}
}

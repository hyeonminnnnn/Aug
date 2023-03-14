package kr.ac.kopo.aug.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.aug.model.Users;
import kr.ac.kopo.aug.service.BoardService;
import kr.ac.kopo.aug.service.UsersService;


@Controller
@RequestMapping("/")
public class RootController {

	@Autowired
	BoardService boardservice;
	
	@Autowired
	UsersService service;
	
	@RequestMapping("/")
	public String index() {
		
		return "index";
	}


	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Users users, HttpSession session, RedirectAttributes rtr) {
		if(service.login(users)) {		
			session.setAttribute("users", users);
			String targetUrl = (String)session.getAttribute("target_url");
			session.removeAttribute("target_url");
			if(targetUrl == null)
				return "redirect:.";
			else
				return "redirect:" + targetUrl;
		} else {
			int result = 0;
			rtr.addFlashAttribute("result", result);
			return "redirect:login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(Users item) {
		service.signup(item);
		
		return "redirect:signupend";
	}
	
	@RequestMapping("/signupend")
	public String signupend() {
		return "signupend";
	}
	
	@ResponseBody
	@RequestMapping("/checkId/{id}")
		public String checkId(@PathVariable String id) {
			
			if(service.checkId(id)) {
				return "OK";
			}
			else {
				return "FAIL";
			}
		}
	
	@RequestMapping("/NewFile")
	public String NewFile() {
		return "NewFile";
	}

}

package kr.ac.kopo.aug.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.aug.model.Board;
import kr.ac.kopo.aug.model.Users;
import kr.ac.kopo.aug.pager.Pager;
import kr.ac.kopo.aug.service.UsersService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	final String path = "admin/";
	
	@Autowired
	UsersService uService;
	
	@RequestMapping("/list")
	public String list(Pager pager, Model model) {
		
		List<Users> list = uService.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable String id, Model model) {
		
		Users item = uService.item(id);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	
	@PostMapping("/update/{id}")
	public String update(Users item) {
		uService.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable String id) {
		uService.delete(id);
		
		return "redirect:../list";
	}
}

package kr.ac.kopo.aug.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.aug.model.Attach;
import kr.ac.kopo.aug.model.Board;
import kr.ac.kopo.aug.model.Cate;
import kr.ac.kopo.aug.model.Comment;
import kr.ac.kopo.aug.model.Heart;
import kr.ac.kopo.aug.model.Users;
import kr.ac.kopo.aug.pager.Pager;
import kr.ac.kopo.aug.service.BoardService;
import kr.ac.kopo.aug.service.CommentService;
import kr.ac.kopo.aug.service.HeartService;
import kr.ac.kopo.aug.service.CateService;

@Controller
@RequestMapping("/board")
public class BoardController {
	final String path = "board/";
	
	final String uploadPath = "d://upload/";
	@Autowired
	BoardService service;
	
	@Autowired
	CommentService cservice;
	
	@Autowired
	CateService cateservice;
	
	@Autowired
	HeartService hservice;

	@ResponseBody
	@PutMapping("/detail/heart/{id}")
	public String addHeart(@PathVariable int id, @SessionAttribute Users users) {
		if(hservice.add(id, users.getId()))
			return "OK";
		else
			return "FAIL";
	}

	
	@ResponseBody
	@RequestMapping("/delete_attach/{id}")
	public String deleteAttach(@PathVariable int id){
		if(service.deleteAttach(id))
			return "OK";
		else
			return "FAIL";
	}
	
	@RequestMapping("/mlist")
	public String mlist(Pager pager, Model model, Users users) {
		
		List<Board> list = service.mlist(pager);
		
		pager.setGrade(users.getGrade());
		
		model.addAttribute("list", list);
		
		return path + "mlist";
	}
	
	@RequestMapping("/clist")
	public String clist(Pager pager, Model model) {
		List<Board> list = service.clist(pager);
		
		model.addAttribute("list", list);
		
		return path + "clist";
	}
	
	@RequestMapping("/notice")
	public String notice(Model model, Pager pager) {
		
		List<Board> list = service.nlist(pager);
		
		model.addAttribute("list", list);
		
		return path + "notice";
	}
	
	@GetMapping("/mwrite")
	public String mrite(Model model) {
		List<Cate> list = cateservice.list();
		
		model.addAttribute("list", list);
		
		return path + "mwrite";
	}
	
	@PostMapping("/mwrite")
	public String mwrite(Board item, @SessionAttribute Users users ) {
		item.setUsersId(users.getId());
		
		try {
			List<Attach> list = new ArrayList<Attach>();
			
			for(MultipartFile attach : item.getAttach()) {
				if(attach != null && !attach.isEmpty()) {
					String filename = attach.getOriginalFilename();
					
					attach.transferTo(new File(uploadPath + filename));
					
					Attach attachItem = new Attach();
					attachItem.setFilename(filename);
					list.add(attachItem);
				}
			}
				item.setAttachs(list);
				
				service.mwrite(item);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return "redirect:mlist?cg=0";
	}
	
	@GetMapping("/cwrite")
	public String cwrite(Model model) {
		List<Cate> list = cateservice.list();
		
		model.addAttribute("list", list);
		
		return path + "cwrite";
	}
	
	@PostMapping("/cwrite")
	public String cwrite(Board item, @SessionAttribute Users users ) {
		item.setUsersId(users.getId());
		
		try {
			List<Attach> list = new ArrayList<Attach>();
			
			for(MultipartFile attach : item.getAttach()) {
				if(attach != null && !attach.isEmpty()) {
					String filename = attach.getOriginalFilename();
					
					attach.transferTo(new File(uploadPath + filename));
					
					Attach attachItem = new Attach();
					attachItem.setFilename(filename);
					list.add(attachItem);
				}
			}
				item.setAttachs(list);
				
				service.cwrite(item);
		} catch(Exception e) {
			e.printStackTrace();
		}
		 
		return "redirect:clist?cg=0";
	}
	
	@GetMapping("/nwrite")
	public String nwrite() {
		return path + "nwrite";
	}
	
	@PostMapping("/nwrite")
	public String nwrite(Board item, @SessionAttribute Users users) {
		item.setUsersId(users.getId());
		
		try {
			List<Attach> list = new ArrayList<Attach>();
			
			for(MultipartFile attach : item.getAttach()) {
				if(attach != null && !attach.isEmpty()) {
					String filename = attach.getOriginalFilename();
					
					attach.transferTo(new File(uploadPath + filename));
					
					Attach attachItem = new Attach();
					attachItem.setFilename(filename);
					list.add(attachItem);
				}
			}
				item.setAttachs(list);
				
				service.nwrite(item);
		} catch(Exception e) {
			e.printStackTrace();
		}
		 
		return "redirect:notice";
	}
	
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable int id ,Model model, Board board, Heart heart) {
		service.viewCount(id);
		
		Board item = service.item(id);
		item.setid(id);
		model.addAttribute("item", item);
		
		return path + "detail";

	}
	
	@ResponseBody
	@GetMapping("/detail/clist")
	public List<Comment> clist(@RequestParam("n") int id, Model model) throws Exception{
		List<Comment> reply = cservice.clist(id);
		
		model.addAttribute("reply", reply);
		
		service.commentCount(id);
		
		return reply;
	}
	
	@ResponseBody
	@PostMapping("/detail/comWrite")
	public void comWrite(Comment item, @SessionAttribute Users users) {
		
		item.setUsersId(users.getId());
		
		cservice.write(item);

	}
	
	@ResponseBody
	@PostMapping("/detail/comDelete")
	public int clist(Comment item, @SessionAttribute Users users) {
		int result = 0;
		
		String usersId = cservice.idCheck(item.getCno());
		
		if(users.getId().equals(usersId)) {
			cservice.delete(item);
			
			result = 1;
		}else if(users.getGrade().equals("마스터") || users.getGrade().equals("관리자")) {
			cservice.delete(item);
				
			result = 1;
		}
		return result;
		}

	
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		Board item = service.item(id);
		
		model.addAttribute("item", item);
		
		List<Cate> list = cateservice.list();
		
		model.addAttribute("list", list);
		
		return path + "update";
	}
	
	@PostMapping("/update/{id}")
	public String update(Board item) {
		service.update(item);
		
		try {
			List<Attach> list = new ArrayList<Attach>();
			
			for(MultipartFile attach : item.getAttach()) {
				if(attach != null && !attach.isEmpty()) {
					String filename = attach.getOriginalFilename();
					
					attach.transferTo(new File(uploadPath + filename));
					
					Attach attachItem = new Attach();
					attachItem.setFilename(filename);
					list.add(attachItem);
				}
			}
				item.setAttachs(list);
				
				service.update(item);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:../detail/" + item.getid();
	}
	
	@RequestMapping("/mdelete/{id}")
	public String mdelete(@PathVariable int id) {

		service.delete(id);
		
		return "redirect:../mlist?cg=0";
	}
	
	@RequestMapping("/cdelete/{id}")
	public String cdelete(@PathVariable int id) {

		service.delete(id);
		
		return "redirect:../clist?cg=0";
	}
	
	@RequestMapping("/ndelete/{id}")
	public String ndelete(@PathVariable int id) {
		service.delete(id);
		
		return "redirect:../notice";
	}
	
}

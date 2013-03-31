package com.wyq.jpa.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wyq.jpa.model.Blog;
import com.wyq.jpa.model.Category;
import com.wyq.jpa.model.Comment;
import com.wyq.jpa.model.Entry;
import com.wyq.jpa.model.Link;
import com.wyq.jpa.service.BlogService;
import com.wyq.jpa.service.CategoryService;
import com.wyq.jpa.service.CommentService;
import com.wyq.jpa.service.EntryService;
import com.wyq.jpa.service.LinkService;
import com.wyq.jpa.util.Pager;

/**
 * Sample controller for going to the home page with a message2
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	
	/**
	 * Selects the home page and populates the model with a message
	 */
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public ModelAndView home(Integer cid,Integer page) {
		logger.info("Welcome home!");
		ModelAndView mav=new ModelAndView("index");
		Blog blog=loadHeader(mav);
		loadContent(mav, blog,cid, page);
		loadFooter(mav);
		return mav;
	}
	@RequestMapping(value = "/getInfo", method = RequestMethod.GET)
	public String home1() {
		return "env";
	}
	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public String index() {
		return "redirect:/";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "admin/login";
	}
	
	
	@RequestMapping(value = "toEntry/{cid}/{eid}", method = RequestMethod.GET)
	public ModelAndView toEntry(@PathVariable Integer cid,@PathVariable Integer eid,Integer p) {
		logger.info("Welcome home!");
		ModelAndView mav=new ModelAndView("entry");
		if (p==null||p<0) {
			p=0;
		}
		Blog blog=loadHeader(mav);
		Entry entry=entryService.getEntryById(eid);
		mav.addObject("entry", entry);
		Pager page=commentService.getPager(eid, p, blog.getBackendCommentSize());
		mav.addObject("page", page);
		loadFooter(mav);
		return mav;
	}
	
	@RequestMapping(value="saveComment",method=RequestMethod.POST)
	public String save(Comment comment,HttpServletRequest request){
		comment.setCreatedTime(new Date());
		comment.setIp(request.getRemoteAddr());
		commentService.save(comment);
		return "redirect:toEntry/"+comment.getEntry().getCategory().getId()+"/"+comment.getEntry().getId()+"";
		
	}
	/**
	 * 加载header
	 * @param mav
	 * @return
	 */
	protected Blog loadHeader(ModelAndView mav) {
		Blog blog=blogService.findById(1);
		mav.addObject("blog", blog);
		// 加载分类信息
		List<Category> categorys = categoryService.getCategorysByBlogid(blog.getId());
		mav.addObject("categorys", categorys);
		return blog;
	}
	/**
	 * 加载首页
	 * @param mav
	 * @param blog
	 * @param page
	 */
	protected void loadContent(ModelAndView mav, Blog blog,Integer cid,Integer page) {
		if (page==null||page<0) {
			page=0;
		}
		if(cid==null||cid<0){
			cid=-1;
		}
		// 加载文章信息
		Pager pager = entryService.getPager(cid,page, blog.getBackendPageSize());
		mav.addObject("page", pager);
	}

	/**
	 * 加载页尾信息
	 * 
	 * @param mav
	 */
	protected void loadFooter(ModelAndView mav) {
		//加载最近发表
		List<Entry> entrys=entryService.getEntrys(-1,0, 5);
		mav.addObject("recentEntrys",entrys);
		//加载评论信心
		List<Comment> coments=commentService.getCommentsList(0, 5);
		mav.addObject("recentComments", coments);
		//加载链接
		List<Link> links=linkService.getLinks();
		mav.addObject("links", links);
	}
	@Autowired
	BlogService blogService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	EntryService entryService;
	@Autowired
	CommentService commentService;
	@Autowired
	LinkService linkService;
}

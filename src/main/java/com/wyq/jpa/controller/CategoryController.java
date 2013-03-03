package com.wyq.jpa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wyq.jpa.model.Category;
import com.wyq.jpa.service.CategoryService;

@RequestMapping(value="category")
@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String category(){
		return "admin/category/list";
	}
	@ResponseBody
	@RequestMapping(value="getAjaxList")
	public Map<String, Object> getCategorys(){
		List<Category> categorys=categoryService.getCategorys();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("total", categorys.size());
		map.put("rows", categorys);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="ajaxUpdateOne")
	public  Map<String, Object> updateCategorys(Category category){
		Map<String, Object> map=new HashMap<String, Object>();
		try{
			if(category.getId()==0){
				category.setId(null);
			}
			categoryService.update(category);
			map.put("title", "提示");
			map.put("errorMsg", "更新成功");
		}catch(Exception e){
			map.put("title", "提示");
			map.put("errorMsg", "更新失败");
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value="ajaxDelOne")
	public Map<String, Object> delCategorys(Integer id){
		Map<String, Object> map=new HashMap<String, Object>();
		try{
			categoryService.delCategoryById(id);
			map.put("success","true");
			map.put("title", "提示");
			map.put("errorMsg", "删除成功");
		}catch(Exception e){
			map.put("title", "提示");
			map.put("errorMsg", "删除失败");
		}
		return map;
	}
}

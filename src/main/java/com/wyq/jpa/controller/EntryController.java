package com.wyq.jpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("entry")
public class EntryController {
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String entry(){
		return "admin/entry/list";
	}
}

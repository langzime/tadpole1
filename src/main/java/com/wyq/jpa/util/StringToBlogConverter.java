package com.wyq.jpa.util;

import org.springframework.core.convert.converter.Converter;

import com.wyq.jpa.model.Blog;

public class StringToBlogConverter implements Converter<String, Blog> {

	@Override
	public Blog convert(String source) {
		// TODO Auto-generated method stub
		Blog blog=new Blog();
		if(source!=null){
			
		}
		return null;
	}

}

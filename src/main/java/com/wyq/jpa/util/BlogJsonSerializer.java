package com.wyq.jpa.util;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

import com.wyq.jpa.model.Blog;

public class BlogJsonSerializer extends JsonSerializer<Blog> {

	@Override
	public void serialize(Blog value, JsonGenerator jgen,
			SerializerProvider provider) throws IOException,
			JsonProcessingException {
		jgen.writeString(value.getId()+"");		
	}

}

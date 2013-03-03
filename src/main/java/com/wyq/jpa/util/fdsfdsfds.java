package com.wyq.jpa.util;

import org.codehaus.jackson.annotate.JsonTypeInfo.Id;
import org.codehaus.jackson.map.jsontype.impl.TypeIdResolverBase;
import org.codehaus.jackson.map.type.TypeFactory;
import org.codehaus.jackson.type.JavaType;

public class fdsfdsfds extends TypeIdResolverBase {
	protected fdsfdsfds(JavaType baseType, TypeFactory typeFactory) {
		super(baseType, typeFactory);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String idFromValue(Object value) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String idFromValueAndType(Object value, Class<?> suggestedType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JavaType typeFromId(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Id getMechanism() {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.springbootspringmvc.demo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootspringmvc.demo.model.CategoryEntity;
import com.springbootspringmvc.demo.repository.CategoryRepository;
import com.springbootspringmvc.demo.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {

	@Autowired 
	private CategoryRepository categoryRepository;
	
	@Override
	public Map<Long,String> findAll() {
		Map<Long,String> result = new HashMap<>();
		
		List<CategoryEntity>entities = categoryRepository.findAll();
		for(CategoryEntity item:entities)
		{
			result.put(item.getId(), item.getName());
		}
		return result;
	}


}
	
	

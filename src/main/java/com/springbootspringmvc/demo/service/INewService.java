package com.springbootspringmvc.demo.service;

import java.util.List;

import com.springbootspringmvc.demo.model.NewEntity;

public interface INewService {
	List<NewEntity> findAll();
	NewEntity findById(long id);
	void save(NewEntity dto,Long categoryId);
	void delete(Long id);
	List<NewEntity> findByTitleContaining(String name);
	
}

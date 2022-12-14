package com.springbootspringmvc.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springbootspringmvc.demo.model.CategoryEntity;

@Repository
public interface CategoryRepository  extends JpaRepository<CategoryEntity, Long>{
	CategoryEntity findOneByCode(String code);
}

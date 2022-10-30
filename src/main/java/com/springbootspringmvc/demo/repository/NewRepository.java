package com.springbootspringmvc.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springbootspringmvc.demo.model.NewEntity;

@Repository
public interface NewRepository extends JpaRepository<NewEntity, Long> {
	List<NewEntity> findByTitleContaining(String title); // ddawjt tên theo yêu cầu chuẩn jpa, đúng field , đúng tên 
	List<NewEntity> findByCategoryCodeContaining(String code);
}


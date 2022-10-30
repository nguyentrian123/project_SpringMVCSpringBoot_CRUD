package com.springbootspringmvc.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springbootspringmvc.demo.model.CategoryEntity;
import com.springbootspringmvc.demo.model.NewEntity;
import com.springbootspringmvc.demo.repository.CategoryRepository;
import com.springbootspringmvc.demo.repository.NewRepository;
import com.springbootspringmvc.demo.service.INewService;

@Service
public class NewService  implements INewService {
	
	@Autowired
	private NewRepository newRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	
	@Override // @Transactional giúp ta bảo toàn dữ liệu , nếu thêm or sửa thất bại thì k có gì thay đổi ở CSDL
	@Transactional // đã thay categoryCode == categoryId để dễ hiểu  
	public void save(NewEntity newEntity, Long categoryId) {
		// Tìm thể loại theo Id mà người dùng đã chọn 
		CategoryEntity category = categoryRepository.findById(categoryId).get();
		
		if(newEntity.getId()!= null) // Id != null có nghĩa là đã có model này ở CSDL ta thực hiện sửa 
		{
			NewEntity oldNew = newRepository.findById(newEntity.getId()).get(); // tìm bài viết trước khi sửa , theo id gửi về 
			// set các thuộc tính mới cho cái model cũ  vừa tìm được theo Id ở CSDL lên.
			oldNew.setCategory(category);
			oldNew.setContent(newEntity.getContent());
			oldNew.setShortDescription(newEntity.getShortDescription());
			oldNew.setTitle(newEntity.getTitle());
			newRepository.save(oldNew);
			
		}
		else // id == null thì thêm mới 
		{	
			newEntity.setCategory(category);
			newRepository.save(newEntity);
		}
		
	}
	
	
	@Override
	public List<NewEntity> findAll() {
		List<NewEntity> entities = newRepository.findAll();
		return entities;
	}
	

	@Override
	public List<NewEntity> findByTitleContaining(String name) {
		List<NewEntity> models = newRepository.findByTitleContaining(name);
		return models;	
	}


	@Override
	public NewEntity findById(long id) {
		NewEntity entity = newRepository.findById(id).get();
		return entity; 
	}
	

	@Override
	@Transactional
	public void delete(Long id) {
		newRepository.deleteById(id);
	}

	
}

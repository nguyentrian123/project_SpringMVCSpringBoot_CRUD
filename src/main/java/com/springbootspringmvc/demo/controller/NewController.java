package com.springbootspringmvc.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springbootspringmvc.demo.model.NewEntity;
import com.springbootspringmvc.demo.service.ICategoryService;
import com.springbootspringmvc.demo.service.INewService;

@Controller
public class NewController {

	@Autowired
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="title",required= false) String title) {
		
		List<NewEntity> models = new ArrayList<NewEntity>();
		ModelAndView mav = new ModelAndView("admin/new/list");
		
		if(StringUtils.hasText(title))
		{
			models.addAll(newService.findByTitleContaining(title));
		}
		else
		{
			models.addAll(newService.findAll());
		}
		
		mav.addObject("model", models);
		return mav;
	}
	
	@RequestMapping(value="/quan-tri/bai-viet/add-edit",method = RequestMethod.POST)
	public String edit(@ModelAttribute NewEntity newEntity,@RequestParam(name="categoryId") Long categoryId) {
		newService.save(newEntity,categoryId);
		return "redirect:/quan-tri/bai-viet/danh-sach";
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/chinh-sua", method = RequestMethod.GET)
	public ModelAndView displayEditNew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) { 
		ModelAndView mav = new ModelAndView("admin/new/edit");
		NewEntity model = new NewEntity();
		
		if(id != null)
		{
			model = newService.findById(id);
		}		
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="/quan-tri/bai-viet/delete",method = RequestMethod.GET)
	public String delete(@RequestParam Long id) {
		newService.delete(id);
		return "redirect:/quan-tri/bai-viet/danh-sach";
	}
	

		
}

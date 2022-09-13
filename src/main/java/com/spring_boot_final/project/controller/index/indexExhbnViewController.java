package com.spring_boot_final.project.controller.index;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_final.project.model.ExhbnVO;
import com.spring_boot_final.project.service.ExhbnService;

@Controller
public class indexExhbnViewController {
	
	 @Autowired
	  ExhbnService service;
	 
	// detail page view
    @RequestMapping("/")
    public String listTestView(Model model) {

        ArrayList<ExhbnVO> vo = service.selectAllData();
        model.addAttribute("exhbnList",vo);

        return "index";
    }
}

package com.spring_boot_final.project.controller.chatbot;

import java.io.IOException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring_boot_final.project.service.ChatbotService;

@RestController
public class ChatbotController {
	
	 // JSON 형태 그대로 반환
	  
	  @RequestMapping("/chatbotJSON") public String
	  chatbotJSON(@RequestParam("message") String message) throws IOException {
	  return ChatbotService.mainJSON(message); }
	 
}

package com.mc.mvc.todo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class todoController {

	@GetMapping("todo")
	public String todo() {
		return "todo";
	}
	
}


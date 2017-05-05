package bug.frontstage.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.anno.Token;

@Component
@RequestMapping("common")
public class CommonDispatcher {
	
	@RequestMapping("/{view}")
	public String dispatcher(@PathVariable String view){
		return view;
	}
	
	@Token(saveToken=true)
	@RequestMapping("/addToken")
	@ResponseBody
	public String addToken(HttpSession session){
		String token = session.getAttribute("token").toString();
		return token;
	}
}

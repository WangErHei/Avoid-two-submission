package bug.frontstage.project_info.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.anno.Token;
import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
import bug.frontstage.bug_info.service.imp.SelectBugInfoimp;
import bug.frontstage.login.service.imp.SelectProgramLoginServiceimp;
import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.project_info.model.Bug;
import bug.frontstage.project_info.service.imp.AddProgramServiceimp;


@Controller
public class ProjectAddBugController {
	private String pagecount;
	@Autowired
	@Qualifier("AddProgramServiceimp")
	private AddProgramServiceimp  addProgramServiceimp;
	
	@Autowired(required=false)
	@Qualifier("SelectBugInfoimp")
	private SelectBugInfoimp selectBugInfoimp;
	
	@Autowired
	@Qualifier("SelectActiveBugServiceimp")
	private SelectActiveBugServiceimp selectActiveBugServiceimp;
	
	@Autowired
	@Qualifier("CountNeedToDoServiceImp")
	private CountNeedToDoServiceImp countNeedToDoServiceImp;
	
	@Autowired(required = false)
	@Qualifier("SelectProgramLoginServiceimp")
	private SelectProgramLoginServiceimp selectProgramLoginServiceimp;
	
//	@RequestMapping("/AddBug")
//	public String toBug(HttpServletRequest  req,int bid,int pid){
//	
//		req.getSession().setAttribute("pid", pid);
//		req.getSession().setAttribute("id", bid);
//		return "new_bug";
//	}
	
	
	@RequestMapping("/toAddBug")
	@Token(removeToken=true)
	public  String addBug(HttpServletRequest  req,int bid,int pid) throws ParseException{
	String title = req.getParameter("bug_title");
	String produce = req.getParameter("module");
	String marker = req.getParameter("handler");
	String describe  = req.getParameter("bug_describe");
	String prop= req.getParameter("priority");
	String type  = req.getParameter("type");
	String plan = req.getParameter("plan");
	String last  =req.getParameter("last");
	String path= req.getParameter("result");
	String  paths = req.getParameter("results");
	String  pathss = req.getParameter("resultss");
	String environment = req.getParameter("environment");
	
	int activenum = selectBugInfoimp.activeBugNumber(pid);
	int waitnum = selectBugInfoimp.waitBugNumber(pid);
	int refusenum = selectBugInfoimp.refuseBugNumber(pid);
	int donenum  = selectBugInfoimp.doneBugNumber(pid);
	int pushnum = selectBugInfoimp.pushBugNumber(pid);
	int closenum = selectBugInfoimp.closeBugNumber(pid);
	int mebernum =selectBugInfoimp.member(pid);
	int producenum = selectBugInfoimp.produce(pid);
	int notstate = selectBugInfoimp.notState(pid);
	int task = selectBugInfoimp.task(pid);
	int need = selectBugInfoimp.need(pid);
	int type1 = selectBugInfoimp.type1(pid);
	int type2 = selectBugInfoimp.type2(pid);
	int type3 = selectBugInfoimp.type3(pid);
	int type4 = selectBugInfoimp.type4(pid);
	long days= selectBugInfoimp.day(pid);
	List<Map<String,Object>> notify = selectBugInfoimp.notify(pid);
	
	req.getSession().setAttribute("waitnum", waitnum);
	req.getSession().setAttribute("refusenum", refusenum);
	req.getSession().setAttribute("activenum", activenum);
	req.getSession().setAttribute("donenum", donenum);
	req.getSession().setAttribute("pushnum", pushnum);
	req.getSession().setAttribute("closenum", closenum);
	req.getSession().setAttribute("mebernum", mebernum);
	req.getSession().setAttribute("producenum", producenum);

	req.getSession().setAttribute("notify", notify);
	req.getSession().setAttribute("notstate", notstate);
	req.getSession().setAttribute("task", task);
	req.getSession().setAttribute("need", need);
	req.getSession().setAttribute("type1", type1);
	req.getSession().setAttribute("type2", type2);
	req.getSession().setAttribute("type3", type3);
	req.getSession().setAttribute("type4", type4);
	req.getSession().setAttribute("days", days);
	Bug bug =new Bug();
	bug.setBug_title(title);
	bug.setBug_photo(path);
	bug.setProduce_name(produce);
	bug.setBug_maker(marker);
	bug.setBug_describe(describe);
	bug.setProp(prop);
	bug.setBug_state("未解决");
	bug.setBug_type(type);
	bug.setBug_plan_date(plan);
	bug.setBug_lasted_date(last);
	bug.setBug_photo(path);
	bug.setBug_environment(environment);
	bug.setBug_fu(paths);
	bug.setBug_fu_name(pathss);
	String name = addProgramServiceimp.buserName(bid);
	bug.setBug_signer(name);
	addProgramServiceimp.addBug(bug, pid,bid);	
	String currpage="1";
	String everycount="5";
	List<Map<String, Object>> activebug = selectActiveBugServiceimp.activeBug(pid,currpage, everycount);
	List<Map<String, Object>> list1 = selectProgramLoginServiceimp.selectAllProgram(pid);
	int total = selectBugInfoimp.total(pid);
	int num = selectActiveBugServiceimp.activeAllNum(pid);
	int count = Integer.parseInt(everycount);
	if (num % count == 0) {
		pagecount = (num / count) + "";
	} else {
		pagecount = (num / count + 1) + "";
	}
	req.getSession().setAttribute("total", total);
	int countNeedToDo = countNeedToDoServiceImp.countNeed(bid, pid);
	req.getSession().setAttribute("countNeedToDo", countNeedToDo);
	req.setAttribute("currpage", currpage);
	req.getSession().setAttribute("activebug", activebug);
	req.getSession().setAttribute("num", num);
	req.setAttribute("pagecount", pagecount);
	req.getSession().setAttribute("activebug", activebug);
	req.getSession().setAttribute("list1", list1);
	return "bugActive";
	
}
}
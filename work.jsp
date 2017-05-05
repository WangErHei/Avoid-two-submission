<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html class=" dk_fouc">

	<head lang="en">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>工作台</title>
		<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/font-awesome-4.4.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-datepicker.min.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/jquery.minicolors.css">
		<link rel="stylesheet" href="<%=path %>/css/animate.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/public.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/bugClose.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/project.css" type="text/css">
		<script type="text/javascript" src="<%=path %>/js/utils.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
		<link rel="stylesheet" href="<%=path %>/css/layer.css" id="layui_layer_skinlayercss">
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="xml" src="<%=path %>/js/xml.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="dropkick" src="<%=path %>/js/jquery.dropkick-1.0.0.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="slimScroll" src="<%=path %>/js/jquery.slimscroll.min.1.3.8.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="utils" src="<%=path %>/js/utils.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="qrcode" src="<%=path %>/js/jquery.qrcode.min.js"></script>
	   <script src="<%=path %>/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript">

function showOneNotify(a){
	 $.post("<%=path%>/showNoticeInfo",{
		 "typeInfo":"全部",
		 "creater":"全部",
		 "notyId":a,
	 	  "bid":"${id}",
	 	  "pid":"${pid}"
			},function(){	
				window.location.href="<%=path%>/common/informDetails";
		});
	}
function produce() {
	 
	 $.post("<%=path%>/selectProduce",{
		"produce_id":"${pid}"
			},function(listpro){
				var option="<option>[未指定]</option>";
				var jsonlist = eval(listpro);
				for(var i  in jsonlist){					
					option = option + "<option value='"+jsonlist[i].produce_name+"'>"+jsonlist[i].produce_name+"</option>";
				}
				$("#bugProduct").html(option);
	}); 
}


function meber() {

	 $.post("<%=path%>/toMember",{
		"pid":"${pid}"
			},function(listmember){				
				var jsonlist = eval(listmember);
				var option="<option>[未指定]</option>";
				for(var i  in jsonlist){		
					option = option + "<option value='"+jsonlist[i].buser_name+"'>"+jsonlist[i].buser_name+"</option>";
				}
				$("#bugFixToSelect").html(option);
				}); 
}
	
	//搜索功能
function updateName() {
	var fastKeyword = $("#fastKeyword").val();
	 $.post("<%=path%>/search",{
		"pid":"${pid}",
		"currpage":"1",
		"content":fastKeyword
			},function(map){	
				window.location.href="<%=path%>/common/search";
		});
}
	
	
</script>	
<script type="text/javascript">
function ajaxFileUpload(){
    $.ajaxFileUpload(
        {
     url:'pic/upload',                 //需要链接到服务器地址
     secureuri:false,
     fileElementId:'uploadFile',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload(){

    $.ajaxFileUpload(
        {
     url:'uploadfu',            //需要链接到服务器地址
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results').val(result.result);
        var b= $('#resultss').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
      
           

function addToken(){

	$.post("<%=path%>/common/addToken",
	function(result){
		$("#token").val(result);
	});
}

	</script>	
	
	
	<script type="text/javascript">

	function tobug(a){

		 $.post("<%=path%>/tobug",{
			"pid":"${pid}",
			"bug_id":a,
			"bid":"${id}"
				},function(map){	
					window.location.href="<%=path%>/common/bugDetails";
			});
	}

	
	
	function ajaxFileUpload1(){
	    $.ajaxFileUpload(
	        {
	     url:'pic/upload',            //需要链接到服务器地址
	     secureuri:false,
	     fileElementId:'uploadFile1',                        //文件选择框的id属性
	     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
	     success: function (jsonStr)            //相当于java中try语句块的用法
	     {      
	        var a= $('#result1').val(jsonStr.result);
	     },
	     error: function (data, status, e)            //相当于java中catch语句块的用法
	     {
	         $('#result').html('添加失败');
	     }
	        }
	               
	           );
	          
	      }
	   
	function FileUpload1(){
	    $.ajaxFileUpload(
	        {
	     url:'uploadfu',            //需要链接到服务器地址
	     secureuri:false,
	     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
	     fileElementId:'imgfile1',                        //文件选择框的id属性
	     success: function (result)            //相当于java中try语句块的用法
	     {    
	        var a= $('#results1').val(result.result);
	        var b= $('#resultss1').val(result.oname);
	     },
	     error: function (data, status, e)            //相当于java中catch语句块的用法
	     {
	         $('#result').html('添加失败');
	     }
	        }
	               
	           );
	          
	      }
	
	function  toExcel(){
		var plan=$("#plan").val();
		var last = $("#last").val();
		//下载只能由href路径
	
		window.location.href="<%=path%>/Excel?bid=${bid}&pid=${pid}&date="+plan+"&date1="+last;
//	setTimeout("location.reload()",400);
		}
	
	
	
</script> 
	<script> 
		$(function(){
			produce();
			meber();

		});
	
		
		
</script> 
</head>
<body class="apps done fixed-sidebar modal-open-v">
		<!-- header start -->
		<header class="site-header">
			<div class="wrapper-header-left-bg"></div>
			<div class="wrapper-header">
				<span class="name">
		        	<img src="<%=path %>/img/logozxi.png" height="33px">
		        </span>
				<div class="wrapper-header-right">
					<div style="display: inline-block;">
						<span class="menus"><a href="<%=path%>/toprogram?id=${id}">我的项目</a></span>
						<span class="menus">
            		<i class="fa fa-angle-right"></i></span>
						<div class="sidebar-select" id="console-sidebar-select" alt="切换项目" title="切换项目">
							<div class="dk_container  dk_shown dk_theme_default" id="dk_container_projectSelectList" tabindex="1">
								<a class="dk_toggle"><span class="dk_label">${pname}</span>
									<span class="select-icon"><i class="fa fa-caret-down"></i></span>
								</a>
								<div class="dk_options">
									<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
										<ul class="dk_options_inner" style="overflow: hidden; width: auto; height: 100%;">
									    <c:forEach  items="${list1}" var="b">
											<li class="dk_option_current">						   				
												<a data-dk-dropdown-value="27221"  href="<%=path %>/change?pid=${b.pid }&pname=${b.pname}&bid=${id}">
												<img src="<%=path %>/img/app-default.jpg">${b.pname}
												<label class="badge bgBlue">${b.pnum}</label>								
												</a>						
											</li>
											</c:forEach>
										</ul>
										<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
										<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
									</div>
								</div>
							</div>
							<select style="visibility: hidden; display: none;" tabindex="1" id="projectSelectList">
								<option value="27221" selected="">呜呜</option>
							</select>
						</div>
						<div class="sidebar-search">
							
								<div class="input-group">
									<input type="text" class="form-control" id="fastKeyword" placeholder="BUG标题、模块" autocomplete="off"  name="content" >
									<span class="input-group-btn"><button class="btn btn-default" type="button"    onclick="javascript:updateName();"><i class="fa fa-search"></i></button></span></div>
					
						</div>
					</div>
            <div class="right">
                <div class="setting">
                    <span class="username" tabindex="2">
                        <div class="username-warp">
                            <i class="fa fa-user"></i>
                            <c:forEach  items="${list}" var="a">
		                            <span class="username-txt textOverHiden" >${a.BUSER_NAME}</span>
		                            </c:forEach>
                        </div>

                             
                        </div>
                    </span>
                </div>
            </div>
        </div>
    </div>
</header>

	 <!-- header end -->
	    <div class="wrapper" id="wrapper">
	        <!-- nav start -->
	        <nav class="navbar-default navbar-static-side">
				<div class="slimScrollDiv" style="position: relative; width: auto; height: 100%;">
					<div class="sidebar-collapse" style="overflow: hidden; width: auto; height: 100%;">
						<div class="project-img relative" id="project-img">
							<p style="background: url(img/app-default.jpg) center center / contain no-repeat;">
								<img src="<%=path %>/img/app-default.jpg" id="projectImg" border="0">
								<span class="bg"></span><a href=""><span class="btn"><i class="fa fa-refresh"></i><br>刷新项目</span></a>
							</p>
						</div>
						<div class="sidebar-menus-icon"><span class="fa fa-navicon" title="展开" alt="展开"></span></div>
						<ul class="nav side-menu" id="side-menu">
								<li class="divider"></li>
								<li class="li-projectInfo active" data-url="" for="main" alt="项目概况" title="项目概况" id="projectInfoMenu">
									<a href="<%=path%>/bugInfo?bid=${id}&pid=${pid}"><i class="fa fa-database"></i> <span class="nav-label">项目概况</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								
								<li data-url="" for="main" alt="活动BUG" title="活动BUG" id="bugActiveMenu">
									<a href="<%=path%>/Programactive?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-clock-o"></i> <span class="nav-label">活动BUG <sup class="badge bgDefault" id="bugsActive">${num}</sup></span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								
								<li data-url="" for="main" alt="所有BUG" title="所有BUG" class="li-bugAll" id="bugAllMenu">
									<a href="<%=path%>/allBug?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-bug"></i> <span class="nav-label">所有BUG</span></a>
								</li>
								<li data-url="" for="main" alt="BUG统计" title="BUG统计" id="bugStatMenu" class="li-countAll" style="display: none;">
									<a href="countAll.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">BUG统计</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li class="divider"></li>
								<li data-url="bugAssignToMe.html" for="main" alt="我的待办" title="我的待办" class="li-bugAssignToMe" id="bugAssignToMeMenu">
									<a href="<%=path%>/needToDo?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-hourglass-end"></i> <span class="nav-label">我的待办 <sup class="badge bgYellow" id="bugsAssignToMe">${countNeedToDo}</sup></span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li data-url="bugFixByMe.html" for="main" alt="我的任务" title="我的任务" class="li-bugFixByMe" id="bugFixByMeMenu" style="">
									<a href="<%=path%>/myAllTask?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-sign-in"></i> <span class="nav-label">我的任务</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li data-url="bugAssignByMe.html" for="main" alt="我的分配" title="我的分配" class="li-bugAssignByMe" id="bugAssignByMeMenu" style="">
									<a href="<%=path%>/assignOthers?bid=${id}&pid=${pid}&currpage=1"><i class="fa fa-sign-out"></i> <span class="nav-label">我的分配</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li class="divider"></li>
								<li data-url="noticeAll.html" for="main" alt="项目通知" title="项目通知" class="li-noticeAll" id="noticeAllMenu">
									<a href="<%=path%>/showNotice?bid=${id }&pid=${pid}&currpage=1"><i class="fa fa-bullhorn"></i> <span class="nav-label">项目通知</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
								</li>
								<li data-url="testCase.html" for="main" alt="测试用例" title="测试用例" class="li-testCase" id="testCaseMenu">
		                        	<a href="<%=path%>/showTestCase?bid=${id }&pid=${pid}&currpage=1"><i class="fa fa-leanpub"></i> <span class="nav-label">测试用例</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
		                   		</li>
							</ul>
					</div>
					<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; left: 1px; height: 704px; background: rgb(0, 0, 0);"></div>
					<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; left: 1px; background: rgb(51, 51, 51);"></div>
				</div>
			</nav>
	        <!-- nav end -->
	        <!-- main start -->
	        <div class="bug-content">
	            <div class="slimScrollDiv" style="position: relative; width: auto; height: 100%;">
	            <div class="bug-main" id="main" style=" width: auto; height: 100%;"><div class="project animated fadeInRight">
	   <h4>项目概况</h4>
	    <div style="position: absolute;right: 15px;top: -6px;">
	        <div class="inline btn-canAddNotice" style="display: inline-block;">
		<span id="projectNotice"><a href="javascript:void(0)" class="btn btn-block btn-primary w100" data-toggle="modal" data-target="#myProjectNoticeModal" id="submitNoticeBtn"><i class="fa fa-bullhorn"></i> 发布通知</a></span> 
			</div>
	        <div class="inline btn-canAddVersion"><span id="addProductVersion"></span></div>
	        <div class="inline btn-canSubmitBug" style="display: inline-block;">
				<span class="btn btn-primary w100" data-toggle="modal" data-target="#myProjectBugModal" id="submitBugBtn" onclick="addToken();"><i class="fa fa-plus-circle"></i> 提交BUG</span>
	        </div>
	     <div class="inline btn-canAddNotice" style="display: inline-block;">
									<a href="javascript:void(0)" class="btn btn-block btn-primary w100" data-toggle="modal" data-target="#exportBugModal" id="submitBugBtn"><i class="fa fa-share-square-o"></i> 导出BUG</a>
								</div>
								<div class="inline btn-canAddVersion"><span id="addProductVersion"></span></div>
	    </div>
	    <div id="emailVerified" style="position:absolute;left:100px;top:-6px;"></div>
	    <div id="proExpireDate" style="position:absolute;left:100px;top:-6px;"></div>
	    <!-- 项目概况统计 -->
	    <div class="projectInfoCount">
	        <div class="pd12">
	            <ul class="bugNum" id="stateCount"><li data-state="All"><div class="cell all"><em class="info">总数</em><span>${total}</span></div></li><a href="<%=path%>/Programactive?bid=${id}&pid=${pid}&currpage=1"><li data-state="Open"><div class="cell open"><em class="danger">未解决</em><span>${activenum}</span></div></li></a><a href="<%=path%>/Programactive?bid=${id}&pid=${pid}&currpage=1"><li data-state="Fixed"><div class="cell fixed" ><em class="warning">待审核</em><span>${waitnum }</span></div></li></a><a href="<%=path%>/Programactive?bid=${id}&pid=${pid}&currpage=1"><li data-state="Rejected"><div class="cell rejected"><em class="success">已拒绝</em><span>${refusenum}</span></div></li></a>	<a href="<%=path%>/allBug?bid=${id}&pid=${pid}&currpage=1"><li data-state="Resolved"><div class="cell resolved" ><em class="success">已解决</em><span>${donenum }</span></div></li></a>	<a href="<%=path%>/allBug?bid=${id}&pid=${pid}&currpage=1"><li data-state="Postponed"><div class="cell postponed" ><em class="success">已延期</em><span>${pushnum }</span></div></li></a>	<a href="<%=path%>/allBug?bid=${id}&pid=${pid}&currpage=1"><li data-state="Closed"><div class="cell closed" ><em class="success">已关闭</em><span>${closenum }</span></div></li></a></ul>
	        </div>
	        <div class="">
	            <ul class="priorityCount" style="display: block;">
                <li id="projectHealth" class="projectHealth"><div class="cell projectHealth5"><em class="info">通知数量</em><span>${numNotice}</span><p><i class="fa fa-tachometer"></i></p></div></li><li style="width: 42.857142857142%;vertical-align: top;">
                    <ul id="bugTypeCount" class="bugTypeCount"><li data-bugtype="Bug"><div class="cell"><span class="label label-danger"><em>缺陷</em> <span>${notstate}</span></span></div></li><li data-bugtype="Task"><div class="cell"><span class="label label-warning" ><em>任务</em> <span>${task}</span></span></div></li><li data-bugtype="Require"><div class="cell"><span class="label label-primary"><em>需求</em> <span>${need }</span></span></div></li></ul>
                    <ul id="priorityCount" class="bugPriorityCount"><li data-priority="Urgent"><div class="cell"><span class="label label-danger">急 ${type1 }</span></div></li><li data-priority="High"><div class="cell"><span class="label label-warning" >高 ${type2 }</span></div></li><li data-priority="Medium"><div class="cell"><span class="label label-primary">中 ${type3}</span></div></li><li data-priority="Low"><div class="cell"><span class="label label-info" >低 ${type4 }</span></div></li></ul>
                </li><li id="projectDayNum"><div class="projectDayNum" ><em class="info">项目运行</em><span>${days} 天</span><p><i class="fa fa-rocket"></i></p></div></li><li id="projectUserNum" data-toggle="modal" data-target="#ProjectUserModal"><div class="projectUserNum"><em class="info">项目成员</em><span>${mebernum}</span><p><i class="fa fa-users"></i></p></div></li><li id="projectProductNum" data-toggle="modal" data-target="#ProjectProductModal"><div class="projectProductNum" ><em class="info">项目产品</em><span>${producenum}</span><p><i class="fa fa-coffee"></i></p><p></p></div></li>
            </ul>
        </div>
	       <!--  <div class="pd34" style="padding-top: 1px">
	            <ul class="bugNum bugPlanNum" id="planDateCount"><li data-state="Today"><div class="cell PlanNumClass"><span class="Today">今天</span><em class="em-Today">0</em></div></li><li data-state="Expired"><div class="cell PlanNumClass"><span class="Expired">已过期</span><em class="em-Expired">0</em></div></li><li data-state="TodayExit"><div class="cell PlanNumClass"><span class="TodayExit">今天结束</span><em class="em-TodayExit">0</em></div></li><li data-state="TodayStart"><div class="cell PlanNumClass"><span class="TodayStart">今天开始</span><em class="em-TodayStart">0</em></div></li><li data-state="Tomorrow"><div class="cell PlanNumClass"><span class="Tomorrow">明天</span><em class="em-Tomorrow">0</em></div></li><li data-state="Week"><div class="cell PlanNumClass"><span class="Week">本周</span><em class="em-Week">0</em></div></li><li data-state="WeekExit"><div class="cell PlanNumClass"><span class="WeekExit">本周结束</span><em class="em-WeekExit">0</em></div></li></ul>
	        </div> -->
	    </div>
	    <div class="row">
        <div class="col-md-6" style="padding-right: 7px">
            <div class="pTable">
                <div class="pTable-title pInfo">
                    <h5><i class="fa fa-flash yellow"></i> <span>最新BUG</span><a href="<%=path %>/Programactive?bid=${id}&pid=${pid}&currpage=1 "> <span class="more" id="latestMoreBtn">更多</span></a></h5>
                </div>  
            
                <div class="pTable-content project-latest-bug" id="project-latest-bug">
                        
                    <div class="table table-hover bugTable" >
                    <c:forEach  items="${activebug}" var="a" varStatus="status">
                    <div class="last-bugs" data-id="${a.bug_id}"  onclick ="tobug(${a.bug_id})">
                   ${status.index+1 }   &nbsp;<span class="defaultColor" alt ="产品" title="产品"> </span>${a.bug_title } <p class="pd12">
                    <span class="label" style="padding:.3em .6em .3em;color:#fff;background:#d9534f">${a.bug_type}</span>
                     <span class="label label-danger">${a.bug_state}</span> <span class="label label-primary">${a.bug_prop}</span> 
                     <span class="right"> ${fn:substring(a.bug_create_date,0,16)}</span></p></div>
					</c:forEach>
                     </div>
                      
                </div>       
            </div>
        </div>
        
        
	        <div class="col-md-6" style="padding-left: 7px">
	            <div class="pTable">
	            <div class="pTable-title pInfo">
	                    <h5><i class="fa fa-bullhorn green"></i> <span>最新通知</span><a href="<%=path%>/showNotice?bid=${id }&pid=${pid}&currpage=1"> <span class="more" id="urgentMoreBtn">更多</span></a></h5>
	                </div>
	                <div class="pTable-content project-urgent-bug" id="project-urgent-bug">
	                    <div class="table table-hover noticeTable">
	                     <c:forEach  items="${noticeIndexList}" var="notyIndexList">
	                    
	                    	<div class="last-notices" data-id="2170" onclick="showOneNotify(${notyIndexList.notify_id})">
	                    		
	                    		<span class="label label-defaultColor" style="display:none"></span> ${notyIndexList.notify_title }
	                    		<p class="pd12">
	                    		
	                    		<span class="label label-info">${notyIndexList.notify_type }</span> 
	                    		<span class="right">${fn:substring(notyIndexList.notify_date,0,16)}</span></p>
	                    	</div>
	                    
	                     </c:forEach>
	                     </div>
	          		</div>
					</div>
	        </div>
	    </div>
	</div>
         
	            </div><div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 713px; background: rgb(0, 0, 0);"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div></div>
	        </div>
	        <!-- main end -->
	    </div>
	    <!-- bugModel start -->
	    <div class="bugModelDiv" id="bugModelDiv">
	    <!--                        提交bug                        -->
			<div class="modal fade myProjectBugModal" id="myProjectBugModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog" role="document" style="z-index: 1040">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
							<h4><i class="fa fa-plus-circle"></i> 新建BUG</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="bugModelForm" name="bugModelForm"action="<%=path%>/toAddBug?bid=${id}&pid=${pid}"   enctype="multipart/form-data"  method="post" >
								<input type="text" id="token" name="token" value="${token}">
								<div class="tabBug">
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active" style="width: 50%;">
											<a href="work.html#tabBugInfo" aria-controls="tabBugInfo" role="tab" data-toggle="tab">信息与描述</a>
										</li>
										<li role="presentation" style="width: 50%;">
											<a href="work.html#tabBugPlan" aria-controls="tabBugPlan" role="tab" data-toggle="tab">人员与计划</a>
										</li>
									</ul>
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="tabBugInfo">
											<div class="form-group">
												<div class="col-sm-7 pd0">
													<label class="col-sm-3 control-label pdProduct">模块</label>
													<div class="col-sm-9 pdSelect">
														<select style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" class="col-sm-12" tabindex="4" id="bugProduct"  name="module">
															
														</select>
													</div>
												</div>
												<div class="col-sm-5 pd0">
													<label class="col-sm-5 control-label">BUG类型</label>

													<div class="col-sm-7">
														<select style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" class="col-sm-12" tabindex="4" class="bugType" id="bugType"  name="type">
															<option value="缺陷">缺陷</option>
															<option value="任务">任务</option>
															<option value="需求">需求</option>
														</select>
													</div>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">标题</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" placeholder="最多输入200个字符"  onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)" onpropertychange="checkStrNum(this,200)" name="bug_title">
												</div>
											</div>
				
											<div class="form-group" id="bugEnvironmentDiv">
												<label class="col-sm-2 control-label">环境</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" placeholder="最多输入100个字符" name="environment" onfocus="checkStrNum(this,100)" oninput="checkStrNum(this,100)" onpropertychange="checkStrNum(this,100)" name="environment">
												</div>
											</div>
							<div class="form-group">
												<label class="col-sm-2 control-label">描述<br></label>
												<div class="col-sm-10 relative">
													<textarea class="form-control textarea" rows="5" name="bug_describe" placeholder="最多输入2000个字符" onfocus="checkStrNum(this,2000)" oninput="checkStrNum(this,2000)" onpropertychange="checkStrNum(this,2000)"></textarea>
													<div class="dragDescriptionDiv"></div>
																 
												</div>
											</div>
											<div class="showAndHideImageFujianDiv" style="">
									<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload()"style="float:left;margin-top:5px" />                                       
                                             <input type="text" id="result"  name="result"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload" value="确定" onclick="FileUpload()" style="float:left;margin-top:5px" />                                       
                                             <input type="text" id="results"  name="results"  value=""readonly="readonly"style="float:left;border:none;margin-top:5px;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss"  name="resultss"  value=""readonly="readonly"style="float:left;border:none;margin-top:5px;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										</div>
										<div role="tabpanel" class="tab-pane" id="tabBugPlan">
											<div class="form-group">
												<div class="col-sm-6 pd0">
													<label class="col-sm-4 control-label">指派给</label>
													<div class="col-sm-8">
														<select class="col-sm-12" tabindex="4" id="bugFixToSelect" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;"  name="handler">
															<option value="0" selected="">[未指定]</option>
															<option value="46604">呜呜</option>
														</select>
													</div>
												</div>
												<div class="col-sm-6 pd0">
													<label class="col-sm-3 control-label pd20">优先级</label>
													<div class="col-sm-9">
														<input type="radio" name="priority" value="急" style="cursor:pointer; width: 24px;height: 18px;" /> 急
														<input type="radio" name="priority" value="高" style="cursor:pointer; width: 24px;height: 18px;" /> 高
														<input type="radio" checked="" name="priority" value="中" style="cursor:pointer; width: 24px;height: 18px;" /> 中
														<input type="radio" name="priority" value="低" style="cursor:pointer; width: 24px;height: 18px;" /> 低
													</div>
												</div>
											</div>
											<div class="form-group" id="bugPlanDateDiv">
												<label class="col-sm-2 control-label">计划日期</label>
												<div class="col-sm-10 planDate">
													<div class="input-daterange input-group col-sm-9">
														<input style="border-radius: 4px; cursor:pointer; border: 1px solid #CCCCCC;" name="plan"  class="col-sm-5" type="date" value="" />
														<span class="col-sm-1">到</span>
														<input style="border-radius: 4px; cursor:pointer; border: 1px solid #CCCCCC;" name=" last" class="col-sm-5" type="date" value="" />
													</div>
												</div>
									
												<div role=" tabpanel" class="tab-pane" id="tabBugTags">
													<div class="bugTagsList"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer noborder">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-info noborder">提交</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
	</div>
<!-- 导出BUG -->
			<div class="modal fade myBugcloseModel in" id="exportBugModal" tabindex="-14" role="dialog" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog" role="document" style="z-index: 1040">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
							<h4><i class="fa fa-share-square-o"></i> 导出</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="ExportBugModelForm"  action>
								<div class="form-group" id="bugPlanDateDiv">
									<label class="col-sm-3 control-label">创建日期</label>
									<div class="col-sm-9 planDate">
										<div class="input-daterange input-group col-sm-9">
											<input style="border-radius: 4px; cursor:pointer; border: 1px solid #CCCCCC;" class="col-sm-5" type="date"  id="plan" value="" />
											<span class="col-sm-1">到</span>
											<input style="border-radius: 4px; cursor:pointer; border: 1px solid #CCCCCC;" class="col-sm-5" type="date"  id="last" value="" />
										</div>
									</div>
									<div role=" tabpanel" class="tab-pane" id="tabBugTags">
										<div class="bugTagsList"></div>
									</div>
								</div>
								<div class="modal-footer noborder">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-info noborder"   onclick="toExcel();">提交</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


<!-- 发布通知	 -->
			<div class="modal fade myProjectBugModal" id="myProjectNoticeModal" tabindex="-12" role="dialog" data-backdrop="static" data-keyboard="false" style="display: none;">
				<div class="modal-dialog" role="document" style="z-index: 1040">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
							<h4><i class="fa fa-bullhorn"></i> 发布通知</h4>
						</div>
								<form class="form-horizontal" id="noticeModelForm" name="noticeModelForm" action="<%=path%>/addNotify" enctype="multipart/form-data"  method="post">
						<div class="modal-body">
					
								<input name="pid" type="hidden" value="${pid}">
								<input name="bid" type="hidden" value="${id}">
								<input name="currpage" type="hidden" value="1">
								
								<div class="form-group">
									<label class="col-sm-2 control-label">类型</label>
									<div class="col-sm-10">
										<select style="cursor:pointer; border-radius: 4px;height: 34px;border:1px solid #CCCCCC;color: #9A9A9A" class="col-sm-12" tabindex="4" id="noticeType"name="noticeType">
											<option value="信息公布">信息公布</option>
											<option value="会议记要">会议记要</option>
											<option value="版本发布">版本发布</option>
											<option value="会议通知">会议通知</option>
											<option value="工作计划">工作计划</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">标题</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" placeholder="最多输入200个字符" name="title" onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)" onpropertychange="checkStrNum(this,200)">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">内容</label>
									<div class="col-sm-10 relative">
										<textarea name="content" class="form-control textarea" rows="6" name="description" placeholder="最多输入2000个字符" onfocus="checkStrNum(this,2000)" oninput="checkStrNum(this,2000)" onpropertychange="checkStrNum(this,2000)"></textarea>
										<div class="dragNoticeDescriptionDiv"></div>
									</div>
								</div>
								<div class="showAndHideImageFujianDiv" style="">
						<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile1" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload1" value="确定" onclick="ajaxFileUpload1()"style="float:left;margin-top:5px;"/>                                       
                                             <input type="text" id="result1"  name="result1"readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile1"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload1" value="确定" onclick="FileUpload1()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results1"  name="results1"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss1"  name="resultss1"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										</div>
								<div class="modal-footer noborder">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-info noborder">提交</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


	    	
	    <!-- bugModel end  -->
		<div class="floatBugInfo"></div>
		<!--  -->
    <script type="text/javascript" src="<%=path %>/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
	</body>

</html>
package bug.incepetor;

import java.lang.reflect.Method;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import bug.anno.Token;

public class TokenInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (handler instanceof HandlerMethod) {
			//利用反射机制，获取方法名
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();
			//获取注解
			Token annotation = method.getAnnotation(Token.class);
			if (annotation != null) {
				boolean needSaveSession = annotation.saveToken();
				if (needSaveSession) {
					String token = UUID.randomUUID().toString();
					System.out.println("服务器中Session中的Token：" + token);
					request.getSession(false).setAttribute("token", token);
				}
				//首次点击，页面存入session值，提交之后清空session。根据session是否为空，来判断避免重复提交（如果为空返回false,被拦截跳转提示页面）
				boolean needRemoveSession = annotation.removeToken();
				if (needRemoveSession) {
					if (isRepeatSubmit(request)) {
						
						response.sendRedirect(request.getContextPath()+"/common/repeat");
				return false;
					}
					request.getSession(false).removeAttribute("token");
				}
			}
		}
			return true;
	}

	private boolean isRepeatSubmit(HttpServletRequest request) {
		String serverToken = (String) request.getSession(false).getAttribute("token");
		if (serverToken == null) {
			return true;
		}
		String clinetToken = request.getParameter("token");
		if(clinetToken == null){
			return true;
		}
		if(!serverToken.equals(clinetToken)){
			return true;
		}
		return false;
	}

}

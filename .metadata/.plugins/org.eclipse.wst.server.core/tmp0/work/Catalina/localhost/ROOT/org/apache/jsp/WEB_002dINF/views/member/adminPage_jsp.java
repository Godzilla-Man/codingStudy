/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.104
 * Generated at: 2025-05-08 05:14:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1745976760724L));
    _jspx_dependants.put("jar:file:/C:/serverworkspace/server_06_notice/src/main/webapp/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>관리자 페이지</title>\r\n");
      out.write("<style>\r\n");
      out.write("	input[type=checkbox].chk + label {\r\n");
      out.write("		height : 24px;\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<div class=\"wrap\">\r\n");
      out.write("		");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/views/common/header.jsp", out, false);
      out.write("\r\n");
      out.write("		<main class=\"content\">\r\n");
      out.write("			<section class=\"section admin-wrap\">\r\n");
      out.write("				<div class=\"page-title\">회원 관리 페이지</div>\r\n");
      out.write("				<table class=\"tbl tbl-hover\">\r\n");
      out.write("					<tr>\r\n");
      out.write("						<th style=\"width:5%;\">선택</th>\r\n");
      out.write("						<th style=\"width:5%;\">번호</th>\r\n");
      out.write("						<th style=\"width:10%;\">아이디</th>\r\n");
      out.write("						<th style=\"width:10%;\">이름</th>\r\n");
      out.write("						<th style=\"width:15%;\">이메일</th>\r\n");
      out.write("						<th style=\"width:15%;\">전화번호</th>\r\n");
      out.write("						<th style=\"width:10%;\">주소</th>\r\n");
      out.write("						<th style=\"width:10%;\">가입일</th>\r\n");
      out.write("						<th style=\"width:10%;\">등급</th>\r\n");
      out.write("						<th style=\"width:10%;\">변경</th>\r\n");
      out.write("					</tr>\r\n");
      out.write("					");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("					\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td colspan=\"10\">\r\n");
      out.write("							<button class=\"btn-point lg\" onclick=\"chgAllLevel()\">선택 회원 등급 변경</button>\r\n");
      out.write("						</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					\r\n");
      out.write("				</table>\r\n");
      out.write("			</section>\r\n");
      out.write("		</main>\r\n");
      out.write("		");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/views/common/footer.jsp", out, false);
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("	<script>\r\n");
      out.write("	function chkLabel(labelObj){\r\n");
      out.write("		$(labelObj).prev().click(); //label 태그 이전 요소(체크박스)클릭\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	//각 행마다 생성된 '등급변경' 버튼 클릭 시, 동작 함수\r\n");
      out.write("	function chgLevel(btnObj){\r\n");
      out.write("		/*\r\n");
      out.write("		DAO에서 수행할 SQL : update tbl_member set member_level = ? where member_no = ?\r\n");
      out.write("		클라이언트가 서버로 전송해야 하는 값은 회원번호, 변경할 등급\r\n");
      out.write("		\r\n");
      out.write("		btnObj는 클릭한 버튼 요소 자바스크립트 객체		\r\n");
      out.write("		*/\r\n");
      out.write("		\r\n");
      out.write("		//let memberNo = $(btnObj).parent().parent().children().first().next().html();\r\n");
      out.write("		let memberNo = $(btnObj).parents('tr').find('.memberNo').html();\r\n");
      out.write("		let chgLevel = $(btnObj).parents('tr').find('select option:selected').val();\r\n");
      out.write("		\r\n");
      out.write("		swal({\r\n");
      out.write("			title : \"변경\",\r\n");
      out.write("			text : \"등급을 변경하시겠습니까?\",\r\n");
      out.write("			icon : \"warning\",\r\n");
      out.write("			buttons : {\r\n");
      out.write("				cancel : {\r\n");
      out.write("					text : \"취소\",\r\n");
      out.write("					value : false,\r\n");
      out.write("					visible : true,\r\n");
      out.write("					closeModal : true\r\n");
      out.write("				},\r\n");
      out.write("				confirm : {\r\n");
      out.write("					text : \"변경\",\r\n");
      out.write("					value : true,\r\n");
      out.write("					visible : true,\r\n");
      out.write("					closeModal : true\r\n");
      out.write("				}\r\n");
      out.write("			}\r\n");
      out.write("		}).then(function(val){\r\n");
      out.write("			if(val){ //변경 버튼 클릭 시\r\n");
      out.write("				\r\n");
      out.write("				$.ajax({\r\n");
      out.write("					url : \"/member/chgLevel\",\r\n");
      out.write("					data : {\"memberNo\" : memberNo, \"chgLevel\" : chgLevel},\r\n");
      out.write("					type : \"get\",\r\n");
      out.write("					success : function(res){\r\n");
      out.write("						console.log(res);\r\n");
      out.write("						//res : 서블릿에서 응답스트림을 통해, 전달한 값(업데이트 결과 값)\r\n");
      out.write("						if(res > 0){\r\n");
      out.write("							swal({\r\n");
      out.write("								title : \"성공\",\r\n");
      out.write("								text : \"등급 변경이 완료되었습니다.\",\r\n");
      out.write("								icon : \"success\"\r\n");
      out.write("							});\r\n");
      out.write("						}else{\r\n");
      out.write("							swal({\r\n");
      out.write("								title : \"실패\",\r\n");
      out.write("								text : \"등급 변경 중, 오류가 발생하였습니다.\",\r\n");
      out.write("								icon : \"error\"\r\n");
      out.write("							});\r\n");
      out.write("						}\r\n");
      out.write("					},\r\n");
      out.write("					error : function(){\r\n");
      out.write("						console.log('ajax 통신 오류');\r\n");
      out.write("					}\r\n");
      out.write("				})	\r\n");
      out.write("			}\r\n");
      out.write("		});			\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	//선택 회원 등급 변경 버튼 클릭 시, 동작 함수\r\n");
      out.write("	function chgAllLevel(){\r\n");
      out.write("		/* 서블릿으로 등급 변경 요청 시, 전달 데이터 형식\r\n");
      out.write("		   \r\n");
      out.write("		   회원 번호 : '2505070021/2505080022'\r\n");
      out.write("		   등급 변경 : '2/3'		   \r\n");
      out.write("		*/\r\n");
      out.write("		\r\n");
      out.write("		//체크된 행의 회원번호와, 변경 등급값을 각각의 배열에 삽입\r\n");
      out.write("		let chkMember = $('.chk:checked'); //체크된 체크박스\r\n");
      out.write("		\r\n");
      out.write("		if(chkMember.length < 1){\r\n");
      out.write("			swal({\r\n");
      out.write("				title : \"경고\",\r\n");
      out.write("				text : \"등급을 변경할 회원을 선택하세요.\",\r\n");
      out.write("				icon : \"warning\"\r\n");
      out.write("			});\r\n");
      out.write("			return;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		//체크된 체크박스 순회하며, 배열에 회원번호와 변경 등급값 삽입\r\n");
      out.write("		let memberNo = [];\r\n");
      out.write("		let chgLevel = [];\r\n");
      out.write("		\r\n");
      out.write("		$.each(chkMember, function(index, item){ \r\n");
      out.write("			//체크박스 순회하며, 함수를 실행시킴. 첫번 째 매개변수로 인덱스, 두번 째 매개변수로 요소(체크박스) 전달\r\n");
      out.write("			\r\n");
      out.write("			//체크박스 기준으로, 같은 행의 회원번호와 변경 등급값을 배열에 삽입\r\n");
      out.write("			memberNo.push($(item).parents('tr').find('.memberNo').html());\r\n");
      out.write("			chgLevel.push($(item).parents('tr').find('select option:selected').val());\r\n");
      out.write("		});\r\n");
      out.write("		\r\n");
      out.write("		console.log(memberNo);\r\n");
      out.write("		console.log(chgLevel);\r\n");
      out.write("		\r\n");
      out.write("		swal({\r\n");
      out.write("			title : \"등급변경\",\r\n");
      out.write("			text : \"등급을 변경하시겠습니까?\",\r\n");
      out.write("			icon : \"warning\",\r\n");
      out.write("			buttons : {\r\n");
      out.write("				cancel : {\r\n");
      out.write("					text : \"취소\",\r\n");
      out.write("					value : false,\r\n");
      out.write("					visible : true,\r\n");
      out.write("					closeModal : true\r\n");
      out.write("				},\r\n");
      out.write("				confirm : {\r\n");
      out.write("					text : \"변경\",\r\n");
      out.write("					value : true,\r\n");
      out.write("					visible : true,\r\n");
      out.write("					closeModal : true\r\n");
      out.write("				}\r\n");
      out.write("			}\r\n");
      out.write("		}).then(function(val){\r\n");
      out.write("			if(val){\r\n");
      out.write("				$.ajax({\r\n");
      out.write("					url : \"/member/chgAllLevel\",\r\n");
      out.write("					data : {\"memberNo\" : memberNo.join('/'), \"chgLevel\" : chgLevel.join('/')},\r\n");
      out.write("					type : 'get',\r\n");
      out.write("					success : function(res){\r\n");
      out.write("						console.log('서버 응답 (res):', res);\r\n");
      out.write("					    console.log('서버 응답 타입 (typeof res):', typeof res);\r\n");
      out.write("					    \r\n");
      out.write("						if(res){\r\n");
      out.write("							swal({\r\n");
      out.write("								title : \"성공\",\r\n");
      out.write("								text : \"등급 변경이 완료되었습니다.\",\r\n");
      out.write("								icon : \"success\"\r\n");
      out.write("							});\r\n");
      out.write("						}else{\r\n");
      out.write("							swal({\r\n");
      out.write("								title : \"실패\",\r\n");
      out.write("								text : \"등급 변경 중, 오류가 발생하였습니다.\",\r\n");
      out.write("								icon : \"error\"\r\n");
      out.write("							});\r\n");
      out.write("						}					\r\n");
      out.write("					},\r\n");
      out.write("					error : function(){\r\n");
      out.write("						console.log('ajax 통신 오류');\r\n");
      out.write("					}\r\n");
      out.write("				})\r\n");
      out.write("			}\r\n");
      out.write("		});\r\n");
      out.write("	}\r\n");
      out.write("	</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f0.setParent(null);
    // /WEB-INF/views/member/adminPage.jsp(34,5) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVar("m");
    // /WEB-INF/views/member/adminPage.jsp(34,5) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/views/member/adminPage.jsp(34,5) '${memberList}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${memberList}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
      if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("					<tr>\r\n");
          out.write("						<td>\r\n");
          out.write("							<div class=\"input-wrap\">\r\n");
          out.write("								<input type=\"checkbox\" class=\"chk\">\r\n");
          out.write("								<label onclick=\"chkLabel(this)\"></label>								\r\n");
          out.write("							</div>\r\n");
          out.write("						</td>\r\n");
          out.write("						<td class=\"memberNo\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.memberNo}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("						<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.memberId}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("						<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.memberName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("						<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.memberEmail}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("						<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.memberPhone}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("						<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.memberAddr}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("						<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.enrollDate}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("						<td>\r\n");
          out.write("							<div class=\"select\">\r\n");
          out.write("								<select>\r\n");
          out.write("									");
          if (_jspx_meth_c_005fif_005f0(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
            return true;
          out.write("\r\n");
          out.write("									");
          if (_jspx_meth_c_005fif_005f1(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
            return true;
          out.write("\r\n");
          out.write("								</select>\r\n");
          out.write("							</div>\r\n");
          out.write("						</td>\r\n");
          out.write("						<td>\r\n");
          out.write("							<button class=\"btn-primary sm\" onclick=\"chgLevel(this)\">등급변경</button>\r\n");
          out.write("						</td>\r\n");
          out.write("					</tr>\r\n");
          out.write("					");
          int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fforEach_005f0.doFinally();
    }
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
    // /WEB-INF/views/member/adminPage.jsp(52,9) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.memberLevel eq 2}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("									<option value=\"2\" selected>정회원</option>\r\n");
        out.write("									<option value=\"3\">준회원</option>\r\n");
        out.write("									");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
    // /WEB-INF/views/member/adminPage.jsp(56,9) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${m.memberLevel eq 3}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
    if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("									<option value=\"2\">정회원</option>\r\n");
        out.write("									<option value=\"3\" selected>준회원</option>\r\n");
        out.write("									");
        int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
    return false;
  }
}

/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.7
 * Generated at: 2018-05-06 13:55:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.index;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class memberlist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/D:/sts_bitcamp/STS-Study/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Ex01_Study/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1523676572924L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

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
  }

  public void _jspDestroy() {
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
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
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
      out.write("  \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("    href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\r\n");
      out.write("<!-- jQuery library -->\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("<!-- Latest compiled JavaScript -->\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\r\n");
      out.write("<!--data table -->\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css\">\r\n");
      out.write("<script type=\"text/javascript\" charset=\"utf8\" src=\"https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" charset=\"utf8\" src=\"https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write(" <!-- contextmenu -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/contextmenu/dist/jquery.contextMenu.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/contextmenu/dist/jquery.contextMenu.css\">\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".selected{background: #eeeeee}\r\n");
      out.write("\r\n");
      out.write("table{\r\n");
      out.write("    text-align: center;\r\n");
      out.write("}\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var id = sessionStorage.getItem(\"id\")\r\n");
      out.write("\tfunction logout() {\r\n");
      out.write("\t\tsessionStorage.clear();\r\n");
      out.write("\t\tlocation.href = \"login\";\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\t$(\"#session_id\").text(id);\r\n");
      out.write("\t    $('#datatable').DataTable({\r\n");
      out.write("\t     \t\r\n");
      out.write("\t    \t\r\n");
      out.write("\t   select:true, \t\r\n");
      out.write("\t   serverSide: true,\r\n");
      out.write("\t   processing: true,\r\n");
      out.write("\t   ajax: {\r\n");
      out.write("\t\t   url: 'getmemberlist',\r\n");
      out.write("\t\t   dataSrc: '',\r\n");
      out.write("\t\t   dataFilter: function(data){\r\n");
      out.write("\t\t\t   console.log(data);\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t   return JSON.stringify(data);\r\n");
      out.write("\t\t\t   \r\n");
      out.write("\t\t   }\r\n");
      out.write("\t\t   /* \"dataSrc\": \"\", */\r\n");
      out.write("/* \t\t   dataFilter: function(data){\r\n");
      out.write("\t            var json = jQuery.parseJSON( data );\r\n");
      out.write("\t            json.recordsTotal = json.total;\r\n");
      out.write("\t            json.recordsFiltered = json.total;\r\n");
      out.write("\t            json.data = json.list;\r\n");
      out.write("\t \t\t\tconsole.log(json);\r\n");
      out.write("\t            return JSON.stringify( json ); // return JSON string\r\n");
      out.write("\t        } */\r\n");
      out.write("\t\t    } ,\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t   columns: [ {data: \"MNO\"},\r\n");
      out.write("                {data: \"ID\"},\r\n");
      out.write("                {data: \"NAME\"},\r\n");
      out.write("                {data: \"GENDER\"},\r\n");
      out.write("                {data: \"TEL\"},\r\n");
      out.write("                {data: \"EMAIL\"},\r\n");
      out.write("                {data: \"ZIPCODE\"},\r\n");
      out.write("                {data: \"DOROADDR\"}] /*,\r\n");
      out.write("                 columnDefs: [\r\n");
      out.write("                \t                \t\r\n");
      out.write("                    { targets: [2,3,4,5,6], visible: true},\r\n");
      out.write("                  \r\n");
      out.write("                ]  */\r\n");
      out.write("\t\t   \r\n");
      out.write("\t   \r\n");
      out.write("\t    });\r\n");
      out.write("\t    \r\n");
      out.write("  \r\n");
      out.write("\t    $('#datatable tbody').on( 'click', 'tr', function () {\r\n");
      out.write("\t        if ( $(this).hasClass('selected') ) {\r\n");
      out.write("\t            $(this).removeClass('selected');\r\n");
      out.write("\t        }\r\n");
      out.write("\t        else {\r\n");
      out.write("\t            $('tr.selected').removeClass('selected');\r\n");
      out.write("\t            $(this).addClass('selected');\r\n");
      out.write("\t        }\r\n");
      out.write("\t    } ); \r\n");
      out.write("\t\t/*    callback: function(key, options) {\r\n");
      out.write("                var m = \"clicked: \" + key;\r\n");
      out.write("                window.console && console.log(m) || alert(m); \r\n");
      out.write("            } */\r\n");
      out.write("\t    $.contextMenu({\r\n");
      out.write("            selector: '.selected', \r\n");
      out.write("            callback: function(key, options){\r\n");
      out.write("            \tvar m = \"clicked: \" + key + options.$trigger.attr(\"id\");\r\n");
      out.write("               alert(m);\r\n");
      out.write("\r\n");
      out.write("            },\r\n");
      out.write("            items: {\r\n");
      out.write("                \"detail\": {name: \"상세보기\", icon: \"edit\" \r\n");
      out.write("                },\r\n");
      out.write("                \"cut\": {name: \"자르기\", icon: \"cut\"},\r\n");
      out.write("               copy: {name: \"복사\", icon: \"copy\"},\r\n");
      out.write("                \"paste\": {name: \"붙여넣기\", icon: \"paste\"},\r\n");
      out.write("                \"delete\": {name: \"삭제\", icon: \"delete\"},\r\n");
      out.write("                \"sep1\": \"---------\",\r\n");
      out.write("                \"quit\": {name: \"Quit\", icon: function(){\r\n");
      out.write("                    return 'context-menu-icon context-menu-icon-quit';\r\n");
      out.write("                }}\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        $('.selected').on('click', function(e){\r\n");
      out.write("            console.log('clicked', this);\r\n");
      out.write("        })    \r\n");
      out.write("\t    \r\n");
      out.write("\t})\r\n");
      out.write("\t\r\n");
      out.write("</script> \r\n");
      out.write("    <!-- container -->\r\n");
      out.write("    <div>\r\n");
      out.write("    \t<span id=\"session_id\"></span> 님 방가 <input type=\"button\" onclick=\"logout()\" value=\"로그아웃\">\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"container\"  style=\"min-height: 820px;\">\r\n");
      out.write("        <div class=\"wall\">\r\n");
      out.write("            <h2><b>회원관리</b></h2>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"col-sm-12\">\r\n");
      out.write("            <div class=\"col-sm-3 left\">\r\n");
      out.write("                <div class=\"input-group\">\r\n");
      out.write("                    <input type=\"text\" class=\"form-control\" placeholder=\"ID 검색\"\r\n");
      out.write("                        id=\"id\">\r\n");
      out.write("                    <div class=\"input-group-btn\">\r\n");
      out.write("                        <button class=\"btn btn-default\" type=\"submit\">\r\n");
      out.write("                            <i class=\"glyphicon glyphicon-search\" id=\"search\"></i>\r\n");
      out.write("                        </button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"col-sm-2 right\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write(" <!-- class=\"table table-hover table-bordered\" -->\r\n");
      out.write("       <!--  <div id=\"tablediv\"> -->\r\n");
      out.write("            <table id=\"datatable\" class=\"table\">\r\n");
      out.write("            \t<thead>\r\n");
      out.write("\t                <tr class=\"info\">\r\n");
      out.write("\t                \t<th>순번</th>\r\n");
      out.write("\t                    <th>아이디</th>\r\n");
      out.write("\t                    <th>이름</th>\r\n");
      out.write("\t                    <th>성별</th>\r\n");
      out.write("\t                    <th>전화번호</th>\r\n");
      out.write("\t                    <th>이메일</th>\r\n");
      out.write("\t                    <th>우편번호</th>\r\n");
      out.write("\t                    <th>주소</th>\r\n");
      out.write("\t                    \r\n");
      out.write("\t                </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                <!-- 데이터가 한건도 없는 경우  -->\r\n");
      out.write("         ");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("            </table>\r\n");
      out.write("        </div>\r\n");
      out.write("        <span class=\"context-menu-one btn btn-neutral\">right click me</span>\r\n");
      out.write("   <!--  </div> -->\r\n");
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
}
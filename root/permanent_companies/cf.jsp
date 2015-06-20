<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.lang.*" %>
<%@page language="java" import="pack.DbBean"%> 
<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>


<%
db.fetchConfigDetails();
db.connect();
ResultSet rs=db.execSQL("select x_percentage,student_id from student_record;");
while(rs.next())
{
    String s="0";
    if(rs.getString(1)==null)
        s="0";
    else
        s=rs.getString(1).replace("%","").replace(" ","").replace("`","");
    char[] sa=s.toCharArray();
    s="";
    int poi=0;
    for(int i=0;i<sa.length;i++)
    {
        if((sa[i]>='0' && sa[i]<='9'))
            s=s+sa[i];
        else if(sa[i]=='.')
        {
            poi++;
            if(poi==1)
                s=s+sa[i];
        }
    }
    if(s.equals(""))
        s="0";
    out.println(s+"=="+Float.parseFloat(s)+"<br/>");
    int h=db.updateSQL("update student_record set x_percentage='"+Float.parseFloat(s)+"' where student_id='"+rs.getInt("student_id")+"';");

}
rs.close();
ResultSet rs1=db.execSQL("select xii_percentage,student_id from student_record;");
while(rs1.next())
{
    String s="0";
    if(rs1.getString(1)==null)
        s="0";
    else
        s=rs1.getString(1).replace("%","").replace(" ","").replace("`","");
    char[] sa=s.toCharArray();
    s="";
    int poi=0;
    for(int i=0;i<sa.length;i++)
    {
        if((sa[i]>='0' && sa[i]<='9'))
            s=s+sa[i];
        else if(sa[i]=='.')
        {
            poi++;
            if(poi==1)
                s=s+sa[i];
        }
    }
    if(s.equals(""))
        s="0";
    out.println(s+"=="+Float.parseFloat(s)+"<br/>");
    int h=db.updateSQL("update student_record set xii_percentage='"+Float.parseFloat(s)+"' where student_id='"+rs1.getInt("student_id")+"';");

}
rs1.close();
db.close();
%>


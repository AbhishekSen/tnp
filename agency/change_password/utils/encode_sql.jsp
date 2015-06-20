<%!
 String encode_sql(String str)
 {

  StringBuffer sql_input = new StringBuffer(1024);
  for (int i=0 ; i< str.length() ; i++)
  {
   if(str.charAt(i) == '\'')
      sql_input.append("\\\'");
   else if(str.charAt(i) == '\"')
      sql_input.append("\\\"");
   else 	
      sql_input.append(str.charAt(i));
  }
  return ( sql_input.toString() ); 

 }
%>
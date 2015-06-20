<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%
	
if (request.getSession(false) != null ){
	String sid = null; 
	sid = request.getSession(false).getId() ;
	//System.out.println("logout "+sid);
		  
           try{
                db.fetchConfigDetails(); //newly added
              	db.connect();
		
				String sql = "delete from session where session_id = \'"+sid+"\' " ;
				System.out.println(sql);
				//PreparedStatement ps = conn.prepareStatement(sql);
				//ps.execute();
				int num_rows=db.updateSQL(sql);
				if(num_rows==1)
					session.invalidate() ;
			}
			catch (Exception e){
              // out.println ("SQL Exception: "+e.getMessage());
           	}
           	finally{
               if (db!= null){
                   try{
                      db.close ();
                      }
                   catch (Exception e) {  }
               }
           }
}
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>


<link rel='stylesheet' href='stylesheet/style.css'>
<link rel="stylesheet" href="stylesheet/styles.css" type="text/css" media="screen" /> 
<script src='javascript/jquery.min.js'></script>
<script type="text/javascript" src="javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="javascript/jquery.sliding-menu.js"></script>
<script type="text/javascript">
  $(function(){ 
	  $('#adminLogin').click(function()
	  {
		$('#studentLogin').show();
		$('#studentLoginContent').hide();
		$('#adminLoginContent').show();
		$('#adminLogin').slideUp("fast");
	  });
	   $('#studentLogin').click(function()
	  {
		$('#adminLogin').show();
		$('#adminLoginContent').hide();
		$('#studentLoginContent').show();
		$('#studentLogin').slideUp("fast");
	  });
	  //$('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
	});
	</script>
	<script type="text/javascript">
	jQuery(function(){
		  jQuery('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
		  jQuery('#VerticalSlidingMenu .SlidingMenu').slidingMenu({ initialOpacity:0.5 });
	});
 </script>
<style type="text/css">
<!--
.style12 {font-family: Georgia, "Times New Roman", Times, serif}
.style13 {color: #006666;
	font-weight: bold;
}
-->
</style>
<style type="text/css">
  .rw{
	float:left;
	height:30px;
	width:100%;
	margin-top:20px;
	line-height:30px;
    
      }
    .lb{
	float:left;
	height:28px;
	width:35%;
	line-height:25px;
	text-align:right;


	}
   .inp{

	float:left;
	height:28px;
	width:50%;
	line-height:25px;
	margin-left:5px;

      }
</style>
</head>
<body>

 <div id = "divMain" >
          <div id = "container">
            <div id = "header">
                <div id = "menu">
                    <div id="HorizontalSlidingMenu">
                        <ul class="SlidingMenu Horizontal">
                        <li><a href="http://www.iitg.ernet.in/">IITG Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/placement/">Placement Cell</a></li>
                        <li><a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a></li>
                      </ul>
                        <div class="ClearFix"></div>
                    </div>
                </div>
              <div  id = "headerTop">
                <div id ="title">
                  <span id = "spanTitleFirst">
                    Training & Placement Cell - 
                  </span>
                  <span id = "spanTitleSecond">
                    IIT Guwahati
                  </span>
                </div>
               <%-- <div id = "search">
                  <input type = "text" /><input type = "button" class = "button" value = "search"/>
                </div> --%>
              </div>
              <hr style = "float:left;width:100%;">
              </div>
              <div id = "body">
                     <div id = "indexCenter" class = "indexCenter">
                        <div id = "logo">
                          <img src = "images/logo-top.gif" alt= "IIT GUAWAHATI"/>
                        </div>
                        <div id = "login">
			  <form action="prlogin_action.jsp" method="post">
                          <div class="rw">
			      <div class="lb">
				  User ID:
			      </div>
			      <div class="inp">
				  <input type="text" name="user">
			      </div>  
			  </div>
			  <div class="rw">
			      <div class="lb">
				  Password:
			      </div>
			      <div class="inp">
				  <input type="password" name="pass">
			      </div>
			  </div>
			  <div class="rw">
			      <div class="lb">
				 
			      </div>
			      <div class="inp">
				  <input type="submit" name="submit" value="submit">
			      </div>
			  </div>
			  </form>
                        </div>
                     </div>
                  </div>
                
              </div>
              <div id = "footer">
                <span>© 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>



<%
	



	   int rows1=0;
	   int rows2=0;
           String sql_count="";
           String sql_temp="";
           ResultSet rs5;
           ResultSet rss5;
           ResultSet res5=null;
           ResultSet reas5=null;
           ResultSet sr5=null;
           ResultSet rs_ag_name=null;
           String sql_schedule="";
           int i5=0;
           String sql_agencyid="";
           String sql_selected=""; 
           int num=0;
           int ind=0;

               
                   sql_count="";
		   sql_count+="select count(*) from interested_students where student_id="+student_id+";" ;

		   db.connect();
		   rss5= db.execSQL(sql_count);
		   if(rss5.next()) 
	 	   {
		     rows2= rss5.getInt(1);
		   }		
		   rss5.close();
		   db.close();
		   
	       String[] db_agencyid_sel = new String[rows2];
	       sql_agencyid="";
               sql_agencyid+="select distinct agency_id from interested_students where student_id='"+student_id+"';" ;
               db.connect();
               reas5= db.execSQL(sql_agencyid);
               num=0;              
               while(reas5.next()) 
	       { 
                  db_agencyid_sel[num]=reas5.getString(1);
                  num++;
               }
               reas5.close();
               db.close();
		rows2=num;  	       
                num=0;
                sql_selected="";
                int sel_cnt=0;
                while(num<rows2)
                {
                    db.connect();
                    sql_selected="select count(*) from schedule where agency_id='"+db_agencyid_sel[num]+"';" ;
                    sr5= db.execSQL(sql_selected);

		
		  if(sr5.next()) 
		   {
                        sel_cnt+=sr5.getInt(1);
		   }
		   sr5.close();

		   db.close();
                   num++;               
                 }               

                  sql_count="";
                  sql_count+="select count(*) from schedule ;" ;

		  db.connect();
		  rs5= db.execSQL(sql_count);
		  if(rs5.next()) 
		  {
		    rows1= rs5.getInt(1);
		  }		
		  rs5.close();
		  db.close();
		
	       String[][] db_events = new String[rows1][11];

	       
               String[][] db_events_sel = new String[sel_cnt][11];


               
              	      
             
 
                sql_schedule="";
                sql_schedule+="select * from schedule ;" ;

		db.connect();
		res5= db.execSQL(sql_schedule);
		i5=0;
		while(res5.next()) 
		{
                  int agency_id=res5.getInt("agency_id");
                  rs_ag_name=db.execSQL("select agency_name from agency where agency_id="+agency_id+";");

                  rs_ag_name.next();
                  String agency_name=rs_ag_name.getString("agency_name");

                  db_events[i5][0]=res5.getString("recurring");
                  String dt_from=res5.getString("date_from");
                  String ary[]=dt_from.split("-");
                  db_events[i5][1]=ary[1];
                  db_events[i5][2]=ary[0];
                  db_events[i5][3]=ary[2];
                  db_events[i5][4]=res5.getString("starting_time");
                  db_events[i5][5]=res5.getString("end_time");
                  db_events[i5][6]=agency_name+", Profile: "+res5.getString("company_profile");
                  db_events[i5][7]=res5.getString("description");
                  db_events[i5][8]=res5.getString("venue");
                  db_events[i5][9]=res5.getString("eligibility_criteria");
                  db_events[i5][10]=res5.getString("departments");                  
		  i5++;
		  rs_ag_name.close();
		}
		res5.close();

		db.close();
	      

              
               num=0;

                i5=0;
                sql_selected="";
                while(num < rows2)
                {
                    db.connect();
                    sql_selected="select * from schedule where agency_id='"+db_agencyid_sel[num]+"';" ;

                    sr5= db.execSQL(sql_selected);

		
		   while(sr5.next()) 
		   {
		        String agency_name=null;
			rs_ag_name=db.execSQL("select agency_name from agency where agency_id='"+db_agencyid_sel[num]+"';");

	                if(rs_ag_name.next())
        	                agency_name=rs_ag_name.getString("agency_name");

	                db_events_sel[i5][0]=sr5.getString("recurring");
        	        String dt_from=sr5.getString("date_from");
                	String ary[]=dt_from.split("-");

	                db_events_sel[i5][1]=ary[1];
        	        db_events_sel[i5][2]=ary[0];
                	db_events_sel[i5][3]=ary[2];
		        db_events_sel[i5][4]=sr5.getString("starting_time");
                	db_events_sel[i5][5]=sr5.getString("end_time");
	                db_events_sel[i5][6]=agency_name+", Profile: "+sr5.getString("company_profile");
        	        db_events_sel[i5][7]=sr5.getString("description");
                	db_events_sel[i5][8]=sr5.getString("venue");
	                db_events_sel[i5][9]=sr5.getString("eligibility_criteria");
        	        db_events_sel[i5][10]=sr5.getString("departments");
			i5++;       
                        rs_ag_name.close();        
		   }
		   sr5.close();

		   db.close();
                   num++;               
                 }     


%>



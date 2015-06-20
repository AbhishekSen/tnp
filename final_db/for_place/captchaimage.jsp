<%@ page import="java.util.*, java.io.*,java.awt.*,java.awt.image.*,javax.imageio.*,java.awt.geom.*"%>
<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
</head>
<body>
<%
 response.setContentType("image/jpg");
  // Define number characters contains the captcha image, declare global 
  int iTotalChars= 6;

  // Size image iHeight and iWidth, declare globl 
  int iHeight=40;
  int iWidth=170;

  // font style 
  Font fntStyle1 = new Font("Arial", Font.HANGING_BASELINE, 30);
  Font fntStyle2 = new Font("Verdana", Font.BOLD, 20);

  // Possible random characters in the image 
  Random randChars = new Random();
  String sImageCode = (Long.toString(Math.abs(randChars.nextLong()), 36)).substring(0,iTotalChars);

  // BufferedImage is used to create a create new image
  // TYPE_INT_RGB - does not support transpatency, TYPE_INT_ARGB - support transpatency
  BufferedImage biImage = new BufferedImage(iWidth, iHeight, BufferedImage.TYPE_INT_RGB);
  Graphics2D g2dImage = (Graphics2D) biImage.getGraphics();

  // Draw background rectangle and noisey filled round rectangles
  int iCircle = 25;
  g2dImage.fillRect(0, 0, iWidth, iHeight);
  //Graphics2D graphics2D = biImage.createGraphics();
  //Color c = new Color(0.6662f, 0.4569f, 0.3232f);
  //GradientPaint gp = new GradientPaint(30, 30, c, 15, 25, Color.white, true);
  //graphics2D.setPaint(gp);
  for ( int i = 0; i < iCircle; i++ )
  {
    g2dImage.setColor(new Color(randChars.nextInt(255),randChars.nextInt(255),randChars.nextInt(100)));
    int iRadius = (int) (Math.random() * iHeight / 6.0);
    int iX = (int) (Math.random() * iWidth - iRadius);
    int iY = (int) (Math.random() * iHeight - iRadius);
    g2dImage.fillRoundRect(iX,iY,iRadius * 2, iRadius * 2,100,100);    
  }


    Color c1=new Color(100,100,255);
    g2dImage.setColor(c1);
    g2dImage.drawLine(0,100 ,100, 0);
    Color c2=new Color(100,255,100);
    g2dImage.setColor(c2);
    g2dImage.drawLine(0,0,100,100);
    Color c3=new Color(100,255,100);
    g2dImage.setColor(c3);
    g2dImage.drawOval(50, 30, 120, 50);
    Color c4=new Color(250,100,250);
    g2dImage.setColor(c4);
    g2dImage.drawLine(30,30,70,100);
    g2dImage.setFont(fntStyle1);
  for ( int i = 0; i < iTotalChars; i++ )
  {
    g2dImage.setColor(new Color(randChars.nextInt(150),randChars.nextInt(255),randChars.nextInt(200)));
    if (i%2==0)
      g2dImage.drawString(sImageCode.substring(i,i+1),25*i,24);
    else
      g2dImage.drawString(sImageCode.substring(i,i+1),25*i,35);
  }

  // create jpeg image and display on the screen
  String j="jpeg";
  OutputStream osImage = response.getOutputStream();
  //out.println(ImageIO.write(biImage, j, osImage));
   out.println("<img src=\""+ImageIO.write(biImage, j, osImage)+"\" >");
  osImage.close();

  // Dispose function is used destory an image object 
  g2dImage.dispose();
  //System.out.println("sImageCode"+sImageCode);

  session.setAttribute("security_code", sImageCode);

  //out.println("\n Code is: "+sImageCode);
%>
    </body>
</html>

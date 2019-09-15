package hotel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class selectServlet extends HttpServlet{
	private String Url="jdbc:mysql://127.0.0.1:3306/hotel";
	private String user="root";
	private String password="88939668";
	private String []name=new String[100];
	private int []bianhao=new int[100];
	private int flag=0;
	private int m=0;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String test=request.getParameter("test");
		String hotel[]=request.getParameterValues("hotel");
		double value1=0;
		double value2=0;
		if(hotel==null) {
			value1=Double.valueOf(request.getParameter("value1"));
			value2=Double.valueOf(request.getParameter("value2"));
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			System.out.println("无法与数据库连接");
			e.getStackTrace();
		}
		try {
			Connection con = DriverManager.getConnection(Url,user,password);
			String sql = "select * from hotelroom,roominfo where hotelroom.name = roominfo.hotelname";
			String sql1="select * from hotelroom where value between '"+value1+"'and '"+value2+"'";
			String sql2="select * from hotelroom where value between '"+value1+"'and '"+value2+"' and simpleinfo like '%"+test+"%'";
			if(hotel==null) {
			if(test.equals("不限")) {
				PreparedStatement pstm1 = con.prepareStatement(sql1);
				ResultSet result1 = pstm1.executeQuery();
				List<Dao> userlist2= new ArrayList<Dao>();
				Dao userdao[]=new Dao[10000];
				while(result1.next()) {
					userdao[flag]=new Dao(result1.getString("name"),result1.getString("simpleinfo"),result1.getString("detailedinfo"),
							result1.getString("src"),result1.getDouble("value"),result1.getString("scrollsrc"),result1.getDouble("point"),
							result1.getString("theme"));
					userlist2.add(userdao[flag]);
					flag++;
				}
				request.setAttribute("userlist2", userlist2);
				request.getRequestDispatcher("订酒店2.jsp").forward(request, response);
				flag=0;
			}
			else {
				PreparedStatement pstm1 = con.prepareStatement(sql2);
				ResultSet result1 = pstm1.executeQuery();
				List<Dao> userlist2= new ArrayList<Dao>();
				Dao userdao[]=new Dao[10000];
				while(result1.next()) {
					userdao[flag]=new Dao(result1.getString("name"),result1.getString("simpleinfo"),result1.getString("detailedinfo"),
							result1.getString("src"),result1.getDouble("value"),result1.getString("scrollsrc"),result1.getDouble("point"),
							result1.getString("theme"));
					userlist2.add(userdao[flag]);
					flag++;
				}
				request.setAttribute("userlist2", userlist2);
				request.getRequestDispatcher("订酒店2.jsp").forward(request, response);
				flag=0;
			}
			}
			else if(hotel!=null) {
				PreparedStatement pstm1 = con.prepareStatement(sql);
				ResultSet result3 = pstm1.executeQuery();
				Set<String> s = new HashSet<String>();
				List<Dao> userlist2= new ArrayList<Dao>();
				Dao userdao[]=new Dao[10000];
				while(result3.next()) {
					if(flag>=1) {
						String []split=name[flag-1].split(",");
						if(result3.getString("name").equals(split[0])){
							name[flag-1]=name[flag-1]+","+result3.getString("info");
							continue;
						}	
					}
					userdao[flag]=new Dao(result3.getString("name"),result3.getString("simpleinfo"),result3.getString("detailedinfo"),
							result3.getString("src"),result3.getDouble("value"),result3.getString("scrollsrc"),result3.getDouble("point"),
							result3.getString("theme"),result3.getString("roomstyle"),result3.getString("info"));
					name[flag]=result3.getString("name")+","+result3.getString("roomstyle")+result3.getString("theme")+","+result3.getString("info");
					flag++;
				}
				System.out.println(flag);
				int h=0;
				int d=0;
				int c=0;
				int g=0;
				int f=0;
				for(int i=0;i<hotel.length;i++) {
					for(int j=0;j<flag;j++) {
						if(name[j].contains(hotel[i])) {
							bianhao[h]=j;
							if(userdao[bianhao[h]].getName().equals(hotel[i])) {
								d++;
							}
							else if(userdao[bianhao[h]].getTheme().equals(hotel[i])){
								f++;
							}
							else if(userdao[bianhao[h]].getRoomstyle().equals(hotel[i])) {
								g++;
							}
							else if(userdao[bianhao[h]].getInfo().equals(hotel[i]))
							{	
								c++;
							}
							h++;
						}
						
					}	
				}
				if((d>0&&f==0&&c==0&&g==0)||(d==0&&f>0&&c==0&&g==0)||(d==0&&f==0&&c>0&&g==0)||(d==0&&f==0&&c==0&&g>0)) {
					for(int n=0;n<h;n++) {
						boolean b=s.add(userdao[bianhao[n]].getName());
						if(b)
							userlist2.add(userdao[bianhao[n]]);
					}
				}
				else {
					for(int n=1;n<h;n++) 
						for(int j=0;j<n;j++) {
							if(userdao[bianhao[n]].getName().equals(userdao[bianhao[j]].getName())) {
								System.out.println(userdao[bianhao[n]].getName());
								userlist2.add(userdao[bianhao[n]]);
							}
						}
				}
				request.setAttribute("userlist2", userlist2);
				request.getRequestDispatcher("订酒店2.jsp").forward(request, response);
				flag=0;
				m=0;
			}
		}catch(SQLException e) {
			e.getStackTrace();
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		this.doGet(request, response);
	}
}

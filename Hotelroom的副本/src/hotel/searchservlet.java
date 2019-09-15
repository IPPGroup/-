package hotel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class searchservlet extends HttpServlet{
	private String Url="jdbc:mysql://127.0.0.1:3306/hotel";
	private String user="root";
	private String password="88939668";
	private int flag=0;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String search= request.getParameter("search");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			System.out.println("无法与数据库连接");
			e.getStackTrace();
		}
		try {
			Connection con = DriverManager.getConnection(Url,user,password);
			String sql1 = "select * from roominfo where number < 15";
			String sql2 = " select * from roominfo where hotelname like '%"+search+"%'";
			if(search=="") {
				PreparedStatement pstm1 = con.prepareStatement(sql1);
				ResultSet result1 = pstm1.executeQuery();
				Room []room=new Room[100];
				List<Room> roomlist = new ArrayList<Room>();
				while(result1.next()) {
						room[flag]=new Room(result1.getString("hotelname"),result1.getString("roomstyle"),result1.getDouble("roomvalue"),
								result1.getInt("number"),result1.getString("roomsrc"));	
						roomlist.add(room[flag]);
					flag++;
				}
				request.setAttribute("roomlist", roomlist);
				request.getRequestDispatcher("searchresult.jsp").forward(request, response);
				flag=0;
			}
			else {
				PreparedStatement pstm1 = con.prepareStatement(sql2);
				ResultSet result1 = pstm1.executeQuery();
				Room []room=new Room[100];
				List<Room> roomlist = new ArrayList<Room>();
				while(result1.next()) {
						room[flag]=new Room(result1.getString("hotelname"),result1.getString("roomstyle"),result1.getInt("roomvalue"),
								result1.getInt("number"),result1.getString("roomsrc"));
						roomlist.add(room[flag]);
					flag++;
				}
				request.setAttribute("roomlist", roomlist);
				request.getRequestDispatcher("searchresult.jsp").forward(request, response);
				flag=0;
			}
			
		}catch(SQLException e) {
			e.getStackTrace();
		}	
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		this.doGet(request, response);
	}
}

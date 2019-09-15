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
import javax.servlet.http.HttpSession;





public class hotelinfo extends HttpServlet{
	private String Url="jdbc:mysql://127.0.0.1:3306/hotel";
	private String user="root";
	private String password="88939668";
	private int flag=0;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			System.out.println("无法与数据库连接");
			e.getStackTrace();	
		} 
		try {
			Connection con=DriverManager.getConnection(Url, user, password);
			String sql1="select * from hotelroom";
			PreparedStatement pstm1 = con.prepareStatement(sql1);
			ResultSet result1 = pstm1.executeQuery();
			HttpSession session=request.getSession();
			List<Dao> userlist= new ArrayList<Dao>();
			Dao userdao[]=new Dao[10000];
			while(result1.next()) {
				userdao[flag]=new Dao(result1.getString("name"),result1.getString("simpleinfo"),result1.getString("detailedinfo"),
						result1.getString("src"),result1.getDouble("value"),result1.getString("scrollsrc"),result1.getDouble("point"),
						result1.getString("theme"));
				userlist.add(userdao[flag]);
				flag++;
			}
			
			session.setAttribute("userlist", userlist);
			request.getRequestDispatcher("订酒店.jsp").forward(request, response);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}

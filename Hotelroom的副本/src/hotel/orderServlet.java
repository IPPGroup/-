package hotel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class orderServlet extends HttpServlet{
	private String Url="jdbc:mysql://127.0.0.1:3306/hotel";
	private String user="root";
	private String password="88939668";
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String info=request.getParameter("info");
		String []information=info.split(",");
		HttpSession session = request.getSession();
		session.setAttribute("id1", information[4]);
		int roomNum=Integer.valueOf(request.getParameter("roomnumber"));
		String name=request.getParameter("name");
		String phoneNumber=request.getParameter("phoneNumber");
		int lastNum=Integer.valueOf(information[7])-roomNum;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			System.out.println("无法与数据库连接");
			e.getStackTrace();
		}
		try {
			Connection con = DriverManager.getConnection(Url, user, password);
			String sql1="insert into myorder value(NULL,'"+information[0]+"','"+information[1]+"','"+information[2]+"','"+roomNum+"','"+information[3]+"','已确认','"+information[6]+"','"+name+"','"+phoneNumber+"')";
			Statement stm = con.createStatement();
			stm.executeUpdate(sql1);
			String sql2="update roominfo set number = '"+lastNum+"' where hotelname = '"+information[0]+"' and roomstyle = '"+information[6]+"'";
			Statement stm1 = con.createStatement();
			stm1.executeUpdate(sql2);
			request.getRequestDispatcher("myOrder.jsp").forward(request,response);
		}catch(SQLException e) {
			e.getStackTrace();
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		this.doGet(request, response);
	}
}

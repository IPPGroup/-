package hotel;

public class Room {
	private String hotelname;
	private String roomstyle;
	private double roomvalue;
	private int number;
	private String roomsrc;
	public Room() {}
	public Room(String hotelname,String roomstyle,double roomvalue,int number,String roomsrc) {
		this.hotelname=hotelname;
		this.roomstyle=roomstyle;
		this.roomvalue=roomvalue;
		this.number=number;
		this.roomsrc=roomsrc;
	}
	public String getHotelname() {
		return hotelname;
	}
	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}
	public String getRoomstyle() {
		return roomstyle;
	}
	public void setRoomstyle(String roomstyle) {
		this.roomstyle = roomstyle;
	}
	public double getRoomvalue() {
		return roomvalue;
	}
	public void setRoomvalue(double roomvalue) {
		this.roomvalue = roomvalue;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getRoomsrc() {
		return roomsrc;
	}
	public void setRoomsrc(String roomsrc) {
		this.roomsrc = roomsrc;
	}
}

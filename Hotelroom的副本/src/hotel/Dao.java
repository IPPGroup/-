package hotel;

public class Dao {
	private String name;
	private String simpleinfo;
	private String detailedinfo;
	private String src;
	private double value;
	private double point;
	private String theme;
	private String roomstyle;
	private double roomvalue;
	private int number;
	private String roomsrc;
	private String scrollsrc;
	private String info;
	public Dao(){};
	public Dao(String name,String simpleinfo,String detailedinfo,String src,double value,String scrollsrc,double point,String theme) {
		this.name=name;
		this.simpleinfo =simpleinfo;
		this.detailedinfo=detailedinfo;
		this.src=src;
		this.value=value;
		this.scrollsrc=scrollsrc;
		this.point=point;
		this.theme=theme;
	}
	public Dao(String name,String simpleinfo,String detailedinfo,String src,double value,String scrollsrc,double point,String theme,String roomstyle,String info) {
		this.name=name;
		this.simpleinfo =simpleinfo;
		this.detailedinfo=detailedinfo;
		this.src=src;
		this.value=value;
		this.scrollsrc=scrollsrc;
		this.point=point;
		this.theme=theme;
		this.roomstyle=roomstyle;
		this.info=info;
	}
	public String getScrollsrc() {
		return scrollsrc;
	}
	public void setScrollsrc(String scrollsrc) {
		this.scrollsrc = scrollsrc;
	}
	public Dao(String name,String simpleinfo,String detailedinfo,String src,double value,String roomstyle,double roomvalue,
			int number,String roomsrc,String info) {
		this.name=name;
		this.simpleinfo =simpleinfo;
		this.detailedinfo=detailedinfo;
		this.src=src;
		this.value=value;
		this.roomstyle=roomstyle;
		this.roomvalue=roomvalue;
		this.number=number;
		this.roomsrc=roomsrc;
		this.info=info;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public double getPoint() {
		return point;
	}
	public void setPoint(double point) {
		this.point = point;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSimpleinfo() {
		return simpleinfo;
	}
	public void setSimpleinfo(String simpleinfo) {
		this.simpleinfo = simpleinfo;
	}
	public String getDetailedinfo() {
		return detailedinfo;
	}
	public void setDetailedinfo(String detailedinfo) {
		this.detailedinfo = detailedinfo;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public double getValue(){
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	
}

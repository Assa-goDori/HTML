package model;

public class Member {
	private String id;
	private String pass;
	private String name;
	private String tel;
	private String email;
	private String picture;
	private int rating;
	private int writecount;
	private int updown;
	private String brand1;
	private String carname1;
	private String brand2;
	private String carname2;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getWritecount() {
		return writecount;
	}
	public void setWritecount(int writecount) {
		this.writecount = writecount;
	}
	public int getUpdown() {
		return updown;
	}
	public void setUpdown(int updown) {
		this.updown = updown;
	}
	public String getBrand1() {
		return brand1;
	}
	public void setBrand1(String brand1) {
		this.brand1 = brand1;
	}
	public String getCarname1() {
		return carname1;
	}
	public void setCarname1(String carname1) {
		this.carname1 = carname1;
	}
	public String getBrand2() {
		return brand2;
	}
	public void setBrand2(String brand2) {
		this.brand2 = brand2;
	}
	public String getCarname2() {
		return carname2;
	}
	public void setCarname2(String carname2) {
		this.carname2 = carname2;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", picture=" + picture + ", rating=" + rating + ", writecount=" + writecount + ", updown=" + updown
				+ ", brand1=" + brand1 + ", carname1=" + carname1 + ", brand2=" + brand2 + ", carname2=" + carname2
				+ "]";
	}
}
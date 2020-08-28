package model;

import java.util.Date;

public class JoinCar {
	private String id;
	private String chgname;
	private int cartype;
	private Date repairdate;
	private int repairtype;
	private int repaircost;
	private int chgdate;
	private int inputkm;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getChgname() {
		return chgname;
	}
	public void setChgname(String chgname) {
		this.chgname = chgname;
	}
	public int getCartype() {
		return cartype;
	}
	public void setCartype(int cartype) {
		this.cartype = cartype;
	}
	public Date getRepairdate() {
		return repairdate;
	}
	public void setRepairdate(Date repairdate) {
		this.repairdate = repairdate;
	}
	public int getRepairtype() {
		return repairtype;
	}
	public void setRepairtype(int repairtype) {
		this.repairtype = repairtype;
	}
	public int getRepaircost() {
		return repaircost;
	}
	public void setRepaircost(int repaircost) {
		this.repaircost = repaircost;
	}
	public int getChgdate() {
		return chgdate;
	}
	public void setChgdate(int chgdate) {
		this.chgdate = chgdate;
	}
	public int getInputkm() {
		return inputkm;
	}
	public void setInputkm(int inputkm) {
		this.inputkm = inputkm;
	}
	
	
}

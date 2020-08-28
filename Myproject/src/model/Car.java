package model;

import java.util.Date;

public class Car {
	private int no;
	private String id;
	private int repairno;
	private String cartype;
	private Date repairdate;
	private String repairtype;
	private String repairname;
	private int repaircost;
	private int inputkm;
	private int fuelprice;
	private int fuel;
	private int tot;
	private Date insurancedate;
	private int insurancecost;
	private int chgdate;
	private String chgname;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRepairno() {
		return repairno;
	}
	public void setRepairno(int repairno) {
		this.repairno = repairno;
	}
	public String getCartype() {
		return cartype;
	}
	public void setCartype(String cartype) {
		this.cartype = cartype;
	}
	public Date getRepairdate() {
		return repairdate;
	}
	public void setRepairdate(Date repairdate) {
		this.repairdate = repairdate;
	}
	public String getRepairtype() {
		return repairtype;
	}
	public void setRepairtype(String repairtype) {
		this.repairtype = repairtype;
	}
	public String getRepairname() {
		return repairname;
	}
	public void setRepairname(String repairname) {
		this.repairname = repairname;
	}
	public int getRepaircost() {
		return repaircost;
	}
	public void setRepaircost(int repaircost) {
		this.repaircost = repaircost;
	}
	public int getInputkm() {
		return inputkm;
	}
	public void setInputkm(int inputkm) {
		this.inputkm = inputkm;
	}
	public int getFuelprice() {
		return fuelprice;
	}
	public void setFuelprice(int fuelprice) {
		this.fuelprice = fuelprice;
	}
	public int getFuel() {
		return fuel;
	}
	public void setFuel(int fuel) {
		this.fuel = fuel;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public Date getInsurancedate() {
		return insurancedate;
	}
	public void setInsurancedate(Date insurancedate) {
		this.insurancedate = insurancedate;
	}
	public int getInsurancecost() {
		return insurancecost;
	}
	public void setInsurancecost(int insurancecost) {
		this.insurancecost = insurancecost;
	}
		
	public int getChgdate() {
		return chgdate;
	}
	public void setChgdate(int chgdate) {
		this.chgdate = chgdate;
	}
	public String getChgname() {
		return chgname;
	}
	public void setChgname(String chgname) {
		this.chgname = chgname;
	}
	@Override
	public String toString() {
		return "Car [no=" + no + ", id=" + id + ", repairno=" + repairno + ", cartype=" + cartype + ", repairdate="
				+ repairdate + ", repairtype=" + repairtype + ", repairname=" + repairname + ", repaircost="
				+ repaircost + ", inputkm=" + inputkm + ", fuelprice=" + fuelprice + ", fuel=" + fuel + ", tot=" + tot
				+ ", insurancedate=" + insurancedate + ", insurancecost=" + insurancecost + ", chgdate=" + chgdate
				+ ", chgname=" + chgname + "]";
	}
}
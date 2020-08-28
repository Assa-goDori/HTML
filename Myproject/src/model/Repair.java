package model;

public class Repair {
	private int repairno;
	private int chgdate;
	private String chgname;
	public int getRepairno() {
		return repairno;
	}
	public void setRepairno(int repairno) {
		this.repairno = repairno;
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
		return "Repair [repairno=" + repairno + ", chgdate=" + chgdate + ", chgname=" + chgname + "]";
	}
	
}
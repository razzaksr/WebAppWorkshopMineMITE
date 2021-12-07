package core.mod;

import java.sql.Date;

public class Companies 
{
	private String org;
	private String role;
	private Date date;
	private int required;
	private double salary;
	private int taken;
	@Override
	public String toString() {
		return "Companies [org=" + org + ", role=" + role + ", date=" + date + ", required=" + required + ", salary="
				+ salary + ", taken=" + taken + "]";
	}

	public Companies(String org, String role, Date date, int required, double salary, int taken) {
		super();
		this.org = org;
		this.role = role;
		this.date = date;
		this.required = required;
		this.salary = salary;
		this.taken = taken;
	}

	public int getTaken() {
		return taken;
	}

	public void setTaken(int taken) {
		this.taken = taken;
	}

	public Companies() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getRequired() {
		return required;
	}
	public void setRequired(int required) {
		this.required = required;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	
}

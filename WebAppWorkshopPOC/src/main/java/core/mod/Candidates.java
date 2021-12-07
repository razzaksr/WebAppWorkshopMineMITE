package core.mod;

public class Candidates 
{
	private Long regno,contact;
	private String name,gender,dept,email,address,skills,placed,status,career;
	private Integer batch;
	private Double cgpa,hsc,diploma,sslc;
	public Candidates(Long regno, Long contact, String name, String gender, String dept, String email, String address,
			String skills, String placed, String status, String career, Integer batch, Double cgpa, Double hsc,
			Double diploma, Double sslc) {
		super();
		this.regno = regno;
		this.contact = contact;
		this.name = name;
		this.gender = gender;
		this.dept = dept;
		this.email = email;
		this.address = address;
		this.skills = skills;
		this.placed = placed;
		this.status = status;
		this.career = career;
		this.batch = batch;
		this.cgpa = cgpa;
		this.hsc = hsc;
		this.diploma = diploma;
		this.sslc = sslc;
	}
	public Candidates() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getRegno() {
		return regno;
	}
	public void setRegno(Long regno) {
		this.regno = regno;
	}
	public Long getContact() {
		return contact;
	}
	public void setContact(Long contact) {
		this.contact = contact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getPlaced() {
		return placed;
	}
	public void setPlaced(String placed) {
		this.placed = placed;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public Integer getBatch() {
		return batch;
	}
	public void setBatch(Integer batch) {
		this.batch = batch;
	}
	public Double getCgpa() {
		return cgpa;
	}
	public void setCgpa(Double cgpa) {
		this.cgpa = cgpa;
	}
	public Double getHsc() {
		return hsc;
	}
	public void setHsc(Double hsc) {
		this.hsc = hsc;
	}
	public Double getDiploma() {
		return diploma;
	}
	public void setDiploma(Double diploma) {
		this.diploma = diploma;
	}
	public Double getSslc() {
		return sslc;
	}
	public void setSslc(Double sslc) {
		this.sslc = sslc;
	}
}

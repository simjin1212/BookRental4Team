// DTO(Data Transfer Object)

package dto;

import java.sql.Date;
import java.sql.Timestamp;

public class member_dto {
	private String id;
	private String name;
	private String passwd;
	private String jumin;
	private String jumin2;
	private String phone1;
	private String phone2;
	private String phone3;
	private String post;
	private String address;
	private String mailid;
	private String domain;
	private Timestamp reg_Date;
	private String member_Grade;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMailid() {
		return mailid;
	}
	public void setMailid(String mailid) {
		this.mailid = mailid;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public Timestamp getReg_Date() {
		return reg_Date;
	}
	public void setReg_Date(Timestamp timestamp) {
		this.reg_Date = timestamp;
	}
	public String getMember_Grade() {
		return member_Grade;
	}
	public void setMember_Grade(String member_Grade) {
		this.member_Grade = member_Grade;
	}
	
	

}

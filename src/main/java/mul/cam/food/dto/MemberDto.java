package mul.cam.food.dto;

import java.io.Serializable;

public class MemberDto implements Serializable{

	private int seq;
	private String userId;
	private String password;
	private String name;
	private String age;
	private String address;
	private String regdate;
	private String delflg;
	private String auth;
	private String email;
	
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	public MemberDto(int seq, String userId, String password, String name, String age, String address, String regdate,
			String delflg, String auth, String email) {
		super();
		this.seq = seq;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.age = age;
		this.address = address;
		this.regdate = regdate;
		this.delflg = delflg;
		this.auth = auth;
		this.email = email;
	}



	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getDelflg() {
		return delflg;
	}

	public void setDelflg(String delflg) {
		this.delflg = delflg;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "MemberDto [seq=" + seq + ", userId=" + userId + ", password=" + password + ", name=" + name + ", age="
				+ age + ", address=" + address + ", regdate=" + regdate + ", delflg=" + delflg + ", auth=" + auth
				+ ", email=" + email + "]";
	}

	
	
}
package vo;

import java.io.Serializable;
import java.sql.Clob;

import org.springframework.stereotype.Component;

@Component
public class MemberVO implements Serializable {
	private static final long serialVersionUID = -7354587414573995513L;
	private String mem_email = null;
	private String mem_name = null;
	private String mem_pw = null;
//	private Clob mem_pfimg = null;
	private String mem_pfimg = null;
	private String mem_loc = null;
	private String mem_hp = null;
	private String mem_publickey = null;
	private String mem_isauthority = null;
	private String mem_zipcode = null;
	private String mem_nickname = null;
	private String mem_birth = null;
	private String msg = null;
	// 추가
	private String result = null;
	private String isWalletExist = null;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_loc() {
		return mem_loc;
	}

	public void setMem_loc(String mem_loc) {
		this.mem_loc = mem_loc;
	}

	public String getMem_hp() {
		return mem_hp;
	}

	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}

	public String getMem_publickey() {
		return mem_publickey;
	}

	public void setMem_publickey(String mem_publickey) {
		this.mem_publickey = mem_publickey;
	}

	public String getMem_isauthority() {
		return mem_isauthority;
	}

	public void setMem_isauthority(String mem_isauthority) {
		this.mem_isauthority = mem_isauthority;
	}

	public String getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

//	public Clob getMem_pfimg() {
//		return mem_pfimg;
//	}
//
//	public void setMem_pfimg(Clob mem_pfimg) {
//		this.mem_pfimg = mem_pfimg;
//	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getIsWalletExist() {
		return isWalletExist;
	}

	public void setIsWalletExist(String isWalletExist) {
		this.isWalletExist = isWalletExist;
	}

	public String getMem_pfimg() {
		return mem_pfimg;
	}

	public void setMem_pfimg(String mem_pfimg) {
		this.mem_pfimg = mem_pfimg;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

}
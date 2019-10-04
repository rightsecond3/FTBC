package vo;

import java.sql.Blob;
import java.util.List;

public class ProjectVO {
	//DB에 있는것
	private String project_code = null;
	private String subcat_code = null;
	private String mem_email = null;
	private String pj_isedit = null;
	private String pj_publickey = null; //encoding해서 넣어야함
	private String pj_privatekey = null;
	private String pj_account = null;
	private String pj_stat = null;
	private String pj_issuccess = null;
	
	//프로젝트테이블이 아닌 테이블에서 가져와야 하는것
	private Blob st_story = null;
	private int targetMoney = 0;
	private String deadLine = null;
	private OutlineVO oVO = null; 
	private List<GiftVO> gList = null;
	 
	//체인에서 가져와야하는것
	private long fundedMoney = 0; //펀딩된 금액
	private int support_num = 0; //후원자 수

	public String getProject_code() {
		return project_code;
	}

	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}

	public String getSubcat_code() {
		return subcat_code;
	}

	public void setSubcat_code(String subcat_code) {
		this.subcat_code = subcat_code;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getPj_isedit() {
		return pj_isedit;
	}

	public void setPj_isedit(String pj_isedit) {
		this.pj_isedit = pj_isedit;
	}

	public String getPj_publickey() {
		return pj_publickey;
	}

	public void setPj_publickey(String pj_publickey) {
		this.pj_publickey = pj_publickey;
	}

	public String getPj_privatekey() {
		return pj_privatekey;
	}

	public void setPj_privatekey(String pj_privatekey) {
		this.pj_privatekey = pj_privatekey;
	}

	public String getPj_account() {
		return pj_account;
	}

	public void setPj_account(String pj_account) {
		this.pj_account = pj_account;
	}

	public String getPj_stat() {
		return pj_stat;
	}

	public void setPj_stat(String pj_stat) {
		this.pj_stat = pj_stat;
	}

	public String getPj_issuccess() {
		return pj_issuccess;
	}

	public void setPj_issuccess(String pj_issuccess) {
		this.pj_issuccess = pj_issuccess;
	}

	public long getFundedMoney() {
		return fundedMoney;
	}

	public void setFundedMoney(long fundedMoney) {
		this.fundedMoney = fundedMoney;
	}

	public int getSupport_num() {
		return support_num;
	}

	public void setSupport_num(int support_num) {
		this.support_num = support_num;
	}

	public int getTargetMoney() {
		return targetMoney;
	}

	public void setTargetMoney(int targetMoney) {
		this.targetMoney = targetMoney;
	}

	public Blob getSt_story() {
		return st_story;
	}

	public void setSt_story(Blob st_story) {
		this.st_story = st_story;
	}

	public String getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}

	public OutlineVO getoVO() {
		return oVO;
	}

	public void setoVO(OutlineVO oVO) {
		this.oVO = oVO;
	}

	public List<GiftVO> getgList() {
		return gList;
	}

	public void setgList(List<GiftVO> gList) {
		this.gList = gList;
	}


	
	 @Override
	    public String toString() {
	        return "UserInfo [num=" + support_num + ", money=" + fundedMoney + ", code=" + project_code + "]";
	    }
}

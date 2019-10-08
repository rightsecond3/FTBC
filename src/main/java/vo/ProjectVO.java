package vo;

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
   private String pjo_img = null;
   private String pjo_longtitle = null;
   private String pjo_introduce = null;
   private String pjo_pageaddr = null;
   private String pjo_summary = null;
   
   //프로젝트테이블이 아닌 테이블에서 가져와야 하는것
   private String st_story = null;
   private String subcat_name = null;
   private int fd_targetMoney = 0;
   private String fd_deadLine = null;
   private String mem_nickname = null;
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
   /*
    * @Override public String toString() { return "UserInfo [num=" + support_num +
    * ", money=" + fundedMoney + ", code=" + project_code + "]"; }
    */


   public String getMem_nickname() {
      return mem_nickname;
   }

   public void setMem_nickname(String mem_nickname) {
      this.mem_nickname = mem_nickname;
   }

   public String getPjo_img() {
      return pjo_img;
   }

   public void setPjo_img(String pjo_img) {
      this.pjo_img = pjo_img;
   }

   public String getPjo_longtitle() {
      return pjo_longtitle;
   }

   public void setPjo_longtitle(String pjo_longtitle) {
      this.pjo_longtitle = pjo_longtitle;
   }

   public String getPjo_introduce() {
      return pjo_introduce;
   }

   public void setPjo_introduce(String pjo_introduce) {
      this.pjo_introduce = pjo_introduce;
   }

   public String getPjo_pageaddr() {
      return pjo_pageaddr;
   }

   public void setPjo_pageaddr(String pjo_pageaddr) {
      this.pjo_pageaddr = pjo_pageaddr;
   }

   public String getPjo_summary() {
      return pjo_summary;
   }

   public void setPjo_summary(String pjo_summary) {
      this.pjo_summary = pjo_summary;
   }

   public int getFd_targetMoney() {
      return fd_targetMoney;
   }

   public void setFd_targetMoney(int fd_targetMoney) {
      this.fd_targetMoney = fd_targetMoney;
   }

   public String getFd_deadLine() {
      return fd_deadLine;
   }

   public void setFd_deadLine(String fd_deadLine) {
      this.fd_deadLine = fd_deadLine;
   }

   public String getSt_story() {
      return st_story;
   }

   public void setSt_story(String st_story) {
      this.st_story = st_story;
   }

   public String getSubcat_name() {
      return subcat_name;
   }

   public void setSubcat_name(String subcat_name) {
      this.subcat_name = subcat_name;
   }


   
}
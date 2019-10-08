package vo;

public class GiftVO {
	private GiftOptionVO goVO = null;
	private int  	gift_unitmoney   	= 0; 
	private int  	gift_isinclude   	= 0; 
	private String  gift_explanation 	= null; 
	private String  gift_deliverydat 	= null;
	private int  	gift_limited     	= 0; 
	private String  project_code     	= null; 
	private String  gift_code        	= null;
	public GiftOptionVO getGoVO() {
		return goVO;
	}
	public void setGoVO(GiftOptionVO goVO) {
		this.goVO = goVO;
	}
	public int getGift_unitmoney() {
		return gift_unitmoney;
	}
	public void setGift_unitmoney(int gift_unitmoney) {
		this.gift_unitmoney = gift_unitmoney;
	}
	public int getGift_isinclude() {
		return gift_isinclude;
	}
	public void setGift_isinclude(int gift_isinclude) {
		this.gift_isinclude = gift_isinclude;
	}
	public String getGift_explanation() {
		return gift_explanation;
	}
	public void setGift_explanation(String gift_explanation) {
		this.gift_explanation = gift_explanation;
	}
	public String getGift_deliverydat() {
		return gift_deliverydat;
	}
	public void setGift_deliverydat(String gift_deliverydat) {
		this.gift_deliverydat = gift_deliverydat;
	}
	public int getGift_limited() {
		return gift_limited;
	}
	public void setGift_limited(int gift_limited) {
		this.gift_limited = gift_limited;
	}
	public String getProject_code() {
		return project_code;
	}
	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}
	public String getGift_code() {
		return gift_code;
	}
	public void setGift_code(String gift_code) {
		this.gift_code = gift_code;
	} 
}

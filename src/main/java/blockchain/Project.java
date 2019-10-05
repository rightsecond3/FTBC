package blockchain;
import java.io.Serializable;
import java.security.PublicKey;

public class Project implements Serializable {
	private static final long serialVersionUID = -1618285943183997746L;
	public String projectCode; // 코드 
	public String projectName;
	public PublicKey projectPublicKey;
	
	/*
	 * public Project(String projectID, String projectName, String projectPublicKey)
	 * { this.projectID = projectID; this.projectName = projectName;
	 * this.projectPublicKey = projectPublicKey; }
	 */
}

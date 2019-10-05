package blockchain;
import java.io.Serializable;

import blockchain.util.CommonSet;


public class Register implements Serializable {
   private static final long serialVersionUID = 7262040228088375698L;
   public Wallet createMoneyWallet() {
      Wallet wallet = new Wallet();
      wallet.generateKeyPair();
      return wallet;
   }
   public Wallet createProjectWallet(String project_code) {
      CommonSet commonSet = CommonSet.getInstance();
      Wallet wallet = new Wallet();
      wallet.generateKeyPair();
      commonSet.projectWallets.put(project_code, wallet);
      return wallet;
   }
   public Project createProject(String project_code) {
      CommonSet commonSet = CommonSet.getInstance();
      Project project = new Project();
      Wallet wallet = null;
      try {
         wallet = commonSet.getProjectWallet(project_code);
      } catch (Exception e) {
         e.printStackTrace();
      }
      project.projectCode = project_code;
      project.projectPublicKey = wallet.getPublicKey();
      commonSet.projects.put(project_code, project);
      return project;
   }

}
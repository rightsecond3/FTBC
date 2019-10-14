package blockchain.test;

import java.security.PrivateKey;
import java.security.PublicKey;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Output;
import blockchain.Transaction;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.util.Path;

public class ManagerAndGenesisChain {
	CommonSet commonSet;
	String parkPuk = "rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAASqfa4IOIBqL+qEoqGxL1C6iVtuQ+a6SqiHpMisRvm2KzokRF1rvsWqq6iPw061KGR4";
	String parkPrk = "rO0ABXNyAD1vcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQcml2YXRlS2V5Dc1c3SkJztQDAAJaAA93aXRoQ29tcHJlc3Npb25MAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZzt4cAB0AAVFQ0RTQXVyAAJbQqzzF/gGCFTgAgAAeHAAAAB9MHsCAQAwEwYHKoZIzj0CAQYIKoZIzj0DAQEEYTBfAgEBBBiAItwbA4XpkkjQsaFTe3xpDKHdJ/b3XrigCgYIKoZIzj0DAQGhNAMyAASqfa4IOIBqL+qEoqGxL1C6iVtuQ+a6SqiHpMisRvm2KzokRF1rvsWqq6iPw061KGR4";
	String jungPuk = "rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAASn80YLxiCkUljRw0WpQEgXIjotoOvrFqDXvaILlyxwgPqUrt4XCDf1YX/unev+U1p4";
	String jungPrk = "rO0ABXNyAD1vcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQcml2YXRlS2V5Dc1c3SkJztQDAAJaAA93aXRoQ29tcHJlc3Npb25MAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZzt4cAB0AAVFQ0RTQXVyAAJbQqzzF/gGCFTgAgAAeHAAAAB9MHsCAQAwEwYHKoZIzj0CAQYIKoZIzj0DAQEEYTBfAgEBBBgdUNZ6VS90c0dhxeU/JwBRtCgQPH2Z3amgCgYIKoZIzj0DAQGhNAMyAASn80YLxiCkUljRw0WpQEgXIjotoOvrFqDXvaILlyxwgPqUrt4XCDf1YX/unev+U1p4";
	String koPuk = "rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAAS01h552VQuQ64SK1LUASeJ2kOwBgv6iT/uv/cc4vDmhue+xkYNdJ8BfNJ/GtjaDW14";
	String koPrk = "rO0ABXNyAD1vcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQcml2YXRlS2V5Dc1c3SkJztQDAAJaAA93aXRoQ29tcHJlc3Npb25MAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZzt4cAB0AAVFQ0RTQXVyAAJbQqzzF/gGCFTgAgAAeHAAAAB9MHsCAQAwEwYHKoZIzj0CAQYIKoZIzj0DAQEEYTBfAgEBBBh0Vm7sVZ3u6qBW4UXMZWBJJAAStTByZDqgCgYIKoZIzj0DAQGhNAMyAAS01h552VQuQ64SK1LUASeJ2kOwBgv6iT/uv/cc4vDmhue+xkYNdJ8BfNJ/GtjaDW14";
	public ManagerAndGenesisChain() {
		commonSet = CommonSet.getInstance();
	}
	private BlockChain getFTBCChain() {
		BlockChain FTBCChain = null;
		try {
			String base64 = Base64Conversion.importChain("FTBC", "C:\\FTBC_server\\chain\\backup\\genesis_chain\\");
			FTBCChain = (BlockChain) Base64Conversion.decodeBase64(base64);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return FTBCChain;
	}
	
	private void createManagerWallet() {
		try {
			Wallet managerWallet = new Wallet();
			managerWallet.generateKeyPair();
			String publicBase64 = Base64Conversion.encodePublicKey(managerWallet.getPublicKey());
			String privateBase64 = Base64Conversion.encodePrivateKey(managerWallet.getPrivateKey());
			Base64Conversion.saveUserPublicKey(publicBase64, Path.MANAGER_WALLET_PATH, "manager.com");
			Base64Conversion.saveUserPrivateKey(privateBase64, Path.MANAGER_WALLET_PATH, "manager.com");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void addGenesisBlock() {
		Wallet managerWallet = commonSet.getManagerWallet();
		PublicKey managerPuk = managerWallet.getPublicKey();
		PrivateKey managerPrk = managerWallet.getPrivateKey();
		BlockChain FTBCChain = new BlockChain();
		// 마르지 않는 샘물 추가
		FTBCChain.genesisTransaction = new Transaction(managerPuk, managerPuk, "", 1000000000000000000L, null);
		FTBCChain.genesisTransaction.generateSignature(managerPrk);
		FTBCChain.genesisTransaction.txId = "0";
		FTBCChain.genesisTransaction.outputs.add(new Output(FTBCChain.genesisTransaction.recipient,
															FTBCChain.genesisTransaction.value,
															FTBCChain.genesisTransaction.txId,
															FTBCChain.genesisTransaction.giftCode));
		FTBCChain.UTXOs.put(FTBCChain.genesisTransaction.outputs.get(0).id, FTBCChain.genesisTransaction.outputs.get(0));
		Block genesis = new Block("0");
		genesis.addTransaction(FTBCChain, FTBCChain.genesisTransaction);
		FTBCChain.addBlock(genesis);
		try {
			String baseStr = Base64Conversion.encodeChain(FTBCChain);
			Base64Conversion.saveChain(baseStr, "C:\\FTBC_server\\chain\\backup\\genesis_chain\\", "FTBC");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// addTransaction
	public boolean transactionAdd(BlockChain FTBCChain, Block block, PublicKey senderPuk, PrivateKey senderPrk, PublicKey recipient, long value, String giftCode) {
		Wallet managerWallet = commonSet.getManagerWallet();
		Wallet senderWallet = new Wallet();
		senderWallet.setPrivateKey(senderPrk);
		senderWallet.setPublicKey(senderPuk);
		boolean isAdd = false;
		try {
			boolean isFirstAdd = block.addTransaction(FTBCChain, managerWallet.sendFunds(FTBCChain, senderWallet.getPublicKey(), "", value));
			boolean isSecondAdd = block.addTransaction(FTBCChain, senderWallet.sendFunds(FTBCChain, recipient, giftCode, value));
			if(isFirstAdd == true || isSecondAdd == true) isAdd = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isAdd;
	}
	
	
	
	public static void main(String[] args) {
		ManagerAndGenesisChain magc = new ManagerAndGenesisChain();
//		magc.createManagerWallet();
//		magc.addGenesisBlock();
		BlockChain FTBCChain = magc.getFTBCChain();
		FTBCChain.syncUTXOs();
		System.out.println("블록체인 사이즈 : "+FTBCChain.blockChain.size());
		Block block = new Block(FTBCChain.blockChain.get(FTBCChain.blockChain.size()-1).hash);
		try {
			PublicKey parkPuk = (PublicKey) Base64Conversion.decodeBase64(magc.parkPuk);
			PrivateKey parkPrk = (PrivateKey) Base64Conversion.decodeBase64(magc.parkPrk);
			PublicKey jungPuk = (PublicKey) Base64Conversion.decodeBase64(magc.jungPuk);
			PrivateKey jungPrk = (PrivateKey) Base64Conversion.decodeBase64(magc.jungPrk);
			PublicKey koPuk = (PublicKey) Base64Conversion.decodeBase64(magc.koPuk);
			PrivateKey koPrk = (PrivateKey) Base64Conversion.decodeBase64(magc.koPrk);
			PublicKey pukA01_1 = (PublicKey) Base64Conversion.decodeBase64("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAAQepanr+5HqVSiWFtcpBr+LcH+S63s7F3xTFYZPd/MsemXPsDPe17O7Y/1SKOeKWEF4\r\n" + 
					"");
			PublicKey pukB04_1 = (PublicKey)Base64Conversion.decodeBase64("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAARoraSWWg1DooWFB1pRb6FjeMRmUX1YuZJsqZHidL5a6rIAO48G/A/PNr7fS7eFz+d4\r\n" + 
					"");
			PublicKey pukB04_2 = (PublicKey) Base64Conversion.decodeBase64("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAAS+Tr0z/pnk/nk8f9elk5BMtZVU5FUYd5nKVdbhqWCFfRzx0NSZuLyfEgYEtuFb/Sl4\r\n" + 
					"");
			PublicKey pukB04_3 = (PublicKey) Base64Conversion.decodeBase64("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAATMZljEeCZSS/ihbgpSVa7wRyaRx2OQy8BVwwgLRYtiCHYEpDUliTs2wr7+iSnTqFN4\r\n" + 
					"");
			PublicKey pukC04_1 = (PublicKey) Base64Conversion.decodeBase64("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAARCaOvueOeP+3TruPqfIKHE0TrwjUXUN14JN53zmhoxOmFXBkBhuLleZRk8zSl//wt4\r\n" + 
					"");
			PublicKey pukC04_2 = (PublicKey) Base64Conversion.decodeBase64("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAASs6PlQVE7It+LoLw70ag9fz8rfoYUriJquUxFYPtwx8GmzH+/z/vNVNj1ZU7ABZpJ4\r\n" + 
					"");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_2, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_2, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_2, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukB04_2, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, parkPuk, parkPrk, pukB04_2, 10000L, "B04_3_1");
			                   
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukB04_3, 10000L, "B04_3_1");
			
			CommonSet commonSet = CommonSet.getInstance();
			Wallet managerWallet = commonSet.getManagerWallet();
			System.out.println("@@@@@@@@@@@@@@@@@@@ 매니저 지갑 잔액 : "+managerWallet.getBalance(FTBCChain));
			
			FTBCChain.addBlock(block);
			String str = Base64Conversion.encodeChain(FTBCChain);
			Base64Conversion.saveChain(str, "C:\\FTBC_server\\chain\\backup\\genesis_chain\\", "FTBC");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

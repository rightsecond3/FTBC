package com.project.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


import vo.ProjectVO;

public class SortProject {

	//인원수 많은 순으로 정렬후 10개만 담음.
	public List<ProjectVO> SortbySupNum(List<ProjectVO> pList){
		List<ProjectVO> rList = new ArrayList<>();
		
		Collections.sort(pList,new CompareNumDesc());
	        for (int i=0; i<10; i++) {
	        	ProjectVO pVO = pList.get(i);
	            System.out.println(pVO.toString());          
	            rList.add(pVO);
	      }
		return rList;
		
	}
	
	// 후원자 수 내림차순
	class CompareNumDesc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			return pVO1.getSupport_num() > pVO2.getSupport_num() ? -1
					: pVO1.getSupport_num() < pVO2.getSupport_num() ? 1 : 0;
		}
	}

	//후원자 수 오름차순
	class CompareNumAsc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			// TODO Auto-generated method stub
			return pVO1.getSupport_num() < pVO2.getSupport_num() ? -1
					: pVO1.getSupport_num() > pVO2.getSupport_num() ? 1 : 0;
		}
	}

	//펀딩 금액 내림차순
	class CompareMoneyDesc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			// TODO Auto-generated method stub
			return pVO1.getFundedMoney() > pVO2.getFundedMoney() ? -1
					: pVO1.getFundedMoney() < pVO2.getFundedMoney() ? 1 : 0;
		}
	}

	//펀딩 금액 오름차순
	class CompareMoneyAsc implements Comparator<ProjectVO> {

		@Override
		public int compare(ProjectVO pVO1, ProjectVO pVO2) {
			// TODO Auto-generated method stub
			return pVO1.getFundedMoney() < pVO2.getFundedMoney() ? -1
					: pVO1.getFundedMoney() > pVO2.getFundedMoney() ? 1 : 0;
		}
	}

}

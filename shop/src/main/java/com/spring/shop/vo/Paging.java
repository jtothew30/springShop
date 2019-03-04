package com.spring.shop.vo;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * @author kim
 *
 */
public class Paging {	
	private String kwd=""; // 검색어
	private String optionKwd;
	private ArrayList<String> listCate2;
	private ArrayList<String> listCate3;
	private String[] chkboxCate2;
	private String[] chkboxCate3;
		
	private int page =1; //현재 페이지 (get)
	private int totalCount; //row 전체의 수 (get)
	private int beginPage;  //출력 시작
	private int endPage;    //출력 끝
	private int displayRow = 10;  //한 페이지에 몇 개의 로우 (선택 set)
	private int displayPage =10;  //한 페이지에 몇 개의 페이지 (선택 set)
	private int startNum;
	private int endNum;
	boolean prev; //prev 버튼이 보일건지 안보일건지
	boolean next; //next 버튼이 보일건지 안보일건지
	
	public int getStartNum() {		return startNum;	}
	public int getEndNum() {		return endNum;	}
	public int getPage() {		return page;	}
	public void setPage(int page) {		this.page = page;	}
	public int getTotalCount() {		return totalCount;	}
	public void setTotalCount(int totalCount) {
		//setTotalCount()를 꼭 호출해야 paging이 되기 때문에
		//paging()함수를 setTotalCount()를 호출했을 때 자동으로 호출되게 한다.
		this.totalCount = totalCount;
		paging();
	}//end
	
	public int getDisplayRow() {		return displayRow;	}
	public void setDisplayRow(int displayRow) {		this.displayRow = displayRow;	}
	public int getDisplayPage() {		return displayPage;	}
	public void setDisplayPage(int displayPage) {		this.displayPage = displayPage;	}
	public int getBeginPage() {		return beginPage;	}
	public int getEndPage() {		return endPage;	}
	public boolean isPrev() {		return prev;	}
	public boolean isNext() {		return next;	}
	
	private void paging(){
		// prev, next, beginPage, endPage를 계산해서 만든다.
		// 2+9 = 11, 11/10 = 1, 1*10 = 10
		// 10+9 = 19, 19/10 = 1, 1*10 = 10
		// 11+9 = 20, 20/10 = 2, 2*10 = 20
		// 20+9 = 29, 29/10 = 2, 2*10 = 20
		// 111+9 = 120 120/10 = 12, 12*10 = 120
		
		// (2+9)/10 * 10 (1번 방법)
		//endPage = ((page+(displayPage-1))/displayPage)*displayPage;
		
		// 1/10 0.1(올림) 1 (2번 방법)
		startNum = (page-1)*displayRow+1;
		endNum = page*displayRow;
		
		endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage;
		//System.out.println("endPage : " + endPage);
		
		beginPage = endPage - (displayPage - 1);
		//System.out.println("beginPage : " + beginPage);
		
		startNum = (page-1)*displayRow+1;
		endNum = page*displayRow;
		
		// 글 32개
		// 32/10 = 3.2 (올림) 4페이지
		// 2=?  2/10
		int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
		
		if(totalPage<=endPage){
			endPage = totalPage;
			next = false;
		}else{
			next = true;
		}
		prev = (beginPage==1)?false:true;//page가 11이상에만 나온다.
		//System.out.println("endPage : " + endPage);
		//System.out.println("totalPage : " + totalPage);
	}//end
	public String getKwd() {
		return kwd;
	}
	public void setKwd(String kwd) {
		this.kwd = kwd;
	}
	
	public String getOptionKwd() {
		return optionKwd;
	}
	public void setOptionKwd(String optionKwd) {
		this.optionKwd = optionKwd;
	}
	public ArrayList<String> getListCate2() {
		return listCate2;
	}
	public void setListCate2(ArrayList<String> listCate2) {
		this.listCate2 = listCate2;
	}
	public ArrayList<String> getListCate3() {
		return listCate3;
	}
	public void setListCate3(ArrayList<String> listCate3) {
		this.listCate3 = listCate3;
	}
	
	
	public String[] getChkboxCate2() {
		return chkboxCate2;
	}
	public void setChkboxCate2(String[] chkboxCate2) {
		this.chkboxCate2 = chkboxCate2;
	}
	public String[] getChkboxCate3() {
		return chkboxCate3;
	}
	public void setChkboxCate3(String[] chkboxCate3) {
		this.chkboxCate3 = chkboxCate3;
	}
	@Override
	public String toString() {
		return "Paging [kwd=" + kwd + ", optionKwd=" + optionKwd + ", listCate2=" + listCate2 + ", listCate3="
				+ listCate3 + ", chkboxCate2=" + Arrays.toString(chkboxCate2) + ", chkboxCate3="
				+ Arrays.toString(chkboxCate3) + ", page=" + page + ", totalCount=" + totalCount + ", beginPage="
				+ beginPage + ", endPage=" + endPage + ", displayRow=" + displayRow + ", displayPage=" + displayPage
				+ ", startNum=" + startNum + ", endNum=" + endNum + ", prev=" + prev + ", next=" + next + "]";
	}
	
	
}//class end


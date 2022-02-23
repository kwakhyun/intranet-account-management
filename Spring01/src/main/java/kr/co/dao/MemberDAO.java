package kr.co.dao;

import java.util.List;

import kr.co.vo.MemberVO;
import kr.co.vo.SearchCriteria;

public interface MemberDAO {
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public void join(MemberVO memberVO) throws Exception;
	
	public List<MemberVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;

	public MemberVO detail(String dealer_no) throws Exception;
	
	public void update(MemberVO memberVO) throws Exception;
	
	public void delete(String dealer_no) throws Exception;
}

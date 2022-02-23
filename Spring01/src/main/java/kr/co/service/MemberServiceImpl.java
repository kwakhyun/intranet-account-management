package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.MemberDAO;
import kr.co.vo.MemberVO;
import kr.co.vo.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	@Override
	public void join(MemberVO memberVO) throws Exception {
		dao.join(memberVO);
	}

	@Override
	public List<MemberVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public MemberVO detail(String dealer_no) throws Exception {
		return dao.detail(dealer_no);
	}

	@Override
	public void update(MemberVO memberVO) throws Exception {
		dao.update(memberVO);
	}

	@Override
	public void delete(String dealer_no) throws Exception {
		dao.delete(dealer_no);
	}

}

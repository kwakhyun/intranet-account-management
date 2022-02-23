package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.MemberVO;
import kr.co.vo.SearchCriteria;

import freet.cipher.sha.Sha256Cipher;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne("memberMapper.login", memberVO);
	}
	
	@Override
	public void join(MemberVO memberVO) throws Exception {
		
		String password = memberVO.getHome_tel_no().substring(3);
		String encPassword = Sha256Cipher.encrypt(password);
		memberVO.setSha_passwd(encPassword);
		
		sqlSession.insert("memberMapper.insert", memberVO);
		
	}

	@Override
	public List<MemberVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("memberMapper.listPage", scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("memberMapper.listCount", scri);
	}

	@Override
	public MemberVO detail(String dealer_no) throws Exception {
		return sqlSession.selectOne("memberMapper.detail", dealer_no);
	}

	@Override
	public void update(MemberVO memberVO) throws Exception {
		sqlSession.update("memberMapper.update", memberVO);
	}

	@Override
	public void delete(String dealer_no) throws Exception {
		sqlSession.delete("memberMapper.delete", dealer_no);
	}

}

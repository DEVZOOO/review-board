package com.devzooo.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devzooo.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.devzooo.mapper.pagingMapper";
	
	@Override
	public void insertBoard(BoardVO vo) {
		sqlSession.insert(namespace+".insertBoard", vo);
	}

	@Override
	public BoardVO selectBoard(int bno) {
		return sqlSession.selectOne(namespace+".selectBoard", bno);
	}

	@Override
	public List<Object> selectAll() {
		return sqlSession.selectList(namespace+".selectAll");
	}

	@Override
	public void updateBoard(BoardVO vo) {
		sqlSession.update(namespace+".updateBoard", vo);
	}

	@Override
	public void deleteBoard(int bno) {
		sqlSession.delete(namespace+".deleteBoard", bno);
	}

	@Override
	public List<Object> selectTen(int pstartno, int onepagelimit) {
		Map<String, Object> map = new HashMap<>();
		map.put("pstartno", pstartno);
		map.put("onepagelimit", onepagelimit);
		return sqlSession.selectList(namespace+".selectTen", map);
	}

	@Override
	public int allListCnt() {
		return sqlSession.selectOne(namespace+".allListCnt");
	}

	@Override
	public void incrementHit(int bno) {
		sqlSession.update(namespace+".incrementHit", bno);
	}

	@Override
	public int passck(BoardVO vo) {
		return sqlSession.selectOne(namespace+".passck", vo);
	}
	@Override
	public List<Object> selectKeyword(String btitle) {
		return sqlSession.selectList(namespace+".selectKeyword", btitle);
	}
}

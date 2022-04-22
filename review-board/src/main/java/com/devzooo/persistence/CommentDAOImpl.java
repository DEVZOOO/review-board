package com.devzooo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devzooo.domain.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	@Inject
	private SqlSession session;
	private static final String namespace="com.devzooo.mapper.commentMapper";
	@Override
	public void insertComment(CommentVO vo) {
		session.insert(namespace+".insertComment", vo);
	}
	@Override
	public List<Object> selectComment(int bno) {
		return session.selectList(namespace+".selectComment", bno);
	}
	@Override
	public void updateComment(CommentVO vo) {
		session.update(namespace+".updateComment", vo);
	}
	@Override
	public void deleteComment(int cno) {
		session.delete(namespace+".deleteComment", cno);
	}
	@Override
	public int passck(CommentVO vo) {
		return session.selectOne(namespace+".passck", vo);
	}
}

package com.devzooo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.devzooo.domain.CommentVO;
import com.devzooo.persistence.CommentDAO;

@Repository
public class CommentServiceImpl implements CommentService {
	@Inject
	CommentDAO dao;
	@Override
	public void insertComment(CommentVO vo) {
		dao.insertComment(vo);
	}
	@Override
	public List<Object> selectComment(int bno) {
		return dao.selectComment(bno);
	}
	@Override
	public void updateComment(CommentVO vo) {
		dao.updateComment(vo);
	}
	@Override
	public void deleteComment(int cno) {
		dao.deleteComment(cno);
	}
	@Override
	public int passck(CommentVO vo) {
		return dao.passck(vo);
	}
}

package com.devzooo.service;

import java.util.List;

import com.devzooo.domain.CommentVO;

public interface CommentService {
	public void insertComment(CommentVO vo);	// c
	public List<Object> selectComment(int bno);	// r
	public void updateComment(CommentVO vo);	// u
	public void deleteComment(int cno);			// d
	public int passck(CommentVO vo);			// passck
}

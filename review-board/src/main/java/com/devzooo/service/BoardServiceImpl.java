package com.devzooo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.devzooo.domain.BoardVO;
import com.devzooo.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO dao;
	@Override
	public void create(BoardVO vo) {
		dao.insertBoard(vo);
	}

	@Override
	public BoardVO read(int bno) {
		return dao.selectBoard(bno);
	}

	@Override
	public List<Object> readAll() {
		return dao.selectAll();
	}

	@Override
	public void update(BoardVO vo) {
		dao.updateBoard(vo);
	}

	@Override
	public void delete(int bno) {
		dao.deleteBoard(bno);
	}

	@Override
	public List<Object> readTen(int pstartno, int onepagelimit) {
		return dao.selectTen(pstartno, onepagelimit);
	}

	@Override
	public int readListCnt() {
		return dao.allListCnt();
	}

	@Override
	public void incrementHit(int bno) {
		dao.incrementHit(bno);
	}

	@Override
	public int passck(BoardVO vo) {
		return dao.passck(vo);
	}
	@Override
	public List<Object> selectKeyword(String btitle) {
		return dao.selectKeyword(btitle);
	}

}

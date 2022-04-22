// 190709
// paging board service
package com.devzooo.service;

import java.util.List;

import com.devzooo.domain.BoardVO;

public interface BoardService {
	public void create(BoardVO vo);		// 글추가
	public BoardVO read(int bno);		// 글 detail
	public List<Object> readAll();		// 전체 리스트
	public void update(BoardVO vo);		// 글 수정
	public void delete(int bno);		// 글 삭제
	public List<Object> readTen(int pstartno, int onepagelimit);	// 10개 가져오기
	public int readListCnt();					// 전체 글 갯수
	public void incrementHit(int bno);		// 조회수 올리기
	public int passck(BoardVO vo);		// 비밀번호 확인
	public List<Object> selectKeyword(String btitle);	// 키워드 검색
}

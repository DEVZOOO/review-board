// 190709
// DAO interface
package com.devzooo.persistence;

import java.util.List;

import com.devzooo.domain.BoardVO;

public interface BoardDAO {
	public void insertBoard(BoardVO vo);		// 글 추가
	public BoardVO selectBoard(int bno);		// 글 detail
	public List<Object> selectAll();			// 글 전체 목록
	public void updateBoard(BoardVO vo);		// 글 수정
	public void deleteBoard(int bno);			// 글 삭제
	public List<Object> selectTen(int pstartno, int onepagelimit);	// 10개 가져오기
	public int allListCnt();					// 전체 글 갯수
	public void incrementHit(int bno);			// 조회수올리기
	public int passck(BoardVO vo);				// 비밀번호 확인
	public List<Object> selectKeyword(String btitle);	// 키워드 검색
}

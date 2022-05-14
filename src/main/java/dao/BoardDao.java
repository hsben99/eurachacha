package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.BoardDto;

@Repository
public class BoardDao {
	@Autowired
	SqlSession session;
	
	public int insertBoard(BoardDto boardDto) {
		return session.insert("boardMapper.insertBoard", boardDto);
	}

	public BoardDto getDetail(String id) {
		return session.selectOne("boardMapper.selectOneBoard",id);		
	}
	
	public List<BoardDto> getMainList(Map<String, String> map) {
		return session.selectList("boardMapper.selectMainList", map);		
	}
	
	public int maxRow(Map<String, String> map) {
		return session.selectOne("boardMapper.maxRow",map);
	}

	public int deleteById(int id) {
		return session.update("boardMapper.deleteById",id);
		
	}
	

}

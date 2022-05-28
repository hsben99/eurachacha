package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.User;

@Repository
public class UserDao {
	@Autowired
	SqlSession session;

	public User getPassword(String id) {
		return session.selectOne("userMapper.getPassword",id);		
	}

	public int join(User user) {
		return session.insert("userMapper.joinUser",user);
		
	}	

}

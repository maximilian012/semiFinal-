package mul.cam.food.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.food.dao.AdminDao;
import mul.cam.food.dto.AdminParam;
import mul.cam.food.dto.BbsComment;
import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.MemberDto;
@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession session;
	
	String ns = "Admin.";
	
	@Override
	public List<MemberDto> getAdminList(AdminParam param) {
		
		return session.selectList(ns + "getAdminList", param);
	}

	@Override
	public int getAllAdmin(AdminParam param) {
		
		return session.selectOne(ns + "getAllAdmin", param);
	}

	@Override
	public int adminDel(String seq) {
		
		return session.update(ns + "adminDel", seq);
	}

	@Override
	public MemberDto getInfo(String id) {
		
		return session.selectOne(ns + "getInfo", id);
	}

	@Override
	public List<BbsDto> getListCnt(String userId) {
		
		return session.selectList(ns + "getListCnt", userId);
	}

	@Override
	public List<BbsComment> getComentCnt(String userId) {
		
		return session.selectList(ns + "getComentCnt", userId);
	}

	@Override
	public void delfUp(String writer) {
		
		session.update(ns + "adminDel", writer);
		
	}

}

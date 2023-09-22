package net.hb.post;

import net.hb.common.DB;
import net.hb.common.Global;
import java.util.List;
import java.util.ArrayList;

public class PostDAO extends Global {
	public PostDAO() {
		try {
			CN=DB.getConnection();
		}
		catch(Exception ex) { }
	}//GuestDAO constructor

	public PostVO selectPostAll(int postId) {//post 테이블 내용 가져오기
		PostVO vo = new PostVO();
		try {
			msg = "select * from yjpost where postid=?";
			PST = CN.prepareStatement(msg);
				PST.setInt(1, postId);
			RS = PST.executeQuery();
			while(RS.next()) {
				vo.setUserId(RS.getInt("userid"));
				vo.setPostId(RS.getInt("postId"));
				vo.setStoreName(RS.getString("storename"));
				vo.setPostText(RS.getString("posttext"));
				vo.setPostGrade(RS.getInt("postgrade"));
				vo.setPostImg(RS.getString("postimg"));
				vo.setPostdate(RS.getDate("postdate"));
			}// while END
		}
		catch(Exception ex) {}
		return vo;
	}//selectPostAll END
		
	public boolean insertPost(PostVO vo) {//post 테이블 내용 추가
		try {
			msg = " insert into yjpost values(?, yjpostid_seq.nextval, ?, ?, ?, ?, sysdate)";
			PST = CN.prepareStatement(msg);
				PST.setInt(1, vo.getUserId());
				PST.setString(2, vo.getStoreName());
				PST.setString(3, vo.getPostText());
				PST.setInt(4, vo.getPostGrade());
				PST.setString(5, vo.getPostImg());
			int insertSuccess = PST.executeUpdate();	
			if(insertSuccess > 0) {
				return true;
			}
			else {
				return false;
			}
		}
		catch(Exception ex) {}
		return false;
	}//insertPost END
	
	public boolean insertReply(PostVO vo) {
		try {
			msg = "insert into yjreply values(?,?,?,sysdate)";
			PST = CN.prepareStatement(msg);
				PST.setInt(1, vo.getUserid());
				PST.setString(2, vo.getRcontent());
				PST.setInt(3, vo.getPostid());
		int insertSuccess = PST.executeUpdate();
		if(insertSuccess >0) {
			return true;
		}else {
			return false;
		}
		}catch(Exception ex) {}
		
		return falg;
	}//insertReply end
	
	
	
	public boolean deleteReply(int duserId, int dpostId, String drContent) {
		try {
			msg = "delete from yjreply where userid=? and rcontent=? and postid=? ";
			PST = CN.prepareStatement(msg);
				PST.setInt(1, duserId);
				PST.setString(2, drContent);
				PST.setInt(3, dpostId);
			int deleteSuccess = PST.executeUpdate();
			if(deleteSuccess>0) {
				return true ;
			} else {return false;}
		}catch(Exception ex) {}
		return falg;
	}
	
	public List<PostVO> inquirePostAll() { // index에 전체 게시글 정보 불러오기위함
		List<PostVO> postList = new ArrayList<PostVO>();
		try {
			msg = " select * from yjpost ";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while(RS.next()) {
				PostVO inquireVo = new PostVO();
				inquireVo.setUserId(RS.getInt("userid"));
				inquireVo.setStoreName(RS.getString("storename"));
				inquireVo.setPostId(RS.getInt("postid"));
				inquireVo.setPostText(RS.getString("posttext"));
				inquireVo.setPostGrade(RS.getInt("postgrade"));
				inquireVo.setPostImg(RS.getString("postimg"));
				inquireVo.setPostdate(RS.getDate("postdate"));
				postList.add(inquireVo);
			}// while END
		}
		catch(Exception ex) {}
		return postList;
	}
	
	public List<PostVO> authorListAll(int user_id){
		List<PostVO> postList = new ArrayList<PostVO>();
		try {
			msg = " select * from yjpost where userid = " + user_id + " order by postid desc";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			
			while(RS.next()) {
				PostVO inquireVo = new PostVO();
				inquireVo.setUserId(RS.getInt("userid"));
				inquireVo.setStoreName(RS.getString("storename"));
				inquireVo.setPostId(RS.getInt("postid"));
				inquireVo.setPostText(RS.getString("posttext"));
				inquireVo.setPostGrade(RS.getInt("postgrade"));
				inquireVo.setPostImg(RS.getString("postimg"));
				inquireVo.setPostdate(RS.getDate("postdate"));
				postList.add(inquireVo);
			}// while END
		}
		catch(Exception ex) {}
		return postList;
	}
	
	public List<PostVO> postListAll(){
		List<PostVO> postList = new ArrayList<PostVO>();
		try {
			msg = " select * from yjpost order by postid desc ";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while(RS.next()) {
				PostVO inquireVo = new PostVO();
				inquireVo.setUserId(RS.getInt("userid"));
				inquireVo.setStoreName(RS.getString("storename"));
				inquireVo.setPostId(RS.getInt("postid"));
				inquireVo.setPostText(RS.getString("posttext"));
				inquireVo.setPostGrade(RS.getInt("postgrade"));
				inquireVo.setPostImg(RS.getString("postimg"));
				inquireVo.setPostdate(RS.getDate("postdate"));
				postList.add(inquireVo);
			}// while END
		}
		catch(Exception ex) {}
		return postList;
	}//end

	public int editPost(PostVO vo) {// 게시글 수정
		try {
			msg = "update yjpost set posttext= ?, postgrade= ?, postimg= ? where userid= ? and postid=? ";
			PST = CN.prepareStatement(msg);
				PST.setString(1, vo.getPostText());
				PST.setInt(2, vo.getPostGrade());
				PST.setString(3, vo.getPostImg());
				PST.setInt(4, vo.getUserId());
				PST.setInt(5, vo.getPostId());
			int editSuccess = PST.executeUpdate();
			if(editSuccess > 0) {
				return editSuccess;
			}
			else {
				return 0;
			}
		}
		catch(Exception ex) {}
		return 0;
	}//editPost END

	public int postDelete(int userId, int postId) {
		try {
			msg = "delete from yjpost where userid= ? and postid= ? ";
			PST = CN.prepareStatement(msg);
				PST.setInt(1, userId);
				PST.setInt(2, postId);
			int deleteSuccess = PST.executeUpdate();
			if(deleteSuccess > 0) {
				return deleteSuccess;
			}
			else {
				return 0;
			}
		}
		catch(Exception ex) {}
		return 0;
	}//postDelete END

	public PostVO postHistory(int userId, int postId) {//수정 전 내용 가져오기 
		PostVO historyVo = new PostVO();
		try {
			msg = "select * from yjpost where userid=? and postid=?";
			PST = CN.prepareStatement(msg);
				PST.setInt(1, userId);
				PST.setInt(2, postId);
			RS = PST.executeQuery();
			if(RS.next()) {
				historyVo.setUserId(RS.getInt("userid"));
				historyVo.setStoreName(RS.getString("storename"));
				historyVo.setPostId(RS.getInt("postid"));
				historyVo.setPostText(RS.getString("posttext"));
				historyVo.setPostGrade(RS.getInt("postgrade"));
				historyVo.setPostImg(RS.getString("postimg"));
				historyVo.setPostdate(RS.getDate("postdate"));
				return historyVo;
			}
		}
		catch(Exception ex) {}
		return null;
	}// postHistory END 
	
	
	public List<PostVO> replyListAll( int postId){
		List<PostVO> replyList = new ArrayList<PostVO>();
		PostVO vo = new PostVO();
		try {
			String a ="select r.* from yjpost y , yjreply r";
			String b =" where y.postid=r.postid and r.postid=" + postId ;
			String c =" order by rdate";
			msg = a + b + c ;
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			
			
			while(RS.next()==true) {
				PostVO inquireVO = new PostVO();
				inquireVO.setUserid(RS.getInt("userid")); 
				inquireVO.setRcontent(RS.getString("rcontent")); 
				inquireVO.setPostid(RS.getInt("postid")); 
				inquireVO.setRdate(RS.getDate("rdate")); 
				replyList.add(inquireVO);
				
			}//while end
		}catch(Exception ex) {}
		return replyList;
	}//replyListAll end
	
	public int postLikeCountAll(int postid) {//좋아요 갯수 불러오기
		try {
			int postLikeCount=0;
			msg = "select count(*) as likecount from yjpostlike where postid=?";
			PST = CN.prepareStatement(msg);
				PST.setInt(1,postid);
			RS = PST.executeQuery();
			if(RS.next()) {
				postLikeCount = RS.getInt("likecount");
			}
			return postLikeCount;
		}
		catch(Exception ex) {}
		return 0;
	}
	
	public int Isliked(int userId, int postId) {//좋아요 했는지 여부 체크 
		try {
			int isliked = 0;
			msg = "select count(*) as isliked from yjpostlike where userid=? and postid=? ";
			PST = CN.prepareStatement(msg);
				PST.setInt(1,userId);
				PST.setInt(2,postId);
			RS = PST.executeQuery();

			if(RS.next()) {
				isliked = RS.getInt("isliked");
			}

			return isliked;
			
		}catch(Exception Ex) {	}
		return 0;
	}

	public void updateLikePost(int userId, int postId) {//좋아요 증가
		try {
			msg = "insert into yjpostlike values(?,?)";
			PST = CN.prepareStatement(msg);
				PST.setInt(1,userId);
				PST.setInt(2,postId);
			PST.executeUpdate();

		}catch(Exception Ex) {	}
	}


	public void deleteLikePost(int userId, int postId) {//좋아요 감소
		try {
			msg = "delete from yjpostlike where userid=? and postid=?";
			PST = CN.prepareStatement(msg);
				PST.setInt(1,userId);
				PST.setInt(2,postId);
			PST.executeUpdate();
			
		
		}catch(Exception Ex) {	}

	}

	public List<PostVO> searchListAll(String postSearch) {// 검색한 게시글 리스트 가져오기
		List<PostVO> searchList = new ArrayList<PostVO>();
		try {
			msg = " select * from yjpost where storename like '%" + postSearch + "%' ";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while(RS.next()) {
				PostVO searchVo = new PostVO();
				searchVo.setUserId(RS.getInt("userid"));
				searchVo.setStoreName(RS.getString("storename"));
				searchVo.setPostId(RS.getInt("postid"));
				searchVo.setPostText(RS.getString("posttext"));
				searchVo.setPostGrade(RS.getInt("postgrade"));
				searchVo.setPostImg(RS.getString("postimg"));
				searchVo.setPostdate(RS.getDate("postdate"));
				searchList.add(searchVo);
			}
		}
		catch(Exception Ex) {	}
		return searchList;
	}
	public List<PostVO> storeNameList(String storeName){
		List<PostVO> postList = new ArrayList<PostVO>();
		try {
			msg = " select * from yjpost where storename = ? order by postid desc";
			PST = CN.prepareStatement(msg);
			PST.setString(1, storeName);
			RS = PST.executeQuery();
			while(RS.next()) {
				PostVO inquireVo = new PostVO();
				inquireVo.setUserId(RS.getInt("userid"));
				inquireVo.setPostId(RS.getInt("postid"));
				inquireVo.setStoreName(storeName);
				inquireVo.setPostText(RS.getString("posttext"));
				inquireVo.setPostGrade(RS.getInt("postgrade"));
				inquireVo.setPostImg(RS.getString("postimg"));
				inquireVo.setPostdate(RS.getDate("postdate"));
				postList.add(inquireVo);
			}// while END
		}
		catch(Exception ex) {}
		return postList;
	}
	
	
		
}// PostDAO END

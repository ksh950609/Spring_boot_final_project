package com.spring_boot_final.project.service;

import com.spring_boot_final.project.dao.ICourseDAO;
import com.spring_boot_final.project.model.CourseCommentVO;
import com.spring_boot_final.project.model.CourseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class CourseService {

    @Autowired
    @Qualifier("ICourseDAO")
    ICourseDAO dao;

   public ArrayList<CourseVO> selectCourse() {
        return dao.selectCourse();
    }
   public final CourseVO selectCoursePost(int courseId) throws Exception {
       dao.hitCourse(courseId);
       return dao.selectCoursePost(courseId);
   }

    public void updateCourse(CourseVO vo) {
       dao.updateCourse(vo);
    }

    public void deleteCourse(HashMap<String, Object> map) {
       dao.deleteCourse(map);
    }

    public void insertCourse(CourseVO vo) {
       dao.insertCourse(vo);}
    
    // 마이 페이지 작성한 코스 게시물 조회    
	public ArrayList<CourseVO> mpCoursePostSelect(String userId) {
		return dao.mpCoursePostSelect(userId);
	}
	
	// 마이페이지 작성한 코스 게시물 삭제
    public void deleteMpCourse(int courseId) {
    	dao.deleteMpCourse(courseId);
    }

    public void insertComment(CourseCommentVO vo) throws Exception {
       dao.countComment(vo.getCourseId());
       dao.insertComment(vo);
    }

    public ArrayList<CourseCommentVO> selectCourseComment(int courseId) {
        return dao.selectCourseComment(courseId);
    }
}

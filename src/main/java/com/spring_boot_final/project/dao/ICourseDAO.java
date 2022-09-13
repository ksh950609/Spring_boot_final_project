package com.spring_boot_final.project.dao;

import com.spring_boot_final.project.model.CourseCommentVO;
import com.spring_boot_final.project.model.CourseVO;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;

@Component
public interface ICourseDAO {
    public ArrayList<CourseVO> selectCourse();
    public CourseVO selectCoursePost(int courseId);

    public void updateCourse(CourseVO vo);

    public void deleteCourse(HashMap<String, Object> map);

    public void insertCourse(CourseVO vo);

    public void hitCourse(int courseId) throws Exception;
    public void countComment(int courseId) throws Exception;

    // 마이 페이지 작성한 코스 게시물 조회
    public ArrayList<CourseVO> mpCoursePostSelect(String useId);
    
    // 마이 페이지 작성한 코스 게시물 삭제
    public void deleteMpCourse(int courseId);

    public void insertComment(CourseCommentVO vo);

    ArrayList<CourseCommentVO> selectCourseComment(int courseId);
}

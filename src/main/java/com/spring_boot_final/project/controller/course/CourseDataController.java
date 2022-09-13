package com.spring_boot_final.project.controller.course;

import com.spring_boot_final.project.model.CourseCommentVO;
import com.spring_boot_final.project.model.CourseListItemVO;
import com.spring_boot_final.project.model.CourseVO;
import com.spring_boot_final.project.model.ExhbnVO;
import com.spring_boot_final.project.service.CourseService;
import org.apache.tomcat.util.json.JSONParser;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
public class CourseDataController {

    @Autowired
    CourseService courseService;


    @ResponseBody
    @RequestMapping("/course/insertCourse")
    public String insertCourse(HttpSession session, @RequestBody CourseVO vo){
        if (session.getAttribute("sid") == null) {
            return "FAIL";
        }

        vo.setUserId(session.getAttribute("sid").toString());
        courseService.insertCourse(vo);
        return "SUCCESS";
    }

    // course 작성
    @ResponseBody
    @RequestMapping("/course/createCourse")
    public String createCourse(HttpSession session,
                               @RequestBody String param) throws IOException {
        // 비로그인 처리
        if (session.getAttribute("sid") == null) {
            return "FAIL";
        }
        // vo 설정
        CourseVO vo = new CourseVO();
        ObjectMapper mapper = new ObjectMapper();
        vo = mapper.readValue(param, CourseVO.class);
        // CourseListItemVO 문자열 변환
        String placeNames = "";
        String categoryNames = "";
        String phones = "";
        String addressNames = "";
        String roadAddressNames = "";
        String postionX = "";
        String positionY = "";
        String placeUrls = "";
        String placeMemos = "";

        for (CourseListItemVO clvo : vo.getCourseListItem()) {
            System.out.println(clvo.getPlace_memo());
            System.out.println(clvo.getPhone());
            placeNames += clvo.getPlace_name() + ";;";
            categoryNames += clvo.getCategory_group_name()+";;";
            phones += clvo.getPhone()+";;";
            addressNames += clvo.getAddress_name()+";;";
            roadAddressNames += clvo.getRoad_address_name()+";;";
            postionX += clvo.getX()+";;";
            positionY += clvo.getY()+";;";
            placeUrls += clvo.getPlace_url()+";;";
            placeMemos += clvo.getPlace_memo().equals("")+";;";

        }
        vo.setUserId(session.getAttribute("sid").toString());
        vo.setPlaceNames(placeNames);
        vo.setCategoryNames(categoryNames);
        vo.setPhones(phones);
        vo.setAddressNames(addressNames);
        vo.setRoadAddressNames(roadAddressNames);
        vo.setPostionX(postionX);
        vo.setPositionY(positionY);
        vo.setPlaceUrls(placeUrls);
        vo.setPlaceMemos(placeMemos);
        // service
        courseService.insertCourse(vo);
        return "SUCCESS";
    }

    @ResponseBody
    @RequestMapping("/course/updateCourse")
    public String updateCourse(HttpSession session, @RequestParam CourseVO vo){
        if (session.getAttribute("sid") == null) {
            return "FAIL";
        }

        vo.setUserId(session.getAttribute("sid").toString());
        courseService.updateCourse(vo);

        return "SUCCESS";
    }

    @ResponseBody
    @RequestMapping("/course/deleteCourse")
    public String deleteCourse(HttpSession session,
                               @RequestParam("courseId") int courseId){
        String userId = session.getAttribute("sid").toString();
        if (session.getAttribute("sid") == null) {
            return "FAIL";
        }

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("courseId", courseId);
        map.put("userId", userId);
        courseService.deleteCourse(map);

        return "SUCCESS";
    }

    ////////// comment secction
    // insert comment
    @ResponseBody
    @RequestMapping("/course/insertComment")
    public String insertComment(HttpSession session,
                                @RequestParam("courseId") int courseId,
                                @RequestParam("comment") String comment) throws Exception {

        if(session.getAttribute("sid") == null) return "FAIL";
        CourseCommentVO vo = new CourseCommentVO();
        vo.setCourseId(courseId);
        vo.setComment(comment);
        vo.setUserId(session.getAttribute("sid").toString());
        courseService.insertComment(vo);

        return "SUCCESS";
    }

}

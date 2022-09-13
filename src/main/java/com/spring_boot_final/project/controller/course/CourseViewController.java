package com.spring_boot_final.project.controller.course;

import com.spring_boot_final.project.model.*;
import com.spring_boot_final.project.service.CourseService;
import com.spring_boot_final.project.service.ExhbnService;
import lombok.RequiredArgsConstructor;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.*;

@Controller
public class CourseViewController {

    @Autowired
    ExhbnService service;
    @Autowired
    CourseService courseService;

    // course page view
    @RequestMapping("/course")
    public String courseView(Model model) {

        ArrayList<ExhbnVO> vo = service.selectAllData();
        model.addAttribute("exhbnList", vo);

        ArrayList<CourseVO> courseVo = courseService.selectCourse();
        model.addAttribute("courseList", courseVo);

        return "course/courseMain";

        // course board view
    }

    // course list view
    @RequestMapping("/course/list")
    public String selectCourse(Model model) {
        ArrayList<CourseVO> vo = courseService.selectCourse();
//        ArrayList<String[]> tag = new ArrayList<String[]>();
//        for (CourseVO i : vo) {
//            String[] temp = i.getCourseTag().split(";;");
//            tag.add(temp);
//        }
        model.addAttribute("courseList", vo);
//        model.addAttribute("tag", tag);

        return "course/courseBoard";
    }

    // 코스 상세 보기
    @RequestMapping("/course/{courseId}")
    public String selectCoursePost(@PathVariable("courseId") int courseId,
                                   HttpSession session,
                                   Model model,
                                   HttpServletResponse response) throws Exception {
        CourseVO vo = courseService.selectCoursePost(courseId);
        ArrayList<CourseCommentVO> commentVo = courseService.selectCourseComment(courseId);
        ArrayList<CourseListItemVO> result = new ArrayList<CourseListItemVO>();
        // 구분자 분리
        String[] placeName = vo.getPlaceNames().split(";;");
        String[] placeMemo = vo.getPlaceMemos().split(";;");

        for (int i=0; i<placeName.length; i++) {
            CourseListItemVO temp = new CourseListItemVO();
            temp.setPlace_name(placeName[i]);
            temp.setCategory_group_name(vo.getCategoryNames().split(";;")[i]);
            temp.setPhone(vo.getPhones().split(";;")[i]==null ? "" : vo.getPhones().split(";;")[i]);
            temp.setAddress_name(vo.getAddressNames().split(";;")[i]);
            temp.setRoad_address_name(vo.getRoadAddressNames().split(";;")[i]);
            temp.setX(vo.getPostionX().split(";;")[i]);
            temp.setY(vo.getPositionY().split(";;")[i]);
            temp.setPlace_url(vo.getPlaceUrls().split(";;")[i]);
            result.add(temp);
        }
        if (placeMemo.length!=0) {
            for (int i = 0; i < placeMemo.length; i++) {
                result.get(i).setPlace_memo(vo.getPlaceMemos().split(";;")[i].length() ==0 ? "" : vo.getPlaceMemos().split(";;")[i]);
            }
        }

        model.addAttribute("cComment",commentVo);
        model.addAttribute("course", vo);
        model.addAttribute("courseItem", result);

        return "course/courseDetailView";
    }

//    @RequestMapping("/course/{courseId}")
//    public String selectCoursePost(@PathVariable("courseId") int courseId,
//                                   HttpSession session,
//                                   Model model) throws Exception {
//        CourseVO vo = courseService.selectCoursePost(courseId);
//        ArrayList<CourseCommentVO> commentVo = courseService.selectCourseComment(courseId);
//        model.addAttribute("course", vo);
//        model.addAttribute("cComment",commentVo);
//
////        ArrayList<String[]> sites = new ArrayList<String[]>();
////        String[] siteName = vo.getCourseSitesArr().split(";;");
////        String[] siteAddress = vo.getCourseAddressArr().split(";;");
////        String[] siteMemo = vo.getCourseMemoArr().split(";;");
//
////        model.addAttribute("siteName", siteName);
////        model.addAttribute("siteAddress", siteAddress);
////        model.addAttribute("siteMemo", siteMemo);
//
//        return "course/courseDetailView";
//    }
//
//    // 새 포스트 작성
    @RequestMapping("/course/newPost/{exhbnId}")
    public String writeCoursePost(@PathVariable("exhbnId") int exhbnId,
                                  HttpSession session,
                                  Model model) {

        ArrayList<String[]> sites = new ArrayList<String[]>();

        ExhbnVO vo = service.selectDetailData(exhbnId);
        model.addAttribute("exhbn", vo);

        return "course/courseDetailPost";
    }
//
//    // 포스트 보기
    @ResponseBody
    @RequestMapping("/course/getCourse")
    public ArrayList<CourseListItemVO> getCourse(int courseId,
                                              HttpSession session,
                                              Model model) throws Exception {
        CourseVO vo = courseService.selectCoursePost(courseId);
        ArrayList<CourseListItemVO> result = new ArrayList<>();
        // 구분자 분리
        String[] placeName = vo.getPlaceNames().split(";;");
        String[] placeMemo = vo.getPlaceMemos().split(";;");

        for (int i=0; i<placeName.length; i++) {
            CourseListItemVO temp = new CourseListItemVO();
            temp.setPlace_name(placeName[i]);
            temp.setCategory_group_name(vo.getCategoryNames().split(";;")[i]);
            temp.setPhone(vo.getPhones().split(";;")[i]==null ? "" : vo.getPhones().split(";;")[i]);
            temp.setAddress_name(vo.getAddressNames().split(";;")[i]);
            temp.setRoad_address_name(vo.getRoadAddressNames().split(";;")[i]);
            temp.setX(vo.getPostionX().split(";;")[i]);
            temp.setY(vo.getPositionY().split(";;")[i]);
            temp.setPlace_url(vo.getPlaceUrls().split(";;")[i]);
            result.add(temp);
        }
        if (placeMemo.length!=0) {
            for (int i = 0; i < placeMemo.length; i++) {
                result.get(i).setPlace_memo(vo.getPlaceMemos().split(";;")[i].length() ==0 ? "" : vo.getPlaceMemos().split(";;")[i]);
            }
        }

        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(result);
        System.out.println(jsonString);

        return result;
    }
//
//    // 포스트 수정
////    @RequestMapping("/course/{courseId}/edit")
////    public String courseDetailEdit(@PathVariable("courseId") int courseId,
////                                   HttpSession session,
////                                   Model model) throws Exception {
////        CourseVO vo = courseService.selectCoursePost(courseId);
////        model.addAttribute("course", vo);
////        return "course/courseDetailEdit";
////    }
//
}
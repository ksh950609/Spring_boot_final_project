package com.spring_boot_final.project.controller.exhbn;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_final.project.model.ExhbnVO;
import com.spring_boot_final.project.model.NoteVO;
import com.spring_boot_final.project.model.PageVO;
import com.spring_boot_final.project.service.ExhbnService;

@Controller
public class ExhbnViewController {

	@Autowired
	ExhbnService service;

	// @RequestMapping("/exhbn/searchlist")
//    public String searchlist(
	/*
	 * @RequestParam int page,
	 * 
	 * @RequestParam String category,
	 * 
	 * @RequestParam String sort,
	 */
	// @RequestParam String keyword,
	/* HttpSession session, */
	// Model model
	// ) {

//        System.out.println(keyword + " ");
	/*
	 * System.out.println(sort + " " + keyword);
	 */
	// ArrayList<ExhbnVO> vo = service.searchList(keyword);
	// model.addAttribute("exhbnList", vo);

	/*
	 * for (int i = 0; i < vo.size(); i++) { String tagRemove =
	 * vo.get(i).getNote().replaceAll(
	 * "<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	 * vo.get(i).setNote(tagRemove.substring(0, (tagRemove.length() < 120 ?
	 * tagRemove.length() : 120)));
	 * 
	 * if (session.getAttribute("sid") != null)
	 * vo.get(i).setNoteLikeCheck(noteService.noteLikeCheck(vo.get(i),
	 * session.getAttribute("sid").toString())); }
	 * 
	 * model.addAttribute("list", vo); model.addAttribute("maxDataNum",
	 * noteService.selectNoteCount(category, keyword) - 1); if
	 * (category.equals("EVENT")) return "note/event"; return "note/list";
	 */
//        return "searchResult";

	// }

	// detail page view
	@GetMapping("/exhbn/detail/{id}")
	public String detailTestView(@PathVariable int id, Model model) {

		ExhbnVO vo = service.selectDetailData(id);
		model.addAttribute("exhbn", vo);

		return "detail";
	}

	// detail page view
	@RequestMapping("/exhbn/list")
	public String listTestView(Model model) {

		ArrayList<ExhbnVO> vo = service.selectAllData();
		model.addAttribute("exhbnList", vo);

		return "list";
	}

	// detail search
	@RequestMapping("/exhbn/searchResult222")
	public String ExhbitonSearch(@RequestParam("exhbnTitle") String title, Model model) {
		ArrayList<ExhbnVO> exhbnSearch = service.exhbnSearch(title);
		model.addAttribute("exhbnSearchList", exhbnSearch);

		// System.out.println(title);

		for (int i = 0; i < exhbnSearch.size(); i++) {
			System.out.println(exhbnSearch.get(i).getExhbnId());
		}

		return "searchResult";
	}

	@RequestMapping("/exhbn/tab_exhbnSearch")
	public String tab_ExhbitonSearch(@RequestParam("exhbnType") String type, Model model) {
		ArrayList<ExhbnVO> tab_exhbnSearch = service.TabSearch(type);
		model.addAttribute("exhbnSearchList", tab_exhbnSearch);

		System.out.println(type);

		for (int i = 0; i < tab_exhbnSearch.size(); i++) {
			System.out.println(tab_exhbnSearch.get(i).getExhbnId());
		}

		return "searchResult";

	}
	
	@RequestMapping("/exhbn/tab_exhbnSearch2")
	public String tab_ExhbitonSearch2(@RequestParam("exhbnType") String type, Model model) {
		ArrayList<ExhbnVO> tab_exhbnSearch = service.TabSearch2(type);
		model.addAttribute("exhbnSearchList", tab_exhbnSearch);

		System.out.println(type);

		for (int i = 0; i < tab_exhbnSearch.size(); i++) {
			System.out.println(tab_exhbnSearch.get(i).getExhbnId());
		}

		return "searchResult";

	}
	@RequestMapping("/exhbn/tab_exhbnSearch3")
	public String tab_ExhbitonSearch3(@RequestParam("exhbnType") String type, Model model) {
		ArrayList<ExhbnVO> tab_exhbnSearch = service.TabSearch3(type);
		model.addAttribute("exhbnSearchList", tab_exhbnSearch);

		System.out.println(type);

		for (int i = 0; i < tab_exhbnSearch.size(); i++) {
			System.out.println(tab_exhbnSearch.get(i).getExhbnId());
		}

		return "searchResult";

	}
	
	@RequestMapping("/exhbn/tab_exhbnSearch4")
	public String tab_ExhbitonSearch4(@RequestParam("exhbnType") String type, Model model) {
		ArrayList<ExhbnVO> tab_exhbnSearch = service.TabSearch4(type);
		model.addAttribute("exhbnSearchList", tab_exhbnSearch);

		System.out.println(type);

		for (int i = 0; i < tab_exhbnSearch.size(); i++) {
			System.out.println(tab_exhbnSearch.get(i).getExhbnId());
		}

		return "searchResult";

	}

	@RequestMapping("/exhbn/tab_exhbnSearch5")
	public String tab_ExhbitonSearch5(@RequestParam("exhbnType") String type, Model model) {
		ArrayList<ExhbnVO> tab_exhbnSearch = service.TabSearch5(type);
		model.addAttribute("exhbnSearchList", tab_exhbnSearch);

		System.out.println(type);

		for (int i = 0; i < tab_exhbnSearch.size(); i++) {
			System.out.println(tab_exhbnSearch.get(i).getExhbnId());
		}

		return "searchResult";

	}
	//탭 메뉴 복사 하는데 변경해야 할 것 
	//js Url 변경시키기, var 변수 변경
	@RequestMapping("/exhbn/tab_exhbnSearch6")
	public String tab_ExhbitonSearch6(@RequestParam("exhbnType") String type, Model model) {
		ArrayList<ExhbnVO> tab_exhbnSearch = service.TabSearch6(type);
		model.addAttribute("exhbnSearchList", tab_exhbnSearch);

		System.out.println(type);

		for (int i = 0; i < tab_exhbnSearch.size(); i++) {
			System.out.println(tab_exhbnSearch.get(i).getExhbnId());
		}

		return "searchResult";

	}
}

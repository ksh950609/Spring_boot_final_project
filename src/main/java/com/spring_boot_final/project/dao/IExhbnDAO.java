package com.spring_boot_final.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.spring_boot_final.project.model.ExhbnVO;
import com.spring_boot_final.project.model.NoteVO;

@Component
public interface IExhbnDAO {

    //Create
    void insertExhbn(ExhbnVO vo);

    //Read
    ExhbnVO selectExhbn(int exhbnId);
    ArrayList<ExhbnVO> selectAllExhbn();
    int existExhbn(int exhbnId);

    //Update
    void updateExhbn(ExhbnVO vo);

    //Delete
    void deleteExhbn(int exhbnId);
    
    // Search
	public ArrayList<ExhbnVO> ExhbnSearch(String title); // 상품 검색
	

	 //tab Search
	public ArrayList<ExhbnVO> tab_ExhbnSearch(String type); 
	public ArrayList<ExhbnVO> tab_ExhbnSearch2(String type); 
	public ArrayList<ExhbnVO> tab_ExhbnSearch3(String type); 
	public ArrayList<ExhbnVO> tab_ExhbnSearch4(String type); 
	public ArrayList<ExhbnVO> tab_ExhbnSearch5(String type); 
	public ArrayList<ExhbnVO> tab_ExhbnSearch6(String type); 




	 
}

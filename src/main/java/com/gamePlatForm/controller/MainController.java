package com.gamePlatForm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamePlatForm.dto.FaceWritingDto;
import com.gamePlatForm.service.FaceWritingService;

/**
 * 게시글 작성 컨트롤러
 * @ author : GOOHOON
 * @ version 1.0
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private FaceWritingService faceWritingService;
	
    /*
     ** 메인 페이지 이동
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String write(HttpSession session, HttpServletRequest request) throws Exception{
    	
        return "/index";
    }

    /*
     ** 메인페이지 비동기 페이징 처리
     */    
    @RequestMapping(value = "/getMainPagingList", method = RequestMethod.GET)
    public @ResponseBody List<FaceWritingDto> getPagingList(HttpSession session, HttpServletRequest request, @RequestParam(value="page") String page) throws Exception{
    	
    	FaceWritingDto faceWritingDto = new FaceWritingDto();
    	faceWritingDto.setPage(Integer.parseInt(page));
    	List<FaceWritingDto> writingDtlDtoList = faceWritingService.getMainPageFaceWritingList(faceWritingDto);

        return writingDtlDtoList;
    }   
    
}

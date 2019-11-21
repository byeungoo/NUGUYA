package com.gamePlatForm.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
	// 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
	
	//리눅스
	private static final String PREFIX_URL = "/home/ubuntu/tomcat8/webapps/data";
	
	//윈도우
	//private static final String SAVE_PATH =  "nuguya";
	//private static final String PREFIX_URL = "C:\\";
	
	public String restore(MultipartFile multipartFile, String path) {
		String url = null;
		
		try {
			
			File Folder = new File(PREFIX_URL + path);

			// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
			if (!Folder.exists()) {
				Folder.mkdirs(); //상위디렉토리 포함 폴더 생성
				
				// 폴더 권한 부여			
				Runtime.getRuntime().exec("chmod -R 777 " + PREFIX_URL + path );
			}
			
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			String size = Long.toString(multipartFile.getSize());
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(size, extName);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			writeFile(multipartFile, saveFileName, path);
			url = "/data" + path + saveFileName;
			System.out.println(url);
						
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return url;
	}
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String size, String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += size;

		fileName += extName;
		
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName, String path)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(PREFIX_URL + path + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
	
	//앱이름과 년도일을 이용한 path 생성
	public String makeSaveFilePath(String appName) {
		
		String path = "/" + appName + "/";
		Calendar cal = Calendar.getInstance(); 
		//현재 년도, 월, 일
		String year = Integer.toString(cal.get ( cal.YEAR ));
		String month = Integer.toString(cal.get ( cal.MONTH ) + 1);
		String date = Integer.toString(cal.get ( cal.DATE ));
		
		path = path + year + "/" + month + "/" + date;
		
		return path;	
	}
}

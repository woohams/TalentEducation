package com.prj.te.model.biz;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.prj.te.dto.BoardLectureDto;
import com.prj.te.model.dao.BoardLectureDao;

@Service
public class BoardLectureBizImpl implements BoardLectureBiz {
	
	@Autowired
	BoardLectureDao lectureDao;

	@Override
	public List<BoardLectureDto> selectList() {
		return lectureDao.selectList();
	}
	@Override
	public BoardLectureDto selectOne(int seq) {
		return lectureDao.selectOne(seq);
	}

	@Override
	public BoardLectureDto selectOneLive(String id) {
		return lectureDao.selectOneLive(id);
	}


	@Override
	public int insertLecture(BoardLectureDto dto) {
		return lectureDao.insertLecture(dto);
	}

	@Override
	public int updateLecture(BoardLectureDto dto) {
		return lectureDao.updateLecture(dto);
	}

	@Override
	public int deleteLecture(int seq) {
		return lectureDao.deleteLecture(seq);
	}
	
	@Override
	public String restore(MultipartFile multipartfile,HttpServletRequest request) {
		String url = null;
	
		try {
			// 파일 정보
			String originFilename = multipartfile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartfile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			
			
			String imagePath = request.getSession().getServletContext().getRealPath("/");
			System.out.println(imagePath);
			writeFile(multipartfile, saveFileName, imagePath);
			url = "\\te\\" + saveFileName;
			System.out.println(url+"----------------------");
			
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
	private String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName, String imagePath)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(imagePath + "\\" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
	



}

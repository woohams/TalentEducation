package com.prj.te;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

	@Resource(name = "uploadPath")
	String uploadPath;
	
	@RequestMapping(value = "/uploadimage.do", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String imgPath = root + "resources\\images\\upload";
		
		System.out.println(imgPath);
		
		File folder = new File(imgPath);
		
		if(!folder.exists()) {
			try {
				folder.mkdir();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
		String seq = request.getParameter("memberseq");
		String imgName = "lec_m" + seq + sdf.format(today) + ".jpg";
		
		File target = new File(imgPath, imgName);
		
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("imgName", imgName);
		
		return "imgtest";
	}
}

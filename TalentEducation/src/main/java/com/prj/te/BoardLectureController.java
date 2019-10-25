package com.prj.te;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.prj.te.dto.BoardLectureDto;
import com.prj.te.model.biz.BoardLectureBiz;

@Controller
public class BoardLectureController {
	
	@Autowired
	BoardLectureBiz lectureBiz;
	

	@RequestMapping(value = "/boardlist.do")
	public String boardList(Model model) {
		
		List<BoardLectureDto> list = lectureBiz.selectList();
		
		model.addAttribute("lectureList", list);
		
		return "boardlist";
	}
	
	@RequestMapping(value = "/selectone.do")
	public String selectOne(Model model, HttpServletRequest request) {
		
		int seq = Integer.parseInt(request.getParameter("boardseq"));
		BoardLectureDto dto = lectureBiz.selectOne(seq);
		
		model.addAttribute("lecture", dto);
		
		return "boardselectone";
	}
	
	@RequestMapping(value = "/lectureinsert.do", method = RequestMethod.GET)
	public String lectureInsertForm() {
		return "lectureinsert";
	}
	
	@RequestMapping(value = "/lectureinsert.do", method = RequestMethod.POST)
	public String lectureInsert(@ModelAttribute BoardLectureDto dto) {

		int res = lectureBiz.insertLecture(dto);
		if(res > 0) {
			return "redirect:/boardlist.do";
		}else {
			return "redirect:/lectureinsert.do";
		}
		
	}

	@RequestMapping(value = "/lectureupdate.do", method = RequestMethod.POST)
	public String lectureUpdate(Model model, HttpServletRequest request) {
		
		int seq = Integer.parseInt(request.getParameter("boardseq"));
		BoardLectureDto dto = lectureBiz.selectOne(seq);
		
		model.addAttribute("lecture", dto);
		
		return "lectureupdate";
	}
	@RequestMapping(value = "/lectureupdateres.do", method = RequestMethod.POST)
	public String lectureUpdateRes(Model model, @ModelAttribute BoardLectureDto dto) {
		
		int res = lectureBiz.updateLecture(dto);
		
		if(res > 0) {
			return "redirect:/selectone.do?boardseq=" + dto.getBoard_lecture_seq();
		}else {
			BoardLectureDto dto0 = lectureBiz.selectOne(dto.getBoard_lecture_seq());
			
			model.addAttribute("lecture", dto0);
			return "lectureupdate";
		}
		
	}
	
	@RequestMapping(value = "/lecturedelete.do", method = RequestMethod.POST)
	public String lectureDelete(HttpServletRequest request) {

		int seq = Integer.parseInt(request.getParameter("boardseq"));
		
		int res = lectureBiz.deleteLecture(seq);
		
		if(res > 0) {
			return "redirect:/boardlist.do";
		}else {
			return "redirect:/selectone.do?boardseq=" + seq;
		}
		
	}


	@RequestMapping(value = {"/openroom.do", "/member/openroom.do"})
	public String openRoom(Model model, HttpServletRequest request) {
		String isTutor = request.getParameter("isTutor");
		String tutorId = request.getParameter("tutorId");
		String myId = request.getParameter("myId");
		int roomNo = 0;
		
		String url = "chattingroom";
		if(isTutor.equals("true")) {
			url = "createroom";
		}else {
			BoardLectureDto lectureDto = lectureBiz.selectOneLive(tutorId);
			roomNo = lectureDto.getBoard_lecture_seq();
		}

		model.addAttribute("url", url);
		model.addAttribute("myId", myId);
		model.addAttribute("roomNo", roomNo);
		
		return "openroom";
	}
	
	@RequestMapping(value= "/summerImgUpload.do", method= {RequestMethod.GET, RequestMethod.POST} )
	@ResponseBody
	public Map<String, Object> uploadfile1(HttpServletRequest request,		
			@RequestParam("uploadFile") MultipartFile multipartFile) throws IOException {
		
		String url = lectureBiz.restore(multipartFile,request);
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", url);
		
		System.out.println(map);
		
		return map;
		
	}
	
	@RequestMapping(value = "/kakaopay.do", method = RequestMethod.GET)
	public String kakaoPay(HttpServletRequest request, HttpServletResponse response, String partner_order_id, String partner_user_id, String item_name, String quantity, String total_amount) throws IOException {
		
		HttpSession session = request.getSession();
		
		URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST"); // POST 방식으로 요청
		conn.setRequestProperty("Authorization", "KakaoAK bc657bea8c1dd8e86875b3cf144b17de"); 
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"); 
		conn.setDoInput(true); 
		conn.setDoOutput(true); 
        
//		String partner_order_id = request.getParameter("partner_order_id");
//		String partner_user_id = request.getParameter("partner_user_id");
//		String item_name = request.getParameter("item_name");
//		String quantity = request.getParameter("quantity");
//		String total_amount = request.getParameter("total_amount");
		
		System.out.println(partner_order_id+partner_user_id+item_name+quantity+total_amount);

		Map<String, String> params = new HashMap<String, String>();

        params.put("cid", "TC0ONETIME");
        params.put("partner_order_id", partner_order_id);
        params.put("partner_user_id", partner_user_id);
        params.put("item_name", item_name);
        params.put("quantity", quantity);
        params.put("total_amount", total_amount);
        params.put("tax_free_amount", "0");
        params.put("approval_url", "http://localhost:8787/te/approval.do");
        params.put("cancel_url", "http://localhost:8787/te/cancel.jsp");
        params.put("fail_url", "http://localhost:8787/te/fail.jsp");
        
        String string_params = new String();
		for(Map.Entry<String, String> elem : params.entrySet()) {
			string_params += (elem.getKey() + "=" + elem.getValue() + "&");
		}
        
        System.out.println(string_params);
        
        OutputStream out = conn.getOutputStream();
        out.write(string_params.getBytes());
        out.flush();
        out.close(); // POST 호출
 
        
        
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String successUrl = null; // 준비 성공 시 연결할 url
		
        
        try { // 응답받은 json 파싱작업
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(in);
			
			session.setAttribute("tid", (String)obj.get("tid"));
			session.setAttribute("partner_order_id", partner_order_id);
			session.setAttribute("partner_user_id", partner_user_id);
			session.setAttribute("item_name", item_name);
		
			successUrl = (String)obj.get("next_redirect_pc_url");
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			in.close(); // 응답 스트림 닫기	
		}
		return "redirect:"+successUrl; 
	}
	
	@RequestMapping(value = "/approval.do", method = RequestMethod.GET)
	public String kakaoPay(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam String pg_token) throws IOException {
		
		HttpSession session = request.getSession();
		
		URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST"); 
		conn.setRequestProperty("Authorization", "KakaoAK bc657bea8c1dd8e86875b3cf144b17de"); 
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"); 
		conn.setDoInput(true); 
		conn.setDoOutput(true); 
		
		String tid = (String)session.getAttribute("tid");
		String partner_order_id = (String)session.getAttribute("partner_order_id");
		String partner_user_id = (String)session.getAttribute("partner_user_id");
	
		Map<String, String> map = new HashMap<String, String>();
		map.put("cid", "TC0ONETIME");
		map.put("tid", tid);
		map.put("partner_order_id", partner_order_id);
		map.put("partner_user_id", partner_user_id);
		map.put("pg_token", pg_token);
		
		StringBuffer param = new StringBuffer();
		for(Map.Entry<String, String> one : map.entrySet()) {
			param.append(one.getKey() + "=" + one.getValue() + "&");
		}
		
		conn.getOutputStream().write(param.toString().getBytes());
		
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		
		try {
			JSONParser parse = new JSONParser();
			JSONObject obj = (JSONObject)parse.parse(in);
			
			String amount = obj.get("amount").toString();
			System.out.println(amount);
			JSONObject amountObj = (JSONObject)parse.parse(amount);
			String total = amountObj.get("total").toString();
			System.out.println(total);
			
			
			model.addAttribute("approved_at", (String)obj.get("approved_at"));
			model.addAttribute("partner_order_id", (String)obj.get("partner_order_id"));
			model.addAttribute("item_name", (String)obj.get("item_name"));
			model.addAttribute("quantity", obj.get("quantity"));
			model.addAttribute("amount", obj.get("amount"));
			model.addAttribute("payment_method_type", (String)obj.get("payment_method_type"));
			
			
			} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			in.close();
		}
	
		return "approval";
	}

}

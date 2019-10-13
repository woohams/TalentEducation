	var naver_id_login = new naver_id_login("CQCVSo1bGXvj408kAJib", "http://localhost:8787/te/naverlogin.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setPopup();
  	naver_id_login.setButton("green", 3, 49);
  	naver_id_login.setDomain("http://localhost:8787/te/naverlogin.do");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();

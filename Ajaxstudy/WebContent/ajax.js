//ajaxstudy/WebContent/ajax.js
var ajax = null;	//전역변수
function getAjaxObject() {	//ajax 객체를 생성 함수
	if (window.ActiveXObject) {	//익스플로러 브라우저(ActiveXObject를 가지고 있는 브라우저)
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) {	//익스플로러 이외의 브라우저
		return new XMLHttpRequest();	//ajax 객체. 서버와 통신이 가능한 객체
	} else {
		return null;
	}
}
/*
 * url : "hello.jsp"
 * params : "name=홍길동"
 * callback : helloFromServer
 * method : "POST:
 */
function sendRequest(url, params, callback, method) {
	//ajax : ajax 객체 저장. XMLHttpRequest 객체
	ajax = getAjaxObject();
	//httpMethod : 요청 방식의 설정
	var httpMethod = method ? method : "GET";
	if (httpMethod != "GET" && httpMethod != "POST") {
		httpMethod = "GET";
	}
	//httpParams : name=홍길동
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if (httpMethod == "GET" && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;	//GET방식인 경우 url에 파라미터 정보를 붙여서 전송
	}
	//true : 비동기 방식 전송
	ajax.open(httpMethod, httpUrl, true);	//ajax 객체 준비
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.onreadystatechange = callback;	//callback 함수 등록(helloFromServer) 서버가 클라이언트의 함수를 다시 호출하는 함수(ajax 상태가 바뀔 때 마다 자동으로 호출되는 함수)
	ajax.send(httpMethod == "POST" ? httpParams : null);	//서버로 전송
}
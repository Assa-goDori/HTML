// WebContent/ajax2.js
var ajax = {}	//객체
ajax.xhr = {};	//ajax에 또 다른 xhr 객체
/*
 * ajax.xhr.Requst 객체의 생성자.
 * 	멤버 변수 : url, params, callback, method, req
 * 	멤버 메서드 : send, getXmlHttpRequest, onStateChange
 */
ajax.xhr.Request = function(url, params, callback, method) {	//생성자
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();
}
//prototype : 멤버메서드 구현.
ajax.xhr.Request.prototype = {
		//getXmlHttpRequest : XmlHttpRequest 객체 생성 기능을 가진 메서드
		getXmlHttpRequest : function() {
			if(window.ActiveXObject) {
				try {
					return new ActiveXObject("Msxml2.XMLHTTP");
				} catch(e) {
					try {
						return new ActiveXObject("Microsoft.XMLHTTP");
					} catch(e2) { return null; }
				}
			} else if (window.XMLHttpRequest) {
				return new XMLHttpRequest();
			} else {
				return null;
			}
		},
		send : function() {
			//this.req : ajax 객체 저장. (XmlhttpRequest 객체)
			this.req = this.getXmlHttpRequest();
			var httpMethod = this.method?this.method:"GET";
			if(httpMethod != "GET" && httpMethod != "POST") {
				httpMethod = "GET";
			}
			var httpParams = (this.params == null || this.params == '')?null:this.params;
			var httpUrl = this.url;
			if(httpMethod == 'GET' && httpParams != null) {
				httpUrl = httpUrl + "?" + httpParams;
			}
			this.req.open(httpMethod,httpUrl,true);
			this.req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			var request = this;		//ajax.xhr.Request 객체를 request라는 지역변수에 선언
			//onreadystatechange : 콜백함수 등록
			this.req.onreadystatechange = function() {
				request.onStateChange.call(request);
			}
			this.req.send(httpMethod=="POST"?httpParams:null);
		},
		onStateChange : function() {
			this.callback(this.req);	//콜백 함수 호출
		}
}
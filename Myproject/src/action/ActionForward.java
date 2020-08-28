package action;

public class ActionForward {
	private boolean redirect;
	private String view;
	
	public ActionForward() { }
	
	public ActionForward(boolean redirect, String view) {
		this.redirect = redirect;
		this.view = view;
	}
	//setter,getter
	public boolean isRedirect() {	//getter, 리턴타입이 boolean인경우 get이 아닌 is
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}
}
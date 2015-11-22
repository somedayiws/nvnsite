package controller;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.ArrayList;

public class SessionCounter implements HttpSessionListener {

	@SuppressWarnings("rawtypes")
	private List sessions = new ArrayList();
	private int view = 3858;

	public SessionCounter() {}

	@SuppressWarnings("unchecked")
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		sessions.add(session.getId());
		view++;
		session.setAttribute("counter", this);
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		sessions.remove(session.getId());

		session.setAttribute("counter", this);
	}
	
	public int getActiveView() {
		return view;
	}
	
	public int getActiveSessionNumber() {
		return sessions.size();
	}
}
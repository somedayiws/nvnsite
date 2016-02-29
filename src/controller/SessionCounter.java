package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.ArrayList;

public class SessionCounter implements HttpSessionListener {

	@SuppressWarnings("rawtypes")
	private List sessions = new ArrayList();
	private int view = 7389;

	public SessionCounter() {
	}

	@SuppressWarnings("unchecked")
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		sessions.add(session.getId());
//		String realPath = session.getServletContext().getRealPath("/counter.txt");
//		FileInputStream fis;
//		try {
//			fis = new FileInputStream(realPath);
//			
//		} catch (FileNotFoundException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		view++;
		session.setAttribute("counter", this);
//		System.out.println(realPath);
//		FileOutputStream fos;
//		try {
//			fos = new FileOutputStream(realPath);
//			PrintWriter pw = new PrintWriter(fos);
//			pw.println(view);
//			pw.close();
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
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
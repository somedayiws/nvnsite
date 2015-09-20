package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.bean.QUANGCAO;
import model.bo.AdvertisementBO;

/**
 * Servlet implementation class AdvertisementServlet
 */
@WebServlet("/admin/AdvertisementServlet")
public class AdvertisementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdvertisementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		String createAdv;
	
		boolean isMultipart = ServletFileUpload
				.isMultipartContent(request);				
		if (!isMultipart) {
			System.out.println("vào");
			String company;
			String link;
			String page;
			String positionInHome;
			String positionInNoHome;
			String display;
			String date;
			String numberOfDay;
			String Image;
			String size;
			String price;
			
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			@SuppressWarnings("rawtypes")
			List items = null;
			
			
		
			
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}

			@SuppressWarnings("rawtypes")
			
			Iterator iter = items.iterator();
			@SuppressWarnings("rawtypes")
			Hashtable params = new Hashtable();
			String filename = null;
			while (iter.hasNext()) {

				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					params.put(item.getFieldName(),item.getString("UTF-8"));
				} else {
					try {
						String itemName = item.getName();
						
						System.out.println("itemName: "+itemName);
						filename = itemName.substring(itemName
								.lastIndexOf("\\") + 1);
						System.out.println("filename: "+filename);
						String realPath = getServletContext().getRealPath("/")+ "images\\" + filename;
						
						System.out.println("realPath: "+realPath);
						File savedFile = new File(realPath);
						@SuppressWarnings("unused")
						FileCleanerCleanup item2 = new FileCleanerCleanup();
						// Upload file l�n server
						item.write(savedFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}			
			company = (String) params.get("company");
			link = (String) params.get("link");		
			page = (String) params.get("page");
			positionInHome = (String) params.get("positionInHome");
			positionInNoHome = (String) params.get("positionInNoHome");
			date = (String) params.get("date");
			numberOfDay = (String) params.get("numberOfDay");
			Image = (String) params.get("Image");
			size = (String) params.get("size");
			price = (String) params.get("price");
			
			display = (String) params.get("display");
			
			System.out.println("company: "+company);
			System.out.println("link: "+link);
			System.out.println("page: "+page);
			System.out.println("positionInHome: "+positionInHome);
			System.out.println("positionInNoHome: "+positionInNoHome);
			System.out.println("date: "+date);
			System.out.println("numberOfDay: "+numberOfDay);
			System.out.println("size: "+size);
			System.out.println("price: "+price);
			System.out.println("Image: "+Image);
			System.out.println("display: "+display);
			
		}
	
		
		//Nhận lại danh sách các quảng cáo
		AdvertisementBO listAdvertisement = new AdvertisementBO();
		
		//Trang đầu tiên
		int page = 1;
		//Hiển thị ra 10 bảng ghi, hiển thị từ trang 1-> trang 5, nhiều hơn thì xuất hiện dấu chấm
		listAdvertisement.setMenu(10, 5);
		
		try {
			//Lấy giá trị page
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		ArrayList<QUANGCAO> advertisement = listAdvertisement.getAdvertisement(page);
		String pageNav = listAdvertisement.getMenuPhanTrang();
		
		request.setAttribute("advertisement", advertisement);
		request.setAttribute("pageNav", pageNav);
		
		RequestDispatcher requestDis = request.getRequestDispatcher("Advertisement.jsp");
		requestDis.forward(request, response);
	}
	
}

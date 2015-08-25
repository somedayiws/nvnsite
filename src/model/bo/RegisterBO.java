package model.bo;

import model.bean.TAIKHOAN;

public class RegisterBO {
	
	/**Attribute and Object*/
	public String error;
	model.dao.RegisterDAO registerDAO = new model.dao.RegisterDAO();
	
	
	/**Check exception: null, re-pass == pass, check agree rule website */
	public boolean checkException(String re_pass,String check_agree,TAIKHOAN account)
	{
		
		/*------Check null-----------*/
		
		if(check_agree == null) //not check rule
		{			
			error ="You must agree rule of website";
			return false;
		}
		
		/*--------check re-pass-----------*/
		if(!re_pass.equals(account.getMatKhau()))
		{
			error = "re-pass must same password";
			return false;
		}
		
		/*---------check checkbox------------*/
		if(!check_agree.contains("agree"))
		{
			error = "You must agree rule of website";
			return false;
		}
		return true;
	}
	
	
	
	
	/**Check validate data input*/
	public boolean checkAccount(TAIKHOAN account)
	{
		if (Validate.check_text("Name", account.getHoTen(), 30, "text")
				&& Validate.check_text("Adress", account.getDiaChi(), 50,"text")
				&& Validate.check_text("Phone", account.getDienThoai(), 11, "phone")
				&& Validate.check_text("Email", account.getEmail(), 30, "email")
				&& Validate.check_text("Username", account.getTenTaiKhoan(), 20, "user")
				&& Validate.check_text("Password", account.getMatKhau(), 50, "pass"))
		{
			//Data valid
			return true;
		}
		else{
			error = Validate.errorValidate;
			return false;
		}
	}
	
	/**Check data input exist*/
	public boolean checkAccountexist(String username,String email) {
		if(!registerDAO.isAccexist(username,email))
		{
			return true;
		}
		else{
			error = registerDAO.errorExist;
			return false;
		}	
	}
	
	/**Get id Account last and auto incerase it*/
	public String id_Account_after_increase()
	{
		String idAccount = null;
		idAccount = registerDAO.getId_Acc_last();
		String string_result;
		
		/*if no have any Account in database*/
		if(idAccount == null)
		{
			string_result = "TK01";
		}
		else
		{
			/*Cut two character first*/
			String wordlock = idAccount.substring(0,2);
			/*Get number of id*/
			String strnumber = idAccount.substring(2);
			/*Convert characters final string into number*/
			try
			{
				int number_id = Integer.parseInt(strnumber);
				number_id++;
				if(number_id<10)
				{
					string_result = wordlock+"0"+number_id;				
				}
				else
				{
					string_result = wordlock+number_id;
				}
			}
			catch(NumberFormatException e)
			{
				return null;
			}
		}
		return string_result;
		
	}
	
	/**Insert data*/
	public boolean insertAccount(TAIKHOAN account)
	{			
		return registerDAO.insertAccount(account);
	}

	

}

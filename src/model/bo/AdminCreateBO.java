package model.bo;

import model.bean.TAIKHOAN;

public class AdminCreateBO {
	
	/**Attribute and Object*/
	public String error;
	model.dao.AdminCreateDAO adminCreate = new model.dao.AdminCreateDAO();
	
	/**Check exception:re-pass == pass */
	public boolean checkException(String re_pass,String pass)
	{
		
		/*--------check re-pass-----------*/
		if(!re_pass.equals(pass))
		{
			error = "re-pass must same password";
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
		if(!adminCreate.isAccexist(username,email))
		{
			return true;
		}
		else{
			error = adminCreate.errorExist;
			return false;
		}	
	}
	
	/**Get id Account last and auto incerase it*/
	public String id_Account_after_increase()
	{
		String idAccount = null;
		idAccount = adminCreate.getId_Acc_last();
		String string_result;
		
		/*if no have any Account in database*/
		if(idAccount == null)
		{
			string_result = "TK000000001";						
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
				string_result = wordlock;
				if(number_id<100000000)
				{
					for(int j=0;j<(8-String.valueOf(number_id).length());j++){
						string_result+="0";
					}
					string_result+=String.valueOf(number_id);				
				}
				else
				{
					string_result = wordlock+String.valueOf(number_id);
				}
				if(string_result.length()>11){
					return null;
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
		return adminCreate.insertAccount(account);
	}
	public void closeConnection() {
		adminCreate.closeConnection();
	}
}

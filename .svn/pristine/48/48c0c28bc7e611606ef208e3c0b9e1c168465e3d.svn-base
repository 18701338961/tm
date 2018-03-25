package com.tm.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class CommonUtils {
	
	public static String getMD5Pssword(String password) {
		MessageDigest md;
		   try {
		    // 鐢熸垚涓�釜MD5鍔犲瘑璁＄畻鎽樿
		    md = MessageDigest.getInstance("MD5");
		    // 璁＄畻md5鍑芥暟
		    md.update(password.getBytes());
		    // digest()鏈�悗纭畾杩斿洖md5 hash鍊硷紝杩斿洖鍊间负8涓哄瓧绗︿覆銆傚洜涓簃d5 hash鍊兼槸16浣嶇殑hex鍊硷紝瀹為檯涓婂氨鏄�浣嶇殑瀛楃
		    // BigInteger鍑芥暟鍒欏皢8浣嶇殑瀛楃涓茶浆鎹㈡垚16浣峢ex鍊硷紝鐢ㄥ瓧绗︿覆鏉ヨ〃绀猴紱寰楀埌瀛楃涓插舰寮忕殑hash鍊�		    
		    String pwd = new BigInteger(1, md.digest()).toString(16);
		    return pwd;
		   } catch (Exception e) {
		    e.printStackTrace();
		   }
		   return password;
		}
	
	public static String getUUID() {  
        UUID uuid = UUID.randomUUID();  
        String str = uuid.toString();  
        // 鍘绘帀"-"绗﹀彿  
        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);  
        return temp;
	}
	
	public static String getyyyymmddHHmmssTime() {
		
		//浣跨敤榛樿鏃跺尯鍜岃瑷�幆澧冭幏寰椾竴涓棩鍘� 
		Calendar cale = Calendar.getInstance();  
		//灏咰alendar绫诲瀷杞崲鎴怐ate绫诲瀷  
		Date tasktime=cale.getTime();  
		//璁剧疆鏃ユ湡杈撳嚭鐨勬牸寮� 
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		//鏍煎紡鍖栬緭鍑� 
		return df.format(tasktime);  
	}
	public static String getyyyymmddHHmmssTime(Date date) {
		
		//璁剧疆鏃ユ湡杈撳嚭鐨勬牸寮� 
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		//鏍煎紡鍖栬緭鍑� 
		return df.format(date);  
	}
	
	public static boolean isValidDate(String str) {
	      boolean convertSuccess=true;
	      // 鎸囧畾鏃ユ湡鏍煎紡涓哄洓浣嶅勾/涓や綅鏈堜唤/涓や綅鏃ユ湡锛屾敞鎰弝yyy/MM/dd鍖哄垎澶у皬鍐欙紱
	       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	       try {
	    // 璁剧疆lenient涓篺alse. 鍚﹀垯SimpleDateFormat浼氭瘮杈冨鏉惧湴楠岃瘉鏃ユ湡锛屾瘮濡�007/02/29浼氳鎺ュ彈锛屽苟杞崲鎴�007/03/01
	          format.setLenient(false);
	          format.parse(str);
	       } catch (ParseException e) {
	          // e.printStackTrace();
	// 濡傛灉throw java.text.ParseException鎴栬�NullPointerException锛屽氨璇存槑鏍煎紡涓嶅
	           convertSuccess=false;
	       } 
	       return convertSuccess;
	}  
	public static boolean isValidDouble(String str) {
		boolean convertSuccess=true;
		try {
			Double.parseDouble(str);
		} catch (Exception e) {
			convertSuccess=false;
		} 
		return convertSuccess;
	}
	
}

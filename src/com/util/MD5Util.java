package com.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class MD5Util {
	
	public static void main(String[] args) {
		String old = jiami("111212$asfsa@qq.com$"+System.currentTimeMillis(), "1314520China");
		String news = jiemi(old, "1314520China");

		System.out.println(news);
		System.out.println(MD5Util.getMD5(MD5Util.getMD5("111111")));

		//System.out.println(news);

		
		//System.out.println(MD5Util.getMD5(MD5Util.getMD5("sunjob5201314")));
		
	}
	
	private static String byteHEX(byte ib) {
		//默认的密码字符串组合，apache校验下载的文件的正确性用的就是默认的这个组合
		char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
				'B', 'C', 'D', 'E', 'F' };
		char[] ob = new char[2];
		ob[0] = Digit[(ib >>> 4) & 0X0F];
		ob[1] = Digit[ib & 0X0F];
		String s = new String(ob);
		return s;
	}
	
   //加密算法	
   public static String getMD5(String source){
	   MessageDigest messageDigest = null;
	try {
		// 获得MD5摘要算法的 MessageDigest 对象
		messageDigest = MessageDigest.getInstance("MD5");
	} catch (NoSuchAlgorithmException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   // 使用指定的字节更新摘要
       messageDigest.update(source.getBytes());
       // 获得密文
       byte[] b = messageDigest.digest();
       // 把密文转换成十六进制的字符串形式
       StringBuffer sb = new StringBuffer();
       for (int i=0;i<b.length;i++){
      	 sb.append(byteHEX(b[i]));
       }
       
       //sb.setCharAt(sb.length()-1, (char)(sb.charAt(sb.length()-1)+1));
       return sb.toString();
   }
   

   
    //解密
	static public String jiemi(String src, String pwd) {
		
		String Password = MD5Util.getMD5(pwd);
		// String Password = ;
		String Algorithm = "DESede";
		byte KeyBytes[] = new byte[24];
		byte PassBytes[] = Password.getBytes();

		for (int i = 0; i < 24; i++) {
			if (i < PassBytes.length)
				KeyBytes[i] = PassBytes[i];
			else
				KeyBytes[i] = 0x30;
		}
		byte[] b = hexStringToBytes(src);
		Security.addProvider(new com.sun.crypto.provider.SunJCE());
		SecretKey DesKey = new SecretKeySpec(KeyBytes, Algorithm);

		try {
			Cipher C = Cipher.getInstance(Algorithm);
			C.init(Cipher.DECRYPT_MODE, DesKey);
			byte Encrypt[] = C.doFinal(b);

			return new String(Encrypt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}

		return null;

	}

	private static byte charToByte(char c) {

		return (byte) "0123456789ABCDEF".indexOf(c);
	}

	public static byte[] hexStringToBytes(String hexString) {

		if (hexString == null || hexString.equals("")) {

			return null;

		}

		hexString = hexString.toUpperCase();

		int length = hexString.length() / 2;

		char[] hexChars = hexString.toCharArray();

		byte[] d = new byte[length];

		for (int i = 0; i < length; i++) {

			int pos = i * 2;

			d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));

		}

		return d;
	}

	//加密
	static public String jiami(String AuthStr, String pwd) {
		String Password =MD5Util.getMD5(pwd);
		String Result = "";
		try {
			byte Auth[] = AuthStr.getBytes("ASCII");
			int Len = Auth.length;
			int Mod = Len % 8;

			if (Mod != 0)
				Len += 8 - Mod;
			byte AuthBytes[] = new byte[Len];

			for (int i = 0; i < Len; i++) {
				if (i >= Auth.length)
					AuthBytes[i] = (byte) (8 - Mod);
				else
					AuthBytes[i] = Auth[i];
			}

			String Algorithm = "DESede";
			byte KeyBytes[] = new byte[24];
			byte PassBytes[] = Password.getBytes();

			for (int i = 0; i < 24; i++) {
				if (i < PassBytes.length)
					KeyBytes[i] = PassBytes[i];
				else
					KeyBytes[i] = 0x30;
			}

			Security.addProvider(new com.sun.crypto.provider.SunJCE());
			SecretKey DesKey = new SecretKeySpec(KeyBytes, Algorithm);

			Cipher C = Cipher.getInstance(Algorithm);
			C.init(Cipher.ENCRYPT_MODE, DesKey);
			byte Encrypt[] = C.doFinal(AuthBytes);

			for (int i = 0; i < Len; i++) {
				Result += String.format("%02X",
						Encrypt[i] < 0 ? (256 + Encrypt[i]) : Encrypt[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return Result;
	}
	
}

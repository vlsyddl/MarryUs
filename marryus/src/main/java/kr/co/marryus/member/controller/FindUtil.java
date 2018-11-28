package kr.co.marryus.member.controller;

import java.util.Random;

/**
 * 인증코드를 무작위로 생성하여 랜덤키 생성
 * @author suzie
 *
 */
public class FindUtil {
	
	public static String createKey() throws Exception{
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for(int i = 0 ; i < 10 ; i++ ) {
			int index  = rnd.nextInt(3);
			
			switch(index) {
			case 0 :
				key.append((char)((int)(rnd.nextInt(26))+97));
				break;
			case 1 :
				key.append((char)((int)(rnd.nextInt(26))+65));
				break;
			case 2 :
				key.append((rnd.nextInt(10)));
				break;
			}//end switch 
		}//end for
		return key.toString();
	}

}

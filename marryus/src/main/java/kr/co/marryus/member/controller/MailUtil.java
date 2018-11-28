package kr.co.marryus.member.controller;

import javax.mail.Session;

import org.apache.commons.mail.HtmlEmail;

/**
 * 이메일 전송 controller
 * @author suzie
 *
 */
public class MailUtil {
	
	public static void sendEmail(String email, String subject, String msg) throws Exception{
		//Mail server설정
		
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //SMTP 서버명
		String hostSMTPid =  "marryus2018"; //아이디
		String hostSMTPpwd = "bitcamp5404"; //비밀번호
		
		// 보내는 사람 : marryUs 
		String fromEmail = "marryus2018@naver.com";
		String fromName = "MarryUs";
		
		
		// email 전송
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true); //SSL(TSL가 없는 경우 사용) 사용 여부 
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);   //SMTP 포트 번호
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);  // TLS 사용
			mail.addTo(email); 
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

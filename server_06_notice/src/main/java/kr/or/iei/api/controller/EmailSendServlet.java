package kr.or.iei.api.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailSendServlet
 */
@WebServlet("/api/emailSend")
public class EmailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailTitle = request.getParameter("emailTitle");
		String receiver = request.getParameter("receiver");
		String emailContent = request.getParameter("emailContent");
		
		/*
		 * 이메일 전송시, 필요 라이브러리
		 * 
		 * - activation-1.1.1.jar
		 * - javax.mail-1.6.2.jar
		 * 
		 */
		
		//1. 환경 설정 정보
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com"); //사용 SMTP 서버명
		prop.put("mail.smtp.port", 465); //사용 SMTP 포트
		prop.put("mail.smtp.auth", true); //인증 수행
		prop.put("mail.smtp.ssl.enable", true); //보안 설정 적용
		prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
		
		//2. 세션 설정 및 인증 정보 설정
		Session session = Session.getDefaultInstance(prop, new Authenticator() {	
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("dijae@naver.com", "B1WNX4TCZ4PJ");
			}
		});
		
		//3. 이메일 관련 정보 세팅
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("dijae@naver.com", "API 메일 발송 테스트"));
			
			InternetAddress to = new InternetAddress(receiver); //수신자 이메일 주소
			msg.setRecipient(Message.RecipientType.TO, to);
			
			msg.setSubject(emailTitle); //제목
			
			msg.setContent(emailContent, "text/html; charset=utf-8"); //본문 내용 및 형식
			
			Transport.send(msg); //이메일 전송
			
			System.out.println("Email 전송 완료!!");			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

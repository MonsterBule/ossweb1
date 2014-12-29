package com.shinowit.framework.Email;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

/**
 * Created by Administrator on 2014/12/25.
 */
public class SendHtmlMail {

    private String server;
    private String sendEamil;
    private String pass;

    public void sendMessage(String to,
                            String subject, String messageText)

            throws MessagingException, java.io.UnsupportedEncodingException

    {

        // Step 1:  Configure the mail session

        java.util.Properties props = new java.util.Properties();
        props.setProperty("mail.smtp.auth", "true");//指定是否需要SMTP验证
        props.setProperty("mail.smtp.host", server);//指定SMTP服务器
        props.put("mail.transport.protocol", "smtp");
        Session mailSession = Session.getDefaultInstance(props);
        mailSession.setDebug(true);//是否在控制台显示debug信息

        // Step 2:  Construct the message
        InternetAddress fromAddress = new InternetAddress(sendEamil);
        InternetAddress toAddress = new InternetAddress(to);

        MimeMessage testMessage = new MimeMessage(mailSession);

        testMessage.setFrom(fromAddress);
        testMessage.addRecipient(javax.mail.Message.RecipientType.TO, toAddress);
        testMessage.setSentDate(new java.util.Date());
        testMessage.setSubject(MimeUtility.encodeText(subject, "utf-8", "B"));

        testMessage.setContent(messageText, "text/html;charset=utf-8");
        System.out.println("Message constructed");

        // Step 3:  Now send the message
        Transport transport = mailSession.getTransport("smtp");
        transport.connect(server, sendEamil, pass);
        transport.sendMessage(testMessage, testMessage.getAllRecipients());
        transport.close();


        System.out.println("发送邮件!");
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getSendEamil() {
        return sendEamil;
    }

    public void setSendEamil(String sendEamil) {
        this.sendEamil = sendEamil;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}

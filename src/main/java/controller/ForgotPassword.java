package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.dao.UserDAO;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();
        UserDAO udao=new UserDAO();
        //User user=udao.isAlreadyRegistered(email);
        if(email!=null && !email.equals("") && udao.isAlreadyRegistered(email)) {
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = email;
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("alessandro.pascarella@gmail.com", "mzzbkhibeborociw");

                }
            });
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Ciao");
                message.setText("La tua password temporanea è " + otpvalue);
                Transport.send(message);
                System.out.println("message sent successfully");
            }

            catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            String address="/WEB-INF/InsOTP.jsp";
            dispatcher=request.getRequestDispatcher(address);
            request.setAttribute("message","La password temporanea è stato inviata al tuo indirizzo email");
            //request.setAttribute("connection", con);
            mySession.setAttribute("otp",otpvalue);
            mySession.setAttribute("email",email);
            dispatcher.forward(request, response);
            //request.setAttribute("status", "success");
        }
    }
}

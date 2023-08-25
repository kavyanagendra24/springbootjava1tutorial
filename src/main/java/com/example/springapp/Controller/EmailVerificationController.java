package com.example.springapp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.springapp.entity.VerificationCode;
import com.example.springapp.repository.VerificationRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Random;

@Controller

public class EmailVerificationController {

    @Autowired
    private JavaMailSender mailSender;
    
    @Autowired
    private VerificationRepository verificationCodeRepository;
    
    @GetMapping("/verification-form")
    public String showVerificationForm() {
        return "verification-form";
    }

    @PostMapping("/verify-email")
    public String sendVerificationCode(@RequestParam("email") String email, HttpServletRequest request, String name) {
        // Generate random verification code
        String verificationCode = generateVerificationCode();
        
        
     // Save the email and OTP in the database
        VerificationCode codeEntity = new VerificationCode();
        codeEntity.setEmail(email);
        codeEntity.setOtp(verificationCode);
        codeEntity.setName(name);
        verificationCodeRepository.save(codeEntity);

        // Save the verification code in the session for future validation
        HttpSession session = request.getSession();
        session.setAttribute("verificationCode", verificationCode);
        session.setAttribute("email", email);

        // Send email with the verification code
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Email Verification");
            message.setText("Your verification code is: " + verificationCode);

            mailSender.send(message);
        } catch (MailException e) {
            // Handle mail send exception
            return "verification-error";
        }

        return "redirect:/verify-otp"; // Redirect to OTP verification page
    }

    @GetMapping("/verify-otp")
    public String showOtpVerificationPage() {
        return "verify-otp";
    }

    @PostMapping("/verify-otp")
    public String verifyOtp(@RequestParam("otp") String otp, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String verificationCode = (String) session.getAttribute("verificationCode");
        String email = (String) session.getAttribute("email");

        if (otp.equals(verificationCode)) {
            // Perform additional actions like marking the email as verified in the database
            return "verification-success";
        } else {
            // Handle incorrect OTP
            return "verification-error";
        }
    }

    private String generateVerificationCode() {
        // Generate a 6-digit random OTP
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
}
	
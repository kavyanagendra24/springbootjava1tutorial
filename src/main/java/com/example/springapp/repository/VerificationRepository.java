package com.example.springapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.springapp.entity.VerificationCode;

public interface VerificationRepository extends JpaRepository<VerificationCode, Long> {

}

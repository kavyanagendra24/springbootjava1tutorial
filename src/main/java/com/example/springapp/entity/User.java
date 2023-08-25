package com.example.springapp.entity;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "user_record")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String password;

	//private Date date;
	
	private LocalDateTime datetimeField;

	private String designation;

	private String worktype;

	private String Day;

	@Lob
	@Type(type = "org.hibernate.type.BinaryType")
	@Column(columnDefinition = "LONGBLOB")
	private byte[] content;

//
//	public User(int id, String name, String password, Date date, String designation, String worktype, String day) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.password = password;
//		this.date = date;
//		this.designation = designation;
//		this.worktype = worktype;
//		Day = day;
//		
//	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int id, String name, String password,/* Date date,*/LocalDateTime datetimeField,
			String designation, String worktype, String day,
			byte[] content) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		//this.date = date;
		this.datetimeField = datetimeField;
		this.designation = designation;
		this.worktype = worktype;
		Day = day;
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

//	public Date getDate() {
//		return date;
//	}
//
//	public void setDate(Date date) {
//		this.date = date;
//	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getWorktype() {
		return worktype;
	}

	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}

	public String getDay() {
		return Day;
	}

	public void setDay(String day) {
		Day = day;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte[] getContent() {
		
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}
	
	public LocalDateTime getDatetimeField() {
		return datetimeField;
	}

	public void setDatetimeField(LocalDateTime datetimeField) {
		this.datetimeField = datetimeField;
	}

}

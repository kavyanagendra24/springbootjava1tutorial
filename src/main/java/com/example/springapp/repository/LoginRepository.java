package com.example.springapp.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.example.springapp.entity.User;


@Repository
public interface LoginRepository extends JpaRepository<User, Integer> {

//	 @Query("SELECT u FROM User u WHERE u.name LIKE %?1%")
//	    List<User> searchUsersByName(String name);
//	 
//	 @Query("SELECT u FROM User u WHERE u.designation LIKE %?1%")
//	    List<User> searchUsersByDesignation(String designation);
	
	  @Query("SELECT u FROM User u WHERE u.name LIKE %?1% AND u.designation LIKE %?2%") 
	  List<User> searchUsersByNameAndDesignation(String name, String designation);
	  
	  
	  @Query("SELECT DISTINCT u.name FROM User u WHERE u.name LIKE %:search%")
	    List<String> findSuggestionsByName(@Param("search") String search);
	  
	  @Query("SELECT u FROM User u WHERE u.name LIKE %:name% AND u.datetimeField BETWEEN :fromDateTime AND :toDateTime")
	    List<User> searchUsersByNameAndDateTimeRange(
	            @Param("name") String name,
	            @Param("fromDateTime") LocalDateTime fromDateTime,
	            @Param("toDateTime") LocalDateTime toDateTime
	    );

	  
}

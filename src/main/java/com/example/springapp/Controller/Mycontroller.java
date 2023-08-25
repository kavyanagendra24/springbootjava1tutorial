package com.example.springapp.Controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.springapp.entity.User;
import com.example.springapp.repository.LoginRepository;

@Controller
public class Mycontroller {

	@Autowired
	private LoginRepository loginrepo;

	@GetMapping("/form")
	public String showVerificationForm() {
		return "form";
	}

	@GetMapping("/Login")
	public String showForm(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "Login";
	}

//	@PostMapping("/Login")
//	public String Form(@ModelAttribute("user") User user) {
//		System.out.println(user);
//		loginrepo.save(user);
//		return "success";
//	}
	
	//save 
	@PostMapping("/Login")
    public String Form(@ModelAttribute("user") User user,
                       @RequestParam("file") MultipartFile file,
                       @RequestParam("dateTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime dateTime) {
        if (!file.isEmpty()) {
            try {
                byte[] content = file.getBytes();
            
                user.setContent(content);
            } catch (Exception e) {
                // Handle file saving error
            }
        }
        user.setDatetimeField(dateTime);
       loginrepo.save(user);
        return "success";
    }
	
	
	

	@GetMapping("/contact")
	public String contacts() {
		return "Contact";
	}

	@GetMapping("/Menu")
	public String menu() {
		return "menu";
	}
	
	//database table
//	@RequestMapping("/users")
//    public String getAllEmployees(Model model) {
//        List<User> users = loginrepo.findAll();
//        model.addAttribute("users", users);
//        return "employee-list";
//    }
	
	
	//Pagination
	@RequestMapping("/users-list")
    public String listUsers(Model model, @RequestParam(defaultValue = "0") int page) {
        int pageSize = 2; // Number of users to display per page
        Pageable pageable = PageRequest.of(page, pageSize);
        Page<User> userPage = loginrepo.findAll(pageable);

        model.addAttribute("users", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());

        return "employee-list";
    }

	@GetMapping("/edit")
    public String editEmployee(@RequestParam("id") int id, Model model) {
        User user = loginrepo.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid employee id: " + id));
        model.addAttribute("user", user);
        return "edit-employee";
    }
	
//	@PostMapping("/update")
//    public String updateEmployee(@ModelAttribute("user") User updatedEmployee) {
//		loginrepo.save(updatedEmployee);
//        return "update";
//    }
	@PostMapping("/update")
	public String updateEmployee(@ModelAttribute("user") User updatedEmployee,
	                             @RequestParam("dateTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime dateTime) {
	    updatedEmployee.setDatetimeField(dateTime); // Set the converted LocalDateTime
	    loginrepo.save(updatedEmployee);
	    return "update";
	}


    @GetMapping("/delete")
    public String deleteEmployee(@RequestParam("id") int id) {
    	loginrepo.deleteById(id);
        return "edit";
    }
    
    //filter for search
    @GetMapping("/users")
    public String getUsersList(@RequestParam(value = "search", required = false) String search,
    		              @RequestParam(value = "designation", required = false) String designation,
                               @RequestParam(value = "sort", required = false) String sort,
                               @RequestParam(value = "fromDateTime", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime fromDateTime,
                               @RequestParam(value = "toDateTime", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime toDateTime,
                               Model model) {
        List<User> users;
        
        
        
        if ((search != null && !search.isEmpty()) || (designation != null && !designation.isEmpty()) || (fromDateTime != null && toDateTime != null)) {
            if (fromDateTime != null && toDateTime != null) {
                users = loginrepo.searchUsersByNameAndDateTimeRange(search, fromDateTime, toDateTime);
                		
            } else {
                users = loginrepo.searchUsersByNameAndDesignation(search, designation);
            }
        } else {
            users = loginrepo.findAll();
        }        
//        if (sort != null) {
//            if (sort.equals("date_asc")) {
//                users.sort(Comparator.comparing(User::getDate));
//            } else if (sort.equals("date_desc")) {
//                users.sort(Comparator.comparing(User::getDate).reversed());
//            }
//        }
        
        model.addAttribute("users", users);
        return "employee-list";
    }

    //Dowmload attach profile
    @GetMapping("/downloadFile")
    public ResponseEntity<ByteArrayResource> downloadFile(@RequestParam("id") int id) {
        // Find the employee by ID
        User user = loginrepo.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user id: " + id));

        // Create a ByteArrayResource from the employee's content
        ByteArrayResource resource = new ByteArrayResource(user.getContent());

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + user.getName())
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .contentLength(user.getContent().length)
                .body(resource);
    }
    
    //suggestive search
    @GetMapping("/suggestions")
    @ResponseBody
    public List<String> getSuggestions(@RequestParam("search") String search) {
        List<String> suggestions = loginrepo.findSuggestionsByName(search);
        return suggestions;
    }
    
}










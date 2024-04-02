package com.example.demo.controller;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.dao.regDao;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;



@Controller
public class loginController {

    @Autowired regDao rd;

    @Autowired HttpSession Session;
    
    @GetMapping("/reg-page")
    public String regPage() {
        return "reg";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard";
    }

    @GetMapping("/view-post")
    public String viewPost(Model m) {
        return "viewPost";
    }

    @GetMapping("/view-all-post")
    public String viewAllPost(Model m) {
        return "viewOtherPost";
    }
    

    @PostMapping("/get-post-by-me")
    public @ResponseBody String getPostByMe() {

        String username = (String) Session.getAttribute("username");
        List<Map<String,Object>> postList = rd.viewPost( username);    
        Gson gson = new Gson();
        System.out.println("getPostByMe OBJECT: " + postList.toString());
        return gson.toJson(postList);

    }

    @PostMapping("/get-all-me")
    public @ResponseBody String getAllPost() {

        List<Map<String,Object>> postList = rd.viewAllPost();    
        Gson gson = new Gson();
        System.out.println("getAllPost OBJECT: " + postList.toString());
        return gson.toJson(postList);

    }

    @PostMapping("/reg-insert")
    public @ResponseBody String reg(@RequestBody String regData) {
        System.out.println("REGISTERING OBJECT: " + regData);
        JSONObject jsonObj = new JSONObject(regData);
        String username = jsonObj.getString("username");
        String password = jsonObj.getString("password");
        String email = jsonObj.getString("email");
        String phone = jsonObj.getString("phone");
        String role =  jsonObj.getString("role");
        String response = rd.regData(username, password, email, phone, role);
        System.out.println("response: " + response);
        return "{\"message\": \"success\"}";
    }
 
    @PostMapping("/auth")
    public @ResponseBody String auth(@RequestBody String regData) {
        System.out.println("Login OBJECT: " + regData);
        JSONObject jsonObj = new JSONObject(regData);
        String username = jsonObj.getString("username");
        String password = jsonObj.getString("password");
        int response = rd.getUserAuth(username, password);
        System.out.println("response: " + response);
        if(response == 1){
            Session.setAttribute("username", username);
            return "{\"page\": \"dashboard\"}";
        }else{
            return "{\"page\": \"login\"}";
        }
    }

    @PostMapping("/create-post")
    public @ResponseBody String createPost(@RequestBody String regData) {
        System.out.println("REGISTERING OBJECT: " + regData);
        JSONObject jsonObj = new JSONObject(regData);
        String postInput = jsonObj.getString("postInput");
        String username = (String) Session.getAttribute("username");
        String response = rd.createPost(username, postInput);
        System.out.println("response: " + response);
        if(response.equals("SUCCESS")){
            return "{\"message\": \"success\"}";
        }else{
            return "{\"message\": \"fail\"}";
        }
    }

    
}

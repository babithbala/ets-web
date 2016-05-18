package edu.pwr.ets.controller;

import java.security.Principal;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class MainController {
 
   @RequestMapping(value = { "/login.htm","/login" }, method = RequestMethod.GET)
   public String loadLoginPage(Model model) {
	   model.addAttribute("title", "Login");
       model.addAttribute("message", "Enter your username/password:");
       return "loginPage";
   }
 
   @RequestMapping(value = "/admin", method = RequestMethod.GET)
   public String adminPage(Model model) {
       model.addAttribute("title", "Admin");
       model.addAttribute("message", "Admin Page - This is protected page!");
       return "adminPage";
   }
 
   @RequestMapping(value = "/logoutSuccessful.htm", method = RequestMethod.GET)
   public String logoutSuccessfulPage(Model model) {
       model.addAttribute("title", "Logout");
       return "logoutSuccessfulPage";
   }
 
   @RequestMapping(value = "/changePassword.htm", method = RequestMethod.GET)
   public String changePassword() {
       return "changePassword";
   }
   
   @RequestMapping(value = "/home.htm", method = RequestMethod.GET)
   public String homePage(Model model) {
       model.addAttribute("title", "Home");
       return "noslides";
   }
 
   @RequestMapping(value = "/403.htm", method = RequestMethod.GET)
   public String accessDenied(Model model, Principal principal) {
       model.addAttribute("title", "Access Denied!");
 
       if (principal != null) {
           model.addAttribute("message", "Hi " + principal.getName()
                   + "<br> You do not have permission to access this page!");
       } else {
           model.addAttribute("msg",
                   "You do not have permission to access this page!");
       }
       return "403Page";
   }
}
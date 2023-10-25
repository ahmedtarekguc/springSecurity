package com.example.springsecurity.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ContactController {

    @GetMapping("/contact")
    public String getContactUs(){
        return "Your contact info";
    }
}

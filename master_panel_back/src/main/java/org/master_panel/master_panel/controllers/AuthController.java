package org.master_panel.master_panel.controllers;

import org.master_panel.master_panel.model.User;
import org.master_panel.master_panel.service.UserService;
import org.master_panel.master_panel.service.UserService.UsernameAlreadyExistException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login() {
        return "autentication/login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("registration", new User());
        return "autentication/register";
    }

    @PostMapping("/register")
    public String store(@Valid @ModelAttribute("registration") User formRegistration,
            BindingResult bindingResult,
            @RequestParam String confirmPassword, Model model) {

        if (!formRegistration.getPassword().equals(confirmPassword)) {
            model.addAttribute("passwordError", "Le password inserite non coincidono.");
            return "autentication/register";
        }

        if (bindingResult.hasErrors()) {
            return "autentication/register";
        }

        try {
            userService.create(formRegistration);
        } catch (UsernameAlreadyExistException e) {
            model.addAttribute("usernameError", e.getMessage());
            return "autentication/register";
        }

        return "redirect:/login";
    }

}

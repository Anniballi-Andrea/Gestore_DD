package org.master_panel.master_panel.controllers;

import java.util.List;

import org.master_panel.master_panel.model.User;
import org.master_panel.master_panel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String index(Model model) {
        List<User> users = userService.getAll();
        model.addAttribute("users", users);

        return "users/index";
    }

    @PostMapping("/promoteToAdmin/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public String userToAdmin(@PathVariable Integer id, Model model) {
        User user = userService.getById(id);
        userService.promoteToAdmin(user);
        List<User> users = userService.getAll();
        model.addAttribute("users", users);

        return "redirect:/users";
    }

    @PostMapping("/demoteToUser/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public String adminToUser(@PathVariable Integer id, Model model) {
        User user = userService.getById(id);
        userService.demoteToUser(user);
        List<User> users = userService.getAll();
        model.addAttribute("users", users);

        return "redirect:/users";
    }

    @PostMapping("promoteToSpeller/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public String toSpeller(@PathVariable Integer id, Model model) {
        User user = userService.getById(id);
        userService.promoteToSpeller(user);
        List<User> users = userService.getAll();
        model.addAttribute("users", users);

        return "redirect:/users";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        userService.deleteById(id);

        return "redirect:/users";
    }

}

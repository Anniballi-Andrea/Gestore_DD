package org.master_panel.master_panel.controllers;

import java.util.List;

import org.master_panel.master_panel.model.MagickItem;
import org.master_panel.master_panel.service.MagickItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/magick_items")
public class MagickItemsController {

    @Autowired
    private MagickItemsService itemsService;

    @GetMapping
    public String index(Model model, @RequestParam(required = false) String name) {

        List<MagickItem> items = itemsService.getAll(name);

        model.addAttribute("items", items);
        model.addAttribute("name", name);
        return "magick_items/index";
    }

    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("item", new MagickItem());
        return "magick_items/create-or-edit";
    }

    @PostMapping("/create")
    public String store(@Valid @ModelAttribute("item") MagickItem formItem, BindingResult bindingResult,
            Model model) {
        if (bindingResult.hasErrors()) {
            return "magick_items/create-or-edit";
        }

        itemsService.create(formItem);
        return "redirect:/magick_items";
    }
}

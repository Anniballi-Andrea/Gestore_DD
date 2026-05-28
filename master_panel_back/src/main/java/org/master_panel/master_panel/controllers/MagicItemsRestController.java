package org.master_panel.master_panel.controllers;

import java.util.List;

import org.master_panel.master_panel.model.MagickItem;
import org.master_panel.master_panel.service.MagickItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/magick_items")
@CrossOrigin(origins = "http://100.81.239.92:5173/")
public class MagicItemsRestController {
    @Autowired
    private MagickItemsService itemsService;

    @GetMapping
    public List<MagickItem> index() {

        List<MagickItem> items = itemsService.getAll();

        return items;
    }

}

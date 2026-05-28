package org.master_panel.master_panel.controllers;

import java.util.List;

import org.master_panel.master_panel.model.Spell;
import org.master_panel.master_panel.service.SpellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/spells")
public class SpellController {

    @Autowired
    private SpellService spellService;

    @GetMapping
    public String index(Model model, @RequestParam(required = false) String name,
            @RequestParam(required = false) String order) {
        List<Spell> spells = spellService.getAll(name, order);

        model.addAttribute("spells", spells);
        model.addAttribute("name", name);
        model.addAttribute("order", order);
        return "spells/index";
    }

    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("spell", new Spell());
        return "spells/create-or-edit";
    }

    @PostMapping("/create")
    public String store(@Valid @ModelAttribute("spell") Spell formSpell, BindingResult bindingResult,
            Model model) {
        if (bindingResult.hasErrors()) {
            return "spells/create-or-edit";
        }

        spellService.create(formSpell);
        return "redirect:/spells";
    }

    @GetMapping("/{id}")
    public String show(@PathVariable("id") Integer id, Model model) {
        Spell spell = spellService.getById(id);

        model.addAttribute("spell", spell);

        return "spells/show";
    }

    @GetMapping("/edit/{id}")
    public String editSpell(@PathVariable Integer id, Model model) {
        Spell spell = spellService.getById(id);
        model.addAttribute("spell", spell);
        model.addAttribute("edit", true);

        return "spells/create-or-edit";
    }

    @PostMapping("/edit/{id}")
    public String updateMonster(@Valid @ModelAttribute("spell") Spell formSpell,
            BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "spells/create-or-edit";
        }

        spellService.update(formSpell);

        return "redirect:/spells";
    }
}

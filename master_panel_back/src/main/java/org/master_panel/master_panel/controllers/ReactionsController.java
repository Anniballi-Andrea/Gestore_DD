
package org.master_panel.master_panel.controllers;

import java.util.List;

import org.master_panel.master_panel.model.Monster;
import org.master_panel.master_panel.model.Reaction;
import org.master_panel.master_panel.service.MonsterService;
import org.master_panel.master_panel.service.ReactionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/reactions")
public class ReactionsController {

    @Autowired
    private ReactionsService reactionsService;
    @Autowired
    private MonsterService monsterService;

    @GetMapping("/show/{id}")
    public String show(@PathVariable("id") Integer id, Model model) {
        Monster monster = monsterService.getById(id);
        List<Reaction> reactions = monster.getReactions();

        model.addAttribute("reactions", reactions);
        model.addAttribute("monsterId", monster.getId());

        return "reactions/show";

    }

    @PostMapping("/create")
    public String store(@Valid @ModelAttribute("reaction") Reaction formReactions, Model model,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "reactions/create-or-edit";
        }

        reactionsService.create(formReactions);

        return "redirect:/reactions/show/" + formReactions.getMonster().getId();
    }

    @GetMapping("/edit/{id}")
    public String editAction(@PathVariable Integer id, Model model) {
        model.addAttribute("reaction", reactionsService.getById(id));
        model.addAttribute("edit", true);

        return "reactions/create-or-edit";
    }

    @PostMapping("/edit/{id}")
    public String edit(@Valid @ModelAttribute("action") Reaction formReaction, Model model,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "reactions/create-or-edit";
        }

        reactionsService.update(formReaction);

        return "redirect:/reactions/show/" + formReaction.getMonster().getId();

    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {

        Reaction reactionToDelete = reactionsService.getById(id);

        Integer monsterId = reactionToDelete.getMonster().getId();

        reactionsService.delete(reactionToDelete);
        ;

        return "redirect:/reactions/show/" + monsterId;
    }
}
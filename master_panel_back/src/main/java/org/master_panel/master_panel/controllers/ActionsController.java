
package org.master_panel.master_panel.controllers;

import java.util.List;

import org.master_panel.master_panel.model.Action;
import org.master_panel.master_panel.model.Monster;
import org.master_panel.master_panel.service.ActionsService;
import org.master_panel.master_panel.service.MonsterService;
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
@RequestMapping("/actions")
public class ActionsController {

    @Autowired
    private ActionsService actionService;

    @Autowired
    private MonsterService monsterService;

    @GetMapping("/show/{id}")
    public String show(@PathVariable("id") Integer id, Model model) {
        Monster monster = monsterService.getById(id);
        List<Action> actions = monster.getActions();

        model.addAttribute("actions", actions);
        model.addAttribute("monsterId", monster.getId());

        return "actions/show";

    }

    @PostMapping("/create")
    public String store(@Valid @ModelAttribute("action") Action formAction, Model model, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "actions/create-or-edit";
        }

        actionService.create(formAction);

        return "redirect:/monsters/" + formAction.getMonster().getId();
    }

    @GetMapping("/edit/{id}")
    public String editAction(@PathVariable Integer id, Model model) {
        model.addAttribute("action", actionService.getById(id));
        model.addAttribute("edit", true);

        return "actions/create-or-edit";
    }

    @PostMapping("/edit/{id}")
    public String edit(@Valid @ModelAttribute("action") Action formAction, Model model, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "actions/create-or-edit";
        }

        actionService.update(formAction);

        return "redirect:/monsters/" + formAction.getMonster().getId();

    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {

        Action actionToDelete = actionService.getById(id);

        Integer monsterId = actionToDelete.getMonster().getId();

        actionService.delete(actionToDelete);
        ;

        return "redirect:/monsters/" + monsterId;
    }
}
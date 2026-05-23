package org.master_panel.master_panel.controllers;

import java.util.List;

import org.master_panel.master_panel.model.LegendAction;
import org.master_panel.master_panel.model.Monster;
import org.master_panel.master_panel.service.LegendActionsService;
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
@RequestMapping("/legendActions")
public class LegendActionsController {

    @Autowired
    private LegendActionsService legendService;

    @Autowired
    private MonsterService monsterService;

    @GetMapping("/show/{id}")
    public String show(@PathVariable("id") Integer id, Model model) {
        Monster monster = monsterService.getById(id);
        List<LegendAction> legendActions = monster.getLegendActions();

        model.addAttribute("legendActions", legendActions);
        model.addAttribute("monsterId", monster.getId());

        return "legendActions/show";

    }

    @PostMapping("/create")
    public String store(@Valid @ModelAttribute("legendAction") LegendAction formLegendAction, Model model,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "legendActions/create-or-edit";
        }

        legendService.create(formLegendAction);

        return "redirect:/legendActions/show/" + formLegendAction.getMonster().getId();
    }

    @GetMapping("/edit/{id}")
    public String editAction(@PathVariable Integer id, Model model) {
        model.addAttribute("legendAction", legendService.getById(id));
        model.addAttribute("edit", true);

        return "legendActions/create-or-edit";
    }

    @PostMapping("/edit/{id}")
    public String edit(@Valid @ModelAttribute("legendActions") LegendAction formLegendAction, Model model,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "legendActions/create-or-edit";
        }

        legendService.update(formLegendAction);

        return "redirect:/legendActions/show/" + formLegendAction.getMonster().getId();

    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {

        LegendAction legendActionToDelete = legendService.getById(id);

        Integer monsterId = legendActionToDelete.getMonster().getId();

        legendService.delete(legendActionToDelete);

        return "redirect:/legendActions/show/" + monsterId;
    }
}
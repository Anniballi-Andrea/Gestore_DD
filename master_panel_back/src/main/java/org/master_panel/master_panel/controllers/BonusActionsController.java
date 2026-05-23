
package org.master_panel.master_panel.controllers;

import java.util.List;

import org.master_panel.master_panel.model.BonusAction;
import org.master_panel.master_panel.model.Monster;
import org.master_panel.master_panel.service.BonusActionsService;
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
@RequestMapping("/bonusActions")
public class BonusActionsController {

    @Autowired
    private BonusActionsService bonusActionsService;

    @Autowired
    private MonsterService monsterService;

    @GetMapping("/show/{id}")
    public String show(@PathVariable("id") Integer id, Model model) {
        Monster monster = monsterService.getById(id);
        List<BonusAction> bonusActions = monster.getBonusActions();

        model.addAttribute("bonusActions", bonusActions);
        model.addAttribute("monsterId", monster.getId());

        return "bonusActions/show";

    }

    @PostMapping("/create")
    public String store(@Valid @ModelAttribute("bonusAction") BonusAction formBonusAction, Model model,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "bonusActions/create-or-edit";
        }

        bonusActionsService.create(formBonusAction);

        return "redirect:/bonusActions/show/" + formBonusAction.getMonster().getId();
    }

    @GetMapping("/edit/{id}")
    public String editAction(@PathVariable Integer id, Model model) {
        model.addAttribute("bonusAction", bonusActionsService.getById(id));
        model.addAttribute("edit", true);

        return "bonusActions/create-or-edit";
    }

    @PostMapping("/edit/{id}")
    public String edit(@Valid @ModelAttribute("bonusAction") BonusAction formBonusAction, Model model,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "bonusActions/create-or-edit";
        }

        bonusActionsService.update(formBonusAction);

        return "redirect:/bonusActions/show/" + formBonusAction.getMonster().getId();

    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {

        BonusAction bonusActionToDelete = bonusActionsService.getById(id);

        Integer monsterId = bonusActionToDelete.getMonster().getId();

        bonusActionsService.delete(bonusActionToDelete);
        ;

        return "redirect:/bonusActions/show/" + monsterId;
    }
}
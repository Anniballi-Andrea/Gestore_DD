package org.master_panel.master_panel.service;

import java.util.Optional;

import org.master_panel.master_panel.model.BonusAction;
import org.master_panel.master_panel.repository.BonusActionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BonusActionsService {

    @Autowired
    private BonusActionsRepository bonusActionRepo;

    public BonusAction getById(Integer id) {
        Optional<BonusAction> bonusActions = bonusActionRepo.findById(id);

        if (bonusActions.isEmpty()) {
            throw new RuntimeException("l'azione bonus non è stata trovata");
        }
        return bonusActions.get();
    }

    public BonusAction create(BonusAction bonusAction) {
        return bonusActionRepo.save(bonusAction);
    }

    public BonusAction update(BonusAction bonusAction) {
        return bonusActionRepo.save(bonusAction);
    }

    public void delete(BonusAction bonusAction) {
        bonusActionRepo.delete(bonusAction);
    }

    public void deleteById(Integer id) {
        BonusAction bonusAction = getById(id);

        bonusActionRepo.delete(bonusAction);
    }

}

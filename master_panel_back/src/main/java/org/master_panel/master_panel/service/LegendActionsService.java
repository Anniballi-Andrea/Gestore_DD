package org.master_panel.master_panel.service;

import java.util.Optional;

import org.master_panel.master_panel.model.LegendAction;
import org.master_panel.master_panel.repository.LegendActionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LegendActionsService {

    @Autowired
    private LegendActionRepository legendRepo;

    public LegendAction getById(Integer id) {
        Optional<LegendAction> legendActions = legendRepo.findById(id);

        if (legendActions.isEmpty()) {
            throw new RuntimeException("l'azione bonus non è stata trovata");
        }
        return legendActions.get();
    }

    public LegendAction create(LegendAction legendAction) {
        return legendRepo.save(legendAction);
    }

    public LegendAction update(LegendAction legendAction) {
        return legendRepo.save(legendAction);
    }

    public void delete(LegendAction legendAction) {
        legendRepo.delete(legendAction);
    }

    public void deleteById(Integer id) {
        LegendAction legendAction = getById(id);

        legendRepo.delete(legendAction);
    }

}

package org.master_panel.master_panel.service;

import java.util.Optional;

import org.master_panel.master_panel.model.Reaction;
import org.master_panel.master_panel.repository.ReactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReactionsService {

    @Autowired
    private ReactionRepository reactionRepo;

    public Reaction getById(Integer id) {
        Optional<Reaction> reaction = reactionRepo.findById(id);

        if (reaction.isEmpty()) {
            throw new RuntimeException("l'azione non è stata trovata");
        }
        return reaction.get();
    }

    public Reaction create(Reaction reaction) {
        return reactionRepo.save(reaction);
    }

    public Reaction update(Reaction reaction) {
        return reactionRepo.save(reaction);
    }

    public void delete(Reaction reaction) {
        reactionRepo.delete(reaction);
    }

    public void deleteById(Integer id) {
        Reaction reaction = getById(id);

        reactionRepo.delete(reaction);
    }

}

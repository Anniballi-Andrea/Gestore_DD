package org.master_panel.master_panel.service;

import java.util.List;
import java.util.Optional;

import org.master_panel.master_panel.model.Spell;
import org.master_panel.master_panel.repository.SpellRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpellService {

    @Autowired
    private SpellRepository spellRepo;

    public List<Spell> getAll() {
        return spellRepo.findAllByOrderByIdDesc();
    }

    public List<Spell> getAll(String name, String order) {

        if ((name == null || name.isBlank()) && (order == null || order.isBlank())) {

            return spellRepo.findAllByOrderByIdDesc();
        } else if ((order == null || order.isBlank())) {

            return spellRepo.findByNameContaining(name);

        } else if ((name == null || name.isBlank()) && order.equals("asc")) {

            return spellRepo.findAllByNameContainingOrderByLevelAsc(name);

        } else if ((name == null || name.isBlank()) && order.equals("desc")) {
            return spellRepo.findAllByNameContainingOrderByLevelDesc(name);

        } else if (order.equals("asc")) {
            return spellRepo.findAllByNameContainingOrderByLevelAsc(name);
        }
        return spellRepo.findAllByNameContainingOrderByLevelDesc(name);

    }

    /*
     * public List<Spell> getAll() {
     * return spellRepo.findAllByOrderByIdDesc();
     * }
     */

    public Optional<Spell> findById(Integer id) {
        return spellRepo.findById(id);
    }

    public Spell findByName(String name) {
        Spell spell = spellRepo.findByName(name);

        return spell;
    }

    public Spell getById(Integer id) {
        Optional<Spell> spells = spellRepo.findById(id);

        if (spells.isEmpty()) {
            throw new RuntimeException("l'azione non è stata trovata");
        }
        return spells.get();
    }

    public Spell create(Spell Spell) {
        return spellRepo.save(Spell);
    }

    public List<Spell> getAllByNameAsc() {
        return spellRepo.findAllByOrderByNameAsc();
    }

    public Spell update(Spell Spell) {
        return spellRepo.save(Spell);
    }

    public void delete(Spell Spell) {
        spellRepo.delete(Spell);
    }

    public void deleteById(Integer id) {
        Spell Spell = getById(id);

        spellRepo.delete(Spell);
    }

}
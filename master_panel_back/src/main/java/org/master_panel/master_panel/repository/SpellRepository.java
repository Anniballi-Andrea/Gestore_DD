package org.master_panel.master_panel.repository;

import java.util.List;

import org.master_panel.master_panel.model.Spell;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SpellRepository extends JpaRepository<Spell, Integer> {

    public List<Spell> findAllByOrderByIdDesc();

    public List<Spell> findAllByOrderByNameAsc();

    public List<Spell> findByNameContaining(String name);

    public Spell findByName(String name);

    public List<Spell> findAllByNameContainingOrderByLevelAsc(String name);

    public List<Spell> findAllByNameContainingOrderByLevelDesc(String name);

}

package org.master_panel.master_panel.controllers;

import java.util.List;
import java.util.Optional;

import org.master_panel.master_panel.model.Spell;
import org.master_panel.master_panel.service.SpellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/spells")
@CrossOrigin(origins = "http://localhost:5173")
public class SpellRestController {

    @Autowired
    private SpellService spellService;

    @GetMapping()
    public List<Spell> index() {
        List<Spell> spells = spellService.getAllByNameAsc();

        return spells;
    }

    @GetMapping("/searchById/{id}")
    public ResponseEntity<Spell> show(@PathVariable Integer id) {
        Optional<Spell> spellAttempt = spellService.findById(id);
        if (spellAttempt.isEmpty()) {
            return new ResponseEntity<Spell>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<Spell>(spellAttempt.get(), HttpStatus.OK);
    }

    @GetMapping("/searchByName/{name}")
    public ResponseEntity<Spell> showByName(@PathVariable String name) {
        Integer spellId = spellService.findByName(name).getId();
        Optional<Spell> spellAttempt = spellService.findById(spellId);
        if (spellAttempt.isEmpty()) {
            return new ResponseEntity<Spell>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Spell>(spellAttempt.get(), HttpStatus.OK);
    }
}

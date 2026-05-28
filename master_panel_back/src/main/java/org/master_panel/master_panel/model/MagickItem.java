package org.master_panel.master_panel.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "magick_item")
public class MagickItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    @NotNull(message = "il nome non deve essere vuoto")
    @NotBlank(message = "Il nome non va lasciato vuoto")
    private String name;

    @Column(nullable = false)
    @NotNull(message = "La rarità non deve essere vuota")
    @NotBlank(message = "La rarità non va lasciata vuota")
    private String rarity;

    @Column(nullable = false)
    @NotNull(message = "il tipo non deve essere vuoto")
    @NotBlank(message = "Il tipo non va lasciato vuoto")
    private String type;

    @Column(name = "sintony", nullable = false)
    private boolean sintony;

    @Lob
    @NotNull(message = "la descrizione non va lasciata vuota")
    @NotBlank(message = "la descrizione non va lasciata vuota")
    private String description;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRarity() {
        return this.rarity;
    }

    public void setRarity(String rarity) {
        this.rarity = rarity;
    }

    public boolean isSintony() {
        return this.sintony;
    }

    public boolean getSintony() {
        return this.sintony;
    }

    public void setSintony(boolean sintony) {
        this.sintony = sintony;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return String.format(
                "nome: %s tipo: %s rarità: %s descrizione: %s richiede sintonia: %s ",
                name, type, rarity, description, sintony);
    }
}

package org.master_panel.master_panel.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "spell")
public class Spell {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    @NotNull(message = "il nome non deve essere vuoto")
    @NotBlank(message = "Il nome non va lasciato vuoto")
    private String name;

    @Column(nullable = false)
    @NotNull(message = "il nome non deve essere vuoto")
    @NotBlank(message = "Il nome non va lasciato vuoto")
    private String school;

    @Column(nullable = false)
    @NotNull(message = "il livello non deve essere vuoto")
    @Min(0)
    private int level;

    @Column(nullable = false)
    @NotNull(message = "il tempo di lancio non deve essere vuoto")
    @NotBlank(message = "Il tempo di lancio non va lasciato vuoto")
    private String castMethod;

    @Column(nullable = false)
    @NotNull(message = "la gittata non deve essere vuoto")
    @NotBlank(message = "la gittata non va lasciato vuoto")
    private String castRange;

    @Lob
    private String components;

    @Column(nullable = false)
    @NotNull(message = "la durata non deve essere vuoto")
    @NotBlank(message = "la durata non va lasciato vuoto")
    private String duration;

    @Lob
    @NotNull(message = "la descrizione non va lasciata vuota")
    @NotBlank(message = "la descrizione non va lasciata vuota")
    private String effect;

    @Lob
    private String upgrade;

    @Lob
    private String materials;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevel() {
        return this.level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getSchool() {
        return this.school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCastMethod() {
        return this.castMethod;
    }

    public void setCastMethod(String castMethod) {
        this.castMethod = castMethod;
    }

    public String getCastRange() {
        return this.castRange;
    }

    public void setCastRange(String castRange) {
        this.castRange = castRange;
    }

    public String getComponents() {
        return this.components;
    }

    public void setComponents(String components) {
        this.components = components;
    }

    public String getDuration() {
        return this.duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getEffect() {
        return this.effect;
    }

    public void setEffect(String effect) {
        this.effect = effect;
    }

    public String getUpgrade() {
        return this.upgrade;
    }

    public void setUpgrade(String upgrade) {
        this.upgrade = upgrade;
    }

    public String getMaterials() {
        return this.materials;
    }

    public void setMaterials(String materials) {
        this.materials = materials;
    }

    @Override
    public String toString() {
        return String.format(
                "nome: %s scuola: %s livello: %d tempo di lancio: %s gittata: %s componenti: %s durata: %s effetto: %s ai livelli superiori: %s materiali: %s",
                name, school, level, castMethod, castRange, components, duration, effect, upgrade, materials);
    }
}
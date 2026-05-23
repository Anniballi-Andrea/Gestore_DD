import axios from "axios"
import { useState } from "react";
import { useEffect } from "react";
import { useContext } from "react";
import { createContext } from "react";

const SpellContext = createContext();

export function SpellProvider({ children }) {

    const [allSpells, setAllSpells] = useState([]);
    const [spellName, setSpellName] = useState("");

    const [spellPref, setSpellPref] = useState(() => {
        const savedSpell = localStorage.getItem(`preferite-spell`);
        return savedSpell ? JSON.parse(savedSpell) : []
    });



    function getAllSpells() {
        axios
            .get("http://100.81.239.92:8080/api/spells")
            .then((response) => {
                const data = response.data;
                setAllSpells(data);
            })
            .catch((err) => console.error("errore:", err));
    }

    useEffect(() => { getAllSpells() }, [])

    const filtredSpell = allSpells.filter((el) => {
        return el.name.toLowerCase().includes(spellName.toLowerCase())
    })



    useEffect(() => {
        localStorage.setItem(`preferite-spell`, JSON.stringify(spellPref));
    }, [spellPref]);

    return (
        <SpellContext.Provider
            value={{
                spellName,
                setSpellName,
                allSpells,
                spellPref,
                setSpellPref,
                filtredSpell

            }}
        >
            {children}
        </SpellContext.Provider>
    );

}

export function useSpell() {
    return useContext(SpellContext);
}
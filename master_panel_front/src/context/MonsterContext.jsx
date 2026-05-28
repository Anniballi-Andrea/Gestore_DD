import axios from "axios"
import { useContext } from "react";
import { useEffect } from "react";
import { useState } from "react";
import { createContext } from "react";
import { useCampaign } from "./CampaignContext";

const MonsterContext = createContext();

export function MonsterProvider({ children }) {

    const { currentCampaign } = useCampaign()

    const storageKey = `battle-monster-${currentCampaign}`


    const [encounterNumb, setEncounterNumb] = useState("");
    const [encounterName, setEncounterName] = useState("");
    const [allMonsters, setAllMonsters] = useState([]);
    const [monsterName, setMonsterName] = useState("");
    const [monsterText, setMonsterText] = useState("");





    //variabile per l'elenco dei nemici in battaglia salvata nel local storage
    const [battle, _setBattle] = useState(() => {
        const savedMonsters = localStorage.getItem(storageKey);
        return savedMonsters ? JSON.parse(savedMonsters) : [];
    });

    //caricare nel local storage lo stato della battaglia ad ogni sua modifica
    useEffect(() => {
        const savedMonsters = localStorage.getItem(storageKey);
        _setBattle(savedMonsters ? JSON.parse(savedMonsters) : []);
    }, [storageKey]);

    const setBattle = (action) => {
        _setBattle((prev) => {
            // Risolve il nuovo stato (supporta sia setBattle(nuovoArray) che setBattle(prev => ...))
            const newState = typeof action === 'function' ? action(prev) : action;

            // Salva nel localStorage specifico della campagna ISTANTANEAMENTE
            localStorage.setItem(storageKey, JSON.stringify(newState));

            return newState;
        });
    }

    function getAllMonster() {
        axios
            .get("http://100.81.239.92:8080/api/monsters/allByName")
            .then((response) => {
                const data = response.data;
                setAllMonsters(data);
            })
            .catch((err) => console.error("errore:", err));
    }


    const getMonster = (e) => {
        e.preventDefault();

        axios
            .get(`http://100.81.239.92:8080/api/monsters/serchByName/${encounterName}`)
            .then((response) => {
                const data = response.data;
                const newBattle = [];
                const quantity = Number(encounterNumb)
                const timeStamp = Date.now()


                for (let index = 1; index <= quantity; index++) {

                    const randomNumber = Math.floor(Math.random() * 100)


                    const newId = `id-${timeStamp}-${randomNumber}-${index}`

                    if (battle.length == 0) {
                        const encounterInstance = {
                            ...data,
                            name: `${data.name} ${index}`,
                            status: `${data.lifePoint}`,
                            instanceId: newId,
                            text: monsterText,
                        };
                        newBattle.push(encounterInstance);
                    } else {
                        const number = battle.length + index
                        const encounterInstance = {
                            ...data,
                            name: `${data.name} ${number}`,
                            status: `${data.lifePoint}`,
                            instanceId: newId
                        };
                        newBattle.push(encounterInstance);
                    }
                }
                setBattle([...battle, ...newBattle]);
                setEncounterNumb("")
                setEncounterName("")
            })
            .catch((err) => console.error("errore:", err));

    }

    const filtredMonster = allMonsters.filter((el) => {
        return el.toLowerCase().includes(monsterName.toLowerCase())
    })

    const removeFromBattle = (id) => {
        setBattle((prev) => prev.filter((el) => el.instanceId !== id));
    };

    const applicaDanno = (id, danno) => {

        setBattle(prevBattle =>
            prevBattle.map(el => {
                if (el.instanceId === id) {
                    let newStatus = el.status - danno;
                    if (newStatus < 0) {
                        newStatus = 0;
                    };
                    return {
                        ...el, status: newStatus
                    };
                }
                return el;
            }
            )
        )
    }

    const applicaCura = (id, danno) => {
        setBattle(prevBattle =>
            prevBattle.map(el => {
                if (el.instanceId === id) {
                    let newStatus = el.status + danno;
                    if (newStatus > el.lifePoint) {
                        newStatus = el.lifePoint;
                    };
                    return {
                        ...el, status: newStatus
                    };
                }
                return el;
            }
            )
        )
    }




    useEffect(() => { getAllMonster() }, [])


    return (
        <MonsterContext.Provider
            value={{
                encounterNumb,
                setEncounterNumb,
                encounterName,
                setEncounterName,
                battle,
                setBattle,
                getMonster,
                removeFromBattle,
                applicaDanno,
                applicaCura,
                allMonsters,
                monsterName,
                setMonsterName,
                filtredMonster,
                monsterText,
                setMonsterText,
            }}
        >
            {children}
        </MonsterContext.Provider>
    );

}

export function useMonster() {
    return useContext(MonsterContext);
}
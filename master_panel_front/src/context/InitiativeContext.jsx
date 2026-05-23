
import { useState } from "react";
import { useEffect } from "react";
import { useContext } from "react";
import { createContext } from "react";
import { useCampaign } from "./CampaignContext";

const InitiativeContext = createContext();

export function InitiativeProvider({ children }) {

    const { currentCampaign } = useCampaign()

    const initStorageKey = `battle-initiative-${currentCampaign}`
    const roundStorageKey = `battle-round-${currentCampaign}`
    const turnStorageKey = `battle-turn-${currentCampaign}`

    const [initiative, _setInitiative] = useState(() => {
        const savedInitiative = localStorage.getItem(initStorageKey);
        return savedInitiative ? JSON.parse(savedInitiative) : []
    });

    useEffect(() => {
        const savedInitiative = localStorage.getItem(initStorageKey);
        _setInitiative(savedInitiative ? JSON.parse(savedInitiative) : [])
    }, [initStorageKey]);

    const setInitiative = (action) => {
        _setInitiative((prev) => {
            const newState = typeof action === 'function' ? action(prev) : action;
            localStorage.setItem(initStorageKey, JSON.stringify(newState));
            return newState;
        });
    }


    const [playerName, setPlayerName] = useState("")
    const [playerInit, setPlayerInit] = useState("")
    const [playerDex, setPlayerDex] = useState("")

    const [turnOn, _setTurnOn] = useState(() => {
        const savedTurn = localStorage.getItem(turnStorageKey);
        return savedTurn ? JSON.parse(savedTurn) : 0
    });

    useEffect(() => {
        const savedTurn = localStorage.getItem(turnStorageKey);
        _setTurnOn(savedTurn ? JSON.parse(savedTurn) : 0)
    }, [turnStorageKey]);

    const setTurnOn = (action) => {
        _setTurnOn((prev) => {
            const newState = typeof action === 'function' ? action(prev) : action;
            localStorage.setItem(turnStorageKey, JSON.stringify(newState));
            return newState;
        });
    }

    const [round, _setRound] = useState(() => {
        const savedRound = localStorage.getItem(roundStorageKey);
        return savedRound ? JSON.parse(savedRound) : 0
    });

    useEffect(() => {
        const savedRound = localStorage.getItem(roundStorageKey);
        _setRound(savedRound ? JSON.parse(savedRound) : 0)
    }, [roundStorageKey]);

    const setRound = (action) => {
        _setRound((prev) => {
            const newState = typeof action === 'function' ? action(prev) : action;
            localStorage.setItem(roundStorageKey, JSON.stringify(newState));
            return newState;
        });
    }


    const finalInitiative = [...initiative].sort((a, b) => {
        if (Number(b.initiative) !== Number(a.initiative)) {
            return Number(b.initiative) - Number(a.initiative);
        }
        return Number(b.dex) - Number(a.dex);
    })

    const addInitiative = (e) => {

        e.preventDefault()
        let init = playerInit
        let dex = playerDex


        const randomNumber = Math.floor(Math.random() * 100)
        const timeStamp = Date.now()

        const player = {
            id: `${timeStamp}${randomNumber}`,
            name: playerName,
            initiative: init,
            dex: dex
        }

        if (player.initiative == "") {
            player.initiative = 0
        }
        if (player.dex == "") {
            player.dex = 0
        }

        setInitiative([...initiative, player]);

        setPlayerDex("")
        setPlayerName("")
        setPlayerInit("")


    }




    const updateInitName = (id, name) => {
        setInitiative((prev) => prev.map((el) => (el.id === id ? { ...el, name: name } : el))
        );
    }

    const updateInit = (id, init) => {
        const value = Number(init);
        setInitiative((prev) => prev.map((el) => (el.id === id ? { ...el, initiative: value } : el))
        );
    }
    const updateDex = (id, dex) => {
        const value = dex;
        setInitiative((prev) => prev.map((el) => (el.id === id ? { ...el, dex: value } : el)));


    }


    const deleteFromInit = (id) => {
        setInitiative((prev) => prev.filter((el) => el.id !== id))


    }

    const nextPlayer = () => {
        if (turnOn == finalInitiative.length - 1) {
            setTurnOn(0)
            setRound(round + 1)
        } else {
            setTurnOn(turnOn + 1)
        }
    }

    function resetInitiative() {
        const newInit = []
        initiative.map((el) => {
            const newElement = {
                id: el.id,
                name: el.name,
                initiative: "",
                dex: el.dex
            }
            newInit.push(newElement)
        }

        )
        setRound(0)
        setTurnOn(0)
        setInitiative(newInit)
    }




    return (
        <InitiativeContext.Provider
            value={{
                initiative,
                setInitiative,
                playerName,
                setPlayerName,
                playerInit,
                setPlayerInit,
                playerDex,
                setPlayerDex,
                addInitiative,
                finalInitiative,
                updateInitName,
                updateInit,
                updateDex,
                deleteFromInit,
                resetInitiative,
                nextPlayer,
                turnOn,
                setTurnOn,
                round,
                setRound
            }}
        >
            {children}
        </InitiativeContext.Provider>
    );

}

export function useInitiative() {
    return useContext(InitiativeContext);
}
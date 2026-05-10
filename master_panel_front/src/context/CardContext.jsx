
import { useState } from "react";
import { useEffect } from "react";
import { useContext } from "react";
import { createContext } from "react";

const CardContext = createContext();

export function CardProvider({ children }) {

    const [status, setStatus] = useState(true)
    const [trait, setTrait] = useState(false)
    const [actions, setActions] = useState(false)
    const [bonusActions, setBonusActions] = useState(false)
    const [reactions, setReactions] = useState(false)
    const [legendActions, setLegendActions] = useState(false)

    const openStatus = () => {
        setTrait(false)
        setActions(false)
        setBonusActions(false)
        setReactions(false)
        setLegendActions(false)
        setStatus(true)


    }

    const openTraits = () => {
        setStatus(false)
        setActions(false)
        setBonusActions(false)
        setReactions(false)
        setLegendActions(false)
        setTrait(true)
    }

    const openActions = () => {
        setStatus(false)
        setTrait(false)
        setBonusActions(false)
        setReactions(false)
        setLegendActions(false)
        setActions(true)

    }

    const openBonusActions = () => {
        setStatus(false)
        setActions(false)
        setTrait(false)
        setReactions(false)
        setLegendActions(false)
        setBonusActions(true)
    }
    const openReactions = () => {
        setStatus(false)
        setTrait(false)
        setBonusActions(false)
        setActions(false)
        setLegendActions(false)
        setReactions(true)
    }
    const openLegendActions = () => {
        setStatus(false)
        setTrait(false)
        setBonusActions(false)
        setActions(false)
        setReactions(false)
        setLegendActions(true)

    }



    return (
        <CardContext.Provider
            value={{
                status,
                setStatus,
                trait,
                setTrait,
                actions,
                setActions,
                bonusActions,
                setBonusActions,
                reactions,
                setReactions,
                legendActions,
                setLegendActions,
                openStatus,
                openTraits,
                openActions,
                openBonusActions,
                openReactions,
                openLegendActions
            }}
        >
            {children}
        </CardContext.Provider>
    );

}

export function useCard() {
    return useContext(CardContext);
}

import { useState } from "react";
import { useEffect } from "react";
import { useContext } from "react";
import { createContext } from "react";

const CampaignContext = createContext();

export function CampaignProvider({ children }) {
    const [campaignList, setCampaignList] = useState(() => {
        const savedCampList = localStorage.getItem(`campaign-list`);
        return savedCampList ? JSON.parse(savedCampList) : [{ id: 1, name: "Campagna 1" }]
    });


    const [currentCampaign, setCurrentCampaign] = useState(() => {
        return localStorage.getItem("current-campaign-name") || "default";
    });

    useEffect(() => {
        localStorage.setItem("current-campaign-name", currentCampaign)
    }, [currentCampaign])

    useEffect(() => {
        localStorage.setItem(`campaign-list`, JSON.stringify(campaignList));
    }, [campaignList]);

    const [deleteError, setDeleteError] = useState(false)

    function deleteCampaign(camp) {
        if (campaignList.length <= 1) {
            return (setDeleteError(true))

        }
        const filtredCamp = campaignList.filter(el => el.id !== camp.id)

        if (currentCampaign === camp.name) {
            setCurrentCampaign(filtredCamp[0].name)
        }
        setCampaignList(filtredCamp)
        localStorage.removeItem(`battle-monster-${camp.name}`);
        localStorage.removeItem(`session-note-${camp.name}`);
        localStorage.removeItem(`round-${camp.name}`);
        localStorage.removeItem(`turn-${camp.name}`);
        localStorage.removeItem(`note-${camp.name}`);
    }

    return (
        <CampaignContext.Provider
            value={{
                currentCampaign,
                setCurrentCampaign,
                campaignList,
                setCampaignList,
                deleteError,
                deleteCampaign
            }}
        >
            {children}
        </CampaignContext.Provider>
    );

}

export function useCampaign() {
    return useContext(CampaignContext);
}
import { useEffect } from "react";
import { useState } from "react"
import { useCampaign } from "../context/CampaignContext";

export default function SessionNote() {

    const { currentCampaign } = useCampaign()
    const storageKey = `note-${currentCampaign}`

    const [note, _setNote] = useState(() => {
        const savedNote = localStorage.getItem(storageKey);
        return savedNote ? JSON.parse(savedNote) : ""
    });

    useEffect(() => {
        const savedNote = localStorage.getItem(storageKey);
        _setNote(savedNote ? JSON.parse(savedNote) : "")
    }, [storageKey]);


    const setNote = (action) => {
        _setNote((prev) => {
            const newState = typeof action === 'function' ? action(prev) : action;
            localStorage.setItem(storageKey, JSON.stringify(newState));
            return newState;
        });
    }

    return (
        <div className="container mt-5">
            <div className="text-center">
                <h3>Note della sessione</h3>
            </div>
            <div className="mt-3 mb-5">
                <textarea
                    className="form-control overflow-y-scroll vh-100 "
                    name="sessionNote"
                    value={note}
                    onChange={e => setNote(e.target.value)}>
                </textarea>
            </div>

        </div>
    )
}
import { useCard } from "../context/CardContext";

export default function EncounterActionsButtons() {

    const {
        status, trait, actions, bonusActions, reactions, legendActions, openStatus,
        openTraits, openActions, openBonusActions, openReactions, openLegendActions
    } = useCard();

    return (
        <div className="col-12 d-flex justify-content-between">
            {
                status ? <div><button className="btn btn-warning" onClick={openStatus}>Stat</button></div>
                    :
                    <div><button className="btn btn-secondary" onClick={openStatus}>Stat</button></div>
            }
            {
                trait ? <div><button className="btn btn-warning" onClick={openTraits}>Tratti</button></div>
                    :
                    <div><button className="btn btn-secondary" onClick={openTraits}>Tratti</button></div>
            }
            {
                actions ? <div><button className="btn btn-warning" onClick={openActions}>Azioni</button></div>
                    :
                    <div><button className="btn btn-secondary" onClick={openActions}>Azioni</button></div>
            }
            {
                bonusActions ? <div><button className="btn btn-warning" onClick={openBonusActions}>Azioni Bonus</button></div>
                    :
                    <div><button className="btn btn-secondary" onClick={openBonusActions}>Azioni Bonus</button></div>
            }
            {
                reactions ? <div><button className="btn btn-warning" onClick={openReactions}>Reazioni</button></div>
                    :
                    <div><button className="btn btn-secondary" onClick={openReactions}>Reazioni</button></div>
            }
            {
                legendActions ? <div><button className="btn btn-warning" onClick={openLegendActions}>Azioni Leggendarie</button></div>
                    :
                    <div><button className="btn btn-secondary" onClick={openLegendActions}>Azioni Leggendarie</button></div>
            }

        </div>
    )
}
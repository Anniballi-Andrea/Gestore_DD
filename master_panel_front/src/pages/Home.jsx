

import FormGetMoster from "../components/FormGetMonster";
import { useMonster } from "../context/MonsterContext";
import FormInitiative from "../components/FormInitiative";
import InitiativeTable from "../components/InitiativeTable";
import { useInitiative } from "../context/InitiativeContext";
import EncounterCard from "../components/EncounterCard";
import Modal from "../components/Modal";
import RoundComponent from "../components/RoundComponent";
import EncounterTraits from "../components/EncounterTraits";
import { useCard } from "../context/CardContext";
import EncounterActions from "../components/EncounterActions";
import EncounterBonusActions from "../components/EncounterBonusActions";
import EncounterReactions from "../components/EncounterReactions";
import EncounterLegendActions from "../components/EncounterLegendActions";




export default function Home() {
    const { battle } = useMonster();
    const { finalInitiative, resetInitiative, } = useInitiative();
    const {
        status, trait, actions, bonusActions, reactions, legendActions, openStatus,
        openTraits, openActions, openBonusActions, openReactions, openLegendActions
    } = useCard();

    return (
        <>
            <div className="container-fluid">
                <div className="row justify-content-around ">
                    <div className="col-4 mt-4 background_custom border_r_none border_l_none border_radius_left p-3">
                        <div className="text-center mt-3">
                            <h5>inserisci giocatori e nemici</h5>
                        </div>
                        {/*titolo */}
                        <FormInitiative />
                        <div className="row mt-4 background_custom initiative_container ">
                            <div className="col-12 " >{finalInitiative.length > 0 ?
                                <>
                                    <InitiativeTable />

                                </>
                                :
                                <div className="col text-center mt-3">
                                    <p>inserisci i giocatori</p>
                                </div>
                                //alternativa
                            }
                                <RoundComponent />
                            </div>
                        </div>
                        {/* tabella iniziativa */}
                    </div>
                    {/* lato destro con sistema iniziatva */}



                    <div className="col-8 mt-4 background_custom border_r_none border_l_none border_radius_right p-3">
                        <div className="text-center mt-3">
                            <h5>Aggiungi nemici</h5>
                        </div>
                        <FormGetMoster />
                        <div className="row mt-5">
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
                            {
                                battle.length > 0 ? (battle.map((el, i) => (
                                    <div key={el.instanceId} className="col-lg-4 mt-3 mb-5" >

                                        {status && <EncounterCard el={el} i={i} />}

                                        {trait && <EncounterTraits el={el} i={i} />}

                                        {actions && <EncounterActions el={el} i={i} />}

                                        {bonusActions && <EncounterBonusActions el={el} i={i} />}

                                        {reactions && <EncounterReactions el={el} i={i} />}

                                        {legendActions && <EncounterLegendActions el={el} i={i} />}

                                    </div>
                                ))
                                ) : (<div className="col text-center mt-4">
                                    <h5>Per iniziare inserisci un mostro</h5>
                                </div>)
                            }
                            {/* */}
                        </div>
                        {/*card dell'encounter */}
                    </div>
                    {/*lato sinistro con sistema encounter */}
                </div>
            </div>
            <Modal confirm={resetInitiative} id={`resetRound`} />
        </>
    )
}
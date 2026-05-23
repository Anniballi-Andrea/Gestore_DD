
import { useMonster } from "../context/MonsterContext";
import Modal from "./Modal";
export default function EncounterActions({ el, i }) {

    const { removeFromBattle } = useMonster();



    return (
        <>
            <div className="card card_home">
                <div className="card-header text-center">
                    <div className="mb-2">
                        {el.name}
                    </div>
                    <div className="d-flex justify-content-center">
                        <div className="me-2">{
                            el.status == 0 ? "morto" : "PF:" + el.status}
                        </div>
                        <div>
                            CA: {el.armorClass}
                        </div>
                    </div>
                </div>
                <div className="card-body ">
                    <div >
                        {el.actions.length > 0 ? <div className="text-center mb-2 pb-2 border-bottom">
                            <span className="fw-bold fs-5">Azioni:</span>
                        </div> :
                            <div className="text-center mb-2 pb-2 border-bottom">
                                <span className="fw-bold fs-5">Azioni non presenti!</span>
                            </div>
                        }
                        <div className="accordion bg_black" id={`accordion-parent-${el.instanceId}`}>
                            {
                                el.actions && el.actions.map((action, index) => (

                                    <div key={action.id} className="accordion-item bg_black">
                                        <h2 className="accordion-header bg_black">
                                            <button
                                                className="accordion-button bg_black collapsed"
                                                type="button"
                                                data-bs-toggle="collapse"
                                                data-bs-target={`#collapse-${el.instanceId}-${action.id}-${index}`}
                                                aria-expanded="false"
                                                aria-controls={`collapse-${el.instanceId}-${action.id}-${index}`}>
                                                {action.name}
                                            </button>
                                        </h2>
                                        <div
                                            id={`collapse-${el.instanceId}-${action.id}-${index}`}
                                            className="accordion-collapse collapse "
                                            data-bs-parent={`#accordion-parent-${el.instanceId}`}>
                                            <div className="accordion-body">
                                                {action.effect}
                                            </div>
                                        </div>
                                    </div>

                                ))
                            }
                        </div>
                    </div>
                    <div className="mt-2 d-flex justify-content-center mt-3">
                        <button type="button" className="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target={`#encounterDelete${el.id}${i}`}>
                            Elimina
                        </button>
                        <Modal confirm={removeFromBattle} el={el.instanceId} id={`encounterDelete${el.id}${i}`} />
                    </div>
                    {/*elimina*/}
                </div>
            </div>

        </>

    )
}
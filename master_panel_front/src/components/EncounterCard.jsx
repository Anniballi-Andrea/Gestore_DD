
import { useState } from "react";
import { useMonster } from "../context/MonsterContext";
import Modal from "./Modal";
import { useEffect } from "react";
import LifePointBar from "./LifePointBar";
export default function EncounterCard({ el, i }) {

    const { removeFromBattle, applicaDanno, applicaCura, setBattle } = useMonster();

    const [inputDanno, setInputDanno] = useState("");
    const [inputCura, setInputCura] = useState("");
    const [tempPf, setTempPf] = useState(() => {
        const savedPfTemp = localStorage.getItem(`monster-${el.instanceId}`);
        return savedPfTemp ? JSON.parse(savedPfTemp) : ""
    });

    useEffect(() => {
        localStorage.setItem(`monster-${el.instanceId}`, JSON.stringify(tempPf));
    }, [tempPf]);

    const handleDanno = (e) => {
        e.preventDefault();
        let danno = Number(inputDanno)
        if (tempPf > 0 && tempPf <= danno && danno > 0) {
            danno -= Number(tempPf)
            setTempPf("")
        } else if (tempPf > 0 && tempPf > danno && danno > 0) {

            setTempPf(tempPf - danno)
            danno = 0;
        }

        if (danno < 0) {
            danno = 0
        }
        applicaDanno(el.instanceId, Number(danno))

        setInputDanno("")
    }
    const handleCura = (e) => {
        e.preventDefault();
        let cura = Number(inputCura)
        if (cura < 0) {
            cura = 0
        }
        applicaCura(el.instanceId, Number(cura))
        setInputDanno("")

        setInputCura("")
    }

    const cangeMonsterText = ((id, text) => {
        setBattle(prevBattle =>
            prevBattle.map(element =>
                element.instanceId === id ? { ...element, text: text } : element

            )
        )
    })


    return (
        <>
            <div className="card card_home">
                <div className="card-header text-center">
                    <div className="mb-2">
                        {el.name}
                    </div>
                    <LifePointBar el={el} />
                    <div className="d-flex justify-content-center">
                        <div className="me-2">
                            {el.status == 0 ? "morto" : "PF:" + el.status}/{el.lifePoint}


                        </div>
                        <div>
                            CA: {el.armorClass}
                        </div>
                    </div>
                    <div className="text-center">
                        Iniziativa: {el.initiative}
                    </div>
                </div>
                <div className="card-body ">
                    <div className="d-flex align-items-center">
                        <form className="me-3" onSubmit={handleDanno}>
                            <div className=" input-group">
                                <input
                                    className="form-control"
                                    type="number"
                                    value={inputDanno}
                                    onChange={(e) => setInputDanno(e.target.value)}
                                    placeholder="danno"
                                />
                                <button className="btn btn-sm btn-warning" type="submit"><img src="/img/sword_icon.svg" alt="" /></button>
                            </div>
                        </form>
                        {/*input danno*/}
                        <form onSubmit={handleCura}>
                            <div className="input-group ">
                                <input
                                    className="form-control "
                                    type="number"
                                    value={inputCura}
                                    onChange={(e) => setInputCura(e.target.value)}
                                    placeholder="cura"
                                />
                                <button className="btn btn-sm btn-success text-dark" type="submit"><i className="bi bi-heart-fill"></i></button>
                            </div>
                        </form>
                        {/*input cura*/}

                    </div>
                    <div className="row row-cols-2 justify-content-center  mt-2 mb-2">
                        <div className="col text-center">
                            <label className="form-label " htmlFor="tempPf">PF temporanei</label>
                            <input id="tempPf" className="form-control text-center" type="number" placeholder="0" value={tempPf} onChange={(e) => setTempPf(e.target.value)} />
                        </div>
                    </div>

                    {/*input danno/cura */}
                    <div className="row row-cols-3 mt-3">
                        {el.strength <= 0 ? <div className="col">str: {el.strength}</div> : <div className="col">str: +{el.strength}</div>}
                        {el.dexterity <= 0 ? <div className="col">dex: {el.dexterity}</div> : <div className="col">dex: +{el.dexterity}</div>}
                        {el.constitution <= 0 ? <div className="col">cons:  {el.constitution}</div> : <div className="col">cons: +{el.constitution}</div>}
                        {el.intelligence <= 0 ? <div className="col">int:  {el.intelligence}</div> : <div className="col">int: +{el.intelligence}</div>}
                        {el.wisdom <= 0 ? <div className="col">sag:  {el.wisdom}</div> : <div className="col">sag: +{el.wisdom}</div>}
                        {el.charisma <= 0 ? <div className="col">car:  {el.charisma}</div> : <div className="col">car: +{el.charisma}</div>}
                    </div>
                    {/*stats*/}
                    <div className="row row-cols-1">
                        {el.savingThrow && <div className="col border_t_custom mt-2 pt-2">Tiri salvezza: {el.savingThrow}</div>}
                        {el.skills && <div className="col border_t_custom mt-2 pt-2" >Abilità: {el.skills}</div>}
                        {el.immunity && <div className="col border_t_custom mt-2 pt-2">Immunità: {el.immunity}</div>}
                        {el.resistence && <div className="col border_t_custom mt-2 pt-2">Resistenze: {el.resistence}</div>}
                        {el.vulnerability && <div className="col border_t_custom mt-2 pt-2">Vulnerabilità: {el.vulnerability}</div>}
                        {el.sense && <div className="col border_t_custom mt-2 pt-2">Sensi: {el.sense}</div>}
                    </div>
                    {/*abilità e resistenze*/}
                    <div className="row row-cols-1 mt-3">
                        <textarea
                            name="malus"
                            placeholder="testo..."
                            value={el.text}
                            onChange={(e) => cangeMonsterText(el.instanceId, e.target.value)}
                        >
                        </textarea>
                    </div>
                    {/*text area*/}
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
export default function SpellCard({ el }) {
    return (
        <div className="card spell_card_body text-light">
            <div className="card-header spell_card text-center">
                <div className="fs-5 fw-bold">{el.name}</div>
                <div className="fs-7 fw-bold">Scuola di {el.school}</div>
                <div>{el.level === 0 ? <span> trucchetto</span> : <span>livello: {el.level}</span>}</div>
            </div>
            <div className="card-body spell_card_body">
                <div className="row border border-danger bg_spell text-dark">
                    <div className="col-6 text-center border-end border-danger">
                        <div>
                            <span className="fw-bold text-danger">TEMPO DI LANCIO</span>
                        </div>
                        <div>
                            <span> {el.castMethod} </span>
                        </div>
                    </div>
                    <div className="col-6 text-center ">
                        <div>
                            <span className="fw-bold text-danger">GITTATA</span>
                        </div>
                        <div>
                            <span>{el.castRange}</span>
                        </div>
                    </div>
                    <div className="col-6 text-center border-end border-top border-danger">
                        <div>
                            <span className="fw-bold text-danger">COMPONENTI</span>
                        </div>
                        <div>
                            <span>{el.components}</span>
                        </div>
                    </div>
                    <div className="col-6 text-center border-top border-danger">
                        <div>
                            <span className="fw-bold text-danger">DURATA</span>
                        </div>
                        <div>
                            <span>{el.duration}</span>
                        </div>
                    </div>
                </div>
                <div className="row border border-danger mt-3 bg_spell text-dark">
                    <div className="col-12 text-start my-3">
                        {
                            el.materials !== "" &&
                            <div class=" mb-2 ">
                                <span class="fw-bold"> Materiali:</span> {el.materials}
                            </div>

                        }
                        {el.effect}
                    </div>

                </div>
                {
                    el.upgrade.length > 0 &&
                    <>
                        <div class="text-center">
                            ai livelli superiori
                        </div>
                        <div class="row border border-danger mt-2 bg_spell text-dark">
                            <div class="col-12 text-start my-3">
                                {el.upgrade}
                            </div>
                        </div>
                    </>
                }
            </div>
        </div>
    )
}


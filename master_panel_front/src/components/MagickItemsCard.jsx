export default function MagickItemsCard({ el }) {
    return (
        <div className="card item_card text-light shadow-lg">
            <div className="card-header item_card_header text-center">
                <div className="fs-5 fw-bold">{el.name}</div>
                <div className="fs-7 fw-bold"> {`${el.type} ${el.rarity}`}{el.sintony && <span>(Richiede sintonia)</span>}</div>
            </div>
            <div className="card-body  item_card_body">

                <div className="row border border-succes  rounded bg_item text-dark">
                    <div className="col-12 text-start  mb-3">
                        {el.description}
                    </div>

                </div>
            </div>
        </div>
    )
}
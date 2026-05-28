
import { useCampaign } from "../context/CampaignContext"

export default function SelectCampaign() {

    const { setCurrentCampaign, campaignList, currentCampaign, deleteCampaign } = useCampaign()

    function selectCampaign(id) {
        const selectedCampaign = campaignList.find(e => e.id === id)
        if (selectedCampaign) {
            setCurrentCampaign(selectedCampaign.name)
        }
    }


    return (
        <div className="dropdown ms-3">
            <button

                className="btn background_custom dropdown-toggle text-white"
                type="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
            >
                Seleziona una campagna
            </button>


            <ul className="dropdown-menu dropdown-menu-end background_custom mt-2 p-2">
                {campaignList.length === 0 ? (
                    <li><span className="dropdown-item text-white text-center">Nessuna campagna</span></li>
                ) : (
                    campaignList.map(el => (
                        <li key={el.id}>
                            <div className="d-flex align-items-center mb-1">
                                <button

                                    className={`dropdown-item me-2 text-white rounded ${currentCampaign === el.name ? 'active fw-bold' : ''}`}
                                    type="button"
                                    onClick={() => selectCampaign(el.id)}
                                >
                                    - {el.name}
                                </button>
                                <button
                                    className="btn btn-sm btn-danger me-2"
                                    type="button"
                                    onClick={() => deleteCampaign(el)}
                                >
                                    <i className="bi bi-trash-fill"></i>
                                </button>
                            </div>

                        </li>
                    ))
                )}
            </ul>
        </div>



    )
}
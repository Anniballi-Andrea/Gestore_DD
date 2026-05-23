import { useState } from "react"
import { useCampaign } from "../context/CampaignContext"

export default function FormAddCapmpaign() {

    const { setCampaignList } = useCampaign()
    const [campName, setCampName] = useState("")

    function addCampaign(e) {
        e.preventDefault()
        const newId = Date.now()
        setCampaignList(prev => [...prev, { id: newId, name: campName }])
        setCampName("")
    }




    return (
        <form className="me-3" onSubmit={addCampaign}>
            <div className="d-flex justify-content-center">
                <div className="me-4">
                    <input
                        type="text"
                        className="form-control"
                        value={campName}
                        onChange={e => setCampName(e.target.value)} />
                </div>
                <div >
                    <button className="btn btn-warning" type="submit"> Aggiungi</button>
                </div>

            </div>

        </form>


    )
}
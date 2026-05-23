import { useCampaign } from "../context/CampaignContext"

export default function CurrentntCampaign() {
    const { currentCampaign } = useCampaign()

    return (
        <div className="d-flex">
            <div className="text-center fs-5 me-3">
                {currentCampaign.toUpperCase()}
            </div>
        </div>

    )
}
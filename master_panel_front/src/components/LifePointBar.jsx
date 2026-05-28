import { useEffect } from "react"
import { useState } from "react"

export default function LifePointBar({ el }) {

    const [psStat, setPsStat] = useState(100)
    const [color, setColor] = useState("rgba(78, 221, 11, 0.479)")

    function changePfBar() {
        if (psStat > 75) {
            setColor("rgba(78, 221, 11, 0.48)")
        } else if (psStat > 50) {
            setColor("rgba(233, 250, 0, 0.48)")
        } else if (psStat > 15) {
            setColor("rgba(253, 188, 9, 0.48)")
        } else {
            setColor("rgba(221, 11, 11, 0.48)")
        }

    }

    useEffect(() => {
        setPsStat((Number(el.status) / Number(el.lifePoint)) * 100)
        changePfBar()
    }, [el.status])
    useEffect(() => {
        changePfBar()
    }, [psStat])


    return (
        <div className="ps_bar_body" style={{ border: `1px solid ${color}` }}>
            <div className="ps_bar_stat" style={{ width: `${psStat}%`, backgroundColor: color }}></div>
            <div className="ps_bar_hover text-center" >
                {Math.round(psStat)}%
            </div>
        </div>
    )
}
import { useState } from "react"
import MonsterCard from "../components/MonsterCard"
import SearchItem from "../components/SearchItem"
import { useMonster } from "../context/MonsterContext"
import { useEffect } from "react"

export default function MonstersPage() {
    const { allMonsters, monsterName, setMonsterName, filtredMonster } = useMonster()


    const [monsterPref, setMonsterPref] = useState(() => {
        const savedMonsters = localStorage.getItem(`preferite-monster`);
        return savedMonsters ? JSON.parse(savedMonsters) : []
    });

    useEffect(() => {
        localStorage.setItem(`preferite-monster`, JSON.stringify(monsterPref));
    }, [monsterPref]);


    const addToPreferite = (el) => {
        if (!monsterPref.find(fav => fav.id === el.id)) {
            setMonsterPref([...monsterPref, el])
        }
        setMonsterName("")
    }

    const removePreferite = (id) => {
        setMonsterPref(monsterPref.filter((el) => el.id !== id))
    }

    return (
        <>
            <div className="container mt-5">
                <div className="row row-cols-3 justify-content-center mt-4">
                    {monsterPref.length > 0 &&
                        monsterPref.map((el) => (
                            <div key={`pref-${el.id}`} onClick={() => removePreferite(el.id)}>
                                <MonsterCard el={el} />
                            </div>
                        ))
                    }
                </div>
            </div>
            <div className="containe-fluid">
                <div className="d-flex justify-content-start align-items-center ms-5 mb-5">
                    <SearchItem name={monsterName} setName={setMonsterName} array={allMonsters} />
                </div>
            </div>
            <div className="container">
                <div className="row row-cols-3 justify-content-center mt-5">
                    {monsterName.length > 2 ? (
                        filtredMonster.map((el) => (
                            <div key={el.id} onClick={() => addToPreferite(el)} >
                                <MonsterCard el={el} />
                            </div>
                        ))) : (
                        allMonsters.map((el) => (
                            <div key={el.id} onClick={() => addToPreferite(el)} >
                                <MonsterCard el={el} />
                            </div>

                        )))
                    }
                </div>
            </div>

        </>
    )
}
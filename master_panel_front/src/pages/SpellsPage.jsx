
import SearchItem from "../components/SearchItem"
import SpellCard from "../components/SpellCard"
import { useSpell } from "../context/spellContext"

export default function SpellsPage() {

    const { spellName, setSpellName, allSpells, spellPref, setSpellPref, filtredSpell } = useSpell()




    const addToPreferite = (el) => {
        if (!spellPref.find(fav => fav.id === el.id)) {
            setSpellPref([...spellPref, el])
        }
        setSpellName("")
    }

    const removePreferite = (id) => {
        setSpellPref(spellPref.filter((el) => el.id !== id))
    }



    return (
        <>
            <div className="container mt-5">
                <div className="row row-cols-3 justify-content-center mt-4">
                    {spellPref.length > 0 &&
                        spellPref.map((el) => (
                            <div className="mb-3" key={`pref-${el.id}`} onClick={() => removePreferite(el.id)}>
                                <SpellCard el={el} />
                            </div>
                        ))
                    }
                </div>
            </div>
            <div className="container-fluid">
                <div className="d-flex justify-content-start align-items-center ms-5 mb-5">
                    {<SearchItem name={spellName} setName={setSpellName} array={allSpells} />
                    }
                </div>
            </div>
            <div className="container">
                <div className="row row-cols-3 justify-content-center mt-4">
                    {spellName.length > 2 ? (
                        filtredSpell.map((el) => (
                            <div className="mb-3" key={el.id} onClick={() => addToPreferite(el)} >
                                <SpellCard el={el} />
                            </div>
                        ))) : (
                        allSpells.map((el) => (
                            <div className="mb-3" key={el.id} onClick={() => addToPreferite(el)} >
                                <SpellCard el={el} />
                            </div>

                        )))

                    }

                </div>
            </div>


        </>
    )
}
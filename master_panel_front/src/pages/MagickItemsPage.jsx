
import MagickItemsCard from "../components/MagickItemsCard"
import SearchItem from "../components/SearchItem"
import SpellCard from "../components/SpellCard"
import { useSpell } from "../context/spellContext"

export default function MagickItemsPage() {

    const { itemName, setItemName, allItems, filtredItems } = useSpell()




    return (
        <>
            <div className="container mt-5">
            </div>
            <div className="container-fluid">
                <div className="d-flex justify-content-start align-items-center ms-5 mb-5">
                    {<SearchItem name={itemName} setName={setItemName} array={allItems} />
                    }
                </div>
            </div>
            <div className="container">
                <div className="row row-cols-3 justify-content-center mt-4">
                    {itemName.length > 2 ? (
                        filtredItems.map((el) => (
                            <div className="mb-3" key={el.id}  >
                                <MagickItemsCard el={el} />
                            </div>
                        ))) : (
                        allItems.map((el) => (
                            <div className="mb-3" key={el.id}  >
                                <MagickItemsCard el={el} />
                            </div>

                        )))

                    }

                </div>
            </div>


        </>
    )
}
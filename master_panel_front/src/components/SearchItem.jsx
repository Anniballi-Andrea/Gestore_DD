import { useState } from "react";

export default function SearchItem({ name, setName, array }) {

    const [search, setSearch] = useState(false)

    const arrayFiltred = array.filter((el) => el.name.toLowerCase().includes(name.toLowerCase()))

    const searchForAdd = ((name) => {
        setSearch(true)
        setName(name)
    })

    const stopSearch = ((name) => {
        setSearch(false)
        setName(name)
    })



    return (
        <>

            <div className="position-relative">
                <label htmlFor="search_encounter" className="custom-label mb-1">
                    Cerca:
                </label>
                <div className="input-group">
                    <span className="input-group-text bg_header color_round border-secondary">
                        <i className="bi bi-search"></i>
                    </span>
                    <input
                        id="search_encounter"
                        className="form-control "
                        style={{ borderColor: "#a9741c" }}
                        type="text"
                        value={name}
                        onChange={(e) => searchForAdd(e.target.value)}
                        onFocus={() => setSearch(true)}
                        autoComplete="off"
                        placeholder="Nome..."
                        required
                    />
                </div>
                {name && name.length >= 3 && search && (
                    <div className="search_box background_custom p-0 shadow-lg">
                        {arrayFiltred.length > 0 ? (
                            <ul className="dropdown-menu show w-100 position-absolute background_custom search_box p-0 mt-1 shadow-lg">
                                {arrayFiltred.map((el, i) => (
                                    <li key={i}>
                                        <button
                                            type="button"
                                            className="dropdown-item py-2 px-3 text-start border-0 bg-transparent text-white"
                                            onClick={() => stopSearch(el.name)}
                                        >
                                            {el.name}
                                        </button>
                                    </li>
                                ))}
                            </ul>
                        ) : (
                            <div className="p-3 text-center  small fst-italic">
                                Nessun elemento trovato
                            </div>
                        )}
                    </div>
                )}
            </div>


        </>

    )
}
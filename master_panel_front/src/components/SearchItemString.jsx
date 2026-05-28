import { useState } from "react";

export default function SearchItemString({ name, setName, array }) {

    const [search, setSearch] = useState(false)

    const arrayFiltred = array.filter((el) => el.toLowerCase().includes(name.toLowerCase()))

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
            <div className="position-relative w-100">
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
                        onFocus={() => setSearch(true)} // Riapre la tendina se l'utente ci clicca dentro
                        autoComplete="off"
                        placeholder="Nome del mostro..."
                        required
                    />
                </div>
                {name && name.length >= 3 && search && (
                    <ul
                        className="dropdown-menu show w-100 position-absolute background_custom search_box p-0 mt-1 shadow-lg "

                    >
                        {arrayFiltred.length > 0 ? (
                            arrayFiltred.map((el, i) => (
                                <li key={i}>
                                    <button
                                        type="button"
                                        className="dropdown-item py-2 px-3 text-start border-0 bg-transparent text-white"
                                        onClick={() => stopSearch(el)}
                                    >
                                        {el}
                                    </button>
                                </li>
                            ))
                        ) : (
                            // Feedback nel caso in cui la ricerca non produca risultati
                            <li className="p-3 text-center text-muted small italic">
                                Nessuna creatura trovata
                            </li>
                        )}
                    </ul>
                )}
            </div>

        </>

    )
}
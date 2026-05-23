import { NavLink } from "react-router";
import FormAddCapmpaign from "./FormAddCampaign";
import SelectCampaign from "./SelectCampaign";
import CurrentntCampaign from "./CurrentCampaign";

export default function Header() {

    return (
        <>
            <header>
                <nav className="navbar navbar-expand-lg bg-body-tertiary bg_header ">
                    <div className="container-fluid">
                        <div className="d-flex align-items-center">
                            <span className="fw-bold fs-5">MasterPanel</span>
                            <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                                <span className="navbar-toggler-icon"></span>
                            </button>
                            <div className="collapse navbar-collapse" id="navbarNav">
                                <ul className="navbar-nav">
                                    <li className="nav-item">
                                        <NavLink className="nav-link  text-light" to="/">Home</NavLink>
                                    </li>
                                    <li className="nav-item">
                                        <NavLink className="nav-link text-light" to="/monsters">Mostri</NavLink>
                                    </li>
                                    <li className="nav-item">
                                        <NavLink className="nav-link text-light" to="/spells">Magie</NavLink>
                                    </li>
                                    <li className="nav-item">
                                        <NavLink className="nav-link text-light" to="/session_note">Note</NavLink>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div className="d-flex align-items-center" >
                            <CurrentntCampaign />
                        </div>
                        <div className="d-flex align-items-center">
                            <div>
                                <FormAddCapmpaign />
                            </div>
                            <div>
                                <SelectCampaign />
                            </div>

                        </div>

                    </div>
                </nav>
            </header>
        </>
    )
}
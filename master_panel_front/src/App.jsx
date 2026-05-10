import { BrowserRouter, Route, Routes } from "react-router-dom"
import DefaultLayout from "./layout/DefaultLayout"
import Home from "./pages/Home"
import MonstersPage from "./pages/MonstersPage"
import { MonsterProvider } from "./context/MonsterContext"
import { InitiativeProvider } from "./context/InitiativeContext"
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import { CardProvider } from "./context/CardContext"
import SpellsPage from "./pages/SpellsPage"
import { SpellProvider } from "./context/spellContext"


function App() {




  return (
    <>

      <MonsterProvider>
        <InitiativeProvider>
          <BrowserRouter>
            <SpellProvider>
              <CardProvider>
                <Routes>
                  <Route element={<DefaultLayout />}>
                    <Route path="/" element={<Home />} />
                    <Route path="/monsters" element={<MonstersPage />} />
                    <Route path="/spells" element={<SpellsPage />} />
                  </Route>
                </Routes>
              </CardProvider>
            </SpellProvider>
          </BrowserRouter>
        </InitiativeProvider>
      </MonsterProvider>


    </>
  )
}

export default App

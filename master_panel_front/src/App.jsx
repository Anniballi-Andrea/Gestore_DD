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
import NotFound from "./pages/NotFound"
import SessionNote from "./pages/SessionNote"
import { CampaignProvider } from "./context/CampaignContext"
import MagickItemsPage from "./pages/MagickItemsPage"


function App() {




  return (
    <>
      <CampaignProvider>
        <MonsterProvider>
          <InitiativeProvider>
            <BrowserRouter>
              <SpellProvider>
                <CardProvider>
                  <Routes>
                    <Route element={<DefaultLayout />}>
                      <Route path="/" element={<Home />} />
                      <Route path="/spells" element={<SpellsPage />} />
                      <Route path="/magick_items" element={<MagickItemsPage />} />
                      <Route path="/session_note" element={<SessionNote />} />
                      <Route path="*" element={<NotFound />} />
                    </Route>
                  </Routes>
                </CardProvider>
              </SpellProvider>
            </BrowserRouter>
          </InitiativeProvider>
        </MonsterProvider>
      </CampaignProvider>
    </>
  )
}

export default App

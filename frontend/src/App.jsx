import { Route, Routes } from "react-router-dom";
import React from "react";
import { QuestionProvider } from "./contexts/QuestionContext";
import Register from "./pages/Register";
import LoginForm from "./pages/LoginForm";
import HomeUser from "./pages/HomeUser";
import Survey from "./pages/Survey";
import Legal from "./pages/Legal";
import EligibleScore from "./components/EligibleScore";
import UnknownScore from "./components/UnknownScore";
import NotEligibleScore from "./components/NotEligibleScore";
import { AuthContextProvider } from "./contexts/AuthContext";
import ListAnswer from "./components/ListAnswer";

import "./App.css";
import Dashboard from "./pages/Dashboard";

function App() {
  return (
    <AuthContextProvider>
      <QuestionProvider>
        <div className="App">
          <Routes>
            <Route path="/register" element={<Register />} />
            <Route path="/login" element={<LoginForm />} />
            <Route path="/" element={<HomeUser />} />
            <Route path="/categories/:categoryId" element={<Survey />} />
            <Route path="/legal" element={<Legal />} />
            <Route path="/resultat/inconnu" element={<UnknownScore />} />
            <Route path="/resultat/non" element={<NotEligibleScore />} />
            <Route path="/resultat/oui" element={<EligibleScore />} />
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/list" element={<ListAnswer />} />
          </Routes>
        </div>
      </QuestionProvider>
    </AuthContextProvider>
  );
}

export default App;

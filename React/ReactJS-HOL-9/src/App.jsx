import ListofPlayers from "./ListofPlayers";
import {
  OddPlayers,
  EvenPlayers,
  ListofIndianPlayers,
} from "./IndianPlayers";

function App() {
  const flag = true; // Change to false to see second output

  const players = [
    { name: "Jack", score: 50 },
    { name: "Michael", score: 70 },
    { name: "John", score: 40 },
    { name: "Ann", score: 61 },
    { name: "Elisabeth", score: 61 },
    { name: "Sachin", score: 95 },
    { name: "Dhoni", score: 100 },
    { name: "Virat", score: 84 },
    { name: "Jadeja", score: 64 },
    { name: "Raina", score: 75 },
    { name: "Rohit", score: 80 },
  ];

  const IndianTeam = [
    "Sachin",
    "Dhoni",
    "Virat",
    "Rohit",
    "Yuvraj",
    "Raina",
  ];

  const T20Players = [
    "First Player",
    "Second Player",
    "Third Player",
  ];

  const RanjiPlayers = [
    "Fourth Player",
    "Fifth Player",
    "Sixth Player",
  ];

  const IndianPlayers = [...T20Players, ...RanjiPlayers];

  if (flag) {
    return (
      <div>
        <ListofPlayers players={players} />
      </div>
    );
  }

  return (
    <div>
      <h1>Odd Players</h1>

      {OddPlayers(IndianTeam)}

      <hr />

      <h1>Even Players</h1>

      {EvenPlayers(IndianTeam)}

      <hr />

      <h1>List of Indian Players Merged</h1>

      <ListofIndianPlayers IndianPlayers={IndianPlayers} />
    </div>
  );
}

export default App;
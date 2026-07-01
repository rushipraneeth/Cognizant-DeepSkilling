import officeImage from "./assets/office.jpeg";

function App() {
  const officeList = [
    {
      Name: "DBS",
      Rent: 50000,
      Address: "Chennai",
    },
    {
      Name: "WeWork",
      Rent: 75000,
      Address: "Hyderabad",
    },
    {
      Name: "SmartWorks",
      Rent: 55000,
      Address: "Bangalore",
    },
  ];

  return (
    <div style={{ marginLeft: "100px" }}>
      <h1>Office Space, at Affordable Range</h1>

      <img
        src={officeImage}
        alt="Office"
        width="300"
      />

      {officeList.map((office, index) => (
        <div key={index}>
          <h2>Name: {office.Name}</h2>

          <h3
            style={{
              color: office.Rent <= 60000 ? "red" : "green",
            }}
          >
            Rent: Rs. {office.Rent}
          </h3>

          <h3>Address: {office.Address}</h3>

          <hr />
        </div>
      ))}
    </div>
  );
}

export default App;
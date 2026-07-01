import React, { Component } from "react";

class CountPeople extends Component {
  constructor() {
    super();

    this.state = {
      entrycount: 0,
      exitcount: 0,
    };
  }

  updateEntry = () => {
    this.setState((prevState) => ({
      entrycount: prevState.entrycount + 1,
    }));
  };

  updateExit = () => {
    this.setState((prevState) => ({
      exitcount: prevState.exitcount + 1,
    }));
  };

  render() {
    return (
      <div
        style={{
          display: "flex",
          justifyContent: "space-around",
          marginTop: "100px",
        }}
      >
        <div>
          <button
            style={{ backgroundColor: "lightgreen" }}
            onClick={this.updateEntry}
          >
            Login
          </button>

          <span> {this.state.entrycount} People Entered!!!</span>
        </div>

        <div>
          <button
            style={{ backgroundColor: "lightgreen" }}
            onClick={this.updateExit}
          >
            Exit
          </button>

          <span> {this.state.exitcount} People Left!!!</span>
        </div>
      </div>
    );
  }
}

export default CountPeople;
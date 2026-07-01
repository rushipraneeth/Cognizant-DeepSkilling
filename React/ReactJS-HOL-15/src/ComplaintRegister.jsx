import { useState } from "react";

function ComplaintRegister() {
  const [employeeName, setEmployeeName] = useState("");
  const [complaint, setComplaint] = useState("");

  const handleSubmit = (event) => {
    event.preventDefault();

    const referenceId = Math.floor(
      100000 + Math.random() * 900000
    );

    alert(
      `Thanks ${employeeName}\n\nYour Complaint was Submitted.\nReference ID is: ${referenceId}`
    );

    setEmployeeName("");
    setComplaint("");
  };

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        marginTop: "60px",
      }}
    >
      <form onSubmit={handleSubmit}>
        <h1 style={{ color: "red" }}>
          Register your complaints here!!!
        </h1>

        <table>
          <tbody>
            <tr>
              <td>Name:</td>

              <td>
                <input
                  type="text"
                  value={employeeName}
                  onChange={(e) =>
                    setEmployeeName(e.target.value)
                  }
                  required
                />
              </td>
            </tr>

            <tr>
              <td>Complaint:</td>

              <td>
                <textarea
                  rows="3"
                  value={complaint}
                  onChange={(e) =>
                    setComplaint(e.target.value)
                  }
                  required
                />
              </td>
            </tr>

            <tr>
              <td></td>

              <td>
                <button type="submit">
                  Submit
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  );
}

export default ComplaintRegister;
import axios from "axios";
import GitClient from "./GitClient";

jest.mock("axios");

describe("Git Client Tests", () => {
  test("should return repository names for techiesyed", async () => {
    const dummyData = [
      { name: "Repo1" },
      { name: "Repo2" },
      { name: "Repo3" },
    ];

    axios.get.mockResolvedValue({
      data: dummyData,
    });

    const response = await GitClient.getRepositories("techiesyed");

    expect(response.data).toEqual(dummyData);

    expect(axios.get).toHaveBeenCalledWith(
      "https://api.github.com/users/techiesyed/repos"
    );
  });
});
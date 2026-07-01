import BookDetails from "./BookDetails";
import BlogDetails from "./BlogDetails";
import CourseDetails from "./CourseDetails";
import { books, blogs, courses } from "./data";
import "./index.css";

function App() {
  return (
    <div className="container">
      <div className="column">
        <CourseDetails courses={courses} />
      </div>

      <div className="column">
        <BookDetails books={books} />
      </div>

      <div className="column">
        <BlogDetails blogs={blogs} />
      </div>
    </div>
  );
}

export default App;
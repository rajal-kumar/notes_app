import { useState } from 'react';
import axios from 'axios';
import ReactMarkdown from 'react-markdown';

export default function NoteForm() {
  const [title, setTitle] = useState('');
  const [body, setBody] = useState('');
  const [response, setResponse] = useState(null);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post('http://localhost:3000/api/v1/notes', {
        note: { title, body },
      });
      setResponse(res.data);
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div>
      <h2>Create Note</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Note Title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <br />
        <textarea
          rows="10"
          cols="40"
          placeholder="Markdown Body"
          value={body}
          onChange={(e) => setBody(e.target.value)}
        />
        <br />
        <button type="submit">Create Note</button>
      </form>

      <h3>Live Preview:</h3>
      <ReactMarkdown>{body}</ReactMarkdown>

      {response && (
        <div>
          <h3>Note Created:</h3>
          <pre>{JSON.stringify(response, null, 2)}</pre>
        </div>
      )}
    </div>
  );
}
